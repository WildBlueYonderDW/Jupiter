#using script_15cba36f180ab171;
#using script_1fa444cdc9dbf364;
#using script_2d9d24f7c63ac143;
#using script_32c2f4a699e57e1e;
#using script_3aacf02225ca0da5;
#using script_3f8889c16399185c;
#using script_4bac13d511590220;
#using scripts\common\debug_graycard;
#using scripts\common\debug_reflection;
#using scripts\common\dev;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_code;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\ent_manager;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\execution;
#using scripts\cp_mp\gasmask;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\juggernaut;
#using scripts\cp_mp\operator;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\pet_watch;
#using scripts\cp_mp\utility\callback_group;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\loot;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_airdrop;
#using scripts\cp_mp\vehicles\vehicle_compass;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\cp_mp\weapon;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\accessories;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\ai_behavior;
#using scripts\mp\ai_mp_controller;
#using scripts\mp\bots\bots;
#using scripts\mp\bounty;
#using scripts\mp\class;
#using scripts\mp\dev;
#using scripts\mp\equipment;
#using scripts\mp\equipment\disguise;
#using scripts\mp\equipment\nvg;
#using scripts\mp\equipment\shock_stick;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\br_gametype_dmz;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_plunder;
#using scripts\mp\gametypes\br_weapons;
#using scripts\mp\gametypes\dmz_dog_tag;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\juggernaut;
#using scripts\mp\killstreaks\deployablebox;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\menus;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\outofbounds;
#using scripts\mp\overseer;
#using scripts\mp\perks\perkfunctions;
#using scripts\mp\perks\perkpackage;
#using scripts\mp\playerlogic;
#using scripts\mp\rangefinder;
#using scripts\mp\rank;
#using scripts\mp\spawnlogic;
#using scripts\mp\spawnscoring;
#using scripts\mp\supers;
#using scripts\mp\supers\super_emp_pulse;
#using scripts\mp\supers\super_stimpistol;
#using scripts\mp\teamrevive;
#using scripts\mp\teams;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\print;
#using scripts\mp\utility\script;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;
#using scripts\mp\weapons;

#namespace dev;

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c6
    // Size: 0x1f51, Type: dev
    function init()
    {
        scripts\common\dev::init();
        precacheitem( "<dev string:x1c>" );
        precachemodel( "<dev string:x30>" );
        precachemodel( "<dev string:x46>" );
        level.var_106f5dbd64532cc4 = loadfx( "<dev string:x5f>" );
        level.var_3c8617e34ae080b5[ "<dev string:x83>" ] = loadfx( "<dev string:x99>" );
        level.var_5683153ad305ce08 = 0.25;
        level.var_e117330e38c95d0b = int( ceil( level.var_5683153ad305ce08 * 1000 / level.frameduration ) );
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
        thread function_53fc6eae3ece8bee();
        thread function_eab2f1dc0cb5d29a();
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
        thread function_851035ff671bdc1f();
        thread function_80ababd8270dc6fd();
        
        if ( getdvarint( @"hash_4b664c074a868ac5", 0 ) )
        {
            thread function_8c8836efc7900575();
            thread function_c908e940d73342cc();
        }
        
        setdevdvarifuninitialized( @"hash_6a070f99cded1bb7", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_128ee1e0b7c9bb5d", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_9554b84c655e575d", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_dd6a15dccb6f778c", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_7ce94a8dcd3c8b99", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_da619ce8239c1736", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_4ae56ff4e4985e83", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_9608479c0ddc550d", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_10966de869cb14af", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_407d81926ced4cff", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_50be975cbeda7bd", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_24de427d5a5a8443", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_3a8e3d6db69d767e", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_1c423b4190c17fda", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_7c14c45b0376be39", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_d2d27e6a1337fc41", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_475e86d5470a4524", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_a4e3922cf017e056", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_be5cbd4a2291f23f", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_32201091ed0c5bd6", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_493c636a94f69749", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_d475fd19488b5a6d", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_b5de345e9da778b5", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_28d1831203c6967b", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_31674c76da07f46f", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_c65dbfe96fb1f3c4", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_18728111915eef48", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_af011dbf40cf4773", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_da4afb1bdf19df26", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_920f0586653a26d4", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_c8c85468b70323a7", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_ba8f8e3054e5584d", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_4888f3f38913205f", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_2a77b8dc84093d22", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_8fcf658de0756ca3", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_87ee17dde7eae140", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_93721f3cbd6d00c6", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_9e1de20ce2f61ca9", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_58d027ad37e05b46", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_e7f0e98d75752c9", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_c9f6917530383799", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_b1f216df6049c46a", "<dev string:xce>" );
        setdevdvarifuninitialized( @"hash_18cc90e3fd22526a", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_e5b307d1608c2011", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_a468c3040709501b", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"scr_devhelipathsdebugdraw", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_b048e9c4cba3bb37", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_af596796ae351a3c", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_f901de8bb079b09b", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_5011715b0d8686b1", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_19130df90d792ee8", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_1d72f4f6602796e9", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_d732ae157aef3ffd", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_1b83a785deee1fc", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_c8b55b33d3bf3112", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_b3de631c7e92d878", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_eee69dc2a527f44", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_7f935bdd07f36e9", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_e4121048ccfa7580", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_2972a0a5a58bfd5d", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_1059590334b9de2c", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_e182fb9e875bf879", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_6ce167f2cdc8ef7c", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_29d45d6822a1cf6d", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_a18e65eb2a8dfec6", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_92522ef77482b74f", 0 );
        setdevdvarifuninitialized( @"hash_a20811cf18dac458", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_53f9e61fbb5d9c84", 0 );
        setdevdvarifuninitialized( @"hash_783f25d038fa2819", 0 );
        setdevdvarifuninitialized( @"hash_f5cc472e41be9c66", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_ede820e2482b470", 0 );
        setdevdvarifuninitialized( @"hash_d657640801ffcf07", 0 );
        setdevdvarifuninitialized( @"hash_5e62b8f4b2dd7d6e", "<dev string:xca>" );
        setdevdvarifuninitialized( @"player_debugsprint", 0 );
        setdevdvarifuninitialized( @"hash_e47e8eaa633b0385", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_68db6c6a95694120", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_e6d36d090a5a2469", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_c03a8d3daea44f20", 0 );
        setdevdvarifuninitialized( @"hash_45ad785835521a20", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_ddcfd9cb21dd26dc", 0 );
        setdevdvarifuninitialized( @"hash_e8f85992b38b6ea8", 0 );
        setdevdvarifuninitialized( @"hash_3617ac10e688070e", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_63e9300e127cbfe7", 0 );
        setdevdvarifuninitialized( @"hash_24fc46aab8e515d3", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_69b7311657d28a29", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_c1fa6ab185f57dc3", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_20c7a16d77382d2b", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_3336a486aff69f38", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_1deddbedb2075add", 0 );
        setdevdvarifuninitialized( @"hash_c9ec8ca2b7a146c4", 0 );
        setdevdvarifuninitialized( @"hash_6711d09c824e3cc9", 0 );
        setdevdvarifuninitialized( @"hash_c85a7135dce00903", 0 );
        setdevdvarifuninitialized( @"hash_6d6e240a9ede976e", 0 );
        setdevdvarifuninitialized( @"hash_2748b78a2910ca11", 0 );
        setdevdvarifuninitialized( @"hash_be71443f47c8632f", 0 );
        setdevdvarifuninitialized( @"hash_86a6152b9a0381fc", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_cd901aea9e9e7eeb", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_95efa6aea863b082", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_1e72609fde690bbc", 0 );
        setdevdvarifuninitialized( @"hash_c6492f4edd9202d3", 0 );
        setdevdvarifuninitialized( @"hash_68cba91a675a2f76", 0 );
        setdevdvarifuninitialized( @"hash_7a5e31b62cb508b0", 0 );
        setdevdvarifuninitialized( @"hash_914bb3dc853c47c4", 0 );
        setdevdvarifuninitialized( @"hash_b34a0bfcf1e59832", 0 );
        setdevdvarifuninitialized( @"hash_3689035427e54e9f", 0 );
        setdevdvarifuninitialized( @"hash_f9aebf06391bb03c", 0 );
        setdevdvarifuninitialized( @"hash_4048e0584107c82d", 0 );
        setdevdvarifuninitialized( @"hash_36ffd6c38bff011f", 0 );
        setdevdvarifuninitialized( @"hash_da92d5d5b7678a37", 0 );
        setdevdvarifuninitialized( @"hash_8ce1d68eab6c438c", 0 );
        setdevdvarifuninitialized( @"hash_2db5bf067432a469", 0 );
        setdevdvarifuninitialized( @"hash_4806172df45de691", 0 );
        setdevdvarifuninitialized( @"hash_796deaab0da995a1", 0 );
        setdevdvarifuninitialized( @"hash_4c260c16d548430f", 0 );
        setdevdvarifuninitialized( @"hash_c000ec9a5a2f4b6c", 0 );
        setdevdvarifuninitialized( @"hash_46a6b424af6acbc2", 0 );
        setdevdvarifuninitialized( @"hash_86e14326e43c0115", 0 );
        setdevdvarifuninitialized( @"hash_a7e60a461c8707b7", 0 );
        setdevdvarifuninitialized( @"scr_ufo", 0 );
        setdevdvarifuninitialized( @"hash_21f13701dd027cd9", 0 );
        setdevdvarifuninitialized( @"hash_35721bc6b305545e", 0 );
        setdevdvarifuninitialized( @"hash_68576d3cfbb31217", 0 );
        setdevdvarifuninitialized( @"hash_ec6d489d470bc2ad", 0 );
        setdevdvarifuninitialized( @"hash_6f6849bde2dd82a2", 0 );
        setdevdvarifuninitialized( @"hash_d51785ab78729b60", 0 );
        setdevdvarifuninitialized( @"hash_4d5720fef87ec87b", 0 );
        setdevdvarifuninitialized( @"hash_cd46b66038189bc6", 0 );
        setdevdvarifuninitialized( @"hash_254c1be46d7151ba", 0 );
        setdevdvarifuninitialized( @"hash_91b2ddadd480bff", 0 );
        setdevdvarifuninitialized( @"hash_666f80ba249a19f0", -1 );
        setdevdvarifuninitialized( @"hash_bd7df9ddb0a387df", -1 );
        setdevdvarifuninitialized( @"hash_2720461050df680a", 0 );
        setdevdvarifuninitialized( @"hash_30c03f7233f67af", 0 );
        setdevdvarifuninitialized( @"hash_8281baf0599d60be", 0 );
        setdevdvarifuninitialized( @"hash_f23e88e0327f5ea8", 0 );
        setdevdvarifuninitialized( @"hash_a173837bf9ac730b", 0 );
        setdevdvarifuninitialized( @"hash_3ff74ed214090ace", 0 );
        setdevdvarifuninitialized( @"hash_46c23f34012ec0ef", 0 );
        setdevdvarifuninitialized( @"hash_e6a5211d6811a3e", 0 );
        setdevdvarifuninitialized( @"hash_62a47106347dc9c3", 0 );
        setdevdvarifuninitialized( @"hash_c23c2c6a2023ae4e", 0 );
        setdevdvarifuninitialized( @"hash_f1f4f1ec702b2cf9", 0 );
        setdevdvarifuninitialized( @"hash_2a7bafdc840d1f2e", 0 );
        setdevdvarifuninitialized( @"hash_6d54ab37bfc60400", 0 );
        setdevdvarifuninitialized( @"hash_b665ceb14dabc0ed", -1 );
        setdevdvarifuninitialized( @"hash_16a5fe0ac78e7780", 0 );
        setdevdvarifuninitialized( @"hash_141db07d0586549b", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_685da616f79a75a8", "<dev string:xd4>" );
        setdevdvarifuninitialized( @"hash_b40f304599deabeb", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_489bbabfad4638e7", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_4afd1f53688a98b3", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_d58b0fd6e8a9a1e2", 0 );
        setdevdvarifuninitialized( @"hash_62458b790daf2c44", 0 );
        setdevdvarifuninitialized( @"hash_f75720f29df3df7", 0 );
        setdevdvarifuninitialized( @"hash_84d17066d7567258", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_ac808c387df6f898", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_ae9fca9b189d7547", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_c22d5ea67b157acc", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_35f2aa5b08cbe390", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_85cb9b5fe926bb55", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_2d45555fbb2ce4da", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_83b57a87863f395", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_9662e6a5384fda41", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_6b8184e328167315", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_9bc47722d769a158", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_81d89e4abec64203", 0 );
        setdevdvarifuninitialized( @"hash_969cec4a11333d98", 0 );
        setdevdvarifuninitialized( @"hash_ba2c7949a7bef89a", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_5d008081f52285c9", 0 );
        setdevdvarifuninitialized( @"hash_e8bf0eb1142e2bf0", 0 );
        setdevdvarifuninitialized( @"hash_4ad91d42246ab0eb", 0 );
        setdevdvarifuninitialized( @"hash_debd4bed61a9b4dc", 0 );
        setdevdvarifuninitialized( @"hash_4fea842213b31f9b", 0 );
        setdevdvarifuninitialized( @"hash_11544fe0c704e8fd", 0 );
        setdevdvarifuninitialized( @"hash_4209eaa327e6b853", 0 );
        setdevdvarifuninitialized( @"hash_1f68298a5bbf604b", 0 );
        setdevdvarifuninitialized( @"hash_f5a9982eaa189f7b", 0 );
        setdevdvarifuninitialized( @"hash_8d64d93609b4dda", 0 );
        setdevdvarifuninitialized( @"hash_4aa285a21e3a2ebe", 0 );
        setdevdvarifuninitialized( @"hash_5b8a4bfaae3c12f4", 0 );
        setdevdvarifuninitialized( @"hash_f2d32cd17a068abf", 0 );
        setdevdvarifuninitialized( @"hash_6a93ed78e507e165", "<dev string:xdb>" );
        setdevdvarifuninitialized( @"hash_7d0eb445e2ed360c", 0 );
        setdevdvarifuninitialized( @"hash_17a1591e3fe7c036", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_17bb7ff71c139bfe", 0 );
        setdevdvarifuninitialized( @"hash_9121a70517dea5ff", 0 );
        setdevdvarifuninitialized( @"hash_3f6aa1398452a3db", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_d1415bb7a04b48f9", 0 );
        setdevdvarifuninitialized( @"hash_a59b8462ed17fe6e", 0 );
        scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_initdev();
        scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_initdev();
        setdevdvarifuninitialized( @"hash_dd33e6bf6e533554", 0 );
        setdevdvarifuninitialized( @"hash_5a20dfa97c106e84", 0 );
        setdevdvarifuninitialized( @"hash_ae48fc0251f15678", 0 );
        setdevdvarifuninitialized( @"hash_27b66fa4ccb92042", 0 );
        setdevdvarifuninitialized( @"hash_1b55e0d66a16ab70", 0 );
        setdevdvarifuninitialized( @"hash_f9f204d56cd2b845", 0 );
        setdevdvarifuninitialized( @"hash_1e89088dab07f7fc", 0 );
        setdevdvarifuninitialized( @"hash_2346182109bbc14a", 0 );
        setdevdvarifuninitialized( @"hash_f29bd33b293b2675", 0 );
        setdevdvarifuninitialized( @"hash_a765ffa626d484ef", 0 );
        setdevdvarifuninitialized( @"hash_46a8210687b62330", 0 );
        setdevdvarifuninitialized( @"hash_29007f0daffa3caf", 0 );
        setdevdvarifuninitialized( @"hash_d88b8d63e294caa0", 0 );
        setdevdvarifuninitialized( @"hash_1910d50ada158ec2", 180 );
        setdevdvarifuninitialized( @"hash_d40cb466778ed4c4", 180 );
        setdevdvarifuninitialized( @"hash_b03ca0b1c52f74b2", 180 );
        setdevdvarifuninitialized( @"hash_8b814398a3af5d7f", 180 );
        setdevdvarifuninitialized( @"hash_2fd14545a1a6803c", 0 );
        setdevdvarifuninitialized( @"hash_20d07e52d0c613fb", 0 );
        setdevdvarifuninitialized( @"hash_7194076ab4888f2b", 0 );
        setdevdvarifuninitialized( @"hash_68874851dce750fe", 0 );
        setdevdvarifuninitialized( @"hash_cccba423c010c957", 0 );
        setdevdvarifuninitialized( @"hash_45dd70c0ac1afda2", 0 );
        setdevdvarifuninitialized( @"hash_684118f4e2ed5dfd", 0 );
        setdevdvarifuninitialized( @"scr_give_equipment", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_bdb86700db7d369e", 0 );
        setdevdvarifuninitialized( @"hash_5148ee2a6dbcf8af", 0 );
        setdevdvarifuninitialized( @"hash_6c7fd12a611ca1e8", 0 );
        setdevdvarifuninitialized( @"hash_d206f268f04a78a3", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_20d714b15057681f", 0 );
        setdevdvarifuninitialized( @"hash_3c6c485214ca7673", 0 );
        setdevdvarifuninitialized( @"hash_827901421ad0679", 1 );
        setdevdvarifuninitialized( @"hash_be65e45de358ca06", "<dev string:xc5>" );
        setdevdvarifuninitialized( @"hash_715685dae50de688", 0 );
        setdevdvarifuninitialized( @"hash_fecec194bb60af48", 1 );
        setdevdvarifuninitialized( @"hash_cf0fa0390ef7a109", 0 );
        setdevdvarifuninitialized( @"hash_99ed34bc5a345aff", 0 );
        setdevdvarifuninitialized( @"hash_2814505e96048f69", 0 );
        setdevdvarifuninitialized( @"hash_9bffca47d2e56b54", 0 );
        setdevdvarifuninitialized( @"hash_381540c4c21ed29a", 0 );
        setdevdvarifuninitialized( @"hash_aa6b4147be329989", 0 );
        setdevdvarifuninitialized( @"hash_e448cfb79f133678", 30 );
        setdevdvarifuninitialized( @"hash_68d66133a48deb9b", 60 );
        setdevdvarifuninitialized( @"hash_1b0b9b8d56ed2d25", 0 );
        setdevdvarifuninitialized( @"hash_1e97927453ad138", 0 );
        setdevdvarifuninitialized( @"hash_a28e203d53e8292d", 0 );
        setdevdvarifuninitialized( @"hash_bcb21c0721a9e458", 0 );
        setdevdvarifuninitialized( @"hash_591b69f7b547308f", 0 );
        setdevdvarifuninitialized( @"hash_14dd8475d8aea762", 0 );
        setdevdvarifuninitialized( @"scr_ammoregen", 0 );
        setdevdvarifuninitialized( @"hash_43a5da10f7aa17e4", 0 );
        setdevdvarifuninitialized( @"hash_93810ec1dad46146", 0 );
        setdevdvarifuninitialized( @"hash_1ba5f3b69f0f55b8", 0 );
        setdevdvarifuninitialized( @"hash_13631697f8fa7f58", 0 );
        setdevdvarifuninitialized( @"hash_892a0f1030eb66da", 0 );
        setdevdvarifuninitialized( @"hash_99f113c180dfe22d", 0 );
        setdevdvarifuninitialized( @"hash_60951c4ee00ec45c", 0 );
        setdevdvarifuninitialized( @"hash_8e93a66436d8d0bb", 0 );
        setdevdvarifuninitialized( @"hash_39dc8a1ad3dd146a", 0 );
        setdevdvarifuninitialized( @"hash_a3a51abfffffb4cf", 0 );
        setdevdvarifuninitialized( @"hash_d2f9b7c5947f75b3", 0 );
        setdevdvarifuninitialized( @"hash_629b4e289546a19e", 0 );
        setdevdvarifuninitialized( @"hash_2c0beeb4679914a5", "<dev string:xf0>" );
        setdevdvarifuninitialized( @"hash_a19ba41066fb4b6a", 0 );
        setdevdvarifuninitialized( @"hash_d197b236ea8564e", 0 );
        setdevdvarifuninitialized( @"scr_god", 0 );
        setdevdvarifuninitialized( @"hash_23c3e7fdfb7fdd84", 0 );
        setdevdvarifuninitialized( @"hash_13779b55083ae0e1", 0 );
        setdevdvarifuninitialized( @"hash_265eb98091c83ef1", "<dev string:xca>" );
        setdevdvar( @"hash_be4638b34423d0ca", "<dev string:xca>" );
        setdevdvar( @"hash_be7522650406f34f", "<dev string:xca>" );
        setdevdvar( @"hash_87fd1aab915574c0", "<dev string:xca>" );
        setdevdvar( @"hash_3debe2571172850", "<dev string:xca>" );
        setdevdvar( @"hash_8fcbab7f56dcce7", "<dev string:xca>" );
        setdevdvar( @"hash_b679b1eead8733a3", "<dev string:xca>" );
        setdevdvar( @"hash_61f1432615a0514b", "<dev string:xca>" );
        setdevdvar( @"hash_ae04ade2c8e72fdc", "<dev string:xca>" );
        setdevdvar( @"scr_giveweapon", "<dev string:xca>" );
        setdevdvar( @"hash_9bf239cb990aca4b", "<dev string:xca>" );
        setdevdvar( @"scr_spawnweapon", "<dev string:xca>" );
        setdevdvar( @"hash_6f67d3ada4d28ec5", "<dev string:xca>" );
        setdevdvar( @"hash_5f48bb8808b7e209", "<dev string:xca>" );
        setdevdvar( @"hash_c87017f600b49447", "<dev string:xca>" );
        setdevdvar( @"hash_2e71bdd72d9c9509", "<dev string:xca>" );
        setdevdvar( @"hash_94cfa401914bb582", "<dev string:xca>" );
        setdevdvar( @"hash_cd022e5b7a0889e", "<dev string:xca>" );
        setdevdvar( @"hash_1da69ba9e35c8ea0", "<dev string:xca>" );
        setdevdvar( @"scr_givegesture", "<dev string:xca>" );
        setdevdvar( @"hash_3764674c95711828", "<dev string:xca>" );
        setdevdvar( @"hash_d51834b4d1b89a35", "<dev string:xca>" );
        setdevdvar( @"hash_d7ac865ae726cebc", "<dev string:xca>" );
        setdevdvar( @"hash_cfc446de878b0ee3", "<dev string:xca>" );
        setdevdvar( @"hash_c73cd4e651e67039", "<dev string:xca>" );
        setdevdvar( @"scr_givekillstreak", "<dev string:xca>" );
        setdevdvar( @"hash_a2679f5af2e4e7b5", 0 );
        setdevdvar( @"hash_9c416c757bf76ea2", "<dev string:xca>" );
        setdevdvar( @"hash_e0efb606c92e6d72", "<dev string:xca>" );
        setdevdvar( @"hash_a4d8c0314583b9e0", "<dev string:xca>" );
        setdevdvar( @"hash_67414ead13819dab", "<dev string:xca>" );
        setdevdvar( @"hash_c6152d5c441f3a5", "<dev string:xca>" );
        setdevdvar( @"scr_dropweapon", "<dev string:xca>" );
        setdevdvar( @"scr_dropammo", "<dev string:xca>" );
        setdevdvar( @"hash_bd52f34ef293135b", 0 );
        setdevdvar( @"hash_d0560daa501833d7", 0 );
        setdevdvar( @"hash_cd736679460603b2", -1 );
        setdevdvar( @"hash_b266c7674623f57f", 0 );
        setdevdvar( @"hash_1e71d7bfcd76b9f0", 0 );
        setdevdvar( @"hash_75dc853de5aa02e4", 0 );
        setdevdvar( @"hash_f6304191ece6f827", 0 );
        setdevdvar( @"hash_c3cafdefe09c5c07", 0 );
        setdevdvar( @"hash_28e2b3251abc4817", 0 );
        setdevdvar( @"hash_8de4ac9450b61777", "<dev string:xca>" );
        setdevdvar( @"hash_8de4ad9450b619aa", "<dev string:xca>" );
        setdevdvar( @"hash_8de4ae9450b61bdd", "<dev string:xca>" );
        setdevdvar( @"hash_8de4a79450b60c78", "<dev string:xca>" );
        setdevdvar( @"hash_8de4a89450b60eab", "<dev string:xca>" );
        setdevdvar( @"hash_efa2254b31f42841", 0 );
        setdevdvar( @"hash_ac65f9192e2efd0", 0 );
        setdevdvar( @"hash_f8168febda35ecc7", 0 );
        setdevdvar( @"hash_c70eda82dc2d8ce0", 0 );
        setdevdvar( @"hash_76509eeacc4eb3b", "<dev string:xca>" );
        setdevdvar( @"hash_77131639c7958348", 0 );
        setdevdvar( @"hash_435b27b2358cbe5", "<dev string:xca>" );
        setdevdvar( @"hash_36dc6dae079401af", "<dev string:xca>" );
        setdevdvar( @"hash_1613e9061d43f96f", "<dev string:xca>" );
        setdevdvar( @"hash_1f832fa9bd6fab3c", "<dev string:xca>" );
        setdevdvar( @"hash_78ad5df9c4da0fdf", 0 );
        setdevdvar( @"hash_f0f5f0919b0e534f", "<dev string:xca>" );
        setdevdvar( @"hash_46a5925d26c9f0fa", "<dev string:xca>" );
        setdevdvar( @"hash_f2d4c68bdb99bb05", "<dev string:xca>" );
        setdevdvar( @"hash_aa9c7230c056a9f8", "<dev string:xca>" );
        setdevdvar( @"hash_f7b7dc1629f731dd", 0 );
        setdevdvar( @"hash_b1941ef83f118a4e", "<dev string:xca>" );
        setdevdvar( @"hash_9e98f56356b76efb", 0 );
        setdevdvar( @"hash_f61046954f1b1c92", "<dev string:xca>" );
        setdevdvar( @"hash_a39dff4526bfe814", "<dev string:xca>" );
        setdevdvar( @"hash_a37021bb0f724502", "<dev string:xca>" );
        setdevdvar( @"hash_6679cf3163ebab7", "<dev string:xca>" );
        setdevdvar( @"scr_giveperk", "<dev string:xca>" );
        setdevdvar( @"scr_takeperk", "<dev string:xca>" );
        setdevdvar( @"hash_7e165cb98e746109", "<dev string:xca>" );
        setdevdvar( @"hash_de36fad7e2df7859", "<dev string:xca>" );
        setdevdvar( @"hash_31d5d7a79355909c", "<dev string:xca>" );
        setdevdvar( @"hash_afb5a1040b7b5c86", "<dev string:xca>" );
        setdevdvar( @"hash_3198b55a01316553", "<dev string:xca>" );
        setdevdvar( @"hash_f6a9618bf7b9f758", "<dev string:xca>" );
        setdevdvar( @"hash_ccb91028531c7b90", "<dev string:xca>" );
        setdevdvar( @"hash_159870fced1db05e", "<dev string:xca>" );
        setdevdvar( @"hash_603986725ce8d7c3", 0 );
        setdevdvar( @"hash_f0b8c004a14db0a2", "<dev string:xca>" );
        setdevdvar( @"hash_f0b8c104a14db2d5", "<dev string:xca>" );
        setdevdvar( @"hash_104f4546b7c78762", "<dev string:xca>" );
        setdevdvar( @"hash_f597c06b2980863d", 0 );
        setdevdvar( @"hash_dd610c5b59107d39", 0 );
        setdevdvar( @"hash_856e167b7d62864a", 0 );
        setdevdvar( @"hash_a4be290f0076f15f", 0 );
        setdevdvar( @"hash_68c6be05e346d7f", 0 );
        setdevdvar( @"hash_eac0c331e6c7a19", 0 );
        setdevdvar( @"hash_2853a457a04cedd", 0 );
        setdevdvar( @"hash_84f60afafd582b5a", "<dev string:xf8>" );
        setdevdvar( @"hash_7593dee806228a1a", 0 );
        setdevdvar( @"hash_feed6c94acdeb007", 0 );
        setdevdvar( @"hash_6a4bdbee44239d75", "<dev string:xca>" );
        setdevdvar( @"hash_aba9a0c99545e4f6", "<dev string:xca>" );
        setdevdvar( @"hash_b48b64507c871c18", 0 );
        setdevdvar( @"hash_f717bc3454c9e8d4", "<dev string:xca>" );
        setdevdvar( @"hash_f4ade8d604c72f7b", 0 );
        setdevdvar( @"hash_6b3fdb8f7cb8773e", 0 );
        setdevdvar( @"hash_78f9417314344fb8", 0 );
        setdevdvar( @"hash_a2d9af91b85e8792", 0 );
        setdevdvarifuninitialized( @"hash_5de19f2fe36e6bb8", 0, 0, 1 );
        setdevdvarifuninitialized( @"hash_c34c8720e3f2e3ce", 0.5, 0.1, 5 );
        setdevdvarifuninitialized( @"hash_d2e1e14db7113dd", 1000, 500, 5000 );
        setdevdvar( @"scr_print", "<dev string:xca>" );
        setdevdvar( @"hash_6ab9781b392f5eab", 0 );
        level.baseweaponlist = [];
        level.nextbodyindex = 0;
        scripts\common\debug_reflection::init_reflection_probe( 1 );
        scripts\common\debug_graycard::init_graycard( 1 );
        scripts\mp\rank::registerscoreinfo( #"debug_100", #"value", 100 );
        scripts\mp\rank::registerscoreinfo( #"debug_500", #"value", 500 );
        scripts\mp\rank::registerscoreinfo( #"debug_1000", #"value", 1000 );
        scripts\mp\rank::registerscoreinfo( #"debug_1500", #"value", 1500 );
        scripts\mp\rank::registerscoreinfo( #"debug_3000", #"value", 3000 );
        thread function_7da799237721b52d();
        
        for ( ;; )
        {
            wait 0.05;
            updatedevsettings();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x251f
    // Size: 0x93, Type: dev
    function function_f4fd99d8e2a39c29()
    {
        while ( true )
        {
            trigger = getdvarint( @"hash_13779b55083ae0e1" );
            setdvar( @"hash_13779b55083ae0e1", 0 );
            
            if ( trigger )
            {
                foreach ( player in level.players )
                {
                    player thread scripts\mp\supers\super_stimpistol::function_b13d8e46564cdfda( trigger );
                }
            }
            
            waitframe();
            trigger = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25ba
    // Size: 0x57b, Type: dev
    function function_53fc6eae3ece8bee()
    {
        level endon( "<dev string:x101>" );
        
        while ( true )
        {
            for ( ;; )
            {
                if ( getdvarint( @"hash_5de19f2fe36e6bb8" ) > 0 )
                {
                    break;
                }
                
                wait 1;
            }
            
            var_3d50beec8a905f93 = getdvarfloat( @"hash_c34c8720e3f2e3ce" );
            var_2e92ecdc28d885c1 = getdvarint( @"hash_d2e1e14db7113dd" );
            var_f45203a97ff98b4f = 0;
            var_12929aa2289a5b08 = 0;
            
            if ( level.mapcorners[ 0 ].origin[ 0 ] > level.mapcorners[ 1 ].origin[ 0 ] )
            {
                minx = getclosestpointonnavmesh( level.mapcorners[ 1 ].origin )[ 0 ];
                maxx = getclosestpointonnavmesh( level.mapcorners[ 0 ].origin )[ 0 ];
            }
            else
            {
                minx = getclosestpointonnavmesh( level.mapcorners[ 0 ].origin )[ 0 ];
                maxx = getclosestpointonnavmesh( level.mapcorners[ 1 ].origin )[ 0 ];
            }
            
            if ( level.mapcorners[ 0 ].origin[ 1 ] > level.mapcorners[ 1 ].origin[ 1 ] )
            {
                miny = getclosestpointonnavmesh( level.mapcorners[ 1 ].origin )[ 1 ];
                maxy = getclosestpointonnavmesh( level.mapcorners[ 0 ].origin )[ 1 ];
            }
            else
            {
                miny = getclosestpointonnavmesh( level.mapcorners[ 0 ].origin )[ 1 ];
                maxy = getclosestpointonnavmesh( level.mapcorners[ 1 ].origin )[ 1 ];
            }
            
            minz = getclosestpointonnavmesh( level.mapcenter + ( 0, 0, -1000 ) )[ 2 ];
            
            if ( isdefined( scripts\cp_mp\parachute::getc130height() ) )
            {
                maxz = getclosestpointonnavmesh( level.mapcenter + ( 0, 0, scripts\cp_mp\parachute::getc130height() ) )[ 2 ];
            }
            else
            {
                maxz = 24000;
            }
            
            if ( distance( ( minx, 0, 0 ), ( maxx, 0, 0 ) ) > distance( ( 0, miny, 0 ), ( 0, maxy, 0 ) ) )
            {
                var_f45203a97ff98b4f = distance( ( minx, 0, 0 ), ( maxx, 0, 0 ) ) / var_2e92ecdc28d885c1 * 2;
            }
            else
            {
                var_f45203a97ff98b4f = distance( ( 0, miny, 0 ), ( 0, maxy, 0 ) ) / var_2e92ecdc28d885c1 * 2;
            }
            
            foreach ( player in level.players )
            {
                for (i = 1; i < var_f45203a97ff98b4f + 1 || i >= 100; i++) {
                    if ( isai( player ) )
                    {
                        break;
                    }
                    else
                    {
                        if ( getdvarint( @"hash_30c67e7422cbc657" ) == 0 )
                        {
                            setdevdvar( @"hash_30c67e7422cbc657", 2 );
                        }
                        
                        if ( !istrue( player isufo() ) )
                        {
                            player ufo();
                        }
                    }
                    
                    if ( getdvarint( @"hash_5de19f2fe36e6bb8" ) == 0 )
                    {
                        break;
                    }
                    
                    var_12929aa2289a5b08 = round_float( 6.28 * 2 * var_2e92ecdc28d885c1 * i / 2 * var_2e92ecdc28d885c1, 0, 1 );
                    var_1dbe0821eb6f91bf = 360 / var_12929aa2289a5b08;
                    navmeshpos = getclosestpointonnavmesh( ( level.mapcenter[ 0 ], level.mapcenter[ 1 ], player.origin[ 2 ] ) );
                    player setorigin( getgroundposition( navmeshpos, 32, 100, 1000 ) );
                    wait var_3d50beec8a905f93;
                    
                    for (j = 0; j < var_12929aa2289a5b08 || j >= 500; j++) {
                        if ( getdvarint( @"hash_5de19f2fe36e6bb8" ) == 0 )
                        {
                            break;
                        }
                        
                        var_e2efb6c5929f202e = level.mapcenter[ 0 ] + i * var_2e92ecdc28d885c1 * sin( var_1dbe0821eb6f91bf * j );
                        var_e2efb7c5929f2261 = level.mapcenter[ 1 ] + i * var_2e92ecdc28d885c1 * cos( var_1dbe0821eb6f91bf * j );
                        navmeshpos = getclosestpointonnavmesh( ( var_e2efb6c5929f202e, var_e2efb7c5929f2261, randomfloatrange( minz, maxz ) ) );
                        player setorigin( getgroundposition( navmeshpos + ( 0, 0, 15 ), 1 ) );
                        wait var_3d50beec8a905f93;
                    }
                    
                    for (k = 0; k < var_12929aa2289a5b08; k++) {
                        if ( getdvarint( @"hash_5de19f2fe36e6bb8" ) == 0 )
                        {
                            break;
                        }
                        
                        if ( maxx > minx )
                        {
                            var_e2efb6c5929f202e = randomfloatrange( minx, maxx );
                        }
                        else
                        {
                            var_e2efb6c5929f202e = randomfloatrange( maxx, minx );
                        }
                        
                        if ( maxy > miny )
                        {
                            var_e2efb7c5929f2261 = randomfloatrange( miny, maxy );
                        }
                        else
                        {
                            var_e2efb7c5929f2261 = randomfloatrange( maxy, miny );
                        }
                        
                        navmeshpos = getclosestpointonnavmesh( ( var_e2efb6c5929f202e, var_e2efb7c5929f2261, randomfloatrange( minz, maxz ) ) );
                        player setorigin( getgroundposition( navmeshpos + ( 0, 0, 15 ), 1 ) );
                        wait var_3d50beec8a905f93;
                    }
                }
                
                if ( getdvarint( @"hash_5de19f2fe36e6bb8" ) > 0 )
                {
                    setdevdvar( @"hash_5de19f2fe36e6bb8", 0 );
                    break;
                }
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b3d
    // Size: 0x97, Type: dev
    function function_3cdf34f5e49d2b02()
    {
        if ( level.players.size <= 1 )
        {
            return 0;
        }
        
        host = devfindhost();
        
        if ( isdefined( host ) )
        {
            foreach ( player in level.players )
            {
                if ( player.team != host.team )
                {
                    return 1;
                }
            }
        }
        
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2bdc
    // Size: 0x43e, Type: dev
    function function_9a0fa9b6ca2660ad()
    {
        start = ( 0, 0, 0 );
        playerangles = ( 0, 0, 0 );
        forward = ( 0, 1, 0 );
        left = ( 1, 0, 0 );
        end = ( 0, 1, 0 );
        hitpos = end;
        var_ad791987651b3ba3 = start;
        ignorelist = undefined;
        runtrace = 1;
        waspressed = 0;
        
        while ( true )
        {
            if ( getdvarint( @"hash_2db5bf067432a469" ) == 1 )
            {
                host = devfindhost();
                
                if ( isdefined( host ) )
                {
                    buttondown = host buttonpressed( "<dev string:x10f>" );
                    
                    if ( buttondown && !waspressed )
                    {
                        runtrace = !runtrace;
                    }
                    
                    waspressed = buttondown;
                    
                    if ( runtrace )
                    {
                        start = host geteye();
                        playerangles = host getplayerangles();
                        forward = anglestoforward( playerangles );
                        left = anglestoleft( playerangles );
                        end = start + forward * 10000;
                        contents = physics_createcontents( [ "<dev string:x11b>" ] );
                        ignorelist = [ host ];
                        hits = undefined;
                        
                        while ( true )
                        {
                            hits = physics_raycast( start, end, contents, ignorelist, 1, "<dev string:x13c>" );
                            var_ec5084dea1eef5be = ignorelist.size;
                            
                            if ( isdefined( hits ) )
                            {
                                foreach ( hit in hits )
                                {
                                    if ( hit[ "<dev string:x154>" ] == "<dev string:x15f>" && isdefined( hit[ "<dev string:x171>" ] ) )
                                    {
                                        if ( hit[ "<dev string:x171>" ].code_classname == "<dev string:x17b>" )
                                        {
                                            ignorelist[ ignorelist.size ] = hit[ "<dev string:x171>" ];
                                            continue;
                                        }
                                        
                                        if ( hit[ "<dev string:x171>" ].code_classname == "<dev string:x189>" )
                                        {
                                            if ( hit[ "<dev string:x171>" ].spawnflags & 1 )
                                            {
                                                ignorelist[ ignorelist.size ] = hit[ "<dev string:x171>" ];
                                            }
                                            
                                            continue;
                                        }
                                        
                                        if ( hit[ "<dev string:x171>" ].code_classname == "<dev string:x19e>" )
                                        {
                                            if ( hit[ "<dev string:x171>" ].spawnflags & 4 )
                                            {
                                                ignorelist[ ignorelist.size ] = hit[ "<dev string:x171>" ];
                                            }
                                        }
                                    }
                                }
                            }
                            
                            if ( var_ec5084dea1eef5be == ignorelist.size )
                            {
                                break;
                            }
                        }
                        
                        hitpos = end;
                        
                        if ( isdefined( hits ) && hits.size > 0 )
                        {
                            hitpos = hits[ 0 ][ "<dev string:x1ae>" ];
                        }
                        
                        var_ad791987651b3ba3 = host.origin;
                    }
                    else
                    {
                        line( start, hitpos, ( 0, 0, 1 ), 1, 0, 1 );
                    }
                    
                    var_29f55613421c5159 = distance( start, hitpos );
                    depthtest = 1;
                    
                    if ( ignorelist.size > 1 )
                    {
                        depthtest = 0;
                    }
                    
                    if ( depthtest )
                    {
                        sphere( hitpos, 10, ( 1, 0, 0 ), 0, 1 );
                    }
                    
                    sphere( hitpos, 10, ( 0, 1, 0 ), depthtest, 1 );
                    print3d( hitpos + left * -20, "<dev string:xca>" + var_29f55613421c5159, ( 1, 1, 1 ), 1, 1, 1 );
                    var_633eaa5f21008b6f = var_ad791987651b3ba3 + left * 50;
                    line( var_633eaa5f21008b6f, hitpos, ( 0, 1, 0 ), 1, depthtest, 1 );
                    var_3eacd3938ccd4b6c = var_ad791987651b3ba3 + left * -50;
                    line( var_3eacd3938ccd4b6c, hitpos, ( 0, 1, 0 ), 1, depthtest, 1 );
                    var_633eaa5f21008b6f += ( 0, 0, 100 );
                    line( var_633eaa5f21008b6f, hitpos, ( 0, 1, 0 ), 1, depthtest, 1 );
                    var_3eacd3938ccd4b6c += ( 0, 0, 100 );
                    line( var_3eacd3938ccd4b6c, hitpos, ( 0, 1, 0 ), 1, depthtest, 1 );
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3022
    // Size: 0x54c, Type: dev
    function function_7da799237721b52d()
    {
        scripts\mp\flags::gameflagwait( "<dev string:x1ba>" );
        var_ce8ff234bacc512d = 0;
        
        while ( true )
        {
            var_c2fb898193825c1b = getdvarint( @"hash_cf0fa0390ef7a109" );
            
            if ( var_c2fb898193825c1b != var_ce8ff234bacc512d )
            {
                while ( getdvarint( @"hash_cf0fa0390ef7a109" ) == 1 && !function_3cdf34f5e49d2b02() )
                {
                    wait 1;
                    host = devfindhost();
                    
                    if ( isdefined( host ) )
                    {
                        host iprintlnbold( "<dev string:x1cb>" );
                    }
                }
                
                if ( var_c2fb898193825c1b )
                {
                    setdvar( @"hash_1f34b1ca7c74422b", 2 );
                    setdvar( @"hash_74445c46e9570b8c", 1 );
                    setdvar( @"hash_fecec194bb60af48", 2 );
                    setdvar( @"hash_608f19db5c17a532", 1 );
                    setdvar( @"hash_66ba57da7420ba2c", 1 );
                    setdvar( @"hash_2e0564e59408db4", 1 );
                }
                else
                {
                    setdvar( @"hash_1f34b1ca7c74422b", 0 );
                    setdvar( @"hash_74445c46e9570b8c", 0 );
                    setdvar( @"hash_fecec194bb60af48", 1 );
                    setdvar( @"hash_608f19db5c17a532", 0 );
                    setdvar( @"hash_66ba57da7420ba2c", 0 );
                    setdvar( @"hash_2e0564e59408db4", 0 );
                }
            }
            
            var_ce8ff234bacc512d = var_c2fb898193825c1b;
            function_85ba65ae7004a192();
            function_5c8e814605d74ddf();
            function_41ea880c5af1f486();
            
            if ( getdvarint( @"hash_2814505e96048f69", 0 ) == 1 )
            {
                if ( isdefined( level.zone ) )
                {
                    if ( isdefined( level.getkothzonedeadzonedist ) )
                    {
                        deadzonedist = [[ level.getkothzonedeadzonedist ]]();
                    }
                    else
                    {
                        deadzonedist = 1000;
                    }
                    
                    cylinder( level.zone.curorigin, level.zone.curorigin + ( 0, 0, 1 ), deadzonedist, ( 1, 0, 0 ) );
                    
                    foreach ( spawnpoint in level.zone.spawnpoints[ 0 ] )
                    {
                        drawspawnpoint( spawnpoint, spawnpoint.classname, ( 1, 1, 1 ) );
                    }
                    
                    foreach ( spawnpoint in level.zone.spawnpoints[ 2 ] )
                    {
                        drawspawnpoint( spawnpoint, spawnpoint.classname, ( 1, 1, 1 ) );
                    }
                }
            }
            
            if ( getdvarint( @"hash_d4420d4cfbeab8b9", 0 ) == 1 )
            {
                if ( isdefined( level.current_objective ) )
                {
                    deadzonedist = [[ level.getkothzonedeadzonedist ]]();
                    maxdist = [[ level.var_a4f0b18944c00689 ]]();
                    fallbackdist = [[ level.var_da752fc97f989d07 ]]();
                    cylinder( level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + ( 0, 0, 1 ), deadzonedist, ( 1, 0, 0 ), 0, 25 );
                    cylinder( level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + ( 0, 0, 1 ), maxdist, ( 1, 0, 0 ), 0, 25 );
                    cylinder( level.current_objective.trigger.originalpos, level.current_objective.trigger.originalpos + ( 0, 0, 1 ), fallbackdist, ( 1, 0, 1 ), 0, 25 );
                    
                    foreach ( spawnpoint in level.current_objective.spawnpoints )
                    {
                        drawspawnpoint( spawnpoint, spawnpoint.classname, ( 1, 1, 1 ) );
                    }
                    
                    foreach ( spawnpoint in level.current_objective.fallbackspawnpoints )
                    {
                        drawspawnpoint( spawnpoint, spawnpoint.classname, ( 1, 1, 1 ) );
                    }
                }
            }
            
            wait level.var_5683153ad305ce08;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x3576
    // Size: 0x444, Type: dev
    function drawspawnpoint( spawnpoint, classname, color, var_ac5a6ba06050a17a, var_a90e409d285175b4, var_f7fc2d16b59644f1 )
    {
        if ( !isdefined( var_f7fc2d16b59644f1 ) )
        {
            var_f7fc2d16b59644f1 = scripts\mp\spawnlogic::isfallbackspawn( spawnpoint );
        }
        
        height = ter_op( var_f7fc2d16b59644f1, 36, 72 );
        base = spawnpoint.origin;
        forward = anglestoforward( spawnpoint.angles );
        right = anglestoright( spawnpoint.angles );
        top = spawnpoint.origin + ( 0, 0, 1 ) * height;
        center = spawnpoint.origin + ( 0, 0, 1 ) * height * 0.5;
        forward *= 16;
        right *= 16;
        centerright = center + right;
        centerleft = center - right;
        centerforward = center + forward;
        centerback = center - forward;
        line( base, centerright, color, 1, 0, level.var_e117330e38c95d0b );
        line( base, centerleft, color, 1, 0, level.var_e117330e38c95d0b );
        line( top, centerright, color, 1, 0, level.var_e117330e38c95d0b );
        line( top, centerleft, color, 1, 0, level.var_e117330e38c95d0b );
        line( base, centerforward, color, 1, 0, level.var_e117330e38c95d0b );
        line( top, centerforward, color, 1, 0, level.var_e117330e38c95d0b );
        line( base, top, color, 1, 0, level.var_e117330e38c95d0b );
        arrow_forward = anglestoforward( spawnpoint.angles );
        arrowhead_forward = anglestoforward( spawnpoint.angles );
        arrowhead_right = anglestoright( spawnpoint.angles );
        arrow_forward *= 32;
        arrowhead_forward *= 24;
        arrowhead_right *= 8;
        arrowtip = center + arrow_forward;
        arrowleft = center + arrowhead_forward - arrowhead_right;
        arrowright = center + arrowhead_forward + arrowhead_right;
        line( center, arrowtip, ( 1, 1, 1 ), 1, 0, level.var_e117330e38c95d0b );
        line( arrowtip, arrowleft, ( 1, 1, 1 ), 1, 0, level.var_e117330e38c95d0b );
        line( arrowtip, arrowright, ( 1, 1, 1 ), 1, 0, level.var_e117330e38c95d0b );
        
        foreach ( alternate in spawnpoint.alternates )
        {
            line( spawnpoint.origin, alternate, color, 1, 0, level.var_e117330e38c95d0b );
        }
        
        topline = spawnpoint.index + "<dev string:x1f1>" + classname;
        print3d( spawnpoint.origin + ( 0, 0, height ), topline, color, 1, 1, level.var_e117330e38c95d0b );
        
        if ( isdefined( var_ac5a6ba06050a17a ) )
        {
            print3d( spawnpoint.origin + ( 0, 0, height - 20 ), var_ac5a6ba06050a17a, ( 1, 1, 1 ), 1, 1, level.var_e117330e38c95d0b );
        }
        
        if ( isdefined( var_a90e409d285175b4 ) )
        {
            print3d( spawnpoint.origin + ( 0, 0, height - 30 ), var_a90e409d285175b4, ( 1, 1, 1 ), 1, 1, level.var_e117330e38c95d0b );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x39c2
    // Size: 0x1fb, Type: dev
    function function_5c8e814605d74ddf()
    {
        var_6fe1eaae1d5e03c = getdvarint( @"hash_fecec194bb60af48" );
        
        if ( var_6fe1eaae1d5e03c != 0 && getdvar( @"hash_1f34b1ca7c74422b" ) != "<dev string:x1f8>" )
        {
            host = devfindhost();
            targetplayer = undefined;
            
            if ( var_6fe1eaae1d5e03c == 1 )
            {
                targetplayer = host;
            }
            else
            {
                if ( !function_3cdf34f5e49d2b02() )
                {
                    host iprintlnbold( "<dev string:x1cb>" );
                    return;
                }
                
                foreach ( player in level.players )
                {
                    if ( player.team != host.team )
                    {
                        targetplayer = player;
                        break;
                    }
                }
            }
            
            if ( isdefined( targetplayer ) && targetplayer.team != "<dev string:x200>" )
            {
                var_eeea99b025f32f53 = level.disableteamstartspawns;
                level.disableteamstartspawns = 1;
                var_254d278b6dcf1c4a = level.usestartspawns;
                level.usestartspawns = 0;
                level.var_da1462b5666f1b4 = 1;
                selectedspawnpoint = targetplayer [[ level.getspawnpoint ]]();
                level.disableteamstartspawns = var_eeea99b025f32f53;
                level.usestartspawns = var_254d278b6dcf1c4a;
                
                if ( isdefined( level.var_53043465614ec8f8 ) )
                {
                    scripts\mp\spawnlogic::activatespawnset( level.var_53043465614ec8f8, 1 );
                    
                    if ( isdefined( level.var_b5bad5601a066c66 ) )
                    {
                        scripts\mp\spawnlogic::activatespawnset( level.var_b5bad5601a066c66, 0 );
                    }
                }
                
                targetplayer finalizespawnpointchoiceforplayer( selectedspawnpoint.index, selectedspawnpoint.bucket, selectedspawnpoint.usingfallback, selectedspawnpoint.threatsight, selectedspawnpoint.damagemod );
                level.var_da1462b5666f1b4 = undefined;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bc5
    // Size: 0xf0, Type: dev
    function function_41ea880c5af1f486()
    {
        if ( getdvarint( @"hash_99ed34bc5a345aff" ) != 0 )
        {
            foreach ( spawnpoint in level.startspawnpoints )
            {
                foreach ( spawnpoint in level.startspawnpoints )
                {
                    color = ( 0, 0, 1 );
                    
                    if ( spawnpoint.infront )
                    {
                        color = ( 1, 1, 1 );
                    }
                    
                    drawspawnpoint( spawnpoint, spawnpoint.classname, color, undefined, undefined );
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3cbd
    // Size: 0x3f7, Type: dev
    function function_85ba65ae7004a192()
    {
        var_a9ba9ed5d3a76ec4 = getdvarint( @"hash_4048e0584107c82d", 0 );
        
        if ( var_a9ba9ed5d3a76ec4 != 0 )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                switch ( getdvarint( @"hash_36ffd6c38bff011f", 0 ) )
                {
                    case 1:
                        nearestdist = 20000000;
                        nearestspawn = level.spawnpoints[ 0 ];
                        
                        foreach ( spawnpoint in level.spawnpoints )
                        {
                            dist = distance( spawnpoint.origin, host.origin );
                            
                            if ( dist < nearestdist )
                            {
                                nearestspawn = spawnpoint;
                                nearestdist = dist;
                            }
                        }
                        
                        level.var_234506fd1f964918 = nearestspawn;
                        level.var_f824ee3add901d82 = undefined;
                        setdevdvar( @"hash_36ffd6c38bff011f", 0 );
                        break;
                    case 2:
                        nearestdot = -1;
                        nearestspawn = level.spawnpoints[ 0 ];
                        playerforward = anglestoforward( host getplayerangles() );
                        
                        foreach ( spawnpoint in level.spawnpoints )
                        {
                            tospawnpoint = vectornormalize( spawnpoint.origin - host.origin );
                            dot = vectordot( playerforward, tospawnpoint );
                            
                            if ( dot > nearestdot )
                            {
                                nearestspawn = spawnpoint;
                                nearestdot = dot;
                            }
                        }
                        
                        level.var_234506fd1f964918 = nearestspawn;
                        level.var_f824ee3add901d82 = undefined;
                        setdevdvar( @"hash_36ffd6c38bff011f", 0 );
                        break;
                }
                
                switch ( getdvarint( @"hash_da92d5d5b7678a37", 0 ) )
                {
                    case 1:
                        playernodes = host getnearnodelistforspawncheck( scripts\mp\spawnlogic::getfarnoderadiusdist() );
                        level.var_f824ee3add901d82 = playernodes[ 0 ];
                        level.var_234506fd1f964918 = undefined;
                        setdevdvar( @"hash_da92d5d5b7678a37", 0 );
                        break;
                    case 2:
                        startpos = host geteye();
                        dir = anglestoforward( host getplayerangles() );
                        endpos = startpos + dir * 5000;
                        traceresults = scripts\engine\trace::ray_trace( startpos, endpos, host );
                        pathnodes = [];
                        
                        if ( isdefined( traceresults ) && isdefined( traceresults[ "<dev string:x1ae>" ] ) )
                        {
                            pathnodes = scripts\mp\spawnlogic::getradiuspathsighttestnodes( traceresults[ "<dev string:x1ae>" ] );
                        }
                        
                        level.var_f824ee3add901d82 = pathnodes[ 0 ];
                        level.var_234506fd1f964918 = undefined;
                        setdevdvar( @"hash_da92d5d5b7678a37", 0 );
                        break;
                }
                
                if ( isdefined( level.var_234506fd1f964918 ) )
                {
                    playernodes = host getnearnodelistforspawncheck( scripts\mp\spawnlogic::getfarnoderadiusdist() );
                    spawnpointnodes = scripts\mp\spawnlogic::getradiuspathsighttestnodes( level.var_234506fd1f964918.origin );
                    
                    if ( isdefined( playernodes[ 0 ] ) && isdefined( spawnpointnodes[ 0 ] ) )
                    {
                        if ( var_a9ba9ed5d3a76ec4 == 1 )
                        {
                            function_1eb5ea876c3c58d4( host, playernodes[ 0 ], spawnpointnodes[ 0 ] );
                        }
                        else
                        {
                            function_1ae49ecbf9d67abe( host, spawnpointnodes[ 0 ] );
                        }
                    }
                    
                    return;
                }
                
                if ( isdefined( level.var_f824ee3add901d82 ) )
                {
                    playernodes = host getnearnodelistforspawncheck( scripts\mp\spawnlogic::getfarnoderadiusdist() );
                    
                    if ( isdefined( playernodes[ 0 ] ) )
                    {
                        if ( var_a9ba9ed5d3a76ec4 == 1 )
                        {
                            function_1eb5ea876c3c58d4( host, playernodes[ 0 ], level.var_f824ee3add901d82 );
                            return;
                        }
                        
                        function_1ae49ecbf9d67abe( host, level.var_f824ee3add901d82 );
                    }
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x40bc
    // Size: 0x243, Type: dev
    function function_1eb5ea876c3c58d4( player, playernode, spawnnode )
    {
        pathpositions = player findpath( spawnnode.origin, playernode.origin );
        
        if ( !isdefined( pathpositions ) || pathpositions.size == 0 )
        {
            return;
        }
        
        function_dfb2ff04c76410f7( pathpositions, ( 1, 1, 1 ) );
        tempspawnstruct = spawnstruct();
        tempspawnstruct.radiuspathnodes = [ spawnnode ];
        pathnodes = [];
        
        foreach ( pathposition in pathpositions )
        {
            pathnode = getclosestnodeinsight( pathposition );
            
            if ( isdefined( pathnode ) )
            {
                pathnodes[ pathnode getnodenumber() ] = pathnode;
            }
        }
        
        foreach ( pathnode in pathnodes )
        {
            start = pathnode.origin + ( 0, 0, 60 );
            end = spawnnode.origin + ( 0, 0, 60 );
            dist = distance( start, end );
            traceresults = scripts\engine\trace::ray_trace( start, end, player );
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [ pathnode ];
            ttlos = scripts\mp\spawnlogic::_precomputedlosdatatest( var_62f9eb99e8a4c02, tempspawnstruct );
            line( end, start, ( 0, 0, 1 ), 0, level.var_e117330e38c95d0b );
            box( start, 0, ( 0, 0, 0 ), 0, level.var_e117330e38c95d0b );
            box( end, 0, ( 1, 1, 1 ), 0, level.var_e117330e38c95d0b );
            function_7346ecd3666450e3( pathnode, ttlos );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4307
    // Size: 0x123, Type: dev
    function function_1ae49ecbf9d67abe( player, targetnode )
    {
        pathnodes = getnodesinradius( player.origin, getdvarint( @"hash_8ce1d68eab6c438c", 1000 ), 0, 1024 );
        
        if ( !isdefined( pathnodes ) || pathnodes.size == 0 )
        {
            return;
        }
        
        sphere( targetnode.origin, 50, ( 1, 1, 1 ), 0, level.var_e117330e38c95d0b );
        tempspawnstruct = spawnstruct();
        tempspawnstruct.radiuspathnodes = [ targetnode ];
        
        foreach ( pathnode in pathnodes )
        {
            var_62f9eb99e8a4c02 = spawnstruct();
            var_62f9eb99e8a4c02.spawnviewpathnodes = [ pathnode ];
            ttlos = scripts\mp\spawnlogic::_precomputedlosdatatest( var_62f9eb99e8a4c02, tempspawnstruct );
            function_7346ecd3666450e3( pathnode, ttlos );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4432
    // Size: 0x19a, Type: dev
    function function_7346ecd3666450e3( pathnode, ttlos )
    {
        lowerlimitfullsights = getdvarfloat( @"hash_ba77e8f37223f218" );
        lowerlimitcornersights = getdvarfloat( @"hash_f055530a90c953bc" );
        color = ( 0, 1, 0 );
        
        if ( ttlos[ 0 ] > lowerlimitfullsights )
        {
            color = ( 1, 0, 0 );
        }
        else if ( ttlos[ 0 ] > lowerlimitcornersights )
        {
            color = ( 1, 1, 0 );
        }
        
        print3d( pathnode.origin, ( 1 - ttlos[ 0 ] ) * 2550, color, 1, 1, level.var_e117330e38c95d0b );
        line( pathnode.origin + ( 0, 0, -10 ), pathnode.origin + ( 0, 0, 10 ), color, 1, 0, level.var_e117330e38c95d0b );
        line( pathnode.origin + ( 10, 0, 0 ), pathnode.origin + ( -10, 0, 0 ), color, 1, 0, level.var_e117330e38c95d0b );
        line( pathnode.origin + ( 0, 10, 0 ), pathnode.origin + ( 0, -10, 0 ), color, 1, 0, level.var_e117330e38c95d0b );
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x45d4
    // Size: 0xb5, Type: dev
    function function_847de9fd3b2ff0da( var_970d2f3032ff7a19, fallbackspawnset, var_6c6e28a61d9a7957 )
    {
        if ( getdvarint( @"hash_cf0fa0390ef7a109" ) != 0 && istrue( level.var_da1462b5666f1b4 ) )
        {
            scripts\mp\spawnlogic::deactivateallspawnsets();
            spawnsets = getarraykeys( level.spawnglobals.spawnsets );
            
            foreach ( spawnset in spawnsets )
            {
                scripts\mp\spawnlogic::activatespawnset( spawnset, 0 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4691
    // Size: 0xdf, Type: dev
    function function_75d2477e56b1aea8( spawningplayer )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        level.var_87f201b082ecf16d = spawnstruct();
        data = level.var_87f201b082ecf16d;
        data.spawningplayer = spawningplayer;
        data.spawnpoints = undefined;
        
        foreach ( player in level.players )
        {
            player.var_2aa7915697eed383 = undefined;
            player.var_e7b68ba3052a8046 = undefined;
            player.var_c6bbe5426966901f = undefined;
            player.buddyspawnpos = player.origin;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4778
    // Size: 0x447, Type: dev
    function function_7dd78553c3cb9d38()
    {
        while ( true )
        {
            var_b972ca9086b939cc = getdvarint( @"hash_9bffca47d2e56b54" );
            
            if ( var_b972ca9086b939cc == 0 )
            {
                waitframe();
                continue;
            }
            
            if ( var_b972ca9086b939cc == 1 )
            {
                host = devfindhost();
                
                if ( !isdefined( host ) || host.team == "<dev string:x200>" )
                {
                    waitframe();
                    continue;
                }
                
                spawncontext = scripts\mp\spawnlogic::createspawnquerycontext( host, host.team );
                scripts\mp\spawnlogic::setactivespawnquerycontext( spawncontext );
                var_2aa7915697eed383 = host scripts\mp\spawnscoring::findbuddyspawn();
            }
            
            waitframe();
            
            if ( !isdefined( level.var_87f201b082ecf16d ) )
            {
                continue;
            }
            
            foreach ( player in level.players )
            {
                if ( player == level.var_87f201b082ecf16d.spawningplayer )
                {
                    continue;
                }
                
                box( player.buddyspawnpos, 0, ter_op( player.team != level.var_87f201b082ecf16d.spawningplayer.team, ( 1, 0, 0 ), ( 1, 1, 1 ) ), 0, 1 );
                
                if ( !isdefined( player.var_2aa7915697eed383 ) || player.var_2aa7915697eed383 != "<dev string:x20d>" )
                {
                    playertext = ter_op( isdefined( player.var_2aa7915697eed383 ), player.var_2aa7915697eed383, "<dev string:x216>" );
                    color = ter_op( isdefined( player.var_2aa7915697eed383 ) && player.var_2aa7915697eed383 == "<dev string:x20d>", ( 0, 1, 0 ), ( 1, 0, 0 ) );
                    print3d( player.buddyspawnpos + ( 0, 0, 50 ), playertext, color, 1, 1, 1 );
                }
                
                if ( isdefined( player.var_e7b68ba3052a8046 ) )
                {
                    foreach ( pathnode in player.var_e7b68ba3052a8046 )
                    {
                        line( pathnode.origin, player.buddyspawnpos + ( 0, 0, 36 ), ( 0, 0, 0.5 ), 1, 0, 1 );
                        box( pathnode.origin, 0, ( 0, 0, 1 ), 0, 1 );
                    }
                }
            }
            
            foreach ( spawnpoint in level.var_87f201b082ecf16d.spawnpoints )
            {
                color = ter_op( isdefined( spawnpoint.var_e9f489beb2febe9a ) && spawnpoint.var_e9f489beb2febe9a == "<dev string:x223>", ( 0, 1, 0 ), ( 1, 0, 0 ) );
                crittext = "<dev string:x22e>" + ter_op( isdefined( spawnpoint.var_e9f489beb2febe9a ), spawnpoint.var_e9f489beb2febe9a, "<dev string:x216>" );
                drawspawnpoint( spawnpoint, "<dev string:x238>", color, "<dev string:x247>" + spawnpoint.totalscore, crittext );
                line( spawnpoint.origin + ( 0, 0, 36 ), spawnpoint.owner.buddyspawnpos + ( 0, 0, 36 ), ( 1, 1, 1 ), 1, 0, 1 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4bc7
    // Size: 0x37, Type: dev
    function function_fe598e0c02fe84ec( player, result )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        player.var_2aa7915697eed383 = result;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c06
    // Size: 0x44, Type: dev
    function function_b1972efe5a8d2a37( spawnpoints )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        data = level.var_87f201b082ecf16d;
        data.spawnpoints = spawnpoints;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c52
    // Size: 0x3d, Type: dev
    function function_55db94df92c1a7c4( buddy, pathnodes )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        if ( !isdefined( pathnodes ) )
        {
            return;
        }
        
        buddy.var_e7b68ba3052a8046 = pathnodes;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c97
    // Size: 0x3d, Type: dev
    function function_c06e014cedb53155( buddy, pathnode )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        if ( !isdefined( pathnode ) )
        {
            return;
        }
        
        buddy.var_c6bbe5426966901f = pathnode;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4cdc
    // Size: 0x37, Type: dev
    function function_41fd2e38468e1538( spawnpoint, reason )
    {
        if ( getdvarint( @"hash_9bffca47d2e56b54" ) == 0 )
        {
            return;
        }
        
        spawnpoint.var_e9f489beb2febe9a = reason;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4d1b
    // Size: 0x7c8, Type: dev
    function function_3d748a0bd7fd42bf()
    {
        level endon( "<dev string:x252>" );
        self endon( "<dev string:x273>" );
        dpad_left = 0;
        dpad_right = 0;
        dpad_up = 0;
        dpad_down = 0;
        var_c648074137812581 = 0;
        
        if ( !isdefined( level.var_aee4775df6b42286 ) )
        {
            level.var_aee4775df6b42286 = spawnstruct();
        }
        
        level.var_aee4775df6b42286.teamfilter = "<dev string:xf0>";
        level.var_aee4775df6b42286.currentsetindex = 0;
        level.var_aee4775df6b42286.currentspawnindex = 0;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = 0;
        level.var_aee4775df6b42286.msg = "<dev string:xca>";
        var_3bfdd37a36509b8a = 0;
        var_3fd47cb31b38c4f3 = 0;
        scale = 2;
        var_d1d1c4895c322015 = getarraykeys( level.spawnpointarray );
        
        while ( true )
        {
            self setactionslot( 3, "<dev string:xca>" );
            self setactionslot( 4, "<dev string:xca>" );
            
            if ( !var_c648074137812581 && ( self buttonpressed( "<dev string:x281>" ) || self buttonpressed( "<dev string:x291>" ) ) )
            {
                var_c648074137812581 = 1;
                var_3fd47cb31b38c4f3 = !var_3fd47cb31b38c4f3;
            }
            else if ( !self buttonpressed( "<dev string:x281>" ) && !self buttonpressed( "<dev string:x291>" ) )
            {
                var_c648074137812581 = 0;
            }
            
            if ( !dpad_up && ( self buttonpressed( "<dev string:x29b>" ) || self buttonpressed( "<dev string:x2a6>" ) ) )
            {
                level.var_aee4775df6b42286.currentsetindex++;
                
                if ( level.var_aee4775df6b42286.currentsetindex >= level.spawnpointarray.size )
                {
                    level.var_aee4775df6b42286.currentsetindex = 0;
                }
                
                level.var_aee4775df6b42286.currentspawnindex = 0;
                dpad_up = 1;
                var_3bfdd37a36509b8a = 1;
            }
            else if ( !self buttonpressed( "<dev string:x29b>" ) && !self buttonpressed( "<dev string:x2a6>" ) )
            {
                dpad_up = 0;
            }
            
            if ( !dpad_down && ( self buttonpressed( "<dev string:x2b1>" ) || self buttonpressed( "<dev string:x2be>" ) ) )
            {
                level.var_aee4775df6b42286.currentsetindex--;
                
                if ( level.var_aee4775df6b42286.currentsetindex < 0 )
                {
                    level.var_aee4775df6b42286.currentsetindex = level.spawnpointarray.size - 1;
                }
                
                level.var_aee4775df6b42286.currentspawnindex = 0;
                var_3bfdd37a36509b8a = 1;
                dpad_down = 1;
            }
            else if ( !self buttonpressed( "<dev string:x2b1>" ) && !self buttonpressed( "<dev string:x2be>" ) )
            {
                dpad_down = 0;
            }
            
            if ( !dpad_left && ( self buttonpressed( "<dev string:x2cb>" ) || self buttonpressed( "<dev string:x2d8>" ) ) )
            {
                if ( var_3fd47cb31b38c4f3 )
                {
                    origin = self.origin;
                    angles = ( 0, self.angles[ 1 ], 0 );
                    cmd = function_3bee1ba99f936020( "<dev string:x2e5>", origin ) + "<dev string:x2ef>" + function_3bee1ba99f936020( "<dev string:x2f4>", angles );
                    function_dfb8ddedc9169a96( cmd );
                    displaymsg( "<dev string:x2fe>" + origin + "<dev string:x31a>" + angles );
                }
                else
                {
                    level.var_aee4775df6b42286.currentspawnindex--;
                    
                    if ( level.var_aee4775df6b42286.currentspawnindex < 0 )
                    {
                        level.var_aee4775df6b42286.currentspawnindex = level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ].size - 1;
                    }
                    
                    var_3bfdd37a36509b8a = 1;
                    println( "<dev string:x31f>" + level.var_aee4775df6b42286.currentspawnindex );
                }
                
                dpad_left = 1;
            }
            else if ( !self buttonpressed( "<dev string:x2cb>" ) && !self buttonpressed( "<dev string:x2d8>" ) )
            {
                dpad_left = 0;
            }
            
            if ( !dpad_right && ( self buttonpressed( "<dev string:x32d>" ) || self buttonpressed( "<dev string:x33b>" ) ) )
            {
                if ( var_3fd47cb31b38c4f3 )
                {
                    origin = self.origin;
                    angles = ( 0, self.angles[ 1 ], 0 );
                    cmd = var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] + "<dev string:x2ef>" + function_3bee1ba99f936020( "<dev string:x2e5>", origin ) + "<dev string:x2ef>" + function_3bee1ba99f936020( "<dev string:x2f4>", angles );
                    function_99ae16b0c7c4c56f( cmd );
                    displaymsg( "<dev string:x349>" + var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] + "<dev string:x31a>" + origin + "<dev string:x31a>" + angles );
                }
                else
                {
                    level.var_aee4775df6b42286.currentspawnindex++;
                    
                    if ( level.var_aee4775df6b42286.currentspawnindex >= level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ].size )
                    {
                        level.var_aee4775df6b42286.currentspawnindex = 0;
                    }
                    
                    var_3bfdd37a36509b8a = 1;
                    println( "<dev string:x35c>" + level.var_aee4775df6b42286.currentspawnindex );
                }
                
                dpad_right = 1;
            }
            else if ( !self buttonpressed( "<dev string:x32d>" ) && !self buttonpressed( "<dev string:x33b>" ) )
            {
                dpad_right = 0;
            }
            
            if ( !var_3fd47cb31b38c4f3 && var_3bfdd37a36509b8a && level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ].size > 0 )
            {
                origin = level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ][ level.var_aee4775df6b42286.currentspawnindex ].origin;
                angles = level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ][ level.var_aee4775df6b42286.currentspawnindex ].angles;
                println( "<dev string:x36b>" + var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] );
                self setorigin( origin );
                self setplayerangles( angles );
                var_3bfdd37a36509b8a = 0;
            }
            
            if ( var_3fd47cb31b38c4f3 )
            {
                printtoscreen2d( 100, 750, "<dev string:x38e>", ( 1, 0, 0 ), scale );
                printtoscreen2d( 100, 780, "<dev string:x39f>" + var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ], ( 1, 0, 0 ), scale );
                updatemsg();
            }
            else
            {
                size = level.spawnpointarray[ var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ] ].size;
                var_d93b5bcbaa9af6a3 = string( level.var_aee4775df6b42286.currentspawnindex + 1 );
                
                if ( size == 0 )
                {
                    var_d93b5bcbaa9af6a3 = "<dev string:xc5>";
                }
                
                printtoscreen2d( 100, 750, "<dev string:x3ac>", ( 1, 1, 0 ), scale );
                printtoscreen2d( 100, 780, "<dev string:x3bf>" + var_d1d1c4895c322015[ level.var_aee4775df6b42286.currentsetindex ], ( 1, 1, 0 ), scale );
                printtoscreen2d( 100, 810, "<dev string:x3cc>" + var_d93b5bcbaa9af6a3 + "<dev string:x3d7>" + string( size ), ( 1, 1, 0 ), scale );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x54eb
    // Size: 0x3e, Type: dev
    function function_3bee1ba99f936020( key, vec )
    {
        return key + "<dev string:x3e3>" + vec[ 0 ] + "<dev string:x3e9>" + vec[ 1 ] + "<dev string:x3e9>" + vec[ 2 ] + "<dev string:x3ef>";
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x5531
    // Size: 0x40, Type: dev
    function displaymsg( msg )
    {
        level.var_aee4775df6b42286.msg = msg;
        level.var_aee4775df6b42286.var_245e093e2c1e1395 = gettime() + 4000;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5579
    // Size: 0x69, Type: dev
    function updatemsg()
    {
        if ( gettime() < level.var_aee4775df6b42286.var_245e093e2c1e1395 && level.var_aee4775df6b42286.msg != "<dev string:xca>" )
        {
            printtoscreen2d( 100, 620, level.var_aee4775df6b42286.msg, ( 1, 0, 0 ) );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x55ea
    // Size: 0x3fb6, Type: dev
    function updatedevsettings()
    {
        updateminimapsetting();
        
        if ( getdvar( @"hash_c6152d5c441f3a5" ) != "<dev string:xca>" )
        {
            camval = int( getdvar( @"hash_c6152d5c441f3a5" ) );
            setdevdvar( @"hash_c6152d5c441f3a5", "<dev string:xca>" );
            
            if ( camval == 1 )
            {
                foreach ( player in level.players )
                {
                    player thread notifyaftertime();
                    player scripts\mp\playerlogic::spawnspectatormapcam( 99 );
                }
            }
            else if ( camval == 2 )
            {
                map_restart();
            }
        }
        
        if ( getdvar( @"hash_d732ae157aef3ffd" ) != "<dev string:xca>" )
        {
            score = getdvarint( @"hash_d732ae157aef3ffd" );
            scripts\mp\gamescore::_setteamscore( "<dev string:x3f4>", score );
        }
        
        if ( getdvar( @"hash_1b83a785deee1fc" ) != "<dev string:xca>" )
        {
            score = getdvarint( @"hash_1b83a785deee1fc" );
            scripts\mp\gamescore::_setteamscore( "<dev string:x3fe>", score );
        }
        
        var_18d26091f3e5b475 = getdvar( @"hash_f207bc2025565cfc" );
        
        if ( var_18d26091f3e5b475 != "<dev string:xca>" )
        {
            foreach ( player in level.players )
            {
                player thread function_8e08e2e46ce4aaab();
                player function_81fbd229afdc1593( var_18d26091f3e5b475 );
            }
            
            setdevdvar( @"hash_f207bc2025565cfc", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_5846fb2081840ca1" ) != "<dev string:xca>" )
        {
            setdevdvar( @"hash_5846fb2081840ca1", "<dev string:xca>" );
            
            for (rid = 0; rid <= level.maxrank; rid++) {
                rankname = function_cd47cbfaa2de3623( rid );
                iprintln( "<dev string:x406>" + rid + 1 );
                iprintln( "<dev string:x42c>", rankname, "<dev string:x450>" + rid + 1 + "<dev string:x458>" );
                wait 0.05;
            }
        }
        
        if ( getdvar( @"hash_c73cd4e651e67039" ) != "<dev string:xca>" )
        {
            foreach ( baseweapon, _ in level.baseweaponlist )
            {
                iprintln( baseweapon );
            }
            
            setdevdvar( @"hash_c73cd4e651e67039", "<dev string:xca>" );
        }
        
        var_a1588061d222e213 = getdvar( @"scr_givekillstreak" );
        var_967387626350eb82 = getdvar( @"hash_a2679f5af2e4e7b5", "<dev string:xc5>" );
        
        if ( var_a1588061d222e213 != "<dev string:xca>" )
        {
            streaknames = scripts\engine\utility::string_split( var_a1588061d222e213, "<dev string:x45d>" );
            blueprintindexes = scripts\engine\utility::string_split( var_967387626350eb82, "<dev string:x45d>" );
            var_11b0ced15240d43f = streaknames.size > 1;
            
            for (i = 0; i < streaknames.size; i++) {
                streakname = streaknames[ i ];
                blueprintindex = int( default_to( blueprintindexes[ i ], "<dev string:xc5>" ) );
                streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
                var_921e39c71a7d1713 = 0;
                emptime = undefined;
                
                if ( streakname == "<dev string:x462>" )
                {
                    var_921e39c71a7d1713 = 1;
                    emptime = getdvarfloat( @"hash_7ae9abc841dc9c4b" );
                    streakname = "<dev string:x46f>";
                    setdevdvar( @"hash_7ae9abc841dc9c4b", 1 );
                }
                
                if ( isdefined( streaksetupinfo ) && getkillstreakindex( streakname ) != -1 )
                {
                    playerarray = function_13e3c70659983189();
                    
                    foreach ( player in playerarray )
                    {
                        if ( isbot( player ) || istestclient( player ) )
                        {
                            continue;
                        }
                        
                        if ( player.team != "<dev string:x200>" && player.sessionstate != "<dev string:x200>" )
                        {
                            if ( streakname == "<dev string:x476>" )
                            {
                                nuketype = getdvarint( @"hash_9d7c4e6216d74263", 0 );
                                
                                switch ( nuketype )
                                {
                                    case 1:
                                        streakname = "<dev string:x47e>";
                                        break;
                                    case 2:
                                        streakname = "<dev string:x496>";
                                        break;
                                }
                            }
                            
                            if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                            {
                                player scripts\mp\gametypes\br_pickups::forcegivekillstreak( streakname, 0, 0, 0, 0, 0, undefined );
                                continue;
                            }
                            
                            player thread scripts\mp\hud_message::showkillstreaksplash( streakname, scripts\mp\killstreaks\killstreaks::calcstreakcost( streakname ), undefined );
                            
                            if ( var_11b0ced15240d43f )
                            {
                                player scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "<dev string:x4a4>", undefined, undefined, undefined, i, blueprintindex );
                                continue;
                            }
                            
                            if ( isdefined( level.var_3b3b12cc96932083.killstreakslot ) && level.var_3b3b12cc96932083.killstreakslot != 0 )
                            {
                                player scripts\mp\killstreaks\killstreaks::equipkillstreak( streakname, level.var_3b3b12cc96932083.killstreakslot, blueprintindex );
                                player scripts\mp\killstreaks\killstreaks::setselectedkillstreak( level.var_3b3b12cc96932083.killstreakslot );
                                player scripts\mp\killstreaks\killstreaks::makekillstreakavailable( level.var_3b3b12cc96932083.killstreakslot, "<dev string:x4a4>" );
                                continue;
                            }
                            
                            player scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "<dev string:x4a4>", undefined, undefined, undefined, undefined, blueprintindex );
                        }
                    }
                }
                else
                {
                    println( "<dev string:x3ef>" + var_a1588061d222e213 + "<dev string:x4ad>" );
                    
                    foreach ( killstreak, value in level.killstreaksetups )
                    {
                        if ( getkillstreakindex( killstreak ) != -1 )
                        {
                            println( "<dev string:x4e4>" + killstreak );
                        }
                    }
                    
                    println( "<dev string:xca>" );
                }
                
                if ( var_11b0ced15240d43f )
                {
                    wait 1;
                }
            }
            
            if ( var_921e39c71a7d1713 )
            {
                level thread function_55bbe0a4afb01226( 5, @"hash_7ae9abc841dc9c4b", emptime );
            }
            
            setdevdvar( @"scr_givekillstreak", "<dev string:xca>" );
        }
        
        var_ec1d95d0e7bf93f2 = getdvarint( @"hash_b19cc3eed2cbedd8", 0 );
        var_ebdff78ff4cf1fa3 = getdvarint( @"hash_4cef10a57c4fc6e7", 0 );
        
        if ( var_ec1d95d0e7bf93f2 > 0 || var_ebdff78ff4cf1fa3 > 0 )
        {
            foreach ( player in level.players )
            {
                player scripts\mp\killstreaks\killstreaks::givestreakpoints( #"assist", 0, var_ec1d95d0e7bf93f2 );
                player scripts\mp\killstreaks\killstreaks::givestreakpoints( #"bounty", 0, var_ebdff78ff4cf1fa3 );
            }
            
            setdevdvar( @"hash_b19cc3eed2cbedd8", 0 );
            setdevdvar( @"hash_4cef10a57c4fc6e7", 0 );
        }
        
        streakname = undefined;
        streaktype = undefined;
        var_bf4f4bde184c9d44 = 0;
        var_2be88e5de0518d55 = getdvar( @"hash_9c416c757bf76ea2" );
        var_2dc35d5d293d283b = getdvar( @"hash_6dfb150e62d63d1a" );
        
        if ( var_2be88e5de0518d55 != "<dev string:xca>" )
        {
            streakname = var_2be88e5de0518d55;
            streaktype = getdvar( @"hash_e0efb606c92e6d72" );
        }
        else if ( var_2dc35d5d293d283b != "<dev string:xca>" )
        {
            streakname = var_2dc35d5d293d283b;
            streaktype = getdvar( @"hash_8727321c64d0325a" );
            var_bf4f4bde184c9d44 = 1;
        }
        
        if ( isdefined( streakname ) )
        {
            if ( isdefined( level.killstreaksetups[ streakname ] ) && getkillstreakindex( streakname ) != -1 || streakname == "<dev string:x4ec>" )
            {
                foreach ( player in level.players )
                {
                    if ( isbot( player ) || istestclient( player ) )
                    {
                        if ( !var_bf4f4bde184c9d44 )
                        {
                            continue;
                        }
                    }
                    else if ( var_bf4f4bde184c9d44 )
                    {
                        continue;
                    }
                    
                    if ( player.team != "<dev string:x200>" && player.sessionstate != "<dev string:x200>" )
                    {
                        player scripts\mp\killstreaks\killstreaks::awardkillstreak( "<dev string:x4f6>", undefined, undefined, player );
                    }
                    
                    if ( streakname != "<dev string:x4ec>" )
                    {
                        setdevdvar( @"hash_c247993ede3808ca", streakname );
                        setdevdvar( @"hash_22186e8d4f1020da", streaktype );
                        continue;
                    }
                    
                    setdevdvar( @"hash_c247993ede3808ca", "<dev string:xca>" );
                    setdevdvar( @"hash_22186e8d4f1020da", "<dev string:xca>" );
                }
            }
            else
            {
                println( "<dev string:x3ef>" + var_2be88e5de0518d55 + "<dev string:x501>" );
                
                foreach ( killstreak, value in level.killstreaksetups )
                {
                    if ( getkillstreakindex( killstreak ) != -1 )
                    {
                        println( "<dev string:x4e4>" + killstreak );
                    }
                }
                
                println( "<dev string:xca>" );
            }
            
            if ( var_2be88e5de0518d55 != "<dev string:xca>" )
            {
                setdevdvar( @"hash_9c416c757bf76ea2", "<dev string:xca>" );
                setdevdvar( @"hash_e0efb606c92e6d72", "<dev string:xca>" );
            }
            else if ( var_2dc35d5d293d283b != "<dev string:xca>" )
            {
                setdevdvar( @"hash_6dfb150e62d63d1a", "<dev string:xca>" );
                setdevdvar( @"hash_8727321c64d0325a", "<dev string:xca>" );
            }
        }
        
        if ( getdvar( @"hash_a39dff4526bfe814" ) != "<dev string:xca>" )
        {
            tokens = strtok( getdvar( @"hash_a39dff4526bfe814" ), "<dev string:x31a>" );
            
            if ( tokens.size )
            {
                playername = tokens[ 0 ];
                
                if ( isdefined( tokens[ 1 ] ) )
                {
                    slotid = int( tokens[ 1 ] );
                }
                else
                {
                    slotid = 0;
                }
                
                owner = undefined;
                
                foreach ( player in level.players )
                {
                    if ( player.name == playername )
                    {
                        owner = player;
                        break;
                    }
                }
                
                if ( !isdefined( owner ) )
                {
                    println( "<dev string:x53c>" + playername + "<dev string:x547>" );
                }
            }
            
            setdevdvar( @"hash_a39dff4526bfe814", "<dev string:xca>" );
        }
        
        var_bf9872587c986a75 = getdvar( @"scr_usekillstreak" );
        
        if ( var_bf9872587c986a75 != "<dev string:xca>" )
        {
            tokens = strtok( var_bf9872587c986a75, "<dev string:x31a>" );
            
            if ( tokens.size > 1 )
            {
                playername = tokens[ 0 ];
                streakname = tokens[ 1 ];
                streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
                
                if ( !isdefined( streaksetupinfo ) )
                {
                    println( "<dev string:x555>" + streakname + "<dev string:x547>" );
                }
                
                owner = undefined;
                
                foreach ( player in level.players )
                {
                    if ( player.name == playername )
                    {
                        owner = player;
                        player thread scripts\mp\killstreaks\killstreaks::forceactivatekillstreak( streakname );
                        
                        if ( issubstr( streakname, "<dev string:x564>" ) )
                        {
                            wait 0.05;
                            player notify( "<dev string:x571>", level.mapcenter, 0 );
                        }
                        
                        if ( issubstr( streakname, "<dev string:x4f6>" ) )
                        {
                            wait 0.05;
                            
                            switch ( streakname )
                            {
                                case #"hash_a400758fbab9a20e":
                                case #"hash_d5cb9b4efa4e54b6":
                                    assertmsg( "<dev string:x5ab>" );
                                    break;
                                case #"hash_7deb28cdb2fc0bdd":
                                    assertmsg( "<dev string:x602>" );
                                    break;
                            }
                        }
                        
                        break;
                    }
                }
                
                if ( !isdefined( owner ) )
                {
                    println( "<dev string:x53c>" + playername + "<dev string:x547>" );
                }
            }
            
            setdevdvar( @"scr_usekillstreak", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_dcabbf514faaada9" ) != "<dev string:xca>" )
        {
            tokens = strtok( getdvar( @"hash_dcabbf514faaada9" ), "<dev string:x31a>" );
            neworigin = ( int( tokens[ 0 ] ), int( tokens[ 1 ] ), int( tokens[ 2 ] ) );
            playername = tokens[ 3 ];
            
            foreach ( player in level.players )
            {
                if ( player.name == playername )
                {
                    player setorigin( neworigin );
                    break;
                }
            }
            
            setdevdvar( @"hash_dcabbf514faaada9", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_a4d8c0314583b9e0" ) != "<dev string:xca>" )
        {
            tokens = strtok( getdvar( @"hash_a4d8c0314583b9e0" ), "<dev string:x31a>" );
            
            if ( tokens.size > 1 )
            {
                playername = tokens[ 0 ];
                var_9453efbbd3361664 = tokens[ 1 ];
                
                if ( !isdefined( level.scriptperks[ var_9453efbbd3361664 ] ) )
                {
                    println( "<dev string:x64d>" + var_9453efbbd3361664 + "<dev string:x547>" );
                }
                
                owner = undefined;
                
                foreach ( player in level.players )
                {
                    if ( player.name == playername )
                    {
                        owner = player;
                        player notify( "<dev string:x658>" );
                        break;
                    }
                }
                
                if ( !isdefined( owner ) )
                {
                    println( "<dev string:x53c>" + playername + "<dev string:x547>" );
                }
            }
            
            setdevdvar( @"hash_a4d8c0314583b9e0", "<dev string:xca>" );
        }
        
        if ( getdvar( @"scr_levelnotify" ) != "<dev string:xca>" )
        {
            level notify( getdvar( @"scr_levelnotify" ) );
            setdevdvar( @"scr_levelnotify", "<dev string:xca>" );
        }
        
        if ( getdvar( @"scr_giveperk" ) != "<dev string:xca>" )
        {
            perk = getdvar( @"scr_giveperk" );
            
            for (i = 0; i < level.players.size; i++) {
                level.players[ i ] thread giveperk( perk );
            }
            
            setdevdvar( @"scr_giveperk", "<dev string:xca>" );
        }
        
        if ( getdvar( @"scr_takeperk" ) != "<dev string:xca>" )
        {
            perk = getdvar( @"scr_takeperk" );
            
            for (i = 0; i < level.players.size; i++) {
                level.players[ i ] thread removeperk( perk );
            }
            
            setdevdvar( @"scr_takeperk", "<dev string:xca>" );
        }
        
        if ( getdvar( @"scr_x_kills_y" ) != "<dev string:xca>" )
        {
            nametokens = strtok( getdvar( @"scr_x_kills_y" ), "<dev string:x31a>" );
            
            if ( nametokens.size > 1 )
            {
                thread xkillsy( nametokens[ 0 ], nametokens[ 1 ] );
            }
            
            setdevdvar( @"scr_x_kills_y", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_6679cf3163ebab7" ) != "<dev string:xca>" )
        {
            hostplayer = undefined;
            enemyplayer = undefined;
            
            foreach ( player in level.players )
            {
                if ( !player ishost() )
                {
                    continue;
                }
                
                hostplayer = player;
                break;
            }
            
            foreach ( player in level.players )
            {
                if ( level.teambased )
                {
                    if ( player.team == hostplayer.team )
                    {
                        continue;
                    }
                    
                    enemyplayer = player;
                    break;
                }
                
                if ( player ishost() )
                {
                    continue;
                }
                
                enemyplayer = player;
                break;
            }
            
            if ( isdefined( enemyplayer ) )
            {
                thread xkillsy( enemyplayer.name, hostplayer.name );
            }
            
            setdevdvar( @"hash_6679cf3163ebab7", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_61d01c88ba0d986f" ) != "<dev string:xca>" )
        {
            weapon = spawn( "<dev string:x665>" + getdvar( @"hash_61d01c88ba0d986f" ), level.players[ 0 ].origin );
            setdevdvar( @"hash_61d01c88ba0d986f", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_c98bb63fdcb9951c" ) != "<dev string:xca>" )
        {
            level.players[ 0 ].pers[ "<dev string:x670>" ] = 0;
            level.players[ 0 ].pers[ "<dev string:x678>" ] = 0;
            newrank = min( getdvarint( @"hash_c98bb63fdcb9951c" ), 54 );
            newrank = max( newrank, 1 );
            setdevdvar( @"hash_c98bb63fdcb9951c", "<dev string:xca>" );
            
            if ( level.teambased )
            {
                foreach ( entry in level.teamnamelist )
                {
                    if ( !getteamdata( entry, "<dev string:x682>" ) )
                    {
                        println( "<dev string:x68f>" );
                    }
                }
            }
            else
            {
                playercount = 0;
                
                foreach ( entry in level.teamnamelist )
                {
                    playercount += getteamdata( entry, "<dev string:x682>" );
                }
                
                if ( playercount < 2 )
                {
                    println( "<dev string:x6d8>" );
                }
            }
            
            lastxp = 0;
            
            for (index = 0; index <= newrank; index++) {
                newxp = rank::getrankinfominxp( index );
                level.players[ 0 ] thread scripts\mp\rank::giverankxp( #"kill", newxp - lastxp );
                lastxp = newxp;
                wait 0.25;
                self notify( "<dev string:x720>" );
            }
        }
        
        if ( getdvarint( @"hash_46c23f34012ec0ef", 0 ) != 0 )
        {
            currank = level.players[ 0 ] rank::getrank();
            
            if ( currank != level.maxrank )
            {
                curxp = level.players[ 0 ] rank::getrankxp();
                neededxp = rank::getrankinfomaxxp( currank ) - curxp;
                level.players[ 0 ] thread rank::giverankxp( #"kill", neededxp );
            }
            
            setdevdvar( @"hash_46c23f34012ec0ef", 0 );
        }
        
        if ( getdvarint( @"hash_46c23f34012ec0ef", 0 ) != 0 )
        {
            level.players[ 0 ] thread rank::giverankxp( #"challenge", getdvarint( @"hash_67ae32d27e2deaa2" ) );
        }
        
        if ( getdvar( @"hash_afb5a1040b7b5c86" ) != "<dev string:xca>" )
        {
            notbot = function_69dffe7a5cb1b4b9();
            notbot thread spam_points_popup();
            setdevdvar( @"hash_afb5a1040b7b5c86", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_31d5d7a79355909c" ) != "<dev string:xca>" )
        {
            splashref = getdvar( @"hash_31d5d7a79355909c" );
            splashtokens = strtok( splashref, "<dev string:x731>" );
            
            if ( splashtokens.size > 1 )
            {
                var_42b1e877ab187c6 = splashtokens[ 0 ];
                splashref = splashtokens[ 1 ];
            }
            else
            {
                var_42b1e877ab187c6 = undefined;
            }
            
            if ( getsubgametype() == "<dev string:x736>" )
            {
                level thread scripts\mp\gametypes\br_gametype_dmz::showdmzsplash( splashref, level.players );
            }
            else
            {
                foreach ( player in level.players )
                {
                    player thread scripts\mp\hud_message::showsplash( splashref, 1, undefined, undefined, undefined, var_42b1e877ab187c6 );
                }
            }
            
            setdevdvar( @"hash_31d5d7a79355909c", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_ca6af9ab4eea7f1b" ) != "<dev string:xca>" )
        {
            foreach ( player in level.players )
            {
                player thread testlowermessage();
            }
            
            setdevdvar( @"hash_ca6af9ab4eea7f1b", "<dev string:xca>" );
        }
        
        if ( getdvar( @"scr_entdebug" ) != "<dev string:xca>" )
        {
            ents = getentarray();
            level.entarray = [];
            level.entcounts = [];
            level.entgroups = [];
            
            for (index = 0; index < ents.size; index++) {
                classname = ents[ index ].classname;
                
                if ( !issubstr( classname, "<dev string:x73d>" ) )
                {
                    curent = ents[ index ];
                    level.entarray[ level.entarray.size ] = curent;
                    
                    if ( !isdefined( level.entcounts[ classname ] ) )
                    {
                        level.entcounts[ classname ] = 0;
                    }
                    
                    level.entcounts[ classname ]++;
                    
                    if ( !isdefined( level.entgroups[ classname ] ) )
                    {
                        level.entgroups[ classname ] = [];
                    }
                    
                    level.entgroups[ classname ][ level.entgroups[ classname ].size ] = curent;
                }
            }
        }
        
        if ( getdvar( @"hash_7e165cb98e746109" ) != "<dev string:xca>" )
        {
            assertmsg( "<dev string:x747>" );
            setdevdvar( @"hash_7e165cb98e746109", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_de36fad7e2df7859" ) != "<dev string:xca>" )
        {
            setdevdvar( @"hash_de36fad7e2df7859", "<dev string:xca>" );
            thread scripts\mp\hostmigration::callback_hostmigration();
            thread function_7fbc04196f29a18b();
        }
        
        if ( getdvar( @"hash_3198b55a01316553" ) != "<dev string:xca>" )
        {
            promotion = getdvar( @"hash_3198b55a01316553" ) == "<dev string:x767>";
            
            foreach ( player in level.players )
            {
                player thread testendgameupdate( promotion );
            }
            
            setdevdvar( @"hash_3198b55a01316553", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_f6a9618bf7b9f758" ) != "<dev string:xca>" )
        {
            if ( getdvar( @"hash_f6a9618bf7b9f758" ) == "<dev string:x76c>" )
            {
                gotonextspawn();
            }
            else if ( getdvar( @"hash_f6a9618bf7b9f758" ) == "<dev string:x774>" )
            {
                gotoprevspawn();
            }
            
            setdevdvar( @"hash_f6a9618bf7b9f758", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_ccb91028531c7b90" ) != "<dev string:xca>" )
        {
            ent = undefined;
            
            if ( isdefined( level.player ) )
            {
                ent = level.player;
            }
            else if ( isdefined( level.players[ 0 ] ) )
            {
                ent = level.players[ 0 ];
            }
            
            if ( isdefined( ent ) )
            {
                println( "<dev string:x77c>" + ent.origin[ 0 ] + "<dev string:x793>" + ent.origin[ 1 ] + "<dev string:x79c>" + ent.origin[ 2 ] );
            }
            else
            {
                println( "<dev string:x7a5>" );
            }
            
            setdevdvar( @"hash_ccb91028531c7b90", "<dev string:xca>" );
        }
        
        if ( getdvarint( @"hash_5011715b0d8686b1" ) > 0 )
        {
            clearscores = getdvarint( @"hash_5011715b0d8686b1" );
            
            if ( clearscores )
            {
                foreach ( entry in level.teamnamelist )
                {
                    scripts\mp\gamescore::_setteamscore( entry, 0 );
                }
            }
            
            setdevdvar( @"hash_5011715b0d8686b1", 0 );
        }
        
        if ( getdvarint( @"hash_1d72f4f6602796e9" ) > 0 )
        {
            setscore = getdvarint( @"hash_1d72f4f6602796e9" );
            
            if ( setscore )
            {
                setdevdvar( hashcat( @"scr_", getgametype(), "<dev string:x7b2>" ), 0 );
            }
            
            setdevdvar( @"hash_1d72f4f6602796e9", 0 );
        }
        
        if ( getdvarint( @"hash_19130df90d792ee8" ) > 0 )
        {
            cleardomflags = getdvarint( @"hash_19130df90d792ee8" );
            
            if ( cleardomflags )
            {
                if ( getgametype() == "<dev string:x7c1>" )
                {
                    foreach ( objective in level.objectives )
                    {
                        if ( isdefined( level.domflag_setneutral ) )
                        {
                            objective thread [[ level.domflag_setneutral ]]();
                        }
                    }
                }
            }
            
            setdevdvar( @"hash_19130df90d792ee8", 0 );
        }
        
        if ( getdvarint( @"hash_e182fb9e875bf879" ) > 0 )
        {
            cleardomflags = getdvarint( @"hash_e182fb9e875bf879" );
            
            if ( cleardomflags )
            {
                if ( getgametype() == "<dev string:x7c1>" )
                {
                    foreach ( objective in level.objectives )
                    {
                        objective scripts\mp\gameobjects::setobjectivestatusicons( "<dev string:x7c8>" + objective.iconname, "<dev string:x7db>" + objective.iconname );
                        
                        if ( isdefined( level.dompoint_setcaptured ) )
                        {
                            objective thread [[ level.dompoint_setcaptured ]]( level.players[ 0 ].team );
                        }
                        
                        objective.capturetime = gettime();
                        objective.firstcapture = 0;
                    }
                }
            }
            
            setdevdvar( @"hash_e182fb9e875bf879", 0 );
        }
        
        if ( getdvarint( @"hash_8a31b9a6205ce71b" ) > 0 )
        {
            var_c97005802accbaed = getdvarint( @"hash_8a31b9a6205ce71b" );
            player = level.players[ 0 ];
            
            switch ( var_c97005802accbaed )
            {
                case 1:
                    if ( player.team == "<dev string:x3fe>" || player.team == "<dev string:x3f4>" )
                    {
                        foreach ( objective in level.objectives )
                        {
                            if ( isdefined( level.dompoint_setcaptured ) )
                            {
                                objective [[ level.dompoint_setcaptured ]]( player.team, player );
                            }
                        }
                        
                        if ( isdefined( level.onflagcapture ) )
                        {
                            level [[ level.onflagcapture ]]( undefined, undefined, player, player.team, undefined, undefined );
                        }
                    }
                    
                    break;
                case 2:
                    foreach ( objective in level.objectives )
                    {
                        if ( isdefined( level.domflag_setneutral ) )
                        {
                            objective thread [[ level.domflag_setneutral ]]();
                        }
                    }
                    
                    break;
                case 3:
                    if ( player.team == "<dev string:x3fe>" || player.team == "<dev string:x3f4>" )
                    {
                        otherteam = getotherteam( player.team )[ 0 ];
                        
                        foreach ( objective in level.objectives )
                        {
                            if ( isdefined( level.dompoint_setcaptured ) )
                            {
                                objective [[ level.dompoint_setcaptured ]]( otherteam, player );
                            }
                        }
                        
                        if ( isdefined( level.onflagcapture ) )
                        {
                            level [[ level.onflagcapture ]]( undefined, undefined, player, otherteam, undefined, undefined );
                        }
                    }
                    
                    break;
            }
            
            if ( isdefined( level.updatefobspawnselection ) )
            {
                [[ level.updatefobspawnselection ]]();
            }
            
            setdevdvar( @"hash_8a31b9a6205ce71b", 0 );
        }
        
        if ( getdvarint( @"hash_cb1fa81ae9d1246a" ) > 0 )
        {
            var_a4ab3e1ca5d220c4 = getdvarint( @"hash_cb1fa81ae9d1246a" );
            player = level.players[ 0 ];
            
            if ( isdefined( level.var_e3a2a0c2e544728e ) )
            {
                [[ level.var_e3a2a0c2e544728e ]]( var_a4ab3e1ca5d220c4 );
            }
            
            setdevdvar( @"hash_cb1fa81ae9d1246a", 0 );
        }
        
        if ( getdvarint( @"hash_eee69dc2a527f44" ) > 0 )
        {
            all_dogs = getactiveagentsoftype( "<dev string:x7ef>" );
            
            foreach ( dog in all_dogs )
            {
                dog scripts\mp\agents\agent_utility::killdog();
            }
            
            setdevdvar( @"hash_eee69dc2a527f44", 0 );
        }
        
        if ( getdvarint( @"hash_e4121048ccfa7580" ) > 0 )
        {
            var_2704eda0a8d8ea7a = getactiveagentsoftype( "<dev string:x7f6>" );
            
            foreach ( agent in var_2704eda0a8d8ea7a )
            {
                killagent( agent );
            }
            
            setdevdvar( @"hash_e4121048ccfa7580", 0 );
        }
        
        if ( getdvarint( @"hash_2972a0a5a58bfd5d" ) > 0 )
        {
            foreach ( player in level.players )
            {
                if ( isai( player ) )
                {
                    continue;
                }
                
                player_team = player.pers[ "<dev string:x7fd>" ];
                idx = 0;
                
                if ( game[ "<dev string:x805>" ] == player_team )
                {
                    idx = 1;
                }
                
                player setclientomnvar( "<dev string:x812>", idx );
            }
            
            setdevdvar( @"hash_2972a0a5a58bfd5d", 0 );
        }
        
        if ( getdvar( @"hash_e47e8eaa633b0385" ) != "<dev string:xca>" )
        {
            foreach ( player in level.players )
            {
                if ( !isai( player ) )
                {
                    eventstring = getdvar( @"hash_e47e8eaa633b0385" );
                    event = eventstring;
                    
                    if ( !isxhash( eventstring ) )
                    {
                        event = function_1823ff50bb28148d( eventstring );
                    }
                    
                    var_5cfb71d837b3eb36 = 1;
                    
                    switch ( eventstring )
                    {
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
                    
                    eventvalue = scripts\mp\rank::getscoreinfovalue( event );
                    player thread scripts\mp\rank::scorepointspopup( eventvalue );
                    player scripts\mp\killstreaks\killstreaks::givestreakpoints( event, var_5cfb71d837b3eb36, eventvalue );
                }
            }
            
            setdevdvar( @"hash_e47e8eaa633b0385", "<dev string:xca>" );
        }
        
        if ( getdvarint( @"hash_cccba423c010c957" ) != 0 )
        {
            foreach ( player in level.players )
            {
                points = getdvarint( @"hash_cccba423c010c957" );
                player scripts\mp\bounty::bountyincreasestreak( points );
            }
            
            setdevdvar( @"hash_cccba423c010c957", 0 );
        }
        
        if ( getdvar( @"hash_68db6c6a95694120" ) != "<dev string:xc5>" )
        {
            foreach ( player in level.players )
            {
                player energy_setmax( 1, 1000 );
                player energy_setenergy( 1, 1000 );
                player energy_setrestorerate( 1, 1000 );
                player energy_setresttimems( 1, 0 );
            }
        }
        
        if ( getdvarint( @"hash_ac45d88ed62c32a5", 0 ) != 0 )
        {
            dvar = getdvarint( @"hash_ac45d88ed62c32a5", 0 );
            
            foreach ( player in level.players )
            {
                switch ( dvar )
                {
                    case 1:
                        player setlensprofiledistort( "<dev string:x85e>" );
                        break;
                    case 2:
                        player setlensprofiledistort( "<dev string:x872>" );
                        break;
                    case 3:
                        player setlensprofiledistort( "<dev string:x880>" );
                        break;
                    case 4:
                        player setlensprofiledistort( "<dev string:x890>" );
                        break;
                    case 5:
                        player setlensprofiledistort( "<dev string:x8a0>" );
                        break;
                    case 6:
                        player setlensprofiledistort( "<dev string:x8a9>" );
                        break;
                    case 7:
                        player setlensprofiledistort( "<dev string:xf0>" );
                        break;
                }
            }
            
            setdevdvar( @"hash_ac45d88ed62c32a5", 0 );
        }
        
        if ( getdvarint( @"hash_914bb3dc853c47c4", 0 ) != 0 )
        {
            if ( !isdefined( level.var_54a25aea9318756c ) )
            {
                level.var_54a25aea9318756c = [];
            }
            
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    level.var_54a25aea9318756c[ level.var_54a25aea9318756c.size ] = traceresults[ "<dev string:x171>" ];
                    iprintlnbold( "<dev string:x8b7>" + traceresults[ "<dev string:x171>" ].name + "<dev string:x8c4>" );
                }
            }
            
            setdevdvar( @"hash_914bb3dc853c47c4", 0 );
        }
        
        if ( getdvarint( @"hash_b34a0bfcf1e59832", 0 ) != 0 )
        {
            level.var_54a25aea9318756c = undefined;
            iprintlnbold( "<dev string:x8d5>" );
            setdevdvar( @"hash_b34a0bfcf1e59832", 0 );
        }
        
        if ( getdvarint( @"hash_3689035427e54e9f", 0 ) != 0 )
        {
            host = devfindhost();
            tracestart = host geteye();
            forward = anglestoforward( host getplayerangles() );
            traceend = tracestart + forward * 5000;
            traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
            
            if ( isdefined( level.var_54a25aea9318756c ) )
            {
                foreach ( target in level.var_54a25aea9318756c )
                {
                    target setorigin( traceresults[ "<dev string:x1ae>" ] );
                }
            }
            
            setdevdvar( @"hash_3689035427e54e9f", 0 );
        }
        
        if ( getdvar( @"hash_c22d5ea67b157acc", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    targetbot = traceresults[ "<dev string:x171>" ];
                    equipment = getdvar( @"hash_c22d5ea67b157acc", "<dev string:xca>" );
                    equipweaponname = level.equipment.table[ equipment ].weaponname;
                    
                    if ( isdefined( equipweaponname ) )
                    {
                        equipweapon = makeweapon( equipweaponname );
                        targetbot giveandfireoffhandreliable( equipweapon );
                    }
                }
            }
            
            setdevdvar( @"hash_c22d5ea67b157acc", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_4883b42098a85dec", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    targetbot = traceresults[ "<dev string:x171>" ];
                    perk = getdvar( @"hash_4883b42098a85dec", "<dev string:xca>" );
                    
                    if ( isdefined( perk ) )
                    {
                        targetbot giveperk( perk );
                    }
                }
            }
            
            setdevdvar( @"hash_c22d5ea67b157acc", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_84d17066d7567258", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    targetbot = traceresults[ "<dev string:x171>" ];
                    super = getdvar( @"hash_84d17066d7567258", "<dev string:xca>" );
                    superweaponname = level.superglobals.staticsuperdata[ super ].weapon;
                    
                    if ( !isdefined( superweaponname ) )
                    {
                        superweaponname = "<dev string:x8ed>";
                    }
                    
                    superweapon = makeweapon( superweaponname );
                    targetbot scripts\mp\perks\perkpackage::perkpackage_givedebug( super );
                    
                    if ( isdefined( targetbot.super ) )
                    {
                        if ( !isnullweapon( superweapon ) && superweapon.basename != "<dev string:x8ed>" )
                        {
                            targetbot giveandfireoffhandreliable( superweapon );
                        }
                        
                        targetbot thread scripts\mp\supers::trysuperusebegin( superweapon );
                    }
                }
                
                setdevdvar( @"hash_84d17066d7567258", "<dev string:xca>" );
            }
        }
        
        if ( getdvar( @"hash_ba2c7949a7bef89a", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    targetbot = traceresults[ "<dev string:x171>" ];
                    streakname = getdvar( @"hash_ba2c7949a7bef89a", "<dev string:xca>" );
                    streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
                    var_921e39c71a7d1713 = 0;
                    emptime = undefined;
                    
                    if ( streakname == "<dev string:x462>" )
                    {
                        var_921e39c71a7d1713 = 1;
                        emptime = getdvarfloat( @"hash_7ae9abc841dc9c4b" );
                        streakname = "<dev string:x46f>";
                        setdevdvar( @"hash_7ae9abc841dc9c4b", 1 );
                    }
                    
                    if ( isdefined( streaksetupinfo ) && getkillstreakindex( streakname ) != -1 )
                    {
                        if ( targetbot.team != "<dev string:x200>" && targetbot.sessionstate != "<dev string:x200>" )
                        {
                            if ( streakname == "<dev string:x476>" )
                            {
                                nuketype = getdvarint( @"hash_9d7c4e6216d74263", 0 );
                                
                                switch ( nuketype )
                                {
                                    case 1:
                                        streakname = "<dev string:x47e>";
                                        break;
                                    case 2:
                                        streakname = "<dev string:x496>";
                                        break;
                                }
                            }
                            
                            targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "<dev string:x4a4>" );
                        }
                        
                        streakitem = targetbot getkillstreakinslot( 0 );
                        targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak( streakitem, 0 );
                        waitframe();
                        targetbot thread function_9997704ec04498( streakname );
                    }
                    else
                    {
                        println( "<dev string:x3ef>" + streakname + "<dev string:x4ad>" );
                        
                        foreach ( killstreak, value in level.killstreaksetups )
                        {
                            if ( getkillstreakindex( killstreak ) != -1 )
                            {
                                println( "<dev string:x4e4>" + killstreak );
                            }
                        }
                        
                        println( "<dev string:xca>" );
                    }
                    
                    if ( var_921e39c71a7d1713 )
                    {
                        /#
                            level thread function_55bbe0a4afb01226( 5, @"hash_7ae9abc841dc9c4b", emptime );
                        #/
                    }
                }
            }
            
            /#
                setdevdvar( @"hash_ba2c7949a7bef89a", "<dev string:xca>" );
            #/
        }
        
        if ( getdvar( @"hash_9662e6a5384fda41", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) && isbot( traceresults[ "<dev string:x171>" ] ) )
                {
                    targetbot = traceresults[ "<dev string:x171>" ];
                    powerup = getdvar( @"hash_9662e6a5384fda41", "<dev string:xca>" );
                    equipweaponname = undefined;
                    
                    if ( powerup == "<dev string:x901>" )
                    {
                        equipweaponname = level.equipment.table[ "<dev string:x912>" ].weaponname;
                    }
                    
                    if ( isdefined( powerup ) )
                    {
                        targetbot namespace_dfe80adf32f5c14a::apply_powerup( powerup );
                        
                        if ( isdefined( equipweaponname ) )
                        {
                            waitframe();
                            equipweapon = makeweapon( equipweaponname );
                            targetbot giveandfireoffhandreliable( equipweapon );
                        }
                    }
                }
            }
            
            setdevdvar( @"hash_9662e6a5384fda41", "<dev string:xca>" );
        }
        
        if ( getdvarint( @"hash_f9aebf06391bb03c", 0 ) != 0 )
        {
            switch ( getdvarint( @"hash_f9aebf06391bb03c", 0 ) )
            {
                case 1:
                    level.players[ 0 ] thread scripts\mp\hud_message::showsplash( "<dev string:x92b>", 42 );
                    break;
                case 2:
                    level.players[ 0 ] thread scripts\mp\hud_message::showsplash( "<dev string:x93f>", 25 );
                    break;
                case 3:
                    level.players[ 0 ] thread scripts\mp\hud_message::showsplash( "<dev string:x94e>", undefined, level.players[ 0 ] );
                    break;
            }
            
            setdvar( @"hash_f9aebf06391bb03c", 0 );
        }
        
        if ( getdvarint( @"hash_f23e88e0327f5ea8", 0 ) == 1 )
        {
            host = devfindhost();
            
            if ( isdefined( host ) )
            {
                printtoscreen2d( 500, 100, host.health, ( 0, 0, 0 ), 3 );
            }
        }
        
        if ( getdvarint( @"hash_c9ec8ca2b7a146c4", 0 ) > 0 )
        {
            points = getdvarint( @"hash_c9ec8ca2b7a146c4" );
            setdevdvar( @"hash_c9ec8ca2b7a146c4", 0 );
            
            foreach ( player in level.players )
            {
                player thread scripts\mp\supers::givesuperpoints( points, undefined, 1 );
            }
        }
        
        if ( getdvarint( @"hash_6711d09c824e3cc9", 0 ) > 0 )
        {
            if ( !istrue( level.var_d0d2e7b5066526 ) )
            {
                level.var_d0d2e7b5066526 = 1;
                level thread function_3ee37b5813de0a8a();
            }
        }
        else if ( istrue( level.var_d0d2e7b5066526 ) )
        {
            level.var_d0d2e7b5066526 = undefined;
            level notify( "<dev string:x95a>" );
        }
        
        function_db271c6d734c887c();
        
        if ( getdvarint( @"scr_testshock", 0 ) == 1 )
        {
            shellshocktest( getdvar( @"hash_bae3e845f30eef22", "<dev string:xca>" ) );
            setdevdvar( @"scr_testshock", 0 );
        }
        
        if ( getdvarint( @"hash_f72d0a271da2c57", 0 ) == 1 )
        {
            function_68eba26864084001();
            setdevdvar( @"hash_f72d0a271da2c57", 0 );
        }
        
        var_bdec632f447f8404 = 0;
        
        if ( getdvarint( @"hash_6014f2652bf27fbd", 0 ) > 0 )
        {
            var_bdec632f447f8404 = 1;
            setdevdvar( @"hash_6014f2652bf27fbd", 0 );
        }
        
        if ( !var_bdec632f447f8404 )
        {
            level.dbgmolodrawhits = getdvarint( @"hash_bdb86700db7d369e", 0 ) > 0;
        }
        else
        {
            setdevdvar( @"hash_bdb86700db7d369e", 0 );
            level.dbgmolodrawhits = 0;
        }
        
        if ( !var_bdec632f447f8404 )
        {
            level.var_4482770c326f1498 = getdvarint( @"hash_5148ee2a6dbcf8af", 0 ) > 0;
        }
        else
        {
            level.var_4482770c326f1498 = 0;
            setdevdvar( @"hash_5148ee2a6dbcf8af", 0 );
        }
        
        level.vehiclefriendlydamage = getdvarint( @"hash_8a14f0b9fe0e8c9f", 0 ) > 0;
        
        if ( isdefined( level.vehicle ) && isdefined( level.vehicle.spawn ) )
        {
            level.vehicle.spawn.abandonedtimeoutoverride = getdvarint( @"hash_e547fe8dfe1679f6", 0 );
        }
        
        vehicleref = getdvar( @"scr_spawnvehicle", "<dev string:xca>" );
        
        if ( vehicleref != "<dev string:xca>" )
        {
            player = level.players[ 0 ];
            
            if ( isdefined( player ) )
            {
                if ( scripts\cp_mp\vehicles\vehicle_airdrop::function_ccdcf48542c8a5b7( vehicleref ) )
                {
                    spawndata = spawnstruct();
                    spawndata.origin = player.origin + ( 0, 0, 100 );
                    spawndata.angles = player.angles * ( 0, 1, 0 );
                    spawndata.spawntype = "<dev string:x975>";
                    level.var_997cade62fad2069 = level thread scripts\cp_mp\vehicles\vehicle_airdrop::vehicle_airdrop( vehicleref, spawndata );
                }
                else
                {
                    level.var_997cade62fad2069 = player thread scripts\cp_mp\vehicles\vehicle::function_276beb60c7f60d1e( vehicleref );
                }
            }
            
            setdevdvar( @"scr_spawnvehicle", "<dev string:xca>" );
        }
        
        vehicleref = getdvar( @"hash_29ad65e1f5a10c7d", "<dev string:xca>" );
        
        if ( vehicleref != "<dev string:xca>" )
        {
            player = level.players[ 0 ];
            
            if ( isdefined( player ) )
            {
                forward = anglestoforward( player getplayerangles() ) * ( 1, 1, 0 );
                data = function_29b4292c92443328( vehicleref );
                
                if ( isdefined( data ) && isdefined( data.mtx ) && data.mtx.size > 0 )
                {
                    dist = data.spawn.clearancecheckradius * 2 * 1.1;
                    
                    for (i = 0; i < data.mtx.size; i++) {
                        spawndata = spawnstruct();
                        spawndata.origin = player.origin + ( 0, 0, 100 ) + forward * dist * i;
                        spawndata.angles = player.angles * ( 0, 1, 0 );
                        spawndata.spawntype = "<dev string:x975>";
                        spawndata.mtx = data.mtx[ i ].ref;
                        
                        if ( scripts\cp_mp\vehicles\vehicle_airdrop::function_ccdcf48542c8a5b7( vehicleref ) )
                        {
                            level.var_997cade62fad2069 = level thread scripts\cp_mp\vehicles\vehicle_airdrop::vehicle_airdrop( vehicleref, spawndata );
                            continue;
                        }
                        
                        level.var_997cade62fad2069 = player thread scripts\cp_mp\vehicles\vehicle::function_84033ce50b8afce2( vehicleref, spawndata );
                    }
                }
            }
            
            setdevdvar( @"hash_29ad65e1f5a10c7d", "<dev string:xca>" );
        }
        
        var_1593d3cbb1826a3e = getdvar( @"hash_cf9748ad04470846", "<dev string:xca>" );
        
        if ( var_1593d3cbb1826a3e != "<dev string:xca>" )
        {
            leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
            
            foreach ( instance in leveldata.debuginstances )
            {
                if ( isdefined( instance.vehiclename ) && instance.vehiclename == "<dev string:x97f>" )
                {
                    instance notify( "<dev string:x991>", var_1593d3cbb1826a3e );
                }
            }
            
            setdevdvar( @"hash_cf9748ad04470846", "<dev string:xca>" );
        }
        
        vehicleref = getdvar( @"hash_37b6962333b896f9", "<dev string:xca>" );
        
        if ( vehicleref != "<dev string:xca>" )
        {
            player = scripts\mp\gamelogic::gethostplayer();
            
            if ( isdefined( player ) )
            {
                thread scripts\cp_mp\vehicles\vehicle::destroyvehicles( vehicleref );
            }
            
            setdevdvar( @"hash_37b6962333b896f9", "<dev string:xca>" );
        }
        
        var_5ddba9c7270d310b = getdvar( @"hash_c6bdc7ccd09be1d9", "<dev string:xca>" );
        
        if ( var_5ddba9c7270d310b != "<dev string:xca>" )
        {
            function_d0fe65eec3480b8a( var_5ddba9c7270d310b );
            setdevdvar( @"hash_c6bdc7ccd09be1d9", "<dev string:xca>" );
        }
        
        var_231c7a2ab59f7ca0 = getdvar( @"hash_2d1de779228d9247", "<dev string:xca>" );
        
        if ( var_231c7a2ab59f7ca0 != "<dev string:xca>" )
        {
            function_5359ebb35b7ca1b5( var_231c7a2ab59f7ca0 );
            setdevdvar( @"hash_2d1de779228d9247", "<dev string:xca>" );
        }
        
        if ( getdvarint( @"hash_381540c4c21ed29a", 0 ) > 0 )
        {
            function_173bf4a6910bc50e();
            setdevdvar( @"hash_381540c4c21ed29a", 0 );
        }
        
        if ( getdvarint( @"hash_bcb21c0721a9e458", 0 ) > 0 )
        {
            function_363044d134c760aa();
            setdevdvar( @"hash_bcb21c0721a9e458", 0 );
        }
        
        if ( getdvarint( @"hash_a28e203d53e8292d", 0 ) > 0 )
        {
            function_912799e4f03d89cb();
            setdevdvar( @"hash_a28e203d53e8292d", 0 );
        }
        
        if ( getdvar( @"scr_give_equipment", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            equipmentref = getdvar( @"scr_give_equipment", "<dev string:xca>" );
            slot = scripts\mp\equipment::getdefaultslot( equipmentref );
            
            if ( isdefined( slot ) )
            {
                foreach ( player in level.players )
                {
                    player scripts\mp\equipment::giveequipment( equipmentref, slot );
                }
            }
            
            setdevdvar( @"scr_give_equipment", "<dev string:xca>" );
        }
        
        if ( getdvarint( @"hash_684118f4e2ed5dfd", 0 ) != 0 )
        {
            foreach ( player in level.players )
            {
                player scripts\mp\equipment::incrementequipmentslotammo( "<dev string:x9a7>", 9999 );
                player scripts\mp\equipment::incrementequipmentslotammo( "<dev string:x9b2>", 9999 );
            }
        }
        
        if ( getdvarint( @"scr_ammoregen", 0 ) != 0 )
        {
            foreach ( player in level.players )
            {
                if ( !isdefined( player.var_b885a1491839b8a7 ) )
                {
                    player thread function_ab139aa828ef1bfc();
                }
            }
        }
        
        if ( getdvar( @"hash_712ae72ab5d6c715", "<dev string:xc5>" ) != "<dev string:xc5>" )
        {
            function_466d9bc3fa346c45( getdvar( @"hash_712ae72ab5d6c715" ) );
            setdevdvar( @"hash_712ae72ab5d6c715", "<dev string:xc5>" );
        }
        
        if ( getdvarint( @"hash_be65e45de358ca06", 0 ) != 0 )
        {
            level thread function_5cf5d79beb35b900( getdvarint( @"hash_be65e45de358ca06", 0 ) );
            setdevdvar( @"hash_be65e45de358ca06", 0 );
        }
        
        if ( getdvar( @"hash_f8fb42a86c465992", "<dev string:xc5>" ) != "<dev string:xc5>" )
        {
            function_6be41bc42b9c8a6();
            setdevdvar( @"hash_f8fb42a86c465992", "<dev string:xc5>" );
        }
        
        if ( getdvar( @"hash_d7d910e4c5366baf", "<dev string:xc5>" ) != "<dev string:xc5>" )
        {
            function_21fde2ca3d2cd943();
            setdevdvar( @"hash_d7d910e4c5366baf", "<dev string:xc5>" );
        }
        
        if ( getdvarint( @"hash_ddc23cc655e92765", -1 ) != -1 )
        {
            foreach ( player in level.players )
            {
                player scripts\mp\accessories::clearplayeraccessory();
            }
            
            setdevdvar( @"hash_ddc23cc655e92765", -1 );
        }
        
        if ( getdvarint( @"hash_25009bea2c78980f", -1 ) != -1 )
        {
            foreach ( player in level.players )
            {
                player scripts\mp\accessories::testaccessoryvfx();
            }
            
            setdevdvar( @"hash_25009bea2c78980f", -1 );
        }
        
        if ( getdvarint( @"hash_3f0ab8b9e50fc7ba", -1 ) != -1 )
        {
            if ( isdefined( level.petconsts ) )
            {
            }
            
            foreach ( player in level.players )
            {
                if ( isdefined( player.petwatch ) )
                {
                }
            }
            
            setdevdvar( @"hash_3f0ab8b9e50fc7ba", -1 );
        }
        
        if ( getdvarint( @"hash_ede820e2482b470", -1 ) != -1 )
        {
            foreach ( player in level.players )
            {
                player scripts\cp_mp\pet_watch::debugsetlasttime( getdvarint( @"hash_ede820e2482b470", -1 ) );
            }
            
            setdevdvar( @"hash_ede820e2482b470", -1 );
        }
        
        if ( getdvarint( @"hash_51f4156cd54c093b", -1 ) != -1 )
        {
            foreach ( player in level.players )
            {
                player scripts\cp_mp\pet_watch::doaction( getdvarint( @"hash_51f4156cd54c093b", -1 ) );
            }
            
            setdevdvar( @"hash_51f4156cd54c093b", -1 );
        }
        
        if ( getdvarint( @"hash_5f699b0da36580f1", -1 ) != -1 )
        {
            foreach ( player in level.players )
            {
                player thread scripts\cp_mp\pet_watch::testpetdebug( getdvarint( @"hash_5f699b0da36580f1", -1 ) );
            }
            
            setdevdvar( @"hash_5f699b0da36580f1", -1 );
        }
        
        if ( getdvarint( @"hash_cd736679460603b2", -1 ) != -1 )
        {
            function_cd9a040b668ec554( getdvarint( @"hash_cd736679460603b2" ) );
            setdevdvar( @"hash_cd736679460603b2", -1 );
        }
        
        if ( getdvarint( @"hash_b266c7674623f57f", 0 ) != 0 )
        {
            function_a130b73465e9ce5d();
            setdevdvar( @"hash_b266c7674623f57f", 0 );
        }
        
        if ( getdvarint( @"hash_d0560daa501833d7", 0 ) != 0 )
        {
            function_f08f7e7ef0ba1885();
            setdevdvar( @"hash_d0560daa501833d7", 0 );
        }
        
        if ( getdvarint( @"hash_1e71d7bfcd76b9f0", 0 ) != 0 )
        {
            function_cb179ef63de05005( getdvarint( @"hash_1e71d7bfcd76b9f0" ) );
            setdevdvar( @"hash_1e71d7bfcd76b9f0", 0 );
        }
        
        if ( getdvarint( @"hash_75dc853de5aa02e4", 0 ) != 0 )
        {
            function_68069128fc606a7a( getdvarint( @"hash_75dc853de5aa02e4" ) );
            setdevdvar( @"hash_75dc853de5aa02e4", 0 );
        }
        
        if ( getdvarint( @"hash_f6304191ece6f827", 0 ) != 0 )
        {
            function_c7bcca7a18e6103c();
            setdevdvar( @"hash_f6304191ece6f827", 0 );
        }
        
        if ( getdvarint( @"hash_c3cafdefe09c5c07", 0 ) != 0 )
        {
            function_3f3a0a6721d16a7d();
            setdevdvar( @"hash_c3cafdefe09c5c07", 0 );
        }
        
        if ( getdvarint( @"hash_892a0f1030eb66da", 0 ) != 0 )
        {
            function_dda4edd64aefb222();
            setdevdvar( @"hash_892a0f1030eb66da", 0 );
        }
        
        if ( getdvarint( @"hash_99f113c180dfe22d", 0 ) != 0 )
        {
            function_dda4edd64aefb222();
            setdevdvar( @"hash_99f113c180dfe22d", 0 );
        }
        
        if ( getdvarint( @"hash_60951c4ee00ec45c", 0 ) != 0 )
        {
            function_61ffbb60b6cc59e0();
            setdevdvar( @"hash_60951c4ee00ec45c", 0 );
        }
        
        if ( getdvarint( @"hash_8e93a66436d8d0bb", 0 ) != 0 )
        {
            function_61ffbb60b6cc59e0();
            setdevdvar( @"hash_8e93a66436d8d0bb", 0 );
        }
        
        if ( getdvarint( @"hash_39dc8a1ad3dd146a", 0 ) != 0 )
        {
            function_f56b2e8615f905ed( 1 );
            setdevdvar( @"hash_39dc8a1ad3dd146a", 0 );
        }
        
        if ( getdvarint( @"hash_a3a51abfffffb4cf", 0 ) != 0 )
        {
            function_f56b2e8615f905ed( 0 );
            setdevdvar( @"hash_a3a51abfffffb4cf", 0 );
        }
        
        if ( getdvarint( @"hash_d2f9b7c5947f75b3", 0 ) != 0 )
        {
            function_6dda0c3edae9407c( 1 );
            setdevdvar( @"hash_d2f9b7c5947f75b3", 0 );
        }
        
        if ( getdvarint( @"hash_629b4e289546a19e", 0 ) != 0 )
        {
            function_6dda0c3edae9407c( 0 );
            setdevdvar( @"hash_629b4e289546a19e", 0 );
        }
        
        if ( getdvarint( @"hash_6ab9781b392f5eab" ) != 0 )
        {
            if ( !isdefined( level.var_e16818f501f94fd5 ) )
            {
                level.var_e16818f501f94fd5 = 0;
            }
            
            player = level.players[ 0 ];
            
            if ( !level.var_e16818f501f94fd5 )
            {
                iprintln( "<dev string:x9bf>" );
                iprintln( "<dev string:x9e5>" );
                level.var_e16818f501f94fd5 = 1;
                player thread function_3d748a0bd7fd42bf();
            }
            else
            {
                level notify( "<dev string:x252>" );
                level.var_e16818f501f94fd5 = 0;
                player setactionslot( 3, "<dev string:xa08>" );
            }
            
            setdevdvar( @"hash_6ab9781b392f5eab", 0 );
        }
        
        if ( getdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            layoutname = getdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" );
            function_f4dcab3497d5fbd1( layoutname );
            setdevdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" );
        }
        
        areaswaphint = getdvar( @"hash_2f5ae859f49a8160", "<dev string:xca>" );
        
        if ( areaswaphint != "<dev string:xca>" )
        {
            hinttokens = strtok( areaswaphint, "<dev string:x31a>" );
            
            if ( hinttokens.size == 2 )
            {
                var_ea7a618318b12eb2 = int( hinttokens[ 0 ] );
                var_1247c85fb7825009 = int( hinttokens[ 1 ] );
                function_9b52d07533d84bb3( var_ea7a618318b12eb2, var_1247c85fb7825009 );
            }
            
            setdevdvar( @"hash_2f5ae859f49a8160", "<dev string:xca>" );
        }
        
        areaswap = getdvar( @"hash_492ae06dcbba00f9", "<dev string:xca>" );
        
        if ( areaswap != "<dev string:xca>" )
        {
            swaptokens = strtok( areaswap, "<dev string:x31a>" );
            
            if ( swaptokens.size == 2 )
            {
                var_22d73bb08fff03fc = int( swaptokens[ 0 ] );
                var_f4292862ffd869fb = int( swaptokens[ 1 ] );
                function_f7b3b7bee266f05d( var_22d73bb08fff03fc, var_f4292862ffd869fb );
            }
            
            setdevdvar( @"hash_492ae06dcbba00f9", "<dev string:xca>" );
        }
        
        if ( getdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" ) != "<dev string:xca>" )
        {
            layoutname = getdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" );
            function_f4dcab3497d5fbd1( layoutname );
            setdevdvar( @"hash_265eb98091c83ef1", "<dev string:xca>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x95a8
    // Size: 0x15f, Type: dev
    function function_f4dcab3497d5fbd1( layout_name )
    {
        bundle = getscriptbundle( layout_name );
        
        if ( !isdefined( bundle ) )
        {
            return;
        }
        
        foreach ( mod_point in bundle.mod_points )
        {
            if ( !isdefined( mod_point ) || !isdefined( mod_point.var_a432aa2cd8d91c10 ) || !isdefined( level.mod_points[ mod_point.var_a432aa2cd8d91c10 ] ) || !isdefined( level.mod_points[ mod_point.var_a432aa2cd8d91c10 ].modsets ) )
            {
                continue;
            }
            
            foreach ( var_a712b718df4150fe, mod_set in level.mod_points[ mod_point.var_a432aa2cd8d91c10 ].modsets )
            {
                if ( isdefined( mod_set ) )
                {
                    function_101e32b07ba7ff43( mod_set.ents, function_1823ff50bb28148d( var_a712b718df4150fe ) == default_to( mod_point.var_77104470a1560df7, "<dev string:xca>" ) );
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x970f
    // Size: 0x11c, Type: dev
    function function_101e32b07ba7ff43( modset, visible )
    {
        foreach ( ent in modset )
        {
            if ( ent isscriptable() )
            {
                ent setscriptablepartstate( "<dev string:xa13>", ter_op( visible, "<dev string:xa21>", "<dev string:xa29>" ), 1 );
                continue;
            }
            
            if ( isdefined( ent.name ) )
            {
                if ( !isdefined( level.lightintensity ) )
                {
                    level.lightintensity = [];
                }
                
                if ( !isdefined( level.lightintensity[ ent.name ] ) )
                {
                    level.lightintensity[ ent.name ] = ent getlightintensity();
                }
                
                ent setlightintensity( ter_op( visible, level.lightintensity[ ent.name ], 0 ) );
                continue;
            }
            
            if ( visible )
            {
                ent show();
                continue;
            }
            
            ent hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9833
    // Size: 0x5f, Type: dev
    function function_466d9bc3fa346c45( camtype )
    {
        player = level.players[ 0 ];
        
        if ( !isdefined( player.var_2788f1901d323afe ) )
        {
            player.var_2788f1901d323afe = 0;
        }
        
        if ( camtype == "<dev string:xa31>" )
        {
            player function_6735a961ca823ef1();
            return;
        }
        
        player replaycam( camtype );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x989a
    // Size: 0xca, Type: dev
    function function_6735a961ca823ef1()
    {
        if ( self.var_2788f1901d323afe )
        {
            takegoproattachments();
            self.var_2788f1901d323afe = 0;
        }
        
        if ( isdefined( self.replaycam ) )
        {
            self cameraunlink();
            self unlink();
            self.replaycam delete();
        }
        
        self setclientdvar( @"cg_fov", 65 );
        setdvar( @"hash_ed28298c207316ae", 0 );
        setdvar( @"hash_979b5474be3b9b47", 0 );
        setdvar( @"hash_960ef00238357bbc", 0 );
        setdvar( @"hash_83bbe73116f488d6", 0 );
        
        if ( isdefined( self.goprooverlay ) )
        {
            self.goprooverlay destroy();
        }
        
        visionsetfadetoblack( "<dev string:xca>", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x996c
    // Size: 0x324, Type: dev
    function replaycam( camtype )
    {
        if ( !self.var_2788f1901d323afe )
        {
            givegoproattachments();
            self.var_2788f1901d323afe = 1;
        }
        
        camdata = function_e32c159574bfdf6c( camtype );
        
        if ( isdefined( camdata.dist ) )
        {
            vecaway = vectornormalize( ( camdata.up, camdata.forward, camdata.right ) ) * camdata.dist;
        }
        else
        {
            vecaway = ( camdata.up, camdata.forward, camdata.right );
        }
        
        self setclientdvar( @"cg_fov", camdata.fov );
        setdvar( @"hash_ed28298c207316ae", 0.203 );
        setdvar( @"hash_979b5474be3b9b47", -0.478 );
        setdvar( @"hash_960ef00238357bbc", 0.011 );
        setdvar( @"hash_83bbe73116f488d6", 0.7 );
        
        if ( !isdefined( self.goprooverlay ) )
        {
            self.goprooverlay = newclienthudelem( self );
            self.goprooverlay.sort = 0;
            self.goprooverlay.foreground = 0;
            self.goprooverlay.horzalign = "<dev string:xa38>";
            self.goprooverlay.vertalign = "<dev string:xa38>";
            self.goprooverlay.alpha = 1;
            self.goprooverlay.enablehudlighting = 1;
            self.goprooverlay setshader( "<dev string:xa46>", 640, 480 );
        }
        
        visionsetfadetoblack( "<dev string:xa61>", 0 );
        
        if ( isdefined( self.replaycam ) )
        {
            self cameraunlink();
            self unlink();
            self.replaycam delete();
        }
        
        camera = spawn( "<dev string:x19e>", self.origin + ( 0, 0, 300 ) );
        camera setmodel( "<dev string:xa6a>" );
        cameralink = spawn( "<dev string:x19e>", self.origin + ( 0, 0, 300 ) );
        cameralink setmodel( "<dev string:xa6a>" );
        camera linkto( cameralink, "<dev string:xa6a>", ( 0, 0, 0 ), ( camdata.basepitch, camdata.baseyaw, camdata.baseroll ) );
        cameralink linkto( self, camdata.linktag, ( vecaway[ 0 ], vecaway[ 1 ] * -1, vecaway[ 2 ] ), ( camdata.roll, camdata.pitch * -1, camdata.yaw * -1 ) );
        self cameralinkto( camera, "<dev string:xa6a>", 1, 1 );
        self.replaycam = camera;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9c98
    // Size: 0x30a, Type: dev
    function function_e32c159574bfdf6c( camtype )
    {
        data = spawnstruct();
        
        switch ( camtype )
        {
            case #"hash_e7559840425a2b2b":
                data.linktag = "<dev string:xa83>";
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
                data.linktag = "<dev string:xa9f>";
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
                data.linktag = "<dev string:xa9f>";
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
                data.linktag = "<dev string:xa9f>";
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
                assertmsg( "<dev string:xad7>" + camtype + "<dev string:xae7>" );
                break;
        }
        
        return data;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9faa
    // Size: 0xf0, Type: dev
    function givegoproattachments()
    {
        if ( isdefined( self.goprohasattachments ) )
        {
            return;
        }
        
        currentweapon = self.currentweapon;
        weapons = self.primaryinventory;
        
        foreach ( weapon in weapons )
        {
            if ( !function_8c05b3051b75cdcd( weapon ) )
            {
                continue;
            }
            
            attachments = weapon.attachments;
            attachments = array_add( attachments, "<dev string:xafa>" );
            attachments = alphabetize( attachments );
            newweapon = makeweapon( getweaponbasename( weapon ), attachments );
            self takeweapon( weapon );
            self giveweapon( newweapon );
        }
        
        switchtoweaponwithbasename( currentweapon );
        self.goprohasattachments = 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa0a2
    // Size: 0xef, Type: dev
    function takegoproattachments()
    {
        if ( !isdefined( self.goprohasattachments ) )
        {
            return;
        }
        
        currentweapon = self.currentweapon;
        weapons = self.primaryinventory;
        
        foreach ( weapon in weapons )
        {
            if ( !function_8c05b3051b75cdcd( weapon ) )
            {
                continue;
            }
            
            attachments = weapon.attachments;
            attachments = array_remove( attachments, "<dev string:xafa>" );
            attachments = alphabetize( attachments );
            newweapon = makeweapon( getweaponbasename( weapon ), attachments );
            self takeweapon( weapon );
            self giveweapon( newweapon );
        }
        
        switchtoweaponwithbasename( currentweapon );
        self.goprohasattachments = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa199
    // Size: 0x44, Type: dev
    function function_8c05b3051b75cdcd( weapon )
    {
        basename = getweaponbasename( weapon );
        
        if ( issubstr( basename, "<dev string:xb0a>" ) )
        {
            return 1;
        }
        
        if ( issubstr( basename, "<dev string:xb16>" ) )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa1e5
    // Size: 0x80, Type: dev
    function switchtoweaponwithbasename( weapontocheck )
    {
        weapons = self.primaryinventory;
        
        foreach ( weapon in weapons )
        {
            if ( getweaponbasename( weapon ) == getweaponbasename( weapontocheck ) )
            {
                self switchtoweaponimmediate( weapon );
                break;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa26d
    // Size: 0xb2, Type: dev
    function function_5cf5d79beb35b900( type )
    {
        asset = ter_op( type == 1, "<dev string:xb22>", "<dev string:xb3f>" );
        repeat = type != 1;
        timeon = 1.25;
        timeoff = 2;
        
        foreach ( player in level.players )
        {
            level thread function_3372dc7d09c3e10d( player, asset, repeat, timeon, timeoff );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0xa327
    // Size: 0x94, Type: dev
    function function_3372dc7d09c3e10d( player, asset, repeat, timeon, timeoff )
    {
        player endon( "<dev string:x273>" );
        idbody = undefined;
        
        while ( true )
        {
            if ( isalive( player ) )
            {
                idbody = scripts\mp\utility\outline::outlineenableforall( player, asset, "<dev string:xb52>" );
                player scripts\mp\utility\outline::_hudoutlineviewmodelenable( asset, 0 );
                
                if ( !repeat )
                {
                    break;
                }
                
                player waittill_any_timeout_1( timeon, "<dev string:xb69>" );
                scripts\mp\utility\outline::outlinedisable( idbody, player );
                player scripts\mp\utility\outline::_hudoutlineviewmodeldisable();
            }
            
            wait timeoff;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa3c3
    // Size: 0xd7, Type: dev
    function function_6be41bc42b9c8a6()
    {
        if ( istrue( level.var_8990a0eae73c98e5 ) )
        {
            level.var_8990a0eae73c98e5 = undefined;
            
            foreach ( player in level.players )
            {
                player disablephysicaldepthoffieldscripting();
                player notify( "<dev string:xb72>" );
            }
            
            return;
        }
        
        level.var_8990a0eae73c98e5 = 1;
        
        foreach ( player in level.players )
        {
            player enablephysicaldepthoffieldscripting();
            player thread function_effde03597f46af1();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa4a2
    // Size: 0x103, Type: dev
    function function_effde03597f46af1()
    {
        level endon( "<dev string:x101>" );
        self notify( "<dev string:xb72>" );
        self endon( "<dev string:xb72>" );
        self notifyonplayercommand( "<dev string:xb84>", "<dev string:xb95>" );
        self notifyonplayercommand( "<dev string:xba6>", "<dev string:xbb9>" );
        self notifyonplayercommand( "<dev string:xbca>", "<dev string:xbdd>" );
        self notifyonplayercommand( "<dev string:xbe7>", "<dev string:xbfb>" );
        level.var_f03297f15c99ff06 = 4;
        level.var_2000b07cea5f680d = 300;
        level.var_eab6b4d118d64153 = [ 22, 16, 11, 8, 5.6, 4, 3.5, 2.8, 2.4, 2, 1.8, 1.6, 1.4 ];
        childthread function_f9632fde127cf240();
        childthread function_62b01d9b57e88095();
        childthread function_c11279198c9b98c5();
        childthread function_cbf57c53946ec8f0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa5ad
    // Size: 0x87, Type: dev
    function function_f9632fde127cf240()
    {
        while ( true )
        {
            self waittill( "<dev string:xb84>" );
            level.var_2000b07cea5f680d += 12;
            self iprintln( "<dev string:xc04>" + level.var_2000b07cea5f680d );
            self setphysicalviewmodeldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            self setphysicaldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa63c
    // Size: 0x87, Type: dev
    function function_62b01d9b57e88095()
    {
        while ( true )
        {
            self waittill( "<dev string:xba6>" );
            level.var_2000b07cea5f680d -= 12;
            self iprintln( "<dev string:xc28>" + level.var_2000b07cea5f680d );
            self setphysicalviewmodeldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            self setphysicaldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa6cb
    // Size: 0xaf, Type: dev
    function function_c11279198c9b98c5()
    {
        while ( true )
        {
            self waittill( "<dev string:xbe7>" );
            level.var_f03297f15c99ff06++;
            level.var_f03297f15c99ff06 = int( min( level.var_f03297f15c99ff06, level.var_eab6b4d118d64153.size - 1 ) );
            self iprintln( "<dev string:xc4c>" + level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ] );
            self setphysicalviewmodeldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            self setphysicaldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa782
    // Size: 0xa3, Type: dev
    function function_cbf57c53946ec8f0()
    {
        while ( true )
        {
            self waittill( "<dev string:xbca>" );
            level.var_f03297f15c99ff06--;
            level.var_f03297f15c99ff06 = int( max( level.var_f03297f15c99ff06, 0 ) );
            self iprintln( "<dev string:xc6a>" + level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ] );
            self setphysicalviewmodeldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            self setphysicaldepthoffield( level.var_eab6b4d118d64153[ level.var_f03297f15c99ff06 ], level.var_2000b07cea5f680d );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa82d
    // Size: 0xe3, Type: dev
    function function_21fde2ca3d2cd943()
    {
        if ( istrue( level.var_86b0c9a0a9be77ee ) )
        {
            level.var_86b0c9a0a9be77ee = undefined;
            
            foreach ( player in level.players )
            {
                player iprintlnbold( "<dev string:xc88>" );
                player notify( "<dev string:xca4>" );
                player scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer( "<dev string:xca>", 0 );
            }
            
            return;
        }
        
        level.var_86b0c9a0a9be77ee = 1;
        
        foreach ( player in level.players )
        {
            player thread function_eda8506c5ffb6a1a();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa918
    // Size: 0xcb, Type: dev
    function function_eda8506c5ffb6a1a()
    {
        level endon( "<dev string:x101>" );
        self notify( "<dev string:xca4>" );
        self endon( "<dev string:xca4>" );
        
        while ( true )
        {
            self iprintlnbold( "<dev string:xcb9>" );
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer( "<dev string:xcdd>", 0 );
            wait 3;
            self iprintlnbold( "<dev string:xce9>" );
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer( "<dev string:xd06>", 0 );
            wait 3;
            self iprintlnbold( "<dev string:xd22>" );
            scripts\cp_mp\utility\game_utility::_visionsetnakedforplayer( "<dev string:xd41>", 0 );
            wait 3;
            self iprintlnbold( "<dev string:xd56>" );
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer( "<dev string:xd06>" );
            wait 3;
            self iprintlnbold( "<dev string:xd73>" );
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer( "<dev string:xd41>" );
            wait 3;
            self iprintlnbold( "<dev string:xd92>" );
            thread scripts\cp_mp\utility\game_utility::_visionunsetnakedforplayer( "<dev string:xcdd>" );
            wait 3;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa9eb
    // Size: 0xac, Type: dev
    function function_338cf67a663c004c()
    {
        level endon( "<dev string:x101>" );
        
        while ( true )
        {
            while ( true )
            {
                if ( getdvarint( @"hash_2a7bafdc840d1f2e", 0 ) == 1 )
                {
                    break;
                }
                
                waitframe();
            }
            
            host = devfindhost();
            
            while ( true )
            {
                if ( isdefined( host ) )
                {
                    host.radarmode = "<dev string:xdb6>";
                    host.radarshowenemydirection = 1;
                    host.hasradar = 1;
                    triggeroneoffradarsweep( host );
                }
                else
                {
                    break;
                }
                
                if ( getdvarint( @"hash_2a7bafdc840d1f2e", 0 ) == 0 )
                {
                    break;
                }
                
                wait 0.2;
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xaa9f
    // Size: 0x171, Type: dev
    function function_a56437c4fc85184d()
    {
        level waittill( "<dev string:xdc4>" );
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        host notifyonplayercommand( "<dev string:xdd6>", "<dev string:xdef>" );
        host notifyonplayercommand( "<dev string:xdd6>", "<dev string:xdff>" );
        host notifyonplayercommand( "<dev string:xdd6>", "<dev string:xe19>" );
        
        for (selectedentity = undefined; true; selectedentity = undefined) {
            host waittill( "<dev string:xdd6>" );
            var_aeb968e718b92e1c = getdvarint( @"hash_a4e3922cf017e056", 0 );
            
            if ( var_aeb968e718b92e1c != 0 )
            {
                if ( host playerads() > 0.5 )
                {
                    continue;
                }
                
                tracestart = host geteye();
                forward = anglestoforward( host getplayerangles() );
                traceend = tracestart + forward * 5000;
                traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
                
                if ( isdefined( traceresults[ "<dev string:x171>" ] ) && isplayer( traceresults[ "<dev string:x171>" ] ) )
                {
                    selectedentity = traceresults[ "<dev string:x171>" ];
                    iprintlnbold( "<dev string:x8b7>" + selectedentity.name + "<dev string:x8c4>" );
                }
                else if ( isdefined( selectedentity ) )
                {
                    pos = traceresults[ "<dev string:x1ae>" ];
                    
                    if ( var_aeb968e718b92e1c == 2 )
                    {
                        pos = getclosestpointonnavmesh( pos );
                    }
                    
                    selectedentity setorigin( pos );
                }
                
                continue;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xac18
    // Size: 0x40, Type: dev
    function unlocksplash( increments, delay )
    {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\hud_message::showsplash( "<dev string:xe2d>", undefined, self );
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xac60
    // Size: 0x40, Type: dev
    function killstreaksplash( increments, delay )
    {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\hud_message::showsplash( "<dev string:xe3e>", undefined, self );
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xaca8
    // Size: 0x1a, Type: dev
    function notifyaftertime()
    {
        wait 0.35;
        self notify( "<dev string:xe4b>", "<dev string:xe5e>", 2 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xacca
    // Size: 0x39, Type: dev
    function ranksplash( increments, delay )
    {
        for (i = 0; i < increments; i++) {
            thread scripts\mp\rank::updaterankannouncehud();
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xad0b
    // Size: 0x31, Type: dev
    function weaponranksplash( increments, delay )
    {
        for (i = 0; i < increments; i++) {
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xad44
    // Size: 0xa7, Type: dev
    function testendgameupdate( promotion )
    {
        self setclientdvars( @"hash_6f0411143e4432e0", "<dev string:xe6d>", @"hash_5b32a696c1d93305", "<dev string:xe7d>", @"hash_b381b15150201be6", "<dev string:xe93>", @"hash_7a8a3eca3135fc23", "<dev string:xeaa>", @"hash_989b23a655566eec", "<dev string:xeb4>", @"hash_6291ab02dce7a81", "<dev string:xeca>", @"hash_3369f827e13404c2", "<dev string:xedc>" );
        
        if ( isdefined( promotion ) && promotion )
        {
            self setclientdvar( @"ui_promotion", 1 );
            return;
        }
        
        self setclientdvar( @"ui_promotion", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xadf3
    // Size: 0x1c, Type: dev
    function function_7fbc04196f29a18b()
    {
        level endon( "<dev string:xeef>" );
        wait randomfloat( 20 );
        level notify( "<dev string:xf07>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xae17
    // Size: 0x55, Type: dev
    function testlowermessage()
    {
        scripts\mp\utility\lower_message::setlowermessageomnvar( "<dev string:xf26>", int( gettime() + 10000 ) );
        wait 3;
        scripts\mp\utility\lower_message::setlowermessageomnvar( "<dev string:xf3a>" );
        wait 3;
        scripts\mp\utility\lower_message::setlowermessageomnvar( "<dev string:xf4a>" );
        wait 10;
        scripts\mp\utility\lower_message::setlowermessageomnvar( "<dev string:xf4a>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xae74
    // Size: 0x4f, Type: dev
    function giveextraperks()
    {
        if ( !isdefined( self.extraperks ) )
        {
            return;
        }
        
        perks = getarraykeys( self.extraperks );
        
        for (i = 0; i < perks.size; i++) {
            giveperk( perks[ i ] );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xaecb
    // Size: 0xf2, Type: dev
    function xkillsy( attackername, victimname )
    {
        attacker = undefined;
        victim = undefined;
        
        for (index = 0; index < level.players.size; index++) {
            if ( level.players[ index ].name == attackername )
            {
                attacker = level.players[ index ];
                continue;
            }
            
            if ( level.players[ index ].name == victimname )
            {
                victim = level.players[ index ];
            }
        }
        
        if ( !isalive( attacker ) || !isalive( victim ) )
        {
            return;
        }
        
        victim thread [[ level.callbackplayerdamage ]]( attacker, attacker, 500, 0, "<dev string:xf5d>", "<dev string:xf71>", ( 0, 0, 0 ), ( 0, 0, 0 ), "<dev string:xf0>", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xafc5
    // Size: 0x51d, Type: dev
    function updateminimapsetting()
    {
        requiredmapaspectratio = getdvarfloat( @"scr_requiredmapaspectratio", 1 );
        
        if ( !isdefined( level.minimapheight ) )
        {
            setdevdvar( @"scr_minimap_height", "<dev string:xc5>" );
            level.minimapheight = 0;
        }
        
        minimapheight = getdvarfloat( @"scr_minimap_height" );
        
        if ( minimapheight != level.minimapheight )
        {
            if ( isdefined( level.minimaporigin ) )
            {
                level.minimapplayer unlink();
                level.minimaporigin delete();
                level notify( "<dev string:xf7c>" );
            }
            
            if ( minimapheight > 0 )
            {
                level.minimapheight = minimapheight;
                players = getentarray( "<dev string:xf93>", "<dev string:xf9d>" );
                
                if ( players.size > 0 )
                {
                    player = players[ 0 ];
                    corners = getentarray( "<dev string:xfaa>", "<dev string:xfbc>" );
                    
                    if ( corners.size == 2 )
                    {
                        viewpos = corners[ 0 ].origin + corners[ 1 ].origin;
                        viewpos = ( viewpos[ 0 ] * 0.5, viewpos[ 1 ] * 0.5, viewpos[ 2 ] * 0.5 );
                        maxcorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        mincorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        
                        if ( corners[ 1 ].origin[ 0 ] > corners[ 0 ].origin[ 0 ] )
                        {
                            maxcorner = ( corners[ 1 ].origin[ 0 ], maxcorner[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( corners[ 1 ].origin[ 0 ], mincorner[ 1 ], mincorner[ 2 ] );
                        }
                        
                        if ( corners[ 1 ].origin[ 1 ] > corners[ 0 ].origin[ 1 ] )
                        {
                            maxcorner = ( maxcorner[ 0 ], corners[ 1 ].origin[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( mincorner[ 0 ], corners[ 1 ].origin[ 1 ], mincorner[ 2 ] );
                        }
                        
                        viewpostocorner = maxcorner - viewpos;
                        viewpos = ( viewpos[ 0 ], viewpos[ 1 ], viewpos[ 2 ] + minimapheight );
                        origin = spawn( "<dev string:xfca>", player.origin );
                        northvector = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
                        eastvector = ( northvector[ 1 ], 0 - northvector[ 0 ], 0 );
                        disttotop = vectordot( northvector, viewpostocorner );
                        
                        if ( disttotop < 0 )
                        {
                            disttotop = 0 - disttotop;
                        }
                        
                        disttoside = vectordot( eastvector, viewpostocorner );
                        
                        if ( disttoside < 0 )
                        {
                            disttoside = 0 - disttoside;
                        }
                        
                        if ( requiredmapaspectratio > 0 )
                        {
                            mapaspectratio = disttoside / disttotop;
                            
                            if ( mapaspectratio < requiredmapaspectratio )
                            {
                                incr = requiredmapaspectratio / mapaspectratio;
                                disttoside *= incr;
                                addvec = vecscale( eastvector, vectordot( eastvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                            else
                            {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop *= incr;
                                addvec = vecscale( northvector, vectordot( northvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                        }
                        
                        aspectratioguess = 1.77778;
                        angleside = 2 * atan( disttoside * 0.8 / minimapheight );
                        angletop = 2 * atan( disttotop * aspectratioguess * 0.8 / minimapheight );
                        
                        if ( angleside > angletop )
                        {
                            angle = angleside;
                        }
                        else
                        {
                            angle = angletop;
                        }
                        
                        znear = minimapheight - 1000;
                        
                        if ( znear < 16 )
                        {
                            znear = 16;
                        }
                        
                        if ( znear > 10000 )
                        {
                            znear = 10000;
                        }
                        
                        player playerlinkto( origin );
                        origin.origin = viewpos + ( 0, 0, -62 );
                        origin.angles = ( 90, getnorthyaw(), 0 );
                        player clearaccessory();
                        player takeallweapons();
                        player _giveweapon( "<dev string:xfdb>" );
                        devsetminimapdvarsettings( znear, angle );
                        level.minimapplayer = player;
                        level.minimaporigin = origin;
                        thread drawminimapbounds( viewpos, mincorner, maxcorner );
                        waitframe();
                        player setplayerangles( origin.angles );
                        setdvar( @"hash_e33eff4545d6dcfb", 0 );
                        setdvar( @"hash_94d94e451d01da61", 0 );
                    }
                    else
                    {
                        println( "<dev string:xfec>" );
                    }
                    
                    return;
                }
                
                setdevdvar( @"scr_minimap_height", "<dev string:xc5>" );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xb4ea
    // Size: 0x29, Type: dev
    function vecscale( vec, scalar )
    {
        return ( vec[ 0 ] * scalar, vec[ 1 ] * scalar, vec[ 2 ] * scalar );
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xb51b
    // Size: 0x213, Type: dev
    function drawminimapbounds( viewpos, mincorner, maxcorner )
    {
        level notify( "<dev string:xf7c>" );
        level endon( "<dev string:xf7c>" );
        viewheight = viewpos[ 2 ] - maxcorner[ 2 ];
        north = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
        diaglen = length( mincorner - maxcorner );
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize( ( mincorneroffset[ 0 ], mincorneroffset[ 1 ], 0 ) );
        mincorner += vecscale( mincorneroffset, diaglen * 1 / 800 );
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize( ( maxcorneroffset[ 0 ], maxcorneroffset[ 1 ], 0 ) );
        maxcorner += vecscale( maxcorneroffset, diaglen * 1 / 800 );
        diagonal = maxcorner - mincorner;
        side = vecscale( north, vectordot( diagonal, north ) );
        sidenorth = vecscale( north, abs( vectordot( diagonal, north ) ) );
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale( mincorner + maxcorner, 0.5 ) + vecscale( sidenorth, 0.51 );
        textscale = diaglen * 0.003;
        
        while ( true )
        {
            line( corner0, corner1, ( 0, 1, 0 ) );
            line( corner1, corner2, ( 0, 1, 0 ) );
            line( corner2, corner3, ( 0, 1, 0 ) );
            line( corner3, corner0, ( 0, 1, 0 ) );
            print3d( toppos, "<dev string:x1038>", ( 1, 1, 1 ), 1, textscale );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xb736
    // Size: 0xf1, Type: dev
    function inittestclientlatent( team, connecting )
    {
        while ( !self canspawnbotortestclient() )
        {
            waitframe();
            
            if ( !isdefined( self ) )
            {
                if ( isdefined( connecting ) )
                {
                    connecting.abort = 1;
                }
                
                return;
            }
        }
        
        self spawnbotortestclient();
        scripts\mp\playerlogic::spawnspectator();
        self.btestclient = 1;
        
        while ( !isdefined( self.pers[ "<dev string:x7fd>" ] ) )
        {
            waitframe();
            
            if ( !isdefined( self ) )
            {
                if ( isdefined( connecting ) )
                {
                    connecting.abort = 1;
                }
                
                return;
            }
        }
        
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            scripts\mp\menus::menuspectator();
            scripts\mp\menus::autoassign();
        }
        
        if ( allowclasschoice() )
        {
            class = "<dev string:x1048>" + randomint( 3 );
            self notify( "<dev string:x1051>", class );
        }
        
        waittill_notify_or_timeout( "<dev string:x106b>", 0.5 );
        wait 0.1;
        
        if ( isdefined( connecting ) )
        {
            connecting.ready = 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb82f
    // Size: 0x117, Type: dev
    function spawn_test_clients( testclients )
    {
        var_821516dc10ec00f0 = [];
        
        while ( var_821516dc10ec00f0.size < testclients )
        {
            waitframe();
            tc = addtestclient();
            
            if ( !isdefined( tc ) )
            {
                println( "<dev string:x107d>" );
                wait 1;
                continue;
            }
            
            connecting = spawnstruct();
            connecting.tc = tc;
            connecting.ready = 0;
            connecting.abort = 0;
            var_821516dc10ec00f0[ var_821516dc10ec00f0.size ] = connecting;
            connecting.tc thread inittestclientlatent( "<dev string:x109a>", connecting );
        }
        
        connectedcomplete = 0;
        
        while ( connectedcomplete < var_821516dc10ec00f0.size )
        {
            connectedcomplete = 0;
            
            foreach ( connecting in var_821516dc10ec00f0 )
            {
                if ( connecting.ready || connecting.abort )
                {
                    connectedcomplete++;
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb94e
    // Size: 0x514, Type: dev
    function function_e8bf4d412ec40f95()
    {
        wait 1;
        
        for ( ;; )
        {
            if ( getdvar( @"hash_159870fced1db05e" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        rom = function_496659f14ebed3ff();
        command = getdvar( @"hash_159870fced1db05e" );
        
        if ( command != "<dev string:x10a8>" && !isdefined( rom ) )
        {
            printonteam( "<dev string:x10b1>", level.players[ 0 ].team );
            command = "<dev string:xca>";
        }
        
        if ( command == "<dev string:x10a8>" )
        {
            level notify( "<dev string:x10d9>" );
            setdevdvar( @"hash_81f3fefd0af8548e", 0 );
            setdevdvar( @"hash_d251722b52989f", 0 );
            setdevdvar( @"hash_50be975cbeda7bd", 1 );
            level thread function_f2054471c141450c();
            
            while ( getdvarint( @"hash_50be975cbeda7bd" ) > 0 )
            {
                wait 1;
            }
            
            level notify( "<dev string:x10ea>" );
            rom = function_496659f14ebed3ff();
            rom thread function_c4100098a22c250b();
            rom thread function_b5cf3fa4ccae275f();
            rom thread function_c3c06fb268e321ea();
            
            if ( matchmakinggame() )
            {
                setmatchdata( "<dev string:x1107>", 1 );
            }
        }
        else if ( command == "<dev string:x1112>" )
        {
            level notify( "<dev string:x10d9>" );
            rom = undefined;
            setdevdvar( @"hash_81f3fefd0af8548e", 1 );
            setdevdvar( @"hash_d251722b52989f", 1 );
        }
        else if ( command == "<dev string:x111b>" )
        {
            printonteam( "<dev string:x1126>", level.players[ 0 ].team );
            rom kill();
        }
        else if ( command == "<dev string:xf8>" || command == "<dev string:x1139>" || command == "<dev string:x1143>" )
        {
            printonteam( "<dev string:x114c>" + command + "<dev string:x1163>", level.players[ 0 ].team );
            rom.laststance = command;
            function_447a488c5aa7ac36( rom.laststance );
        }
        else if ( command == "<dev string:x1168>" )
        {
            host_origin = level.players[ 0 ].origin;
            host_angles = level.players[ 0 ].angles;
            rom_origin = rom.origin;
            rom_angles = rom.angles;
            level.players[ 0 ] setorigin( rom_origin );
            level.players[ 0 ] setplayerangles( rom_angles );
            rom setorigin( host_origin );
            rom.spawnpoint = host_origin;
            rom.forcespawnorigin = host_origin;
            rom setplayerangles( host_angles );
            rom_stance = rom getstance();
            host_stance = level.players[ 0 ] getstance();
            rom.laststance = host_stance;
            function_447a488c5aa7ac36( rom.laststance );
            level.players[ 0 ] setstance( rom_stance );
            printonteam( "<dev string:x1172>", level.players[ 0 ].team );
        }
        else if ( command == "<dev string:x1190>" || command == "<dev string:x119e>" )
        {
            level notify( "<dev string:x11ab>" );
            
            if ( command == "<dev string:x119e>" )
            {
                rom thread function_c4100098a22c250b();
            }
        }
        else if ( command == "<dev string:x11bf>" )
        {
            if ( !isdefined( rom.outlined ) )
            {
                rom.outlined = 0;
            }
            
            if ( !rom.outlined )
            {
                rom hudoutlinedisableforclient( level.players[ 0 ] );
                rom hudoutlineenableforclient( level.players[ 0 ], "<dev string:x11c8>" );
                rom.outlined = 1;
            }
            else
            {
                rom hudoutlinedisableforclient( level.players[ 0 ] );
                rom.outlined = 0;
            }
        }
        else if ( command == "<dev string:x11df>" || command == "<dev string:x11f3>" || command == "<dev string:x1207>" || command == "<dev string:x1220>" || command == "<dev string:x1238>" || command == "<dev string:x124f>" || command == "<dev string:x1263>" || command == "<dev string:x1276>" || command == "<dev string:x128a>" )
        {
            if ( !isdefined( rom.var_2252d1347aca96e3 ) )
            {
                rom.var_2252d1347aca96e3 = 0;
            }
            
            level notify( "<dev string:x12a1>" );
            rom.var_2252d1347aca96e3 = 0;
            command = getsubstr( command, 13, command.size );
            
            if ( command != "<dev string:x12bd>" )
            {
                rom thread function_4fa739bfec196a56( command );
                rom.var_2252d1347aca96e3 = 1;
            }
        }
        
        setdevdvar( @"hash_159870fced1db05e", "<dev string:xca>" );
        thread function_e8bf4d412ec40f95();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbe6a
    // Size: 0x68, Type: dev
    function function_496659f14ebed3ff()
    {
        foreach ( player in level.players )
        {
            if ( isbot( player ) || istestclient( player ) )
            {
                return player;
            }
        }
        
        return undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xbeda
    // Size: 0x411, Type: dev
    function function_4fa739bfec196a56( cmd )
    {
        level endon( "<dev string:x10d9>" );
        level endon( "<dev string:x12a1>" );
        self endon( "<dev string:x273>" );
        player = level.players[ 0 ];
        heightoffset = ( 0, 0, 16 );
        barlength = 16;
        var_9b6f35a98a27757e = ( 1, 1, 1 );
        snipermaxrange = 2048;
        var_2f4cfdbd0f5f027e = ( 0.2, 0.6, 0.2 );
        lmgmaxrange = 1100;
        var_218a8d4929a5b267 = ( 0.5, 0.7, 0.5 );
        armaxrange = 1280;
        var_d538d80127ca33b2 = ( 0.3, 0.4, 0.7 );
        smgmaxrange = 512;
        var_6957491d3651c83e = ( 0.1, 0.6, 0.3 );
        pistolmaxrange = 300;
        var_498fbd9888b90db6 = ( 0.1, 0.9, 0.6 );
        shotgunmaxrange = 190;
        var_8f93c6e864526b11 = ( 0.7, 0.1, 0.6 );
        colors = undefined;
        ranges = undefined;
        
        switch ( cmd )
        {
            case #"hash_c482c6c109150a4":
                colors = [ var_8f93c6e864526b11, var_498fbd9888b90db6, var_6957491d3651c83e, var_d538d80127ca33b2, var_218a8d4929a5b267, var_2f4cfdbd0f5f027e ];
                ranges = [ shotgunmaxrange, pistolmaxrange, smgmaxrange, armaxrange, lmgmaxrange, snipermaxrange ];
                break;
            case #"hash_23209741b93850b5":
                colors = [ var_8f93c6e864526b11 ];
                ranges = [ shotgunmaxrange ];
                break;
            case #"hash_719417cb1de832b6":
                colors = [ var_498fbd9888b90db6 ];
                ranges = [ pistolmaxrange ];
                break;
            case #"hash_900cb96c552c5e8e":
                colors = [ var_6957491d3651c83e ];
                ranges = [ smgmaxrange ];
                break;
            case #"hash_fa18d2f6bd57925a":
                colors = [ var_d538d80127ca33b2 ];
                ranges = [ armaxrange ];
                break;
            case #"hash_2f2d546c2247838f":
                colors = [ var_218a8d4929a5b267 ];
                ranges = [ lmgmaxrange ];
                break;
            case #"hash_6191aaef9f922f96":
                colors = [ var_2f4cfdbd0f5f027e ];
                ranges = [ snipermaxrange ];
                break;
            default:
                break;
        }
        
        if ( isdefined( colors ) && isdefined( ranges ) )
        {
            while ( true )
            {
                angles = vectortoangles( player.origin - self.origin );
                forward = anglestoforward( angles );
                right = anglestoright( angles );
                left = right * -1;
                endorg = self.origin + forward * snipermaxrange;
                points = [];
                points[ 0 ] = self.origin;
                
                foreach ( range in ranges )
                {
                    points[ points.size ] = points[ 0 ] + forward * range;
                }
                
                lastpoint = points[ 0 ];
                
                for (i = 1; i < points.size; i++) {
                    var_2a04ae9968adcc79 = points[ i ] + heightoffset + right * barlength;
                    var_2a04ab9968adc5e0 = points[ i ] + heightoffset + left * barlength;
                    line( lastpoint + heightoffset, points[ i ] + heightoffset, colors[ i - 1 ], 1, 0, 1 );
                    line( var_2a04ae9968adcc79, var_2a04ab9968adc5e0, colors[ i - 1 ], 1, 0, 1 );
                    lastpoint = points[ i ];
                }
                
                waitframe();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc2f3
    // Size: 0x2b, Type: dev
    function function_c3c06fb268e321ea()
    {
        level endon( "<dev string:x10d9>" );
        self endon( "<dev string:x273>" );
        
        while ( true )
        {
            self waittill( "<dev string:xb69>" );
            thread function_1d4145a2086a065b();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc326
    // Size: 0x26, Type: dev
    function function_1d4145a2086a065b()
    {
        corpse = self getcorpseentity();
        wait 1;
        
        if ( isdefined( corpse ) )
        {
            corpse delete();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc354
    // Size: 0xb0, Type: dev
    function function_b5cf3fa4ccae275f()
    {
        level endon( "<dev string:x10d9>" );
        self endon( "<dev string:x273>" );
        
        if ( !isdefined( self.spawnpoint ) )
        {
            self.spawnpoint = self.origin;
        }
        
        if ( !isdefined( self.laststance ) )
        {
            self.laststance = "<dev string:xf0>";
        }
        
        while ( true )
        {
            if ( !isalive( self ) )
            {
                self waittill( "<dev string:x106b>" );
            }
            
            if ( self.origin != self.spawnpoint )
            {
                self setorigin( self.spawnpoint );
            }
            
            if ( self getstance() != self.laststance )
            {
                function_447a488c5aa7ac36( self.laststance );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc40c
    // Size: 0xb2, Type: dev
    function function_447a488c5aa7ac36( stance )
    {
        switch ( stance )
        {
            case #"hash_3fed0cbd303639eb":
                setdevdvar( @"hash_33fe5ebb83d90648", 1 );
                setdevdvar( @"hash_43cd2bf145682550", 0 );
                break;
            case #"hash_d91940431ed7c605":
                setdevdvar( @"hash_33fe5ebb83d90648", 0 );
                setdevdvar( @"hash_43cd2bf145682550", 1 );
                break;
            case #"hash_c6775c88e38f7803":
            default:
                setdevdvar( @"hash_33fe5ebb83d90648", 0 );
                setdevdvar( @"hash_43cd2bf145682550", 0 );
                break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc4c6
    // Size: 0x17f, Type: dev
    function function_c4100098a22c250b()
    {
        level endon( "<dev string:x10d9>" );
        level endon( "<dev string:x11ab>" );
        self endon( "<dev string:x273>" );
        player = level.players[ 0 ];
        
        while ( true )
        {
            romhealth = "<dev string:x12f7>" + self.health + "<dev string:x12ff>";
            romdist = function_d3ca4f2f302e8de7( player.origin );
            
            if ( isdefined( self.attackerdata ) && isdefined( self.attackerdata[ player.guid ] ) )
            {
                romdamage = "<dev string:x1304>" + self.attackerdata[ player.guid ].damage + "<dev string:x12ff>";
                romhitloc = "<dev string:x1310>" + self.attackerdata[ player.guid ].shitloc + "<dev string:x12ff>";
                var_66026d112b9fc1b5 = "<dev string:x1319>" + getweaponbasename( self.attackerdata[ player.guid ].objweapon );
            }
            else
            {
                romdamage = "<dev string:x1323>";
                romhitloc = "<dev string:x1332>";
                var_66026d112b9fc1b5 = "<dev string:x133c>";
            }
            
            builtstring = romhealth + romdamage + romdist + romhitloc + var_66026d112b9fc1b5;
            printtoscreen2d( 150, 500, builtstring, ( 1, 1, 1 ), 2 );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc64d
    // Size: 0x3c, Type: dev
    function function_f2054471c141450c()
    {
        level endon( "<dev string:x10d9>" );
        level endon( "<dev string:x10ea>" );
        
        while ( true )
        {
            printtoscreen2d( 800, 650, "<dev string:x1345>", ( 1, 1, 1 ), 2 );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc691
    // Size: 0x135, Type: dev
    function function_d3ca4f2f302e8de7( playerorg )
    {
        shotgunmaxrange = 190;
        pistolmaxrange = 300;
        smgmaxrange = 512;
        lmgmaxrange = 1100;
        armaxrange = 1280;
        snipermaxrange = 2048;
        dist = int( distance( playerorg, self.origin ) );
        weapstring = "<dev string:xca>";
        
        if ( dist <= shotgunmaxrange )
        {
            weapstring = "<dev string:x135b>";
        }
        else if ( dist > shotgunmaxrange && dist <= pistolmaxrange )
        {
            weapstring = "<dev string:x1366>";
        }
        else if ( dist > pistolmaxrange && dist <= smgmaxrange )
        {
            weapstring = "<dev string:x1370>";
        }
        else if ( dist > smgmaxrange && dist <= lmgmaxrange )
        {
            weapstring = "<dev string:x1377>";
        }
        else if ( dist > lmgmaxrange && dist <= armaxrange )
        {
            weapstring = "<dev string:x137e>";
        }
        else if ( dist > lmgmaxrange && dist <= snipermaxrange )
        {
            weapstring = "<dev string:x1384>";
        }
        else if ( dist > snipermaxrange )
        {
            weapstring = "<dev string:x1394>";
        }
        
        return "<dev string:x13a0>" + dist + "<dev string:x13ab>" + weapstring + "<dev string:x13b1>";
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc7ce
    // Size: 0xa6, Type: dev
    function function_689eec6bde3c18d9()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_6a070f99cded1bb7" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_6a070f99cded1bb7", 0 );
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot( notbot );
        
        if ( isdefined( bot ) )
        {
            notbot thread [[ level.callbackplayerdamage ]]( bot, bot, 500, 0, "<dev string:xf5d>", bot.primaryweaponobj, bot.origin, ( 0, 0, 0 ), "<dev string:xf0>", 0 );
        }
        
        wait 1;
        thread function_689eec6bde3c18d9();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc87c
    // Size: 0x18d, Type: dev
    function function_67ae0f36ccdc36d6()
    {
        for ( ;; )
        {
            if ( getdvar( @"hash_128ee1e0b7c9bb5d" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        killstreak = getdvar( @"hash_128ee1e0b7c9bb5d" );
        setdevdvar( @"hash_128ee1e0b7c9bb5d", "<dev string:xca>" );
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot( notbot, 1 );
        
        if ( getdvarint( @"hash_9554b84c655e575d" ) )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) || istestclient( player ) )
                {
                    bot = player;
                }
                
                if ( isdefined( bot ) )
                {
                    bot botusekillstreak( killstreak );
                }
            }
        }
        else if ( getdvarint( @"hash_7ce94a8dcd3c8b99" ) )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) || istestclient( player ) )
                {
                    bot = player;
                }
                
                if ( isdefined( bot ) )
                {
                    bot thread botusekillstreak( killstreak );
                }
            }
        }
        else if ( isdefined( bot ) )
        {
            bot botusekillstreak( killstreak );
        }
        
        thread function_67ae0f36ccdc36d6();
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xca11
    // Size: 0x115, Type: dev
    function botusekillstreak( killstreak )
    {
        var_921e39c71a7d1713 = 0;
        emptime = undefined;
        
        if ( killstreak == "<dev string:x462>" )
        {
            var_921e39c71a7d1713 = 1;
            emptime = getdvarfloat( @"hash_7ae9abc841dc9c4b" );
            killstreak = "<dev string:x46f>";
            setdevdvar( @"hash_7ae9abc841dc9c4b", 1 );
        }
        
        if ( killstreak == "<dev string:x13b7>" )
        {
            scripts\mp\perks\perkfunctions::setlightarmor();
            return;
        }
        
        if ( killstreak == "<dev string:x13cc>" )
        {
            var_188f231997d311a7 = getdvarint( @"hash_3f1bd355bf340abb" );
            setdvar( @"hash_3f1bd355bf340abb", 1 );
            scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut();
            setdvar( @"hash_3f1bd355bf340abb", var_188f231997d311a7 );
            return;
        }
        
        scripts\mp\killstreaks\killstreaks::awardkillstreak( killstreak, "<dev string:x4a4>" );
        wait 0.1;
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isai( self ) && !getdvarint( @"hash_dd6a15dccb6f778c" ) )
        {
            return;
        }
        
        thread scripts\mp\killstreaks\killstreaks::forceactivategimmekillstreak();
        
        if ( var_921e39c71a7d1713 )
        {
            level thread function_55bbe0a4afb01226( 1, @"hash_7ae9abc841dc9c4b", emptime );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcb2e
    // Size: 0xad, Type: dev
    function function_4d94248caa9df84()
    {
        while ( true )
        {
            if ( getdvar( @"hash_4ae56ff4e4985e83" ) != "<dev string:xca>" )
            {
                if ( getdvar( @"hash_4ae56ff4e4985e83" ) == "<dev string:x13da>" )
                {
                    level thread function_d701da79246ffd5c( 1 );
                }
                else if ( getdvar( @"hash_4ae56ff4e4985e83" ) == "<dev string:x13e2>" )
                {
                    level thread function_d701da79246ffd5c( 0.05 );
                }
                else if ( getdvar( @"hash_4ae56ff4e4985e83" ) == "<dev string:x13ea>" )
                {
                    level function_26f66601b72597e0();
                }
                
                setdvar( @"hash_4ae56ff4e4985e83", "<dev string:xca>" );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcbe3
    // Size: 0x9a, Type: dev
    function function_69aa890d8277ddd5()
    {
        while ( true )
        {
            if ( getdvar( @"hash_9608479c0ddc550d" ) != "<dev string:xca>" )
            {
                if ( istrue( level.var_78184ec36f669844 ) )
                {
                    level notify( "<dev string:x13f2>" );
                    level function_8a263305b061f543();
                    level.var_78184ec36f669844 = undefined;
                    iprintlnbold( "<dev string:x1410>" );
                }
                else
                {
                    level function_731eebf12019c961();
                    level thread function_b7e6fc2c99a2fa66();
                    level.var_78184ec36f669844 = 1;
                    iprintlnbold( "<dev string:x142f>" );
                }
                
                setdvar( @"hash_9608479c0ddc550d", "<dev string:xca>" );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcc85
    // Size: 0x9a, Type: dev
    function function_240f0116344cd1b3()
    {
        while ( true )
        {
            if ( getdvar( @"hash_10966de869cb14af" ) != "<dev string:xca>" )
            {
                if ( istrue( level.var_54554b64b7a5456 ) )
                {
                    level notify( "<dev string:x13f2>" );
                    level function_3a192b1ca3dd6a6d();
                    level.var_54554b64b7a5456 = undefined;
                    iprintlnbold( "<dev string:x144d>" );
                }
                else
                {
                    level function_78cb449e68ad3a33();
                    level thread function_9bfd57a46a0b8120();
                    level.var_54554b64b7a5456 = 1;
                    iprintlnbold( "<dev string:x1465>" );
                }
                
                setdvar( @"hash_10966de869cb14af", "<dev string:xca>" );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcd27
    // Size: 0x80, Type: dev
    function function_731eebf12019c961()
    {
        foreach ( player in level.players )
        {
            if ( isbot( player ) && !player _hasperk( "<dev string:x147c>" ) )
            {
                player giveperk( "<dev string:x147c>" );
                player thread function_95c542c3d23e8ed5();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcdaf
    // Size: 0x77, Type: dev
    function function_8a263305b061f543()
    {
        foreach ( player in level.players )
        {
            if ( isbot( player ) && player _hasperk( "<dev string:x147c>" ) )
            {
                player removeperk( "<dev string:x147c>" );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xce2e
    // Size: 0x47, Type: dev
    function function_b7e6fc2c99a2fa66()
    {
        level endon( "<dev string:x13f2>" );
        
        while ( true )
        {
            level waittill( "<dev string:xdc4>", player );
            
            if ( isbot( player ) )
            {
                player giveperk( "<dev string:x147c>" );
                player thread function_95c542c3d23e8ed5();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xce7d
    // Size: 0x20, Type: dev
    function function_95c542c3d23e8ed5()
    {
        self endon( "<dev string:xb69>" );
        self endon( "<dev string:x273>" );
        wait 0.1;
        function_6a769435cb4b49de();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcea5
    // Size: 0x9a, Type: dev
    function function_6a769435cb4b49de()
    {
        player = undefined;
        
        foreach ( p in level.players )
        {
            if ( !isbot( p ) )
            {
                player = p;
                break;
            }
        }
        
        if ( isdefined( player ) )
        {
            self dodamage( player.maxhealth, player.origin, player, player, "<dev string:x1495>", undefined, "<dev string:x14a3>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcf47
    // Size: 0x63, Type: dev
    function function_78cb449e68ad3a33()
    {
        foreach ( player in level.players )
        {
            if ( isbot( player ) )
            {
                player thread function_c110bb7b83fba1fc();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcfb2
    // Size: 0x62, Type: dev
    function function_3a192b1ca3dd6a6d()
    {
        foreach ( player in level.players )
        {
            if ( isbot( player ) )
            {
                player notify( "<dev string:x14b2>" );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd01c
    // Size: 0x3a, Type: dev
    function function_9bfd57a46a0b8120()
    {
        level endon( "<dev string:x14c3>" );
        
        while ( true )
        {
            level waittill( "<dev string:xdc4>", player );
            
            if ( isbot( player ) )
            {
                player thread function_c110bb7b83fba1fc();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd05e
    // Size: 0x2f, Type: dev
    function function_c110bb7b83fba1fc()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x14b2>" );
        
        while ( true )
        {
            self botpressbutton( "<dev string:x14f2>", 1.1 );
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd095
    // Size: 0xbd, Type: dev
    function function_d701da79246ffd5c( delay )
    {
        level notify( "<dev string:x14f9>" );
        level endon( "<dev string:x14f9>" );
        setdvar( @"player_sustainammo", 1 );
        
        while ( true )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) && isalive( player ) )
                {
                    if ( delay == 0.05 )
                    {
                        player botpressbutton( "<dev string:x150a>", delay );
                        continue;
                    }
                    
                    player botpressbutton( "<dev string:x150a>" );
                }
            }
            
            wait delay;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd15a
    // Size: 0x21, Type: dev
    function function_26f66601b72597e0()
    {
        setdvar( @"player_sustainammo", "<dev string:xc5>" );
        level notify( "<dev string:x14f9>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd183
    // Size: 0x28, Type: dev
    function function_55bbe0a4afb01226( waittime, dvarname, dvarvalue )
    {
        wait waittime;
        setdevdvar( dvarname, dvarvalue );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd1b3
    // Size: 0xd1, Type: dev
    function function_e9dca57ef4039df1()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_407d81926ced4cff" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_407d81926ced4cff", 0 );
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot( notbot );
        
        if ( isdefined( bot ) )
        {
            trace = scripts\engine\trace::_bullet_trace( bot.origin + ( 0, 0, 4 ), bot.origin - ( 0, 0, 4 ), 0, bot );
            box = scripts\mp\killstreaks\deployablebox::createboxforplayer( "<dev string:x1514>", trace[ "<dev string:x1ae>" ], bot );
            wait 0.05;
            box thread scripts\mp\killstreaks\deployablebox::box_setactive();
        }
        
        thread function_e9dca57ef4039df1();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd28c
    // Size: 0x2af, Type: dev
    function addtestclientspawnpoint()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_50be975cbeda7bd" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( notbot ) )
        {
            setdevdvar( @"hash_50be975cbeda7bd", 0 );
            thread addtestclientspawnpoint();
            return;
        }
        
        if ( !isalive( notbot ) )
        {
            setdevdvar( @"hash_50be975cbeda7bd", 0 );
            thread addtestclientspawnpoint();
            return;
        }
        
        markerpos = scripts\engine\trace::_bullet_trace( notbot geteye(), notbot.origin + anglestoforward( notbot getplayerangles() ) * 10000, 0, notbot );
        marker = spawn( "<dev string:x19e>", markerpos[ "<dev string:x1ae>" ] );
        marker setmodel( "<dev string:x1527>" );
        trace = scripts\engine\trace::_bullet_trace( marker.origin + ( 0, 0, 50 ), marker.origin + ( 0, 0, -100 ), 0, marker );
        marker.origin = trace[ "<dev string:x1ae>" ];
        marker thread showfx();
        
        while ( getdvarint( @"hash_50be975cbeda7bd" ) > 0 )
        {
            markerpos = scripts\engine\trace::_bullet_trace( notbot geteye(), notbot.origin + anglestoforward( notbot getplayerangles() ) * 10000, 0, marker );
            marker.origin = markerpos[ "<dev string:x1ae>" ];
            trace = scripts\engine\trace::_bullet_trace( marker.origin + ( 0, 0, 50 ), marker.origin + ( 0, 0, -100 ), 0, marker );
            marker.origin = trace[ "<dev string:x1ae>" ];
            
            if ( notbot usebuttonpressed() )
            {
                ent = addtestclient();
                
                if ( !isdefined( ent ) )
                {
                    println( "<dev string:x107d>" );
                    wait 1;
                    continue;
                }
                
                ent inittestclientlatent( getotherteam( notbot.team )[ 0 ] );
                
                if ( !isdefined( ent ) )
                {
                    println( "<dev string:x107d>" );
                    wait 1;
                    continue;
                }
                
                ent waittill_notify_or_timeout( "<dev string:x106b>", 0.5 );
                wait 0.1;
                
                while ( ent.sessionstate != "<dev string:x1538>" )
                {
                    waitframe();
                }
                
                ent setorigin( marker.origin );
                
                if ( matchmakinggame() )
                {
                    setmatchdata( "<dev string:x1107>", 1 );
                }
                
                break;
            }
            
            wait 0.05;
        }
        
        marker delete();
        setdevdvar( @"hash_50be975cbeda7bd", 0 );
        thread addtestclientspawnpoint();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd543
    // Size: 0x27, Type: dev
    function showfx()
    {
        self endon( "<dev string:xb69>" );
        wait 1;
        playfxontag( level.var_106f5dbd64532cc4, self, "<dev string:x1543>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd572
    // Size: 0x20a, Type: dev
    function warpenemies()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_24de427d5a5a8443" ) > 0 || getdvarint( @"hash_1c423b4190c17fda" ) > 0 || getdvarint( @"hash_32201091ed0c5bd6" ) > 0 )
            {
                notbot = function_69dffe7a5cb1b4b9();
                
                if ( !isdefined( notbot ) )
                {
                    return;
                }
                
                targets = undefined;
                
                if ( isdefined( level.warptargets ) )
                {
                    targets = level.warptargets;
                }
                else
                {
                    targets = level.characters;
                }
                
                warpplayers = [];
                
                foreach ( character in targets )
                {
                    if ( !isalive( character ) )
                    {
                        continue;
                    }
                    
                    if ( getdvarint( @"hash_32201091ed0c5bd6" ) > 0 )
                    {
                    }
                    else if ( isagent( character ) )
                    {
                        continue;
                    }
                    
                    if ( isdefined( character.sessionstate ) && character.sessionstate == "<dev string:x200>" )
                    {
                        continue;
                    }
                    
                    if ( getdvarint( @"hash_1c423b4190c17fda" ) > 0 )
                    {
                        if ( !isbot( character ) )
                        {
                            continue;
                        }
                    }
                    
                    if ( !level.teambased || character.team != notbot.team )
                    {
                        warpplayers[ warpplayers.size ] = character;
                    }
                }
                
                if ( warpplayers.size == 1 )
                {
                    warp( notbot, warpplayers[ 0 ], 1 );
                }
                else
                {
                    for (i = 0; i < warpplayers.size; i++) {
                        warp( notbot, warpplayers[ i ], i );
                    }
                }
                
                if ( getdvarint( @"hash_f5a9982eaa189f7b" ) > 0 )
                {
                    function_46f83fe8ffc7244();
                }
                
                setdevdvar( @"hash_24de427d5a5a8443", 0 );
                setdevdvar( @"hash_1c423b4190c17fda", 0 );
                setdevdvar( @"hash_32201091ed0c5bd6", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd784
    // Size: 0x1a0, Type: dev
    function function_444dddd830151a09()
    {
        for ( ;; )
        {
            if ( getdvar( @"hash_be5cbd4a2291f23f" ) != "<dev string:xca>" )
            {
                break;
            }
            
            waitframe();
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( notbot ) )
        {
            return;
        }
        
        targets = undefined;
        
        if ( isdefined( level.warptargets ) )
        {
            targets = level.warptargets;
        }
        else
        {
            targets = level.characters;
        }
        
        warpplayers = [];
        
        foreach ( character in targets )
        {
            if ( !isalive( character ) )
            {
                continue;
            }
            
            if ( isagent( character ) )
            {
                continue;
            }
            
            if ( character.sessionstate == "<dev string:x200>" )
            {
                continue;
            }
            
            if ( getdvar( @"hash_be5cbd4a2291f23f" ) != "<dev string:xca>" )
            {
                if ( !isbot( character ) )
                {
                    continue;
                }
            }
            
            if ( getdvar( @"hash_be5cbd4a2291f23f" ) != "<dev string:xca>" )
            {
                if ( character.team == getdvar( @"hash_be5cbd4a2291f23f" ) )
                {
                    warpplayers[ warpplayers.size ] = character;
                }
            }
        }
        
        if ( warpplayers.size == 1 )
        {
            warp( notbot, warpplayers[ 0 ], 1 );
        }
        else
        {
            for (i = 0; i < warpplayers.size; i++) {
                warp( notbot, warpplayers[ i ], i );
            }
        }
        
        setdevdvar( @"hash_be5cbd4a2291f23f", "<dev string:xca>" );
        thread function_444dddd830151a09();
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd92c
    // Size: 0xdc, Type: dev
    function function_a9f60102f1faf3e8( character, offsetfwd, offsetlft )
    {
        offsetfwd = ter_op( isdefined( offsetfwd ), offsetfwd, 0 );
        offsetlft = ter_op( isdefined( offsetlft ), offsetlft, 0 );
        fwd = anglestoforward( character.angles ) * ( 72 + offsetfwd ) + ( 0, 0, 48 );
        lft = anglestoleft( character.angles ) * offsetlft;
        target = character.origin + fwd + lft;
        result = undefined;
        
        if ( scripts\cp_mp\utility\game_utility::islargemap() )
        {
            result = character.origin + fwd + lft;
        }
        else
        {
            result = getclosestpointonnavmesh( character.origin + fwd + lft, character );
        }
        
        return result;
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xda10
    // Size: 0xcf, Type: dev
    function warp( caller, warpee, idx )
    {
        var_f36ab59f21d5828c = idx % 3;
        var_8b2ecf7072c2e3b8 = int( idx / 3 );
        offsetfwd = var_8b2ecf7072c2e3b8 * 96;
        offsetlft = var_f36ab59f21d5828c * 48 - 48;
        
        if ( var_8b2ecf7072c2e3b8 % 2 != 0 )
        {
            offsetlft += 24;
        }
        
        spawnpos = level.players[ 0 ].origin;
        spawnang = ( 0, caller getplayerangles( 1 )[ 1 ] + 180, 0 );
        warpee setorigin( spawnpos + ( 0, 0, 18 ) );
        warpee setplayerangles( spawnang );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xdae7
    // Size: 0x1f7, Type: dev
    function warpfriendlies()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_3a8e3d6db69d767e" ) > 0 || getdvarint( @"hash_7c14c45b0376be39" ) > 0 || getdvarint( @"hash_493c636a94f69749" ) > 0 )
            {
                notbot = function_69dffe7a5cb1b4b9();
                
                if ( !isdefined( notbot ) )
                {
                    return;
                }
                
                targets = undefined;
                
                if ( isdefined( level.warptargets ) )
                {
                    targets = level.warptargets;
                }
                else
                {
                    targets = level.characters;
                }
                
                warpplayers = [];
                
                foreach ( character in targets )
                {
                    if ( !isalive( character ) )
                    {
                        continue;
                    }
                    
                    if ( getdvarint( @"hash_493c636a94f69749" ) > 0 )
                    {
                    }
                    else if ( isagent( character ) )
                    {
                        continue;
                    }
                    
                    if ( isdefined( character.sessionstate ) && character.sessionstate == "<dev string:x200>" )
                    {
                        continue;
                    }
                    
                    if ( getdvarint( @"hash_1c423b4190c17fda" ) > 0 )
                    {
                        if ( !isbot( character ) )
                        {
                            continue;
                        }
                    }
                    
                    if ( notbot != character && level.teambased && character.team == notbot.team )
                    {
                        warpplayers[ warpplayers.size ] = character;
                    }
                }
                
                if ( warpplayers.size == 1 )
                {
                    warp( notbot, warpplayers[ 0 ], 1 );
                }
                else
                {
                    for (i = 0; i < warpplayers.size; i++) {
                        warp( notbot, warpplayers[ i ], i );
                    }
                }
                
                setdevdvar( @"hash_3a8e3d6db69d767e", 0 );
                setdevdvar( @"hash_7c14c45b0376be39", 0 );
                setdevdvar( @"hash_493c636a94f69749", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xdce6
    // Size: 0x12e, Type: dev
    function function_1d7da97245fef737()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_d2d27e6a1337fc41" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_d2d27e6a1337fc41", 0 );
        
        if ( !isdefined( level.var_b15737b9e81b1b62 ) )
        {
            level.var_b15737b9e81b1b62 = 0;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( notbot ) )
        {
            return;
        }
        
        spawnpos = function_a9f60102f1faf3e8( notbot );
        
        for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
            characterindex = level.var_b15737b9e81b1b62 % level.characters.size;
            character = level.characters[ characterindex ];
            level.var_b15737b9e81b1b62++;
            
            if ( isdefined( character ) && isbot( character ) && isalive( character ) )
            {
                if ( level.teambased )
                {
                    if ( character.team != notbot.team )
                    {
                        character setorigin( spawnpos );
                        break;
                    }
                    
                    continue;
                }
                
                character setorigin( spawnpos );
                break;
            }
        }
        
        thread function_1d7da97245fef737();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xde1c
    // Size: 0x131, Type: dev
    function function_87862ab67c8f77de()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_475e86d5470a4524" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_475e86d5470a4524", 0 );
        
        if ( !isdefined( level.var_1224a488fbe3e153 ) )
        {
            level.var_1224a488fbe3e153 = 0;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( notbot ) )
        {
            return;
        }
        
        spawnpos = function_a9f60102f1faf3e8( notbot );
        
        for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
            characterindex = level.var_1224a488fbe3e153 % level.characters.size;
            character = level.characters[ characterindex ];
            level.var_1224a488fbe3e153++;
            
            if ( isdefined( character ) && character != notbot )
            {
                if ( level.teambased )
                {
                    if ( isdefined( character.team ) && character.team == notbot.team )
                    {
                        character setorigin( spawnpos );
                        break;
                    }
                    
                    continue;
                }
                
                character setorigin( spawnpos );
                break;
            }
        }
        
        thread function_87862ab67c8f77de();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xdf55
    // Size: 0x609, Type: dev
    function function_17cdeb7626afb432()
    {
        for ( ;; )
        {
            if ( getdvar( @"hash_be4638b34423d0ca" ) != "<dev string:xca>" )
            {
                thread function_74738c3819abb360();
            }
            else if ( getdvar( @"hash_be7522650406f34f" ) != "<dev string:xca>" )
            {
                thread function_1c7d46262629d29d();
            }
            else if ( getdvar( @"hash_87fd1aab915574c0" ) != "<dev string:xca>" )
            {
                thread function_ce3fb44e346e757a();
            }
            else if ( getdvar( @"hash_3debe2571172850" ) != "<dev string:xca>" )
            {
                thread function_6b13277c62c054f6();
            }
            else if ( getdvar( @"hash_8fcbab7f56dcce7" ) != "<dev string:xca>" )
            {
                thread function_b3bb97f140498db5();
            }
            else if ( getdvar( @"hash_b679b1eead8733a3" ) != "<dev string:xca>" )
            {
                thread function_b39eda08d7912835();
            }
            else if ( getdvar( @"hash_61f1432615a0514b" ) != "<dev string:xca>" )
            {
                thread dbgbullets();
            }
            else if ( getdvar( @"hash_ae04ade2c8e72fdc" ) != "<dev string:xca>" )
            {
                thread function_6dfe999747a36cb2();
            }
            else if ( getdvar( @"scr_giveweapon" ) != "<dev string:xca>" )
            {
                thread gui_giveweapon();
            }
            else if ( getdvarint( @"hash_4aa285a21e3a2ebe" ) != 0 )
            {
                thread function_72e55f6d23ab9c08();
            }
            else if ( getdvar( @"hash_9bf239cb990aca4b" ) != "<dev string:xca>" )
            {
                thread function_9304864c4018f425();
            }
            else if ( getdvar( @"scr_spawnweapon" ) != "<dev string:xca>" )
            {
                thread gui_spawnweapon();
            }
            else if ( getdvar( @"hash_b1941ef83f118a4e" ) != "<dev string:xca>" )
            {
                thread function_5bec6fc6eda8f898();
            }
            else if ( getdvar( @"hash_6f67d3ada4d28ec5" ) != "<dev string:xca>" )
            {
                thread function_d6a83cf324a42777();
            }
            else if ( getdvar( @"scr_dropweapon" ) != "<dev string:xca>" )
            {
                thread gui_dropweapon();
            }
            else if ( getdvar( @"scr_dropammo" ) != "<dev string:xca>" )
            {
                thread gui_dropammo();
            }
            else if ( getdvar( @"hash_5f48bb8808b7e209" ) != "<dev string:xca>" )
            {
                thread function_51be8168158324f7();
            }
            else if ( getdvar( @"hash_c87017f600b49447" ) != "<dev string:xca>" )
            {
                thread gui_giveattachment();
            }
            else if ( getdvar( @"hash_2e71bdd72d9c9509" ) != "<dev string:xca>" )
            {
                thread function_74438b2c9e6463();
            }
            else if ( getdvar( @"hash_94cfa401914bb582" ) != "<dev string:xca>" )
            {
                thread function_72bdcbf68a00d590();
            }
            else if ( getdvar( @"hash_cd022e5b7a0889e" ) != "<dev string:xca>" )
            {
                thread function_cc74ebbb668e7700();
            }
            else if ( getdvar( @"hash_1da69ba9e35c8ea0" ) != "<dev string:xca>" )
            {
                thread function_a4ec750e2bc80eee();
            }
            else if ( getdvar( @"scr_givegesture" ) != "<dev string:xca>" )
            {
                thread function_58d040b31ffcfd8b();
            }
            else if ( getdvar( @"hash_3764674c95711828" ) != "<dev string:xca>" )
            {
                thread function_3487ac5f6da16476();
            }
            else if ( getdvar( @"hash_cfc446de878b0ee3" ) != "<dev string:xca>" )
            {
                thread function_2bfcc7409565e78f();
            }
            else if ( getdvar( @"hash_d51834b4d1b89a35" ) != "<dev string:xca>" )
            {
                thread function_5415edb8c8843131();
            }
            else if ( getdvar( @"hash_d7ac865ae726cebc" ) != "<dev string:xca>" )
            {
                thread function_c2edf5eae934b748();
            }
            else if ( getdvar( @"hash_3336a486aff69f38" ) != "<dev string:xca>" )
            {
                thread devlistinventory();
            }
            else if ( getdvarint( @"hash_21f13701dd027cd9" ) != 0 )
            {
                function_5a05e17142c56074();
            }
            else if ( getdvarint( @"hash_35721bc6b305545e" ) != 0 )
            {
                function_5b12f5872c82005c();
            }
            else if ( getdvarint( @"hash_68576d3cfbb31217" ) != 0 )
            {
                function_cc940c3c7c1a71da();
            }
            else if ( getdvar( @"hash_912105285f3af273" ) != "<dev string:xca>" )
            {
                function_377f1acfb3774426();
            }
            else if ( getdvar( @"hash_5e62b8f4b2dd7d6e" ) != "<dev string:xca>" )
            {
                function_1da70102eeb10c0b();
            }
            else if ( getdvarint( @"hash_28e2b3251abc4817" ) != 0 )
            {
                thread function_82525648d7c500ed();
            }
            else if ( getdvar( @"hash_8de4ac9450b61777" ) != "<dev string:xca>" )
            {
                thread function_24ef69feb5dcce7d();
            }
            else if ( getdvar( @"hash_8de4ad9450b619aa" ) != "<dev string:xca>" )
            {
                thread function_24ef66feb5dcc7e4();
            }
            else if ( getdvar( @"hash_8de4ae9450b61bdd" ) != "<dev string:xca>" )
            {
                thread function_24ef67feb5dcca17();
            }
            else if ( getdvar( @"hash_8de4a79450b60c78" ) != "<dev string:xca>" )
            {
                thread function_24ef64feb5dcc37e();
            }
            else if ( getdvar( @"hash_8de4a89450b60eab" ) != "<dev string:xca>" )
            {
                thread function_24ef65feb5dcc5b1();
            }
            else if ( getdvarint( @"hash_efa2254b31f42841" ) != 0 )
            {
                thread function_532fd73f8db5615b();
            }
            else if ( getdvarint( @"hash_ac65f9192e2efd0" ) != 0 )
            {
                thread function_ebaa726e097207e2();
            }
            else if ( getdvarint( @"hash_f8168febda35ecc7" ) != 0 )
            {
                thread function_daa34434b1f85095();
            }
            else if ( getdvarint( @"hash_c70eda82dc2d8ce0" ) != 0 )
            {
                thread function_a0067dff1df866ca();
            }
            else if ( getdvarint( @"hash_76509eeacc4eb3b" ) != 0 )
            {
                thread function_6aeecf11ea7f6981();
            }
            else if ( getdvarint( @"hash_77131639c7958348" ) != 0 )
            {
                thread function_29eb5f1263c8fb82();
            }
            else if ( getdvarint( @"hash_d58b0fd6e8a9a1e2" ) != 0 )
            {
                function_5b1cb8baef2fdc56();
            }
            else if ( getdvarint( @"hash_62458b790daf2c44" ) != 0 )
            {
                function_ff1ea3e0d41c1878();
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe566
    // Size: 0x37a, Type: dev
    function function_74738c3819abb360()
    {
        entries = [];
        attachments = getnonopticattachmentlistbasenames();
        optics = getopticattachmentlistbasenames();
        
        foreach ( a in attachments )
        {
            entries[ entries.size ] = "<dev string:x154d>" + a + "<dev string:x1579>" + tolower( a ) + "<dev string:x3ef>";
        }
        
        foreach ( optic in optics )
        {
            entries[ entries.size ] = "<dev string:x1597>" + optic + "<dev string:x1579>" + tolower( optic ) + "<dev string:x3ef>";
        }
        
        weapons = [];
        weaponsscriptbundle = scripts\cp_mp\weapon::function_a221d76594ef4e8b();
        
        if ( isdefined( weaponsscriptbundle ) )
        {
            foreach ( weaponname in weaponsscriptbundle )
            {
                weaponscriptbundle = scripts\cp_mp\weapon::function_8477d8595e0364a7( weaponname, [ #"menuclass", #"ref" ] );
                
                if ( isdefined( weaponscriptbundle ) )
                {
                    weapclass = weaponscriptbundle.menuclass;
                    
                    if ( weapclass == "<dev string:xca>" )
                    {
                        continue;
                    }
                    
                    if ( !issubstr( weapclass, "<dev string:x665>" ) )
                    {
                        continue;
                    }
                    
                    if ( weapclass == "<dev string:x15be>" || weapclass == "<dev string:x15ce>" || weapclass == "<dev string:x15e0>" )
                    {
                        continue;
                    }
                    
                    weapclass = getsubstr( weapclass, 7 );
                    weap = weaponscriptbundle.ref;
                    project = "<dev string:x15f4>";
                    
                    if ( string_starts_with( weap, "<dev string:x15fd>" ) )
                    {
                        project = "<dev string:x1604>";
                    }
                    
                    tokens = strtok( weap, "<dev string:x160d>" );
                    idx = 0;
                    
                    if ( tokens.size > 0 )
                    {
                        idx = 1;
                    }
                    
                    weapmid = tokens[ idx ];
                    
                    if ( tokens.size > 2 )
                    {
                        weapmid = tokens[ idx ] + "<dev string:x160d>" + tokens[ idx + 1 ];
                    }
                    
                    if ( weap.size < 3 || getsubstr( weap, weap.size - 3 ) != "<dev string:x1612>" )
                    {
                        weap += "<dev string:x1612>";
                    }
                    
                    path = "<dev string:x1619>" + project + "<dev string:x1634>" + weapclass + "<dev string:x1634>" + weapmid;
                    entries[ entries.size ] = path + "<dev string:x1639>" + tolower( weap ) + "<dev string:x3ef>";
                }
            }
        }
        
        println( "<dev string:x1653>" );
        
        foreach ( e in entries )
        {
            if ( e != "<dev string:xca>" )
            {
                println( e );
            }
        }
        
        println( "<dev string:x1696>" );
        iprintlnbold( "<dev string:x16bc>" );
        setdevdvar( @"hash_be4638b34423d0ca", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe8e8
    // Size: 0x11d, Type: dev
    function function_1c7d46262629d29d()
    {
        val = getdvar( @"hash_be7522650406f34f" );
        
        if ( isdefined( val ) )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                if ( getdvar( @"hash_772ed98b83015ac9" ) == "<dev string:x1f8>" )
                {
                    setdevdvar( @"hash_772ed98b83015ac9", 1 );
                    setdevdvar( @"hash_48a5711c3d32ab43", 0 );
                    player giveperk( "<dev string:x16e7>" );
                    iprintlnbold( "<dev string:x1700>" );
                    continue;
                }
                
                setdevdvar( @"hash_772ed98b83015ac9", 0 );
                setdevdvar( @"hash_48a5711c3d32ab43", 0.75 );
                player removeperk( "<dev string:x16e7>" );
                iprintlnbold( "<dev string:x1719>" );
            }
        }
        
        setdevdvar( @"hash_be7522650406f34f", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xea0d
    // Size: 0xde, Type: dev
    function function_ce3fb44e346e757a()
    {
        val = getdvar( @"hash_87fd1aab915574c0" );
        
        if ( isdefined( val ) )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                if ( !isdefined( level.var_ce3fb44e346e757a ) )
                {
                    level.var_ce3fb44e346e757a = 1;
                    player setrecoilscale( 0, 100 );
                    iprintlnbold( "<dev string:x1733>" );
                    continue;
                }
                
                level.var_ce3fb44e346e757a = undefined;
                player setrecoilscale( 0, 0 );
                iprintlnbold( "<dev string:x1741>" );
            }
        }
        
        setdevdvar( @"hash_87fd1aab915574c0", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xeaf3
    // Size: 0xa7, Type: dev
    function function_6b13277c62c054f6()
    {
        val = getdvar( @"hash_3debe2571172850" );
        
        if ( isdefined( val ) )
        {
            intval = int( val );
            
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                player setrecoilscale( intval );
            }
        }
        
        setdevdvar( @"hash_3debe2571172850", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xeba2
    // Size: 0xca, Type: dev
    function function_b3bb97f140498db5()
    {
        val = getdvar( @"hash_8fcbab7f56dcce7" );
        
        if ( isdefined( val ) )
        {
            foreach ( player in level.players )
            {
                if ( !player _hasperk( val ) )
                {
                    player giveperk( val );
                    player iprintlnbold( "<dev string:x174e>" + val + "<dev string:x1758>" );
                    continue;
                }
                
                player removeperk( val );
                player iprintlnbold( "<dev string:x174e>" + val + "<dev string:x1763>" );
            }
        }
        
        setdevdvar( @"hash_8fcbab7f56dcce7", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xec74
    // Size: 0x54, Type: dev
    function function_b39eda08d7912835()
    {
        if ( !isdefined( level.var_b39eda08d7912835 ) )
        {
            iprintlnbold( "<dev string:x1770>" );
            level.var_b39eda08d7912835 = 1;
        }
        else
        {
            iprintlnbold( "<dev string:x178b>" );
            level.var_b39eda08d7912835 = undefined;
        }
        
        setdevdvar( @"hash_b679b1eead8733a3", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xecd0
    // Size: 0xef, Type: dev
    function dbgbullets()
    {
        val = "<dev string:xa31>";
        type = undefined;
        
        if ( getdvarint( @"hash_61f1432615a0514b" ) == 1 )
        {
            val = "<dev string:x17a7>";
            type = "<dev string:x17c9>";
        }
        else if ( getdvarint( @"hash_61f1432615a0514b" ) == 2 )
        {
            val = "<dev string:x17dd>";
            type = "<dev string:x7f6>";
        }
        else
        {
            assertmsg( "<dev string:x17eb>" + getdvar( @"hash_61f1432615a0514b" ) );
            return;
        }
        
        if ( getdvar( @"g_debugbullets" ) == val )
        {
            iprintlnbold( "<dev string:x1814>" );
            setdevdvar( @"g_debugbullets", "<dev string:xa31>" );
        }
        else
        {
            iprintlnbold( "<dev string:x182a>" + type );
            setdevdvar( @"g_debugbullets", val );
        }
        
        setdevdvar( @"hash_61f1432615a0514b", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xedc7
    // Size: 0x71, Type: dev
    function function_6dfe999747a36cb2()
    {
        if ( getdvar( @"hash_937cc8707ed92860" ) == "<dev string:x183d>" )
        {
            iprintlnbold( "<dev string:x1844>" );
            setdevdvar( @"hash_937cc8707ed92860", "<dev string:x1f8>" );
        }
        else
        {
            iprintlnbold( "<dev string:x185c>" );
            setdevdvar( @"hash_937cc8707ed92860", "<dev string:x183d>" );
        }
        
        setdevdvar( @"hash_ae04ade2c8e72fdc", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xee40
    // Size: 0x1d1, Type: dev
    function gui_giveweapon()
    {
        var_b23392514364503b = getdvar( @"scr_giveweapon" );
        variant = -1;
        toks = strtok( var_b23392514364503b, "<dev string:x1873>" );
        
        if ( toks.size > 1 )
        {
            var_b23392514364503b = toks[ 0 ];
            variant = int( toks[ 1 ] );
        }
        
        if ( isdefined( var_b23392514364503b ) )
        {
            weapnew = getweaponrootname( var_b23392514364503b );
            
            if ( !function_89497fa763d431c0( weapnew ) )
            {
                level.weaponmapdata[ weapnew ] = spawnstruct();
                level.weaponmapdata[ weapnew ].assetname = var_b23392514364503b;
                level.weaponmapdata[ weapnew ].group = "<dev string:x1878>";
            }
            
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                hasnvg = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = scripts\cp_mp\weapon::buildweapon_blueprint( weapnew, undefined, undefined, variant, undefined, undefined, hasnvg );
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player scripts\mp\weapons::dropweaponfordeath( undefined, "<dev string:xca>" );
                player.droppeddeathweapon = undefined;
                
                if ( player hasweapon( var_c88b10f789adf8eb ) )
                {
                    player _takeweapon( var_c88b10f789adf8eb );
                }
                
                if ( isbot( player ) )
                {
                    player botsetflag( "<dev string:x188a>", 0 );
                }
                
                player giveweapon( var_c88b10f789adf8eb );
                player _switchtoweaponimmediate( var_c88b10f789adf8eb );
                scripts\cp_mp\weapon::fixupplayerweapons( player, weapnew );
            }
        }
        
        setdevdvar( @"scr_giveweapon", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf019
    // Size: 0x3a, Type: dev
    function function_72e55f6d23ab9c08()
    {
        if ( isdefined( level.blockweapondrops ) )
        {
            level.blockweapondrops = undefined;
        }
        else
        {
            level.blockweapondrops = 1;
        }
        
        setdevdvar( @"hash_4aa285a21e3a2ebe", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf05b
    // Size: 0x202, Type: dev
    function gui_spawnweapon()
    {
        weapnew = getdvar( @"scr_spawnweapon" );
        variant = -1;
        toks = strtok( weapnew, "<dev string:x1873>" );
        
        if ( toks.size > 1 )
        {
            weapnew = toks[ 0 ];
            variant = int( toks[ 1 ] );
        }
        
        if ( isdefined( weapnew ) )
        {
            weapnew = getweaponrootname( weapnew );
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                hasnvg = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = scripts\cp_mp\weapon::buildweapon_blueprint( weapnew, undefined, undefined, variant, undefined, undefined, hasnvg );
                startpos = player.origin;
                dir = anglestoforward( player.angles );
                offset = 50;
                voffset = ( 0, 0, 45 );
                name = getcompleteweaponname( var_c88b10f789adf8eb );
                weapon = spawn( "<dev string:x665>" + name, startpos + offset * dir + voffset, 17 );
                weapon itemweaponsetammo( weaponclipsize( var_c88b10f789adf8eb ), weaponmaxammo( var_c88b10f789adf8eb ) );
                weapon makeusable();
                weapon sethintdisplayrange( 96 );
                weapon setuserange( 96 );
                centerofmass = weapon physics_getentitycenterofmass();
                
                if ( isdefined( centerofmass ) )
                {
                    centerofmass = centerofmass[ "<dev string:x18a2>" ];
                }
                else
                {
                    centerofmass = weapon.origin;
                }
                
                launchforce = dir * 1000 + ( 0, 0, 500 );
                weapon physicslaunchserveritem( centerofmass, launchforce );
            }
        }
        
        setdevdvar( @"scr_spawnweapon", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf265
    // Size: 0x5d, Type: dev
    function function_d6a83cf324a42777()
    {
        tuning = float( getdvar( @"hash_6f67d3ada4d28ec5" ) );
        intvalue = function_f3c863dd3265167( tuning );
        iprintln( "<dev string:x18ae>" + tuning + "<dev string:x18be>" + intvalue );
        setdevdvar( @"hash_6f67d3ada4d28ec5", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf2ca
    // Size: 0x198, Type: dev
    function function_5bec6fc6eda8f898()
    {
        scripts\cp_mp\equipment::loadequipmentbundles();
        variantid = 0;
        blueprintname = getdvar( @"hash_b1941ef83f118a4e" );
        equipment = scripts\cp_mp\equipment::function_f4f687e4e1edb923( blueprintname );
        var_2c513776ced53b01 = undefined;
        slot = undefined;
        
        if ( isdefined( level.equipment.table[ equipment ] ) )
        {
            var_2c513776ced53b01 = level.equipment.table[ equipment ].weaponname;
            slot = level.equipment.table[ equipment ].defaultslot;
        }
        
        equipblueprint = function_40fd49171fad19d3( blueprintname );
        
        if ( isdefined( var_2c513776ced53b01 ) )
        {
            equipvariants = getweaponblueprintnames( var_2c513776ced53b01 );
            
            foreach ( variant, id in equipvariants )
            {
                if ( equipblueprint == variant )
                {
                    foreach ( player in level.players )
                    {
                        player scripts\cp_mp\equipment::giveequipment( equipment, slot, undefined, id );
                    }
                    
                    break;
                }
            }
        }
        
        setdevdvar( @"hash_b1941ef83f118a4e", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf46a
    // Size: 0x164, Type: dev
    function function_9304864c4018f425()
    {
        variant = getdvarint( @"hash_9bf239cb990aca4b" );
        
        if ( isdefined( variant ) )
        {
            curweapon = level.players[ 0 ] getcurrentweapon();
            weapnew = getweaponrootname( curweapon );
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                hasnvg = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
                var_c88b10f789adf8eb = scripts\cp_mp\weapon::buildweapon_blueprint( weapnew, undefined, undefined, variant, undefined, undefined, hasnvg );
                currentweapon = player.currentweapon;
                player.droppeddeathweapon = undefined;
                player scripts\mp\weapons::dropweaponfordeath( undefined, "<dev string:xca>" );
                player.droppeddeathweapon = undefined;
                
                if ( player hasweapon( var_c88b10f789adf8eb ) )
                {
                    player _takeweapon( var_c88b10f789adf8eb );
                }
                
                player giveweapon( var_c88b10f789adf8eb );
                player setweaponammoclip( var_c88b10f789adf8eb, weaponclipsize( var_c88b10f789adf8eb ) );
                player setweaponammostock( var_c88b10f789adf8eb, weaponmaxammo( var_c88b10f789adf8eb ) );
                player _switchtoweaponimmediate( var_c88b10f789adf8eb );
                scripts\cp_mp\weapon::fixupplayerweapons( player, weapnew );
            }
        }
        
        setdevdvar( @"hash_9bf239cb990aca4b", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf5d6
    // Size: 0xdf, Type: dev
    function function_51be8168158324f7()
    {
        weapnew = getdvar( @"hash_5f48bb8808b7e209" );
        
        if ( isdefined( weapnew ) )
        {
            foreach ( player in level.players )
            {
                currentweapon = player.currentweapon;
                player dropitem( currentweapon );
                
                if ( player hasweapon( weapnew ) )
                {
                    player _takeweapon( weapnew );
                }
                
                player giveweapon( weapnew );
                player setweaponammoclip( weapnew, weaponclipsize( weapnew ) );
                player setweaponammostock( weapnew, weaponmaxammo( weapnew ) );
                player _switchtoweaponimmediate( weapnew );
            }
        }
        
        setdevdvar( @"hash_5f48bb8808b7e209", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf6bd
    // Size: 0xa4, Type: dev
    function function_74438b2c9e6463()
    {
        var_607e557985cff3dd = getdvar( @"hash_2e71bdd72d9c9509" );
        charm = "<dev string:x18cd>" + var_607e557985cff3dd;
        
        if ( isdefined( charm ) )
        {
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                gui_giveattachment_internal( player, charm );
            }
        }
        
        setdevdvar( @"hash_2e71bdd72d9c9509", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf769
    // Size: 0x93, Type: dev
    function gui_giveattachment()
    {
        var_effb4ae1788a8b10 = getdvar( @"hash_c87017f600b49447" );
        
        if ( isdefined( var_effb4ae1788a8b10 ) )
        {
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                gui_giveattachment_internal( player, var_effb4ae1788a8b10 );
            }
        }
        
        setdevdvar( @"hash_c87017f600b49447", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xf804
    // Size: 0xa2, Type: dev
    function gui_giveattachment_internal( player, var_effb4ae1788a8b10 )
    {
        currentweapon = player.currentweapon;
        player dropitem( currentweapon );
        newweapon = scripts\mp\weapons::addattachmenttoweapon( currentweapon, var_effb4ae1788a8b10 );
        
        if ( !isdefined( newweapon ) )
        {
            player giveweapon( currentweapon );
            
            if ( !isbot( player ) )
            {
                player iprintlnbold( "<dev string:x18d9>" + var_effb4ae1788a8b10 );
            }
            
            return;
        }
        
        player giveweapon( newweapon );
        player setweaponammoclip( newweapon, weaponclipsize( newweapon ) );
        player setweaponammostock( newweapon, weaponmaxammo( newweapon ) );
        player _switchtoweaponimmediate( newweapon );
        scripts\cp_mp\weapon::fixupplayerweapons( player, newweapon );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf8ae
    // Size: 0x331, Type: dev
    function function_377f1acfb3774426()
    {
        dvarstring = getdvar( @"hash_912105285f3af273" );
        setdevdvar( @"hash_912105285f3af273", "<dev string:xca>" );
        categoryindex = int( getsubstr( dvarstring, 0, 1 ) );
        modelindex = int( getsubstr( dvarstring, 1, 3 ) );
        player = level.players[ 0 ];
        oldweapon = player.currentweapon;
        newweapon = oldweapon;
        
        if ( categoryindex == 0 )
        {
            iprintlnbold( "<dev string:x190e>" + modelindex );
            
            if ( !isdefined( newweapon.receiver ) )
            {
                iprintln( "<dev string:x191b>" );
                return;
            }
            
            attachmentname = newweapon.receiver;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 1 )
        {
            iprintlnbold( "<dev string:x1948>" + modelindex );
            
            if ( !isdefined( newweapon.frontpiece ) )
            {
                iprintln( "<dev string:x1957>" );
                return;
            }
            
            attachmentname = newweapon.frontpiece;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 2 )
        {
            iprintlnbold( "<dev string:x1986>" + modelindex );
            
            if ( !isdefined( newweapon.backpiece ) )
            {
                iprintln( "<dev string:x1994>" );
                return;
            }
            
            attachmentname = newweapon.backpiece;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 3 )
        {
            iprintlnbold( "<dev string:x19c2>" + modelindex );
            
            if ( !isdefined( newweapon.magazine ) )
            {
                iprintln( "<dev string:x19cf>" );
                return;
            }
            
            attachmentname = newweapon.magazine;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 4 )
        {
            iprintlnbold( "<dev string:x19fc>" + modelindex );
            
            if ( !isdefined( newweapon.scope ) )
            {
                iprintln( "<dev string:x1a06>" );
                return;
            }
            
            attachmentname = newweapon.scope;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 5 )
        {
            iprintlnbold( "<dev string:x1a30>" + modelindex );
            
            if ( !isdefined( newweapon.underbarrel ) )
            {
                iprintln( "<dev string:x1a40>" );
                return;
            }
            
            attachmentname = newweapon.underbarrel;
            newweapon = newweapon withoutattachment( attachmentname );
            newweapon = newweapon withattachment( attachmentname, modelindex );
        }
        else if ( categoryindex == 6 )
        {
            iprintlnbold( "<dev string:x1a70>" + modelindex );
            
            if ( !isdefined( newweapon.others ) || newweapon.others.size < 1 )
            {
                iprintln( "<dev string:x1a7b>" );
                return;
            }
            
            attachmentname = newweapon.others[ 0 ];
            newweapon = newweapon withoutotherattachment( attachmentname );
            newweapon = newweapon withotherattachment( attachmentname, modelindex );
        }
        
        player dropitem( oldweapon );
        player giveweapon( newweapon );
        player setweaponammoclip( newweapon, weaponclipsize( newweapon ) );
        player setweaponammostock( newweapon, weaponmaxammo( newweapon ) );
        player _switchtoweaponimmediate( newweapon );
        scripts\cp_mp\weapon::fixupplayerweapons( player, newweapon );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfbe7
    // Size: 0x21d, Type: dev
    function function_1da70102eeb10c0b()
    {
        dvarstring = getdvar( @"hash_5e62b8f4b2dd7d6e" );
        args = strtok( dvarstring, "<dev string:x1aa5>" );
        setdevdvar( @"hash_5e62b8f4b2dd7d6e", "<dev string:xca>" );
        attachmentname = args[ 0 ];
        modelindex = int( args[ 1 ] );
        player = level.players[ 0 ];
        oldweapon = player.currentweapon;
        newweapon = oldweapon;
        attachmenttoidmap = newweapon.attachmentvarindices;
        failed = 0;
        attachments = [];
        
        foreach ( attachment, id in attachmenttoidmap )
        {
            attachments[ attachments.size ] = attachment;
        }
        
        if ( !newweapon canuseattachment( attachmentname ) )
        {
            failed = 1;
        }
        
        if ( failed )
        {
            return undefined;
        }
        
        var_7809ad191e44fe6a = [];
        
        foreach ( idx, attachment in attachments )
        {
            var_7809ad191e44fe6a[ idx ] = attachmenttoidmap[ attachment ];
        }
        
        attachments[ attachments.size ] = attachmentname;
        var_7809ad191e44fe6a[ var_7809ad191e44fe6a.size ] = 0;
        attachments = scripts\cp_mp\weapon::weaponattachremoveextraattachments( attachments );
        newweapon = scripts\cp_mp\weapon::buildweapon( getweaponrootname( newweapon ), attachments, undefined, "<dev string:xf0>", undefined, var_7809ad191e44fe6a, undefined, undefined, undefined );
        newweapon = newweapon withattachment( attachmentname, modelindex );
        iprintlnbold( "<dev string:x1aaa>" + attachmentname + "<dev string:x1ac0>" + modelindex );
        player dropitem( oldweapon );
        player giveweapon( newweapon );
        player setweaponammoclip( newweapon, weaponclipsize( newweapon ) );
        player setweaponammostock( newweapon, weaponmaxammo( newweapon ) );
        player _switchtoweaponimmediate( newweapon );
        scripts\cp_mp\weapon::fixupplayerweapons( player, newweapon );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xfe0c
    // Size: 0x180, Type: dev
    function function_72bdcbf68a00d590()
    {
        camo = getdvar( @"hash_94cfa401914bb582" );
        
        if ( isdefined( camo ) && camo != "<dev string:xca>" )
        {
            camolist = [];
            camoref = "<dev string:xca>";
            camoindex = int( camo );
            
            if ( camoindex != 0 )
            {
                for (rowindex = 0; tablelookupbyrow( "<dev string:x1add>", rowindex, 1 ) != "<dev string:xca>"; rowindex++) {
                    camolist[ camolist.size ] = tablelookupbyrow( "<dev string:x1add>", rowindex, 1 );
                }
                
                if ( camoindex < camolist.size )
                {
                    camoref = camolist[ camoindex ];
                }
            }
            else
            {
                camoref = camo;
            }
            
            foreach ( player in level.players )
            {
                weapon = player.currentweapon;
                player dropitem( weapon );
                weapon = weapon getnoaltweapon();
                
                if ( camoref != "<dev string:xca>" )
                {
                    weapon = weapon withcamo( camoref );
                }
                else
                {
                    weapon = weapon withoutcamo();
                }
                
                player giveweapon( weapon );
                player setweaponammoclip( weapon, weaponclipsize( weapon ) );
                player setweaponammostock( weapon, weaponmaxammo( weapon ) );
                player _switchtoweaponimmediate( weapon );
            }
        }
        
        setdevdvar( @"hash_94cfa401914bb582", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xff94
    // Size: 0xf8, Type: dev
    function function_cc74ebbb668e7700()
    {
        ret = getdvar( @"hash_cd022e5b7a0889e" );
        
        if ( isdefined( ret ) && ret != "<dev string:xca>" )
        {
            reticleid = int( ret );
            
            foreach ( player in level.players )
            {
                weapon = player.currentweapon;
                player dropitem( weapon );
                weapon = weapon getnoaltweapon();
                weapon = weapon withreticle( reticleid );
                player giveweapon( weapon );
                player setweaponammoclip( weapon, weaponclipsize( weapon ) );
                player setweaponammostock( weapon, weaponmaxammo( weapon ) );
                player _switchtoweaponimmediate( weapon );
            }
        }
        
        setdevdvar( @"hash_cd022e5b7a0889e", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10094
    // Size: 0xaf, Type: dev
    function function_82525648d7c500ed()
    {
        slot = getdvarint( @"hash_28e2b3251abc4817" );
        setdevdvar( @"hash_28e2b3251abc4817", "<dev string:xca>" );
        player = level.players[ 0 ];
        currentweapon = player.currentweapon;
        newweapon = currentweapon clearsticker( slot - 1 );
        player dropitem( currentweapon );
        player giveweapon( newweapon );
        player setweaponammoclip( newweapon, weaponclipsize( newweapon ) );
        player setweaponammostock( newweapon, weaponmaxammo( newweapon ) );
        player _switchtoweaponimmediate( newweapon );
        scripts\cp_mp\weapon::fixupplayerweapons( player, newweapon );
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1014b
    // Size: 0x94, Type: dev
    function function_8555679b81ea1cbe( slotindex, material )
    {
        player = level.players[ 0 ];
        currentweapon = player.currentweapon;
        newweapon = currentweapon setsticker( slotindex, material );
        player dropitem( currentweapon );
        player giveweapon( newweapon );
        player setweaponammoclip( newweapon, weaponclipsize( newweapon ) );
        player setweaponammostock( newweapon, weaponmaxammo( newweapon ) );
        player _switchtoweaponimmediate( newweapon );
        scripts\cp_mp\weapon::fixupplayerweapons( player, newweapon );
        return newweapon;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x101e7
    // Size: 0x62, Type: dev
    function function_24ef69feb5dcce7d()
    {
        material = getdvar( @"hash_8de4ac9450b61777" );
        setdevdvar( @"hash_8de4ac9450b61777", "<dev string:xca>" );
        newweapon = function_8555679b81ea1cbe( 0, material );
        iprintlnbold( "<dev string:x1af1>" + newweapon.stickerslot0 + "<dev string:x1b18>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10251
    // Size: 0x63, Type: dev
    function function_24ef66feb5dcc7e4()
    {
        material = getdvar( @"hash_8de4ad9450b619aa" );
        setdevdvar( @"hash_8de4ad9450b619aa", "<dev string:xca>" );
        newweapon = function_8555679b81ea1cbe( 1, material );
        iprintlnbold( "<dev string:x1b1d>" + newweapon.stickerslot1 + "<dev string:x1b18>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x102bc
    // Size: 0x63, Type: dev
    function function_24ef67feb5dcca17()
    {
        material = getdvar( @"hash_8de4ae9450b61bdd" );
        setdevdvar( @"hash_8de4ae9450b61bdd", "<dev string:xca>" );
        newweapon = function_8555679b81ea1cbe( 2, material );
        iprintlnbold( "<dev string:x1b44>" + newweapon.stickerslot2 + "<dev string:x1b18>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10327
    // Size: 0x63, Type: dev
    function function_24ef64feb5dcc37e()
    {
        material = getdvar( @"hash_8de4a79450b60c78" );
        setdevdvar( @"hash_8de4a79450b60c78", "<dev string:xca>" );
        newweapon = function_8555679b81ea1cbe( 3, material );
        iprintlnbold( "<dev string:x1b6b>" + newweapon.stickerslot3 + "<dev string:x1b18>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10392
    // Size: 0x63, Type: dev
    function function_24ef65feb5dcc5b1()
    {
        material = getdvar( @"hash_8de4a89450b60eab" );
        setdevdvar( @"hash_8de4a89450b60eab", "<dev string:xca>" );
        newweapon = function_8555679b81ea1cbe( 4, material );
        iprintlnbold( "<dev string:x1b92>" + newweapon.var_b39ac546cc8621f8 + "<dev string:x1b18>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x103fd
    // Size: 0x6f, Type: dev
    function function_e1c83dde130fe5c7()
    {
        setdevdvar( @"hash_bb5083a30a232081", 0 );
        
        foreach ( index, player in level.players )
        {
            player iprintlnbold( "<dev string:x1bb9>" + index );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10474
    // Size: 0x30a, Type: dev
    function function_5d6535026d8a0ba8()
    {
        reactive = getdvar( @"hash_36dc6dae079401af" );
        var_1cbb266d488421af = getdvarint( @"hash_78ad5df9c4da0fdf" );
        setdevdvar( @"hash_36dc6dae079401af", "<dev string:xca>" );
        
        if ( isdefined( level.var_c7f5010f9a7d007f ) && level.var_c7f5010f9a7d007f )
        {
            return;
        }
        
        if ( var_1cbb266d488421af == 3 )
        {
            targetindex = getdvarint( @"hash_63cee9da5e3dc5c", 0 );
            
            if ( !isdefined( level.players[ targetindex ] ) )
            {
                return;
            }
            
            targetplayer = level.players[ targetindex ];
        }
        else
        {
            foreach ( player in level.players )
            {
                if ( player ishost() )
                {
                    level.hostplayer = player;
                }
            }
            
            assertex( isdefined( level.hostplayer ), "<dev string:x1bcb>" );
            targetplayer = level.hostplayer;
            
            switch ( var_1cbb266d488421af )
            {
                case 0:
                    break;
                case 1:
                case 2:
                    mindist = 0;
                    
                    if ( level.players.size > 1 )
                    {
                        foreach ( player in level.players )
                        {
                            if ( player == level.hostplayer )
                            {
                                continue;
                            }
                            
                            dist = distancesquared( player.origin, level.hostplayer.origin );
                            
                            if ( mindist == 0 )
                            {
                                mindist = dist;
                                targetplayer = player;
                                continue;
                            }
                            
                            if ( mindist > dist )
                            {
                                mindist = dist;
                                targetplayer = player;
                            }
                        }
                    }
                    else
                    {
                        setdevdvar( @"hash_169df099a285d3e6", 1 );
                        setdevdvar( @"bot_notarget", 1 );
                        setdevdvar( @"hash_12d23346fbacee91", 1 );
                        setdvar( @"hash_2d5236cbe9894aff", 1 );
                        level.var_c7f5010f9a7d007f = 1;
                        level waittill( "<dev string:xdc4>", targetplayer );
                        level.var_c7f5010f9a7d007f = 0;
                    }
                    
                    break;
            }
            
            if ( var_1cbb266d488421af == 2 )
            {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward( targetangles );
                warporigin = level.hostplayer.origin + forward * 100;
                targetplayer setorigin( getclosestpointonnavmesh( warporigin ) );
                targetplayer setplayerangles( targetangles + ( 0, 180, 0 ) );
            }
        }
        
        function_a64aaa2a58a91089( targetplayer, reactive );
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x10786
    // Size: 0x87, Type: dev
    function function_a64aaa2a58a91089( player, reactive )
    {
        player _setsuit( player.operatorcustomization.suit );
        player.operatorcustomization.var_3291e2cbec055766 = reactive;
        player function_602b3de054f2a81( player.operatorcustomization.var_3291e2cbec055766 );
        println( "<dev string:x1c0b>" + player.operatorcustomization.var_3291e2cbec055766 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10815
    // Size: 0xe2, Type: dev
    function function_96c18d9ffd1d401a()
    {
        parachute = getdvar( @"hash_1613e9061d43f96f" );
        setdevdvar( @"hash_1613e9061d43f96f", "<dev string:xca>" );
        player = undefined;
        
        foreach ( player in level.players )
        {
            if ( player ishost() )
            {
                level.hostplayer = player;
                break;
            }
        }
        
        player function_9cd675a7411b6362( "<dev string:xca>" );
        player function_9cd675a7411b6362( parachute );
        player.operatorcustomization.parachute = parachute;
        println( "<dev string:x1c26>" + player.operatorcustomization.parachute );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x108ff
    // Size: 0xce, Type: dev
    function function_b07cec8c9e70afe3()
    {
        contrail = getdvar( @"hash_1f832fa9bd6fab3c" );
        setdevdvar( @"hash_1f832fa9bd6fab3c", "<dev string:xca>" );
        player = undefined;
        
        foreach ( player in level.players )
        {
            if ( player ishost() )
            {
                level.hostplayer = player;
                break;
            }
        }
        
        player.operatorcustomization.brinfilsmokesuffix = contrail;
        println( "<dev string:x1c42>" + player.operatorcustomization.brinfilsmokesuffix );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x109d5
    // Size: 0x30a, Type: dev
    function function_af63b6f9d83af7fe()
    {
        skin = getdvar( @"hash_435b27b2358cbe5" );
        var_1cbb266d488421af = getdvarint( @"hash_78ad5df9c4da0fdf" );
        setdevdvar( @"hash_435b27b2358cbe5", "<dev string:xca>" );
        
        if ( isdefined( level.var_c7f5010f9a7d007f ) && level.var_c7f5010f9a7d007f )
        {
            return;
        }
        
        if ( var_1cbb266d488421af == 3 )
        {
            targetindex = getdvarint( @"hash_63cee9da5e3dc5c", 0 );
            
            if ( !isdefined( level.players[ targetindex ] ) )
            {
                return;
            }
            
            targetplayer = level.players[ targetindex ];
        }
        else
        {
            foreach ( player in level.players )
            {
                if ( player ishost() )
                {
                    level.hostplayer = player;
                }
            }
            
            assertex( isdefined( level.hostplayer ), "<dev string:x1bcb>" );
            targetplayer = level.hostplayer;
            
            switch ( var_1cbb266d488421af )
            {
                case 0:
                    break;
                case 1:
                case 2:
                    mindist = 0;
                    
                    if ( level.players.size > 1 )
                    {
                        foreach ( player in level.players )
                        {
                            if ( player == level.hostplayer )
                            {
                                continue;
                            }
                            
                            dist = distancesquared( player.origin, level.hostplayer.origin );
                            
                            if ( mindist == 0 )
                            {
                                mindist = dist;
                                targetplayer = player;
                                continue;
                            }
                            
                            if ( mindist > dist )
                            {
                                mindist = dist;
                                targetplayer = player;
                            }
                        }
                    }
                    else
                    {
                        setdevdvar( @"hash_169df099a285d3e6", 1 );
                        setdevdvar( @"bot_notarget", 1 );
                        setdevdvar( @"hash_12d23346fbacee91", 1 );
                        setdvar( @"hash_2d5236cbe9894aff", 1 );
                        level.var_c7f5010f9a7d007f = 1;
                        level waittill( "<dev string:xdc4>", targetplayer );
                        level.var_c7f5010f9a7d007f = 0;
                    }
                    
                    break;
            }
            
            if ( var_1cbb266d488421af == 2 )
            {
                targetangles = level.hostplayer getplayerangles();
                forward = anglestoforward( targetangles );
                warporigin = level.hostplayer.origin + forward * 100;
                targetplayer setorigin( getclosestpointonnavmesh( warporigin ) );
                targetplayer setplayerangles( targetangles + ( 0, 180, 0 ) );
            }
        }
        
        function_c24ed5c1c6a1f2d3( targetplayer, skin );
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x10ce7
    // Size: 0x69f, Type: dev
    function function_c24ed5c1c6a1f2d3( player, skin )
    {
        assertex( skin != "<dev string:xc5>" && int( skin ) == 0, "<dev string:x1c5d>" );
        player.operatorcustomization.skinref = skin;
        body = scripts\cp_mp\operator::function_8eba78e65f4be793( skin );
        head = scripts\cp_mp\operator::function_223061772e2a61b9( skin );
        operator = scripts\cp_mp\operator::function_605079124463a67b( skin );
        suit = scripts\mp\teams::function_ada9a2308a4046e2( operator );
        player.operatorcustomization.suit = suit;
        gender = scripts\mp\teams::getoperatorgender( operator );
        clothtype = scripts\cp_mp\operator::function_32d5918a7844bd9a( skin );
        geartype = scripts\cp_mp\operator::function_112bf281c4f02cd5( skin );
        
        if ( body == "<dev string:xca>" || head == "<dev string:xca>" )
        {
            return;
        }
        
        viewmodelname = scripts\mp\teams::getplayerviewmodelfrombody( body );
        player setcustomization( body, head );
        bodymodelname = player getcustomizationbody();
        headmodelname = player getcustomizationhead();
        viewmodelname = player getcustomizationviewmodel();
        player _setsuit( player.operatorcustomization.suit );
        var_8f23fe410ad2500e = scripts\cp_mp\operator::function_2dc6ef8b84dfec64( skin );
        
        if ( isdefined( var_8f23fe410ad2500e ) )
        {
            player.operatorcustomization.var_3291e2cbec055766 = var_8f23fe410ad2500e;
            player function_602b3de054f2a81( player.operatorcustomization.var_3291e2cbec055766 );
        }
        
        player scripts\mp\teams::setcharactermodels( bodymodelname, headmodelname, viewmodelname );
        player notify( "<dev string:x1c98>" );
        
        if ( isdefined( gender ) && gender == "<dev string:x1ca8>" )
        {
            player function_555e2d32e2756625( "<dev string:x1ca8>" );
            player.operatorcustomization.gender = "<dev string:x1ca8>";
        }
        else
        {
            player function_555e2d32e2756625( "<dev string:xca>" );
            player.operatorcustomization.gender = "<dev string:x1cb2>";
        }
        
        if ( isdefined( player.operatorcustomization.skinref ) && player.operatorcustomization.skinref == "<dev string:x1cba>" )
        {
            player setentitysoundcontext( "<dev string:x1cd4>", "<dev string:x1cde>" );
            player.operatorcustomization.gender = "<dev string:x1ca8>";
        }
        
        if ( isdefined( player.operatorcustomization.skinref ) && player.operatorcustomization.skinref == "<dev string:x1cf0>" )
        {
            player setentitysoundcontext( "<dev string:x1cd4>", "<dev string:x1d0c>" );
            player.operatorcustomization.gender = "<dev string:x1cb2>";
        }
        
        if ( isdefined( player.operatorcustomization.skinref ) && player.operatorcustomization.skinref == "<dev string:x1d1d>" )
        {
            player setentitysoundcontext( "<dev string:x1cd4>", "<dev string:x1d0c>" );
            player.operatorcustomization.gender = "<dev string:x1cb2>";
        }
        
        if ( isdefined( clothtype ) && clothtype != "<dev string:xca>" )
        {
            if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.clothtype ) && player.operatorcustomization.clothtype == clothtype )
            {
            }
            
            if ( !isdefined( player.operatorcustomization ) )
            {
                player.operatorcustomization = "<dev string:xca>";
            }
            
            if ( !isdefined( player.operatorcustomization.clothtype ) )
            {
                player.operatorcustomization.clothtype = "<dev string:xca>";
            }
            
            if ( isdefined( player.operatorcustomization.clothtype ) && player.operatorcustomization.clothtype != clothtype )
            {
                player.operatorcustomization.clothtype = clothtype;
                
                foreach ( player in level.players )
                {
                    player setclothtype( function_1823ff50bb28148d( clothtype ) );
                }
            }
        }
        else
        {
            foreach ( player in level.players )
            {
                player setclothtype( #"vestlight" );
            }
        }
        
        if ( isdefined( geartype ) && geartype != "<dev string:xca>" )
        {
            if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.geartype ) && player.operatorcustomization.geartype == geartype )
            {
            }
            
            if ( !isdefined( player.operatorcustomization ) )
            {
                player.operatorcustomization = "<dev string:xca>";
            }
            
            if ( !isdefined( player.operatorcustomization.geartype ) )
            {
                player.operatorcustomization.geartype = "<dev string:xca>";
            }
            
            if ( isdefined( player.operatorcustomization.geartype ) && player.operatorcustomization.geartype != geartype )
            {
                player.operatorcustomization.geartype = geartype;
                
                foreach ( player in level.players )
                {
                    player function_8abe5a968cc3c220( function_1823ff50bb28148d( geartype ) );
                }
            }
            
            return;
        }
        
        foreach ( player in level.players )
        {
            player function_8abe5a968cc3c220( #"millghtgr" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1138e
    // Size: 0x188, Type: dev
    function function_5a137678f1239061()
    {
        clothtype = getdvar( @"hash_f0f5f0919b0e534f" );
        setdevdvar( @"hash_f0f5f0919b0e534f", "<dev string:xca>" );
        player = level.player;
        
        if ( isdefined( clothtype ) && clothtype != "<dev string:xca>" )
        {
            if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.clothtype ) && player.operatorcustomization.clothtype == clothtype )
            {
            }
            
            if ( !isdefined( player.operatorcustomization ) )
            {
                player.operatorcustomization = "<dev string:xca>";
            }
            
            if ( !isdefined( player.operatorcustomization.clothtype ) )
            {
                player.operatorcustomization.clothtype = "<dev string:xca>";
            }
            
            if ( isdefined( player.operatorcustomization.clothtype ) && player.operatorcustomization.clothtype != clothtype )
            {
                player.operatorcustomization.clothtype = clothtype;
                
                foreach ( player in level.players )
                {
                    player setclothtype( function_1823ff50bb28148d( clothtype ) );
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1151e
    // Size: 0x188, Type: dev
    function function_c2b8b450a3cba9c0()
    {
        geartype = getdvar( @"hash_46a5925d26c9f0fa" );
        setdevdvar( @"hash_46a5925d26c9f0fa", "<dev string:xca>" );
        player = level.player;
        
        if ( isdefined( geartype ) && geartype != "<dev string:xca>" )
        {
            if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.geartype ) && player.operatorcustomization.geartype == geartype )
            {
            }
            
            if ( !isdefined( player.operatorcustomization ) )
            {
                player.operatorcustomization = "<dev string:xca>";
            }
            
            if ( !isdefined( player.operatorcustomization.geartype ) )
            {
                player.operatorcustomization.geartype = "<dev string:xca>";
            }
            
            if ( isdefined( player.operatorcustomization.geartype ) && player.operatorcustomization.geartype != geartype )
            {
                player.operatorcustomization.geartype = geartype;
                
                foreach ( player in level.players )
                {
                    player function_8abe5a968cc3c220( function_1823ff50bb28148d( geartype ) );
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x116ae
    // Size: 0x188, Type: dev
    function function_69716a0655c2632f()
    {
        bagtype = getdvar( @"hash_f2d4c68bdb99bb05" );
        setdevdvar( @"hash_f2d4c68bdb99bb05", "<dev string:xca>" );
        player = level.player;
        
        if ( isdefined( bagtype ) && bagtype != "<dev string:xca>" )
        {
            if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.bagtype ) && player.operatorcustomization.bagtype == bagtype )
            {
            }
            
            if ( !isdefined( player.operatorcustomization ) )
            {
                player.operatorcustomization = "<dev string:xca>";
            }
            
            if ( !isdefined( player.operatorcustomization.bagtype ) )
            {
                player.operatorcustomization.bagtype = "<dev string:xca>";
            }
            
            if ( isdefined( player.operatorcustomization.bagtype ) && player.operatorcustomization.bagtype != bagtype )
            {
                player.operatorcustomization.bagtype = bagtype;
                
                foreach ( player in level.players )
                {
                    player function_1863f51c1339d80f( function_1823ff50bb28148d( bagtype ) );
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1183e
    // Size: 0x1d, Type: dev
    function function_532fd73f8db5615b()
    {
        level notify( "<dev string:x1d35>" );
        setdevdvar( @"hash_efa2254b31f42841", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11863
    // Size: 0x1d, Type: dev
    function function_ebaa726e097207e2()
    {
        level notify( "<dev string:x1d40>" );
        setdevdvar( @"hash_ac65f9192e2efd0", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11888
    // Size: 0x1d, Type: dev
    function function_daa34434b1f85095()
    {
        level notify( "<dev string:x1d56>" );
        setdevdvar( @"hash_f8168febda35ecc7", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x118ad
    // Size: 0x1d, Type: dev
    function function_a0067dff1df866ca()
    {
        level notify( "<dev string:x1d68>" );
        setdevdvar( @"hash_c70eda82dc2d8ce0", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x118d2
    // Size: 0x21a, Type: dev
    function function_6aeecf11ea7f6981()
    {
        setdevdvar( @"hash_76509eeacc4eb3b", "<dev string:xca>" );
        var_220d1f05810ccfd7 = [];
        
        foreach ( root, struct in level.weaponmapdata )
        {
            assetname = weaponassetnamemap( root );
            obj = makeweapon( assetname );
            
            if ( !isprimaryweapon( obj ) )
            {
                continue;
            }
            
            group = getweapongroup( assetname );
            attachments = getallselectableattachments( assetname );
            
            if ( !isdefined( var_220d1f05810ccfd7[ group ] ) )
            {
                var_220d1f05810ccfd7[ group ] = [];
            }
            
            foreach ( a in attachments )
            {
                if ( !array_contains( var_220d1f05810ccfd7[ group ], a ) )
                {
                    var_220d1f05810ccfd7[ group ][ var_220d1f05810ccfd7[ group ].size ] = a;
                }
            }
        }
        
        foreach ( root, struct in level.weaponmapdata )
        {
            assetname = weaponassetnamemap( root );
            obj = makeweapon( assetname );
            
            if ( !isprimaryweapon( obj ) )
            {
                continue;
            }
            
            print( "<dev string:x1d86>" + assetname + "<dev string:x1dbc>" );
            group = getweapongroup( assetname );
            attachments = getallselectableattachments( assetname );
            
            foreach ( a in var_220d1f05810ccfd7[ group ] )
            {
                if ( !array_contains( attachments, a ) )
                {
                    print( "<dev string:x1dd6>" + a + "<dev string:x12ff>" );
                }
            }
            
            print( "<dev string:x1e02>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x11af4
    // Size: 0x1bd, Type: dev
    function function_29eb5f1263c8fb82()
    {
        setdevdvar( @"hash_77131639c7958348", 0 );
        lootids = [ 49, 199, 50, 47, 192, 45, 43, 44, 252, 61, 63, 60, 112, 215, 110, 103, 101, 290, 104, 100, 108, 105, 106, 107, 156, 158, 201, 164, 163, 268, 269, 160, 176, 177, 178, 179, 224, 200, 181, 183, 175, 174, 173, 284, 129, 127, 130, 126, 136, 139, 138, 144, 147, 146, 140, 142, 143, 94, 262, 91, 239, 98, 97, 83, 222, 81 ];
        level thread function_e5640fb672e8a8c2( lootids );
    }

    // Namespace dev / scripts\mp\dev
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x11cb9
    // Size: 0x1f9, Type: dev
    function createweaponstruct( rarity, weaponroot, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, locdesc, icon )
    {
        struct = spawnstruct();
        struct.item = "<dev string:x1e4a>";
        struct.blank_0 = "<dev string:xca>";
        struct.type = "<dev string:x1e52>";
        struct.rarity = string( rarity );
        struct.blank_1 = "<dev string:xca>";
        struct.blank_2 = "<dev string:xca>";
        struct.blank_3 = "<dev string:xca>";
        struct.blank_4 = "<dev string:xca>";
        struct.weaponroot = weaponroot;
        struct.blank_5 = "<dev string:xca>";
        struct.attachments = "<dev string:xca>";
        
        foreach ( key, aid in var_de230719cecf1c95 )
        {
            if ( struct.attachments != "<dev string:xca>" )
            {
                struct.attachments += "<dev string:x45d>";
            }
            
            struct.attachments += key;
            
            if ( int( aid ) > 0 )
            {
                struct.attachments += "<dev string:x1aa5>" + aid;
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
    // Checksum 0x0, Offset: 0x11eba
    // Size: 0x116, Type: dev
    function function_bcd4202f4c57f735( s )
    {
        return s.item + "<dev string:x2ef>" + s.blank_0 + "<dev string:x2ef>" + s.type + "<dev string:x2ef>" + s.rarity + "<dev string:x2ef>" + s.blank_1 + "<dev string:x2ef>" + s.blank_2 + "<dev string:x2ef>" + s.blank_3 + "<dev string:x2ef>" + s.blank_4 + "<dev string:x2ef>" + s.weaponroot + "<dev string:x2ef>" + s.blank_5 + "<dev string:x2ef>" + s.attachments + "<dev string:x2ef>" + s.weaponname + "<dev string:x2ef>" + s.var_c6afd69be9317fc8 + "<dev string:x2ef>" + s.locdesc + "<dev string:x2ef>" + s.icon;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11fd8
    // Size: 0x99, Type: dev
    function function_5fb76aeed704755( lines )
    {
        filepath = "<dev string:x1e5c>";
        fileid = openfile( filepath, "<dev string:x1e88>" );
        
        foreach ( l in lines )
        {
            fprintln( fileid, l );
        }
        
        fileid = closefile( fileid );
        iprintlnbold( "<dev string:x1e91>" + filepath + "<dev string:x12ff>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x12079
    // Size: 0x195, Type: dev
    function function_e5640fb672e8a8c2( lootids )
    {
        lines = [];
        
        foreach ( lootid in lootids )
        {
            weaponroot = function_1cc3fd00b6ccc3ba( lootid );
            weaponscriptbundle = scripts\cp_mp\weapon::function_8477d8595e0364a7( weaponroot, [ #"desc", #"image" ] );
            var_25152a36c536d7f = scripts\cp_mp\utility\loot::function_793e8a72cedb8ef3( lootid );
            weaponrarity = "<dev string:xc5>";
            locdesc = weaponscriptbundle.desc;
            var_655be453564ea032 = getweaponvarianttablename( weaponroot );
            variantid = int( tablelookup( var_655be453564ea032, 1, var_25152a36c536d7f, 0 ) );
            var_c6afd69be9317fc8 = tablelookup( var_655be453564ea032, 1, var_25152a36c536d7f, 17 );
            var_de230719cecf1c95 = weaponattachcustomtoidmap( weaponroot, variantid );
            icon = weaponscriptbundle.image;
            weaponobj = scripts\cp_mp\weapon::buildweapon_blueprint( weaponroot, undefined, undefined, variantid );
            weaponname = getcompleteweaponname( weaponobj );
            struct = createweaponstruct( weaponrarity, weaponroot, var_de230719cecf1c95, weaponname, var_c6afd69be9317fc8, locdesc, icon );
            lines[ lines.size ] = function_bcd4202f4c57f735( struct );
        }
        
        function_5fb76aeed704755( lines );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12216
    // Size: 0xc7, Type: dev
    function function_a4ec750e2bc80eee()
    {
        grenade = getdvar( @"hash_1da69ba9e35c8ea0" );
        
        if ( isdefined( grenade ) )
        {
            playerarray = function_13e3c70659983189();
            
            foreach ( player in playerarray )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                player scripts\mp\equipment::clearallequipment();
                player giveweapon( grenade );
                player assignweaponoffhandprimary( grenade );
                player givemaxammo( grenade );
                setdevdvar( @"player_sustainammo", 1 );
            }
        }
        
        setdevdvar( @"hash_1da69ba9e35c8ea0", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x122e5
    // Size: 0xd8, Type: dev
    function function_58d040b31ffcfd8b()
    {
        gesture = getdvar( @"scr_givegesture" );
        
        if ( isdefined( gesture ) && gesture != "<dev string:xca>" )
        {
            foreach ( player in level.players )
            {
                if ( player ishost() )
                {
                    iprintlnbold( "<dev string:x1ea7>" + gesture );
                    
                    if ( !isdefined( player.selectedgesture ) )
                    {
                        player.selectedgesture = gesture;
                        player thread function_cc23c85e2cfce0b6();
                        continue;
                    }
                    
                    player.selectedgesture = gesture;
                }
            }
        }
        
        setdevdvar( @"scr_givegesture", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x123c5
    // Size: 0x144, Type: dev
    function function_3487ac5f6da16476()
    {
        execution = getdvar( @"hash_3764674c95711828" );
        
        if ( isdefined( execution ) && execution != "<dev string:xca>" )
        {
            foreach ( player in level.players )
            {
                if ( player ishost() )
                {
                    player clearexecution();
                    
                    foreach ( weapon in player.equippedweapons )
                    {
                        if ( issubstr( weapon.basename, "<dev string:x1ebd>" ) )
                        {
                            player takeweapon( weapon );
                        }
                    }
                    
                    player scripts\cp_mp\execution::_giveexecution( execution );
                    player.operatorcustomization.execution = player.executionref;
                    iprintlnbold( "<dev string:x1ecf>" + execution );
                }
            }
        }
        
        setdevdvar( @"hash_3764674c95711828", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12511
    // Size: 0x17c, Type: dev
    function function_2bfcc7409565e78f()
    {
        debugweapon = getdvar( @"hash_cfc446de878b0ee3" );
        
        foreach ( player in level.players )
        {
            if ( player ishost() )
            {
                if ( isdefined( player.executionref ) )
                {
                    player clearexecution();
                    
                    foreach ( weapon in player.equippedweapons )
                    {
                        if ( issubstr( weapon.basename, "<dev string:x1ee6>" ) || issubstr( weapon.basename, "<dev string:x1ebd>" ) )
                        {
                            player takeweapon( weapon );
                        }
                    }
                }
                
                if ( isdefined( debugweapon ) )
                {
                    player giveweapon( debugweapon );
                    player giveexecution( scripts\cp_mp\execution::execution_getexecutionbyref( player.executionref ), debugweapon );
                }
                else
                {
                    player giveexecution( scripts\cp_mp\execution::execution_getexecutionbyref( player.executionref ) );
                }
                
                iprintlnbold( "<dev string:x1ef8>" + debugweapon );
                player thread scripts\cp_mp\execution::watchinexecution();
            }
        }
        
        setdevdvar( @"hash_cfc446de878b0ee3", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12695
    // Size: 0x1f7, Type: dev
    function gui_dropweapon()
    {
        weaponbasename = getdvar( @"scr_dropweapon" );
        var_d7998a1681d92243 = getdvarint( @"hash_bd52f34ef293135b", 0 );
        attachdictionary = [];
        attachlist = [];
        numattachments = 0;
        
        if ( var_d7998a1681d92243 > 0 )
        {
            csvfilename = "<dev string:x1f16>" + getsubstr( getweaponrootname( weaponbasename ), 4 ) + "<dev string:x1f26>";
            row = -1;
            
            while ( true )
            {
                row++;
                category = tablelookupbyrow( csvfilename, row, 1 );
                
                if ( !isdefined( category ) || category == "<dev string:xca>" )
                {
                    break;
                }
                
                if ( isdefined( attachdictionary[ category ] ) || category == "<dev string:x1f3a>" )
                {
                    continue;
                }
                
                attachdictionary[ category ] = tablelookupbyrow( csvfilename, row, 0 );
                numattachments++;
                
                if ( numattachments >= var_d7998a1681d92243 )
                {
                    break;
                }
            }
            
            foreach ( attachment in attachdictionary )
            {
                attachlist[ attachlist.size ] = attachment;
            }
        }
        
        weaponobj = scripts\cp_mp\weapon::buildweapon( getweaponrootname( weaponbasename ), attachlist, "<dev string:xf0>", "<dev string:xf0>", -1 );
        
        foreach ( player in level.players )
        {
            player giveweapon( weaponobj );
            player.droppeddeathweapon = undefined;
            player scripts\mp\weapons::dropweaponfordeath( undefined, "<dev string:xca>", weaponobj );
            player.droppeddeathweapon = undefined;
        }
        
        setdevdvar( @"scr_dropweapon", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12894
    // Size: 0x13c, Type: dev
    function gui_dropammo()
    {
        ammodrop = getdvarint( @"scr_dropammo" );
        
        if ( isdefined( ammodrop ) )
        {
            foreach ( player in level.players )
            {
                if ( player ishost() )
                {
                    if ( isdefined( player.currentweapon ) )
                    {
                        if ( ammodrop == 0 )
                        {
                            player setweaponammoclip( player.currentweapon, 1 );
                            continue;
                        }
                        
                        if ( ammodrop == 1 )
                        {
                            player setweaponammostock( player.currentweapon, 1 );
                            continue;
                        }
                        
                        if ( ammodrop == 2 )
                        {
                            player setweaponammoclip( player.currentweapon, 0 );
                            continue;
                        }
                        
                        if ( ammodrop == 3 )
                        {
                            player setweaponammostock( player.currentweapon, 0 );
                            continue;
                        }
                        
                        if ( ammodrop == 4 )
                        {
                            player setweaponammoclip( player.currentweapon, 0 );
                            player setweaponammostock( player.currentweapon, 0 );
                        }
                    }
                }
            }
        }
        
        setdevdvar( @"scr_dropammo", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x129d8
    // Size: 0x42, Type: dev
    function function_cc23c85e2cfce0b6()
    {
        level endon( "<dev string:x101>" );
        self endon( "<dev string:x273>" );
        
        while ( true )
        {
            if ( self buttonpressed( "<dev string:x1f42>" ) )
            {
                self giveandfireoffhand( self.selectedgesture );
                wait 1;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12a22
    // Size: 0x40, Type: dev
    function function_8e08e2e46ce4aaab()
    {
        if ( isdefined( self.var_8e08e2e46ce4aaab ) )
        {
            return;
        }
        
        self.var_8e08e2e46ce4aaab = 1;
        thread function_269edab67ec4e271();
        thread thirdpersontoggle();
        self waittill( "<dev string:xb69>" );
        self.var_8e08e2e46ce4aaab = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x12a6a
    // Size: 0x4d, Type: dev
    function function_81fbd229afdc1593( weaponname )
    {
        if ( !isdefined( level.baseweaponlist[ weaponname ] ) )
        {
            self iprintlnbold( "<dev string:x1f4d>" + weaponname );
            return;
        }
        
        self notify( "<dev string:x1f61>" );
        self.baseweapon = weaponname;
        thread function_7e660ea4358a031();
        function_aecaa1451c1f3a98();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12abf
    // Size: 0xc3, Type: dev
    function thirdpersontoggle()
    {
        self endon( "<dev string:xb69>" );
        self notifyonplayercommand( "<dev string:x1f74>", "<dev string:xbb9>" );
        thirdpersonelem = createfontstring( "<dev string:x1f81>", 1.5 );
        thirdpersonelem setpoint( "<dev string:x1f8c>", "<dev string:x1f8c>", 0, 332 );
        thirdpersonelem settext( "<dev string:x1f98>" + getdvarint( @"camera_thirdperson" ) + "<dev string:x1fa8>" );
        thread destroyondeath( thirdpersonelem );
        
        for ( ;; )
        {
            self waittill( "<dev string:x1f74>" );
            setdvar( @"camera_thirdperson", !getdvarint( @"camera_thirdperson" ) );
            thirdpersonelem settext( "<dev string:x1f98>" + getdvarint( @"camera_thirdperson" ) + "<dev string:x1fa8>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12b8a
    // Size: 0x130, Type: dev
    function function_269edab67ec4e271()
    {
        self endon( "<dev string:xb69>" );
        self notifyonplayercommand( "<dev string:x1f42>", "<dev string:xb95>" );
        camolist = [];
        
        for (rowindex = 0; tablelookupbyrow( "<dev string:x1add>", rowindex, 1 ) != "<dev string:xca>"; rowindex++) {
            camolist[ camolist.size ] = tablelookupbyrow( "<dev string:x1add>", rowindex, 1 );
        }
        
        self.camoindex = 0;
        camoelem = createfontstring( "<dev string:x1f81>", 1.5 );
        camoelem setpoint( "<dev string:x1f8c>", "<dev string:x1f8c>", 0, 312 );
        camoelem settext( "<dev string:x1fbf>" + tablelookup( "<dev string:x1add>", 0, self.camoindex, 1 ) + "<dev string:x1fc9>" );
        thread destroyondeath( camoelem );
        
        for ( ;; )
        {
            self waittill( "<dev string:x1f42>" );
            self.camoindex++;
            
            if ( self.camoindex > camolist.size - 1 )
            {
                self.camoindex = 0;
            }
            
            camoelem settext( "<dev string:x1fbf>" + tablelookup( "<dev string:x1add>", 0, self.camoindex, 1 ) + "<dev string:x1fc9>" );
            function_aecaa1451c1f3a98();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12cc2
    // Size: 0x15b, Type: dev
    function function_7e660ea4358a031()
    {
        self endon( "<dev string:xb69>" );
        self endon( "<dev string:x1f61>" );
        self notifyonplayercommand( "<dev string:x1fe0>", "<dev string:x1fef>" );
        
        if ( !isdefined( self.weaponelem ) )
        {
            self.weaponelem = createfontstring( "<dev string:x1f81>", 1.5 );
            self.weaponelem setpoint( "<dev string:x1f8c>", "<dev string:x1f8c>", 0, 292 );
            thread destroyondeath( self.weaponelem );
        }
        
        self.variantindex = 0;
        self.weaponelem settext( "<dev string:x1ffc>" + level.baseweaponlist[ self.baseweapon ].variants[ self.variantindex ] + "<dev string:x2008>" );
        
        for ( ;; )
        {
            self waittill( "<dev string:x1fe0>" );
            self.variantindex++;
            
            if ( self.variantindex > level.baseweaponlist[ self.baseweapon ].variants.size - 1 )
            {
                self.variantindex = 0;
            }
            
            self.weaponelem settext( "<dev string:x1ffc>" + level.baseweaponlist[ self.baseweapon ].variants[ self.variantindex ] + "<dev string:x2008>" );
            function_aecaa1451c1f3a98();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x12e25
    // Size: 0x1d, Type: dev
    function destroyondeath( hudelem )
    {
        self waittill( "<dev string:xb69>" );
        hudelem destroy();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12e4a
    // Size: 0x66, Type: dev
    function function_aecaa1451c1f3a98()
    {
        self takeallweapons();
        waitframe();
        weaponname = level.baseweaponlist[ self.baseweapon ].variants[ self.variantindex ];
        _giveweapon( weaponname, int( self.camoindex ) );
        _switchtoweapon( weaponname );
        self givemaxammo( weaponname );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12eb8
    // Size: 0x6b, Type: dev
    function watchnoclip()
    {
        if ( lpcfeaturegated() )
        {
            return;
        }
        
        level waittill( "<dev string:xdc4>", player );
        
        if ( !isbot( player ) && !istestclient( player ) )
        {
            player notifyonplayercommand( "<dev string:x201a>", "<dev string:x202c>" );
            player notifyonplayercommand( "<dev string:x203e>", "<dev string:xbb9>" );
            player thread playernoclip();
        }
        
        level thread watchnoclip();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12f2b
    // Size: 0x81, Type: dev
    function playernoclip()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        self.var_6c475bd1264d67bc = 0;
        self.var_4fc792011a904560 = 0;
        
        if ( !lpcfeaturegated() )
        {
            thread function_8362ef67970902e0();
            thread function_d84fbbb6b1926fec();
        }
        
        while ( true )
        {
            if ( getdvarint( @"hash_4888f3f38913205f" ) > 0 )
            {
                if ( self.var_6c475bd1264d67bc && self.var_4fc792011a904560 )
                {
                    self noclip();
                }
            }
            
            wait 0.2;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12fb4
    // Size: 0x3e, Type: dev
    function function_8362ef67970902e0()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x201a>" );
            self.var_6c475bd1264d67bc = 1;
            wait 0.2;
            self.var_6c475bd1264d67bc = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12ffa
    // Size: 0x3e, Type: dev
    function function_d84fbbb6b1926fec()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x203e>" );
            self.var_4fc792011a904560 = 1;
            wait 0.2;
            self.var_4fc792011a904560 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13040
    // Size: 0x88, Type: dev
    function watchufo()
    {
        level waittill( "<dev string:xdc4>", player );
        
        if ( isdefined( player ) && !isbot( player ) && !istestclient( player ) )
        {
            player notifyonplayercommand( "<dev string:x2060>", "<dev string:x202c>" );
            player notifyonplayercommand( "<dev string:x206f>", "<dev string:xb95>" );
            player notifyonplayercommand( "<dev string:x207e>", "<dev string:xbfb>" );
            player notifyonplayercommand( "<dev string:x2088>", "<dev string:x2092>" );
            player thread playerufo();
        }
        
        level thread watchufo();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x130d0
    // Size: 0xf6, Type: dev
    function function_bbd4b5c8add9f273()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x207e>" );
            
            if ( getdvarint( @"scr_ufo" ) > 0 )
            {
                contents = scripts\engine\trace::create_contents( 0, 1, 1, 1, 1, 0, 0 );
                shotdir = anglestoforward( self getplayerangles() );
                endpos = self geteye() + shotdir * 90000;
                var_bc1fb594d8a6e68a = physics_raycast( self geteye(), endpos, contents, undefined, 0, "<dev string:x13c>", 0 );
                hit = isdefined( var_bc1fb594d8a6e68a ) && var_bc1fb594d8a6e68a.size > 0;
                
                if ( hit )
                {
                    hitpos = var_bc1fb594d8a6e68a[ 0 ][ "<dev string:x1ae>" ];
                    println( "<dev string:xca>" + hitpos + "<dev string:x3e9>" + ( 0, self getplayerangles()[ 1 ], 0 ) + "<dev string:x3e9>" );
                }
                
                wait 0.2;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x131ce
    // Size: 0x67, Type: dev
    function function_c2744ae5dcea21ad()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2088>" );
            
            if ( getdvarint( @"scr_ufo" ) > 0 )
            {
                println( "<dev string:xca>" + self geteye() + "<dev string:x3e9>" + ( 0, self getplayerangles()[ 1 ], 0 ) + "<dev string:x3e9>" );
                wait 0.2;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1323d
    // Size: 0x92, Type: dev
    function playerufo()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        if ( lpcfeaturegated() )
        {
            return;
        }
        
        self.var_f78ebfaa82781031 = 0;
        self.var_55caa385951974a5 = 0;
        thread function_eca8d9e76233ce9d();
        thread function_e8a05aada0294d89();
        thread function_bbd4b5c8add9f273();
        thread function_c2744ae5dcea21ad();
        
        while ( true )
        {
            if ( getdvarint( @"hash_2a77b8dc84093d22" ) > 0 )
            {
                if ( self.var_f78ebfaa82781031 && self.var_55caa385951974a5 )
                {
                    self ufo();
                }
            }
            
            wait 0.2;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x132d7
    // Size: 0x3e, Type: dev
    function function_eca8d9e76233ce9d()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2060>" );
            self.var_f78ebfaa82781031 = 1;
            wait 0.2;
            self.var_f78ebfaa82781031 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1331d
    // Size: 0x3e, Type: dev
    function function_e8a05aada0294d89()
    {
        self endon( "<dev string:x14db>" );
        self endon( "<dev string:x2052>" );
        
        while ( true )
        {
            self waittill( "<dev string:x206f>" );
            self.var_55caa385951974a5 = 1;
            wait 0.2;
            self.var_55caa385951974a5 = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13363
    // Size: 0xd3, Type: dev
    function printperks()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_c8c85468b70323a7" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) && getdvarint( @"hash_c8c85468b70323a7" ) != 2 || !isbot( player ) && getdvarint( @"hash_c8c85468b70323a7" ) != 1 )
            {
                continue;
            }
            
            player function_8f1bc9ff072e55f3();
        }
        
        setdevdvar( @"hash_c8c85468b70323a7", 0 );
        thread printperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1343e
    // Size: 0x139, Type: dev
    function function_8f1bc9ff072e55f3()
    {
        count = function_8140890dcf1d2c83();
        println( "<dev string:x209e>" + self.name + "<dev string:x20b7>" + count + "<dev string:x20c4>" );
        
        foreach ( perk, value in self.perks )
        {
            sval = ter_op( value < 10, "<dev string:xc5>", "<dev string:xca>" ) + value;
            println( sval + "<dev string:x20cc>" + perk );
        }
        
        if ( self.perksblocked.size > 0 )
        {
            println( "<dev string:x20d3>" );
            
            foreach ( perk, value in self.perksblocked )
            {
                sval = ter_op( value < 10, "<dev string:xc5>", "<dev string:xca>" ) + value;
                println( sval + "<dev string:x20cc>" + perk );
            }
        }
        
        println( "<dev string:x20e7>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1357f
    // Size: 0x8a, Type: dev
    function function_b0211c9e3a276f99()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_ba8f8e3054e5584d" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        if ( !isdefined( level.var_123ab3758e7ca34d ) )
        {
            level.var_123ab3758e7ca34d = 1;
            iprintlnbold( "<dev string:x20f2>" );
            level thread function_d9ccd984ecda554();
        }
        else
        {
            iprintlnbold( "<dev string:x210b>" );
            level notify( "<dev string:x2125>" );
            level.var_123ab3758e7ca34d = undefined;
        }
        
        setdevdvar( @"hash_ba8f8e3054e5584d", 0 );
        thread function_b0211c9e3a276f99();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13611
    // Size: 0x24, Type: dev
    function function_d9ccd984ecda554()
    {
        level endon( "<dev string:x2125>" );
        
        while ( true )
        {
            function_fae2bd7fe8ffb6e8();
            level waittill( "<dev string:x213e>" );
            waittillframeend();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1363d
    // Size: 0x78, Type: dev
    function function_fae2bd7fe8ffb6e8()
    {
        foreach ( player in level.players )
        {
            count = player function_8140890dcf1d2c83();
            player iprintlnbold( "<dev string:x2153>" + count );
            player function_8f1bc9ff072e55f3();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x136bd
    // Size: 0x63, Type: dev
    function function_8140890dcf1d2c83()
    {
        count = 0;
        
        foreach ( num in self.perks )
        {
            count += num;
        }
        
        return count;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13728
    // Size: 0xc4, Type: dev
    function devgiveperks()
    {
        while ( true )
        {
            if ( getdvar( @"hash_8fcf658de0756ca3" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        perk = getdvar( @"hash_8fcf658de0756ca3" );
        playerarray = function_13e3c70659983189();
        
        foreach ( player in playerarray )
        {
            player thread giveperk( perk );
            player scripts\mp\class::function_dc63eafe3f6318df();
        }
        
        setdevdvar( @"hash_8fcf658de0756ca3", "<dev string:xca>" );
        thread devgiveperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x137f4
    // Size: 0x93, Type: dev
    function devclearperks()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_87ee17dde7eae140" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_87ee17dde7eae140", 0 );
        
        foreach ( player in level.players )
        {
            player thread scripts\mp\class::loadout_clearperks();
        }
        
        thread devclearperks();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1388f
    // Size: 0x51, Type: dev
    function function_eaf8d13254082879()
    {
        while ( true )
        {
            if ( getdvar( @"hash_f0b8c004a14db0a2" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        game[ "<dev string:x2163>" ] = 2400;
        setdevdvar( @"hash_f0b8c004a14db0a2", "<dev string:xca>" );
        thread function_eaf8d13254082879();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x138e8
    // Size: 0xa8, Type: dev
    function function_80ababd8270dc6fd()
    {
        while ( true )
        {
            playerarray = function_13e3c70659983189();
            powerup = getdvar( @"hash_3f6aa1398452a3db", "<dev string:xca>" );
            
            if ( powerup != "<dev string:xca>" )
            {
                foreach ( player in playerarray )
                {
                    player namespace_dfe80adf32f5c14a::apply_powerup( powerup );
                }
                
                setdevdvar( @"hash_3f6aa1398452a3db", "<dev string:xca>" );
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13998
    // Size: 0xd3, Type: dev
    function devhideviewmodel()
    {
        while ( true )
        {
            if ( getdvar( @"hash_104f4546b7c78762" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        val = getdvarint( @"hash_104f4546b7c78762" );
        
        if ( val > 0 )
        {
            foreach ( player in level.players )
            {
                player setviewmodel( "<dev string:x2183>" );
            }
        }
        else
        {
            setdevdvar( @"hash_435b27b2358cbe5", "<dev string:x219b>" );
        }
        
        setdevdvar( @"hash_104f4546b7c78762", "<dev string:xca>" );
        thread devhideviewmodel();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13a73
    // Size: 0x51, Type: dev
    function function_eaf8d03254082646()
    {
        while ( true )
        {
            if ( getdvar( @"hash_f0b8c104a14db2d5" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        game[ "<dev string:x2163>" ] = 4800;
        setdevdvar( @"hash_f0b8c104a14db2d5", "<dev string:xca>" );
        thread function_eaf8d03254082646();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13acc
    // Size: 0x93, Type: dev
    function function_2b05a1bb91e36782()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_ed0cf15ec432ad73", 0 ) != 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_ed0cf15ec432ad73", 0 );
        
        foreach ( player in level.players )
        {
            player scripts\mp\perks\perkpackage::perkpackage_reset();
        }
        
        thread function_2b05a1bb91e36782();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13b67
    // Size: 0xd6, Type: dev
    function function_53a0f5e4d6bbc7a4()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_93721f3cbd6d00c6" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        damageval = getdvarint( @"hash_93721f3cbd6d00c6" );
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( damageval >= 100 )
        {
            damageval = notbot.health - 1;
        }
        
        bot = getbot( notbot );
        
        if ( isdefined( bot ) )
        {
            notbot thread [[ level.callbackplayerdamage ]]( bot, bot, damageval, 0, "<dev string:xf5d>", 0, bot.currentweapon, bot.origin, ( 0, 0, 0 ), "<dev string:xf0>", 0 );
        }
        
        setdevdvar( @"hash_93721f3cbd6d00c6", 0 );
        thread function_53a0f5e4d6bbc7a4();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13c45
    // Size: 0x5e, Type: dev
    function function_179953844e4b32a3()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_9e1de20ce2f61ca9" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        notbot.health = 100;
        setdevdvar( @"hash_9e1de20ce2f61ca9", 0 );
        thread function_179953844e4b32a3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13cab
    // Size: 0x26c, Type: dev
    function function_d274538e2f24b500()
    {
        while ( true )
        {
            if ( getdvar( @"hash_58d027ad37e05b46" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        bot = undefined;
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot( notbot );
        
        if ( isdefined( bot ) )
        {
            switch ( getdvar( @"hash_58d027ad37e05b46" ) )
            {
                case #"hash_7f140387222cfe9c":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoright( notbot.angles ) * 100 );
                    break;
                case #"hash_b291f3b7bbb77bab":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoright( notbot.angles ) * 100 * -1 );
                    break;
                case #"hash_56fc9561bf733ce7":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoforward( notbot.angles ) * 100 );
                    break;
                case #"hash_780928871e950151":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoright( notbot.angles ) * 600 );
                    break;
                case #"hash_d887fab7cfd82d82":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoright( notbot.angles ) * 600 * -1 );
                    break;
                case #"hash_404a4461b3700846":
                    bot setorigin( notbot.origin + ( 0, 0, 5 ) + anglestoforward( notbot.angles ) * 600 );
                    break;
            }
            
            wait 0.1;
            _magicbullet( makeweapon( "<dev string:x21fe>" ), bot.origin + ( 0, 0, 35 ), notbot.origin + ( 0, 0, 35 ), bot );
        }
        
        setdevdvar( @"hash_58d027ad37e05b46", "<dev string:xca>" );
        thread function_d274538e2f24b500();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13f1f
    // Size: 0xbf, Type: dev
    function function_575159fea0eac66b()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_b16b6814d40b4d09" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        bot = getbot( notbot );
        
        if ( isdefined( bot ) )
        {
            notbot thread [[ level.callbackplayerdamage ]]( bot, bot, notbot.health, 0, "<dev string:xf5d>", 0, bot.currentweapon, bot.origin, ( 0, 0, 0 ), "<dev string:xf0>", 0, undefined, undefined, 0, notbot.health );
        }
        
        setdevdvar( @"hash_b16b6814d40b4d09", 0 );
        thread function_575159fea0eac66b();
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x13fe6
    // Size: 0x224, Type: dev
    function getbot( notbot, var_fc019006dbdc298b )
    {
        bot = undefined;
        
        foreach ( player in level.players )
        {
            if ( !isbot( player ) && !istestclient( player ) )
            {
                continue;
            }
            
            if ( isdefined( player ) && isdefined( notbot ) )
            {
                if ( level.teambased )
                {
                    if ( player.team != notbot.team )
                    {
                        bot = player;
                        break;
                    }
                    
                    continue;
                }
                
                bot = player;
                break;
            }
        }
        
        if ( !isdefined( bot ) )
        {
            foreach ( player in level.players )
            {
                if ( !isbot( player ) && !istestclient( player ) )
                {
                    continue;
                }
                
                if ( isdefined( player ) && isdefined( notbot ) )
                {
                    if ( level.teambased )
                    {
                        if ( player.team == notbot.team )
                        {
                            bot = player;
                            break;
                        }
                    }
                }
            }
        }
        
        if ( !isdefined( bot ) )
        {
            setdevdvar( @"hash_2d5236cbe9894aff", 1 );
            wait 3;
            
            foreach ( player in level.players )
            {
                if ( !isbot( player ) && !istestclient( player ) )
                {
                    continue;
                }
                
                if ( isdefined( player ) && isdefined( notbot ) )
                {
                    if ( level.teambased )
                    {
                        if ( player.team != notbot.team )
                        {
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
    // Checksum 0x0, Offset: 0x14212
    // Size: 0x7c, Type: dev
    function function_69dffe7a5cb1b4b9()
    {
        notbot = level.players[ 0 ];
        
        foreach ( player in level.players )
        {
            if ( !isbot( player ) && !istestclient( player ) )
            {
                return player;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14296
    // Size: 0xed, Type: dev
    function function_5cc7bbf54f71fa3()
    {
        while ( true )
        {
            if ( getdvar( @"hash_c9f6917530383799" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 0.5;
        }
        
        if ( isdefined( level.ingraceperiod ) && level.ingraceperiod )
        {
            level notify( "<dev string:x220d>" );
            level notify( "<dev string:x2220>" );
            
            foreach ( p in level.players )
            {
                p setclientomnvar( "<dev string:x2238>", 0 );
                p setclientomnvar( "<dev string:x2254>", 1 );
                scripts\mp\playerlogic::clearprematchlook( p );
                p _freezecontrols( 0, 1 );
            }
        }
        
        setdevdvar( @"hash_c9f6917530383799", "<dev string:xca>" );
        thread function_5cc7bbf54f71fa3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1438b
    // Size: 0x42, Type: dev
    function function_f4f9fc0c0543a738()
    {
        timelimit_maprestart = getdvarfloat( @"hash_9303077b6b67dda6", -1 );
        
        if ( timelimit_maprestart >= 0 )
        {
            setdevdvar( @"hash_b1f216df6049c46a", timelimit_maprestart );
        }
        
        function_2384873117c9fee0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x143d5
    // Size: 0x110, Type: dev
    function private function_2384873117c9fee0()
    {
        while ( true )
        {
            if ( getdvarfloat( @"hash_b1f216df6049c46a", -1 ) >= 0 )
            {
                break;
            }
            
            if ( getdvarfloat( @"hash_b1f216df6049c46a", -1 ) == -2 )
            {
                timelimit = scripts\mp\utility\game::gettimelimit();
                setdevdvar( @"hash_b1f216df6049c46a", int( timelimit / 2 ) );
                break;
            }
            
            wait 1;
        }
        
        timelimit = getdvarfloat( @"hash_b1f216df6049c46a" );
        setdevdvar( @"hash_9303077b6b67dda6", timelimit );
        setdevdvar( @"hash_b1f216df6049c46a", -1 );
        level.starttime = gettime();
        gamemode = hashcat( @"scr_", getgametype(), "<dev string:x226c>" );
        level.watchdvars[ gamemode ].value = timelimit;
        level.overridewatchdvars[ gamemode ] = timelimit;
        setdevdvar( gamemode, timelimit );
        setovertimelimitdvar( timelimit );
        thread function_2384873117c9fee0();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x144ed
    // Size: 0x44, Type: dev
    function disableforfeit()
    {
        while ( true )
        {
            if ( getdvarfloat( @"hash_783f25d038fa2819" ) == 1 )
            {
                level.disableforfeit = 1;
                level notify( "<dev string:x227a>" );
            }
            else
            {
                level.disableforfeit = 0;
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14539
    // Size: 0x153, Type: dev
    function function_b35d4a9546104424()
    {
        prev = getdvarint( @"hash_18cc90e3fd22526a" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_18cc90e3fd22526a" ) != prev )
            {
                break;
            }
            
            wait 1;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        switch ( getdvarint( @"hash_18cc90e3fd22526a" ) )
        {
            case 0:
                notbot notify( "<dev string:x228b>" );
                
                if ( isdefined( notbot.var_4c012b00b670c7c1 ) )
                {
                    notbot.var_4c012b00b670c7c1 destroyelem();
                }
                
                if ( isdefined( notbot.var_a3616d148441d592 ) )
                {
                    notbot.var_a3616d148441d592 destroyelem();
                }
                
                break;
            case 1:
                notbot.var_4c012b00b670c7c1 = notbot createprimaryprogressbar( 200, 250 );
                notbot.var_a3616d148441d592 = notbot createprimaryprogressbartext( 200, 250 );
                notbot.var_a3616d148441d592 setpoint( "<dev string:x229e>", undefined, level.primaryprogressbartextx - 150, level.primaryprogressbartexty + 250 );
                notbot.var_a3616d148441d592 settext( "<dev string:x22a7>" );
                notbot thread function_fd92cd457ce53d53();
                break;
        }
        
        thread function_b35d4a9546104424();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14694
    // Size: 0x13, Type: dev
    function function_fd92cd457ce53d53()
    {
        level endon( "<dev string:x101>" );
        self endon( "<dev string:x228b>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x146af
    // Size: 0x123, Type: dev
    function function_b4a1b56a2c46ae2d()
    {
        prev = getdvarint( @"hash_a468c3040709501b" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_a468c3040709501b" ) != prev )
            {
                break;
            }
            
            wait 1;
        }
        
        notbot = function_69dffe7a5cb1b4b9();
        
        switch ( getdvarint( @"hash_a468c3040709501b" ) )
        {
            case 0:
                notbot notify( "<dev string:x22b4>" );
                
                if ( isdefined( notbot.var_450ee4f468089512 ) )
                {
                    notbot.var_450ee4f468089512 destroyelem();
                }
                
                if ( isdefined( notbot.var_44cdc709e589d8b9 ) )
                {
                    notbot.var_44cdc709e589d8b9 destroyelem();
                }
                
                break;
            case 1:
                notbot.var_450ee4f468089512 = notbot createprimaryprogressbar( 200, 200 );
                notbot.var_44cdc709e589d8b9 = notbot createprimaryprogressbartext( 200, 200 );
                notbot.var_44cdc709e589d8b9 settext( "<dev string:x22c7>" );
                notbot thread function_c932c71bd99a784a();
                break;
        }
        
        thread function_b4a1b56a2c46ae2d();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x147da
    // Size: 0xd5, Type: dev
    function function_c932c71bd99a784a()
    {
        level endon( "<dev string:x101>" );
        self endon( "<dev string:x22b4>" );
        prevxp = getrankxp();
        
        while ( true )
        {
            currxp = getrankxp();
            
            if ( prevxp != currxp )
            {
                rank = getrankforxp( currxp );
                minxp = getrankinfominxp( rank );
                nextxp = getrankinfoxpamt( rank );
                barfrac = ( currxp - minxp ) / nextxp;
                
                if ( barfrac > 1 )
                {
                    barfrac = 1;
                }
                
                self.var_450ee4f468089512 updatebar( barfrac, 0 );
                prevxp = currxp;
                self.var_44cdc709e589d8b9 settext( "<dev string:x22d4>" + currxp + "<dev string:x22e2>" + nextxp + "<dev string:x22f2>" + rank + 1 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x148b7
    // Size: 0x287, Type: dev
    function devhelipathdebugdraw()
    {
        white = ( 1, 1, 1 );
        red = ( 1, 0, 0 );
        green = ( 0, 1, 0 );
        blue = ( 0, 0, 1 );
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = ( 0, 0, -30 );
        endonmsg = "<dev string:x22fc>";
        
        while ( true )
        {
            if ( getdvarint( @"scr_devhelipathsdebugdraw" ) > 0 )
            {
                script_origins = getentarray( "<dev string:xfca>", "<dev string:xf9d>" );
                
                foreach ( ent in script_origins )
                {
                    if ( isdefined( ent.targetname ) )
                    {
                        switch ( ent.targetname )
                        {
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
                        
                        switch ( ent.targetname )
                        {
                            case #"hash_edf28f9f9eab902":
                            case #"hash_18b8d1ddd9bd830d":
                            case #"hash_b3d3504a12cbef63":
                            case #"hash_c7f2713f8146c2fe":
                                if ( drawtime == maxdrawtime )
                                {
                                    ent thread drawpath( textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg );
                                }
                                
                                ent draworiginlines();
                                ent drawtargetnametext( textcolor, textalpha, textscale );
                                ent draworigintext( textcolor, textalpha, textscale, origintextoffset );
                                break;
                        }
                    }
                }
                
                drawtime -= 0.05;
                
                if ( drawtime < 0 )
                {
                    drawtime = maxdrawtime;
                }
            }
            
            if ( getdvarint( @"scr_devhelipathsdebugdraw" ) == 0 )
            {
                level notify( endonmsg );
                drawtime = maxdrawtime;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14b46
    // Size: 0x245, Type: dev
    function function_c3c888333a91da1()
    {
        white = ( 1, 1, 1 );
        red = ( 1, 0, 0 );
        green = ( 0, 1, 0 );
        blue = ( 0, 0, 1 );
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = ( 0, 0, -30 );
        endonmsg = "<dev string:x235c>";
        
        while ( true )
        {
            if ( getdvarint( @"hash_b048e9c4cba3bb37" ) > 0 )
            {
                script_structs = getstructarray( "<dev string:x237b>", "<dev string:x239a>" );
                
                foreach ( ent in script_structs )
                {
                    line( ent.origin, ent.origin + ( 10, 0, 0 ), red );
                    line( ent.origin, ent.origin + ( 0, 10, 0 ), green );
                    line( ent.origin, ent.origin + ( 0, 0, 10 ), blue );
                    print3d( ent.origin, ent.origin );
                    
                    if ( isdefined( ent.script_noteworthy ) )
                    {
                        print3d( ent.origin + origintextoffset, ent.script_noteworthy );
                    }
                    
                    if ( isdefined( ent.radius ) )
                    {
                        print3d( ent.origin + origintextoffset * 2, "<dev string:x23af>" + ent.radius );
                    }
                }
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14d93
    // Size: 0xcd, Type: dev
    function draworiginlines()
    {
        red = ( 1, 0, 0 );
        green = ( 0, 1, 0 );
        blue = ( 0, 0, 1 );
        line( self.origin, self.origin + anglestoforward( self.angles ) * 10, red );
        line( self.origin, self.origin + anglestoright( self.angles ) * 10, green );
        line( self.origin, self.origin + anglestoup( self.angles ) * 10, blue );
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14e68
    // Size: 0x57, Type: dev
    function drawtargetnametext( textcolor, textalpha, textscale, textoffset )
    {
        if ( !isdefined( textoffset ) )
        {
            textoffset = ( 0, 0, 0 );
        }
        
        print3d( self.origin + textoffset, self.targetname, textcolor, textalpha, textscale );
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14ec7
    // Size: 0x98, Type: dev
    function draworigintext( textcolor, textalpha, textscale, textoffset )
    {
        if ( !isdefined( textoffset ) )
        {
            textoffset = ( 0, 0, 0 );
        }
        
        originstring = "<dev string:x23bb>" + self.origin[ 0 ] + "<dev string:x3e9>" + self.origin[ 1 ] + "<dev string:x3e9>" + self.origin[ 2 ] + "<dev string:x458>";
        print3d( self.origin + textoffset, originstring, textcolor, textalpha, textscale );
    }

    // Namespace dev / scripts\mp\dev
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x14f67
    // Size: 0x98, Type: dev
    function drawspeedacceltext( textcolor, textalpha, textscale, textoffset )
    {
        if ( isdefined( self.script_airspeed ) )
        {
            print3d( self.origin + ( 0, 0, textoffset[ 2 ] * 2 ), "<dev string:x23c0>" + self.script_airspeed, textcolor, textalpha, textscale );
        }
        
        if ( isdefined( self.script_accel ) )
        {
            print3d( self.origin + ( 0, 0, textoffset[ 2 ] * 3 ), "<dev string:x23d4>" + self.script_accel, textcolor, textalpha, textscale );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x15007
    // Size: 0xe9, Type: dev
    function drawpath( linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg )
    {
        level endon( endonmsg );
        ent = self;
        entfirsttarget = ent.targetname;
        
        while ( isdefined( ent.target ) )
        {
            enttarget = getent( ent.target, "<dev string:xfbc>" );
            ent thread drawpathsegment( enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg );
            
            if ( ent.targetname == "<dev string:x2327>" )
            {
                entfirsttarget = ent.target;
            }
            else if ( ent.target == entfirsttarget )
            {
                break;
            }
            
            ent = enttarget;
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x150f8
    // Size: 0x88, Type: dev
    function drawpathsegment( enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg )
    {
        level endon( endonmsg );
        
        while ( drawtime > 0 )
        {
            line( self.origin, enttarget.origin, linecolor );
            drawspeedacceltext( textcolor, textalpha, textscale, textoffset );
            drawtime -= 0.05;
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15188
    // Size: 0x1bf, Type: dev
    function function_eb556484559de206()
    {
        white = ( 1, 1, 1 );
        red = ( 1, 0, 0 );
        green = ( 0, 1, 0 );
        blue = ( 0, 0, 1 );
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = ( 0, 0, -30 );
        endonmsg = "<dev string:x23e5>";
        
        while ( true )
        {
            if ( getdvarint( @"hash_af596796ae351a3c" ) > 0 )
            {
                script_origins = getentarray( "<dev string:x2408>", "<dev string:xfbc>" );
                
                foreach ( ent in script_origins )
                {
                    textcolor = red;
                    textalpha = 1;
                    textscale = 1;
                    
                    if ( drawtime == maxdrawtime )
                    {
                        ent thread drawpath( textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg );
                    }
                    
                    ent draworiginlines();
                    ent drawtargetnametext( textcolor, textalpha, textscale );
                    ent draworigintext( textcolor, textalpha, textscale, origintextoffset );
                }
                
                drawtime -= 0.05;
                
                if ( drawtime < 0 )
                {
                    drawtime = maxdrawtime;
                }
            }
            
            if ( getdvarint( @"hash_af596796ae351a3c" ) == 0 )
            {
                level notify( endonmsg );
                drawtime = maxdrawtime;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1534f
    // Size: 0x1c5, Type: dev
    function function_cf49861d75a5ec29()
    {
        while ( true )
        {
            if ( getdvar( @"hash_f901de8bb079b09b" ) != "<dev string:xca>" )
            {
                break;
            }
            
            wait 1;
        }
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) || istestclient( player ) )
            {
                continue;
            }
            
            if ( getdvar( @"hash_f901de8bb079b09b" ) == "<dev string:x241e>" )
            {
                println( player.name );
                
                foreach ( challenge, value in player.challengedata )
                {
                    if ( issubstr( challenge, "<dev string:x2427>" ) && value )
                    {
                        println( "<dev string:x2431>" + challenge );
                    }
                }
                
                continue;
            }
            
            if ( getdvar( @"hash_f901de8bb079b09b" ) == "<dev string:x243c>" )
            {
                println( player.name );
                
                foreach ( challenge, value in player.challengedata )
                {
                    if ( issubstr( challenge, "<dev string:x2446>" ) && value )
                    {
                        println( "<dev string:x2451>" + challenge );
                    }
                }
            }
        }
        
        setdevdvar( @"hash_f901de8bb079b09b", "<dev string:xca>" );
        thread function_cf49861d75a5ec29();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1551c
    // Size: 0x17f, Type: dev
    function reflectionprobe_hide_hp()
    {
        neutralpoint = getentarray( "<dev string:x245d>", "<dev string:xfbc>" );
        enemypoint = getentarray( "<dev string:x2476>", "<dev string:xfbc>" );
        friendpoint = getentarray( "<dev string:x2495>", "<dev string:xfbc>" );
        contestpoint = getentarray( "<dev string:x24b5>", "<dev string:xfbc>" );
        
        foreach ( zone in neutralpoint )
        {
            zone hide();
        }
        
        foreach ( zone in enemypoint )
        {
            zone hide();
        }
        
        foreach ( zone in friendpoint )
        {
            zone hide();
        }
        
        foreach ( zone in contestpoint )
        {
            zone hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x156a3
    // Size: 0xe5, Type: dev
    function reflectionprobe_hide_front()
    {
        var_a5d9ff994b1d7ab6 = getent( "<dev string:x24d6>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a5d9ff994b1d7ab6 ) )
        {
            var_a5d9ff994b1d7ab6 hide();
        }
        
        var_a5d9fe994b1d7883 = getent( "<dev string:x24f9>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a5d9fe994b1d7883 ) )
        {
            var_a5d9fe994b1d7883 hide();
        }
        
        var_a5da04994b1d85b5 = getent( "<dev string:x251b>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a5da04994b1d85b5 ) )
        {
            var_a5da04994b1d85b5 hide();
        }
        
        var_a57411994aac8dfb = getent( "<dev string:x253f>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a57411994aac8dfb ) )
        {
            var_a57411994aac8dfb hide();
        }
        
        var_a57412994aac902e = getent( "<dev string:x2560>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a57412994aac902e ) )
        {
            var_a57412994aac902e hide();
        }
        
        var_a57414994aac9494 = getent( "<dev string:x2580>", "<dev string:xfbc>" );
        
        if ( isdefined( var_a57414994aac9494 ) )
        {
            var_a57414994aac9494 hide();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15790
    // Size: 0x170, Type: dev
    function gotonextspawn()
    {
        if ( isdefined( level.spawnpoints ) )
        {
            foreach ( player in level.players )
            {
                if ( !isdefined( player.var_93ec845e5e7f0ab2 ) )
                {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
                
                player.spawnpos = level.spawnpoints[ player.var_93ec845e5e7f0ab2 ].origin;
                player spawn( level.spawnpoints[ player.var_93ec845e5e7f0ab2 ].origin, level.spawnpoints[ player.var_93ec845e5e7f0ab2 ].angles );
                iprintlnbold( player.var_93ec845e5e7f0ab2 );
                player.var_a09d322d8fae5a52 = player.var_93ec845e5e7f0ab2 - 1;
                
                if ( player.var_a09d322d8fae5a52 < 0 )
                {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
                
                player.var_93ec845e5e7f0ab2++;
                
                if ( player.var_93ec845e5e7f0ab2 == level.spawnpoints.size )
                {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15908
    // Size: 0x17c, Type: dev
    function gotoprevspawn()
    {
        if ( isdefined( level.spawnpoints ) )
        {
            foreach ( player in level.players )
            {
                if ( !isdefined( player.var_a09d322d8fae5a52 ) )
                {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
                
                player.spawnpos = level.spawnpoints[ player.var_a09d322d8fae5a52 ].origin;
                player spawn( level.spawnpoints[ player.var_a09d322d8fae5a52 ].origin, level.spawnpoints[ player.var_a09d322d8fae5a52 ].angles );
                iprintlnbold( player.var_93ec845e5e7f0ab2 );
                player.var_93ec845e5e7f0ab2 = player.var_a09d322d8fae5a52 + 1;
                
                if ( player.var_93ec845e5e7f0ab2 == level.spawnpoints.size )
                {
                    player.var_93ec845e5e7f0ab2 = 0;
                }
                
                player.var_a09d322d8fae5a52--;
                
                if ( player.var_a09d322d8fae5a52 < 0 )
                {
                    player.var_a09d322d8fae5a52 = level.spawnpoints.size - 1;
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15a8c
    // Size: 0xac, Type: dev
    function devaliengiveplayersmoney()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_a0e912753d4b01bb" ) == 0 )
            {
                wait 0.05;
                continue;
            }
            
            foreach ( player in level.players )
            {
                if ( isdefined( level.var_a30d44df4e10c40e ) )
                {
                    player [[ level.var_a30d44df4e10c40e ]]( 1000 );
                }
            }
            
            setdevdvar( @"hash_a0e912753d4b01bb", "<dev string:xc5>" );
            wait 0.05;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b40
// Size: 0x9d
function spam_points_popup()
{
    scoreevents = [ #"headshot", #"avenger", #"longshot", #"posthumous", #"double", #"triple", #"multi" ];
    
    for (i = 0; i < scoreevents.size; i++) {
        thread scripts\mp\rank::scorepointspopup( 100 );
        thread scripts\mp\rank::scoreeventpopup( scoreevents[ i ] );
        wait 2;
    }
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15be5
    // Size: 0xc9, Type: dev
    function function_7ce9934f6628c684()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_1059590334b9de2c" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_1059590334b9de2c", 0 );
        notbot = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( notbot ) )
        {
            return;
        }
        
        foreach ( character in level.characters )
        {
            if ( level.teambased )
            {
                if ( character.team == notbot.team )
                {
                    kick( character getentitynumber() );
                }
                
                continue;
            }
            
            return;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15cb6
// Size: 0xd7
function devlistinventory()
{
    dvarvalue = getdvar( @"hash_3336a486aff69f38", "" );
    
    if ( dvarvalue != "" )
    {
        hostplayer = devfindhost();
        
        if ( !isdefined( hostplayer ) )
        {
            return;
        }
        
        list = undefined;
        msg = undefined;
        bold = 0;
        
        if ( dvarvalue == "all" )
        {
            msg = "all weapons";
            list = hostplayer getweaponslistall();
        }
        else if ( dvarvalue == "primaryCurrent" )
        {
            msg = "current weapon";
            bold = 1;
            list = [ hostplayer getcurrentweapon() ];
        }
        else
        {
            msg = dvarvalue + " inventory";
            list = hostplayer getweaponslist( dvarvalue );
        }
        
        hostplayer devprintweaponlist( list, msg, bold );
        
        /#
            setdevdvar( @"hash_3336a486aff69f38", "<dev string:xca>" );
        #/
    }
}

// Namespace dev / scripts\mp\dev
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15d95
// Size: 0x138
function devprintweaponlist( list, msg, printbold )
{
    /#
        println( "<dev string:x25a2>" );
        println( "<dev string:x25cf>" + msg );
        println( "<dev string:x25a2>" );
        
        if ( isdefined( list ) && list.size > 0 )
        {
            foreach ( weapon in list )
            {
                clipammo = self getweaponammoclip( weapon );
                stockammo = self getweaponammostock( weapon );
                var_239ede92ef726510 = getcompleteweaponname( weapon );
                weapmsg = "<dev string:x25e3>" + var_239ede92ef726510 + "<dev string:x31a>" + clipammo + "<dev string:x1634>" + stockammo;
                weapclass = weaponclass( var_239ede92ef726510 );
                
                if ( isdefined( weapclass ) )
                {
                    weapmsg = weapmsg + "<dev string:x25e9>" + weapclass;
                }
                
                println( weapmsg );
                
                if ( printbold )
                {
                    iprintlnbold( weapmsg );
                }
            }
        }
        else
        {
            println( "<dev string:x25f4>" );
        }
        
        println( "<dev string:x25a2>" );
    #/
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ed5
// Size: 0xd9
function function_4e64ae8b36808971()
{
    while ( true )
    {
        var_775635eb25c3c213 = getdvarint( @"hash_4fa4d9014bdc9130", 0 );
        
        if ( var_775635eb25c3c213 )
        {
            setdvar( @"hash_4fa4d9014bdc9130", 0 );
            player = devfindhost();
            shockstick = player scripts\mp\utility\weapon::_launchgrenade( "shock_stick_mp", player.origin, ( 0, 0, 0 ), undefined, 1 );
            shockstick.tableinfo = scripts\cp_mp\equipment::getequipmenttableinfo( "equip_shockstick" );
            player scripts\mp\weapons::grenadeinitialize( shockstick, makeweapon( "shock_stick_mp" ), 0, player );
            shockstick setscriptablepartstate( "electric", "active", 0 );
            shockstick setscriptablepartstate( "detonate", "detonate", 0 );
            shockstick thread scripts\mp\equipment\shock_stick::function_f47ab824a48fe570();
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fb6
// Size: 0x151
function devgivesuperthink()
{
    while ( true )
    {
        super = getdvar( @"hash_e6d36d090a5a2469", "" );
        blueprintindex = getdvarint( @"hash_c03a8d3daea44f20", 0 );
        
        if ( super != "" )
        {
            /#
                setdevdvar( @"hash_e6d36d090a5a2469", "<dev string:xca>" );
            #/
            
            foreach ( player in level.players )
            {
                player scripts\mp\supers::givesuper( super, 0, 1, blueprintindex );
            }
        }
        
        if ( getdvarint( @"hash_1deddbedb2075add", 0 ) != 0 )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                if ( !isdefined( player scripts\mp\supers::getcurrentsuper() ) )
                {
                    continue;
                }
                
                if ( player scripts\mp\supers::issupercharging() )
                {
                    player scripts\mp\supers::givesuperpoints( player scripts\mp\supers::getsuperpointsneeded() * 0.25 );
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1610f
// Size: 0x97
function function_41316fca284326ce()
{
    var_8d1c8465d1ac3312 = 0;
    state = 0;
    
    while ( true )
    {
        hostplayer = devfindhost();
        var_cb1e30930c35f2e2 = getdvarint( @"hash_e8f85992b38b6ea8", 0 );
        
        if ( var_cb1e30930c35f2e2 != state )
        {
            if ( var_cb1e30930c35f2e2 )
            {
                if ( !var_8d1c8465d1ac3312 )
                {
                    var_b4af32dc208a0bc9 = 1;
                    hostplayer thread scripts\mp\equipment\nvg::runnvg();
                }
                
                hostplayer scripts\common\values::reset_all( "devForceNVG" );
            }
            else
            {
                hostplayer scripts\common\values::set( "devForceNVG", "nvg", 0 );
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161ae
// Size: 0x89
function function_48721e21935095f2()
{
    while ( true )
    {
        var_db69e7387cd0e20b = getdvarint( @"hash_ddcfd9cb21dd26dc", 0 );
        
        if ( var_db69e7387cd0e20b == 1 )
        {
            /#
                setdevdvar( @"hash_ddcfd9cb21dd26dc", 0 );
            #/
            
            hostplayer = devfindhost();
            
            if ( isdefined( hostplayer ) && isreallyalive( hostplayer ) )
            {
                if ( istrue( hostplayer.disguised ) )
                {
                    hostplayer thread scripts\mp\equipment\disguise::function_3ede6b66136c0f93();
                }
                else
                {
                    hostplayer thread scripts\mp\equipment\disguise::function_c2afddb38bd47f6f();
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1623f
// Size: 0x84
function function_1c94018ff6ba8037()
{
    while ( true )
    {
        superref = getdvar( @"hash_45ad785835521a20", "" );
        
        if ( superref != "" )
        {
            /#
                setdevdvar( @"hash_45ad785835521a20", "<dev string:xca>" );
            #/
            
            switch ( superref )
            {
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
// Checksum 0x0, Offset: 0x162cb
// Size: 0x36e
function function_40a388aa7e058d29()
{
    while ( true )
    {
        streakname = getdvar( @"hash_2d45555fbb2ce4da", "" );
        
        if ( streakname != "" )
        {
            if ( !isdefined( level.var_fa1da5a5e42cd276 ) )
            {
                level.var_fa1da5a5e42cd276 = 0;
            }
            
            targetbot = undefined;
            streakname = getdvar( @"hash_2d45555fbb2ce4da", "" );
            blueprintindex = getdvarint( @"hash_a2679f5af2e4e7b5", 0 );
            streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
            
            /#
                setdevdvar( @"hash_2d45555fbb2ce4da", "<dev string:xca>" );
            #/
            
            host = devfindhost();
            
            if ( !isdefined( host ) )
            {
                continue;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_fa1da5a5e42cd276 % level.characters.size;
                ent = level.characters[ entindex ];
                level.var_fa1da5a5e42cd276++;
                
                if ( isdefined( ent ) && isbot( ent ) && isalive( ent ) && ent.sessionstate == "playing" )
                {
                    if ( level.teambased && host.team != ent.team )
                    {
                        targetbot = ent;
                        break;
                    }
                }
            }
            
            if ( !isdefined( targetbot ) )
            {
                continue;
            }
            
            var_921e39c71a7d1713 = 0;
            emptime = undefined;
            
            if ( streakname == "emp_quick" )
            {
                var_921e39c71a7d1713 = 1;
                emptime = getdvarfloat( @"hash_7ae9abc841dc9c4b" );
                streakname = "emp";
                
                /#
                    setdevdvar( @"hash_7ae9abc841dc9c4b", 1 );
                #/
            }
            
            if ( isdefined( streaksetupinfo ) && getkillstreakindex( streakname ) != -1 )
            {
                if ( targetbot.team != "spectator" && targetbot.sessionstate != "spectator" )
                {
                    if ( streakname == "nuke" )
                    {
                        nuketype = getdvarint( @"hash_9d7c4e6216d74263", 0 );
                        
                        switch ( nuketype )
                        {
                            case 1:
                                streakname = "nuke_select_location";
                                break;
                            case 2:
                                streakname = "nuke_multi";
                                break;
                        }
                    }
                    
                    targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "other", undefined, undefined, undefined, undefined, blueprintindex );
                }
                
                streakitem = targetbot getkillstreakinslot( 0 );
                targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak( streakitem, 0 );
                waitframe();
                targetbot thread function_9997704ec04498( streakname );
            }
            else
            {
                println( "<dev string:x3ef>" + streakname + "<dev string:x4ad>" );
                
                foreach ( killstreak, value in level.killstreaksetups )
                {
                    if ( getkillstreakindex( killstreak ) != -1 )
                    {
                        println( "<dev string:x4e4>" + killstreak );
                    }
                }
                
                println( "<dev string:xca>" );
            }
            
            if ( var_921e39c71a7d1713 )
            {
                /#
                    level thread function_55bbe0a4afb01226( 5, @"hash_7ae9abc841dc9c4b", emptime );
                #/
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16641
// Size: 0x36e
function function_7fcfffcf734d504e()
{
    while ( true )
    {
        streakname = getdvar( @"hash_83b57a87863f395", "" );
        
        if ( streakname != "" )
        {
            if ( !isdefined( level.var_86cdb737b05fc7c3 ) )
            {
                level.var_86cdb737b05fc7c3 = 0;
            }
            
            targetbot = undefined;
            streakname = getdvar( @"hash_83b57a87863f395", "" );
            blueprintindex = getdvarint( @"hash_a2679f5af2e4e7b5", 0 );
            streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
            
            /#
                setdevdvar( @"hash_83b57a87863f395", "<dev string:xca>" );
            #/
            
            host = devfindhost();
            
            if ( !isdefined( host ) )
            {
                continue;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_86cdb737b05fc7c3 % level.characters.size;
                ent = level.characters[ entindex ];
                level.var_86cdb737b05fc7c3++;
                
                if ( isdefined( ent ) && isbot( ent ) && isalive( ent ) && ent.sessionstate == "playing" )
                {
                    if ( level.teambased && host.team == ent.team )
                    {
                        targetbot = ent;
                        break;
                    }
                }
            }
            
            if ( !isdefined( targetbot ) )
            {
                continue;
            }
            
            var_921e39c71a7d1713 = 0;
            emptime = undefined;
            
            if ( streakname == "emp_quick" )
            {
                var_921e39c71a7d1713 = 1;
                emptime = getdvarfloat( @"hash_7ae9abc841dc9c4b" );
                streakname = "emp";
                
                /#
                    setdevdvar( @"hash_7ae9abc841dc9c4b", 1 );
                #/
            }
            
            if ( isdefined( streaksetupinfo ) && getkillstreakindex( streakname ) != -1 )
            {
                if ( targetbot.team != "spectator" && targetbot.sessionstate != "spectator" )
                {
                    if ( streakname == "nuke" )
                    {
                        nuketype = getdvarint( @"hash_9d7c4e6216d74263", 0 );
                        
                        switch ( nuketype )
                        {
                            case 1:
                                streakname = "nuke_select_location";
                                break;
                            case 2:
                                streakname = "nuke_multi";
                                break;
                        }
                    }
                    
                    targetbot scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "other", undefined, undefined, undefined, undefined, blueprintindex );
                }
                
                streakitem = targetbot getkillstreakinslot( 0 );
                targetbot thread scripts\mp\killstreaks\killstreaks::triggerkillstreak( streakitem, 0 );
                waitframe();
                targetbot thread function_9997704ec04498( streakname );
            }
            else
            {
                println( "<dev string:x3ef>" + streakname + "<dev string:x4ad>" );
                
                foreach ( killstreak, value in level.killstreaksetups )
                {
                    if ( getkillstreakindex( killstreak ) != -1 )
                    {
                        println( "<dev string:x4e4>" + killstreak );
                    }
                }
                
                println( "<dev string:xca>" );
            }
            
            if ( var_921e39c71a7d1713 )
            {
                /#
                    level thread function_55bbe0a4afb01226( 5, @"hash_7ae9abc841dc9c4b", emptime );
                #/
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169b7
// Size: 0xb7
function function_9997704ec04498( streakname )
{
    if ( function_dd2c7b73d401a990( streakname ) )
    {
        return;
    }
    
    wait 2;
    botweapon = self.currentweapon;
    iskillstreakweapon = iskillstreakweapon( botweapon ) || issubstr( self.currentweapon.basename, "ks_remote_map" );
    
    while ( iskillstreakweapon( self.currentweapon ) )
    {
        self botpressbutton( "attack" );
        wait 1;
    }
    
    while ( self.currentweapon.basename == "ks_remote_map_mp" )
    {
        self notify( "confirm_location", self.origin );
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a76
// Size: 0x85
function function_dd2c7b73d401a990( streakname )
{
    switch ( streakname )
    {
        case #"hash_27002778019fb447":
        case #"hash_28d0236400e33fd0":
        case #"hash_349713b5ad494dda":
        case #"hash_48cc3a9a58208f82":
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
// Checksum 0x0, Offset: 0x16b03
// Size: 0x5e
function function_8ab3c5933d589588()
{
    while ( true )
    {
        equipmentref = getdvar( @"hash_24fc46aab8e515d3", "" );
        
        if ( equipmentref != "" )
        {
            /#
                setdevdvar( @"hash_24fc46aab8e515d3", "<dev string:xca>" );
            #/
            
            devfindhost() namespace_437d750db8e68984::function_ac625f4c2bf0906b( equipmentref );
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b69
// Size: 0xe0
function devgivefieldupgradethink()
{
    while ( true )
    {
        super = getdvar( @"hash_3617ac10e688070e", "" );
        blueprintindex = getdvarint( @"hash_63e9300e127cbfe7", 0 );
        
        if ( super != "" )
        {
            /#
                setdevdvar( @"hash_3617ac10e688070e", "<dev string:xca>" );
            #/
            
            foreach ( player in level.players )
            {
                if ( !isbot( player ) )
                {
                    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                    {
                        player scripts\mp\gametypes\br_pickups::forcegivesuper( super, 1, 0, 0, 0 );
                        continue;
                    }
                    
                    player scripts\mp\perks\perkpackage::perkpackage_givedebug( super, blueprintindex );
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c51
// Size: 0x155
function function_5ab0cae02a1a189()
{
    while ( true )
    {
        super = getdvar( @"hash_69b7311657d28a29", "" );
        
        if ( super != "" )
        {
            /#
                setdevdvar( @"hash_69b7311657d28a29", "<dev string:xca>" );
            #/
            
            superweaponname = level.superglobals.staticsuperdata[ super ].weapon;
            
            if ( !isdefined( superweaponname ) )
            {
                superweaponname = "super_default_mp";
            }
            
            superweapon = makeweapon( superweaponname );
            
            foreach ( ent in level.characters )
            {
                if ( !isbot( ent ) || !isalive( ent ) || ent.sessionstate != "playing" )
                {
                    continue;
                }
                
                ent scripts\mp\perks\perkpackage::perkpackage_givedebug( super );
                
                if ( isdefined( ent.super ) )
                {
                    if ( !isnullweapon( superweapon ) && superweapon.basename != "super_default_mp" )
                    {
                        ent giveandfireoffhandreliable( superweapon );
                    }
                    
                    ent thread scripts\mp\supers::trysuperusebegin( superweapon );
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16dae
// Size: 0x1e1
function function_39e64f7e9eb964a3()
{
    while ( true )
    {
        super = getdvar( @"hash_ac808c387df6f898", "" );
        blueprintindex = getdvarint( @"hash_63e9300e127cbfe7", 0 );
        
        if ( super != "" )
        {
            /#
                setdevdvar( @"hash_ac808c387df6f898", "<dev string:xca>" );
            #/
            
            host = devfindhost();
            
            if ( !isdefined( host ) )
            {
                continue;
            }
            
            if ( !isdefined( level.var_31f015b75096086c ) )
            {
                level.var_31f015b75096086c = 0;
            }
            
            superweaponname = level.superglobals.staticsuperdata[ super ].weapon;
            
            if ( !isdefined( superweaponname ) )
            {
                superweaponname = "super_default_mp";
            }
            
            superweapon = makeweapon( superweaponname );
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_31f015b75096086c % level.characters.size;
                ent = level.characters[ entindex ];
                level.var_31f015b75096086c++;
                
                if ( isdefined( ent ) && isbot( ent ) && isalive( ent ) && ent.sessionstate == "playing" )
                {
                    if ( level.teambased && host.team != ent.team )
                    {
                        ent scripts\mp\perks\perkpackage::perkpackage_givedebug( super, blueprintindex );
                        
                        if ( isdefined( ent.super ) )
                        {
                            if ( !isnullweapon( superweapon ) && superweapon.basename != "super_default_mp" )
                            {
                                ent giveandfireoffhandreliable( superweapon );
                            }
                            
                            ent thread scripts\mp\supers::trysuperusebegin( superweapon );
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
// Checksum 0x0, Offset: 0x16f97
// Size: 0x19f
function function_287927c59ec7edc8()
{
    while ( true )
    {
        super = getdvar( @"hash_ae9fca9b189d7547", "" );
        blueprintindex = getdvarint( @"hash_63e9300e127cbfe7", 0 );
        
        if ( super != "" )
        {
            /#
                setdevdvar( @"hash_ae9fca9b189d7547", "<dev string:xca>" );
            #/
            
            if ( !isdefined( level.var_97e88aefcade05 ) )
            {
                level.var_97e88aefcade05 = 0;
            }
            
            superweaponname = level.superglobals.staticsuperdata[ super ].weapon;
            
            if ( !isdefined( superweaponname ) )
            {
                superweaponname = "super_default_mp";
            }
            
            superweapon = makeweapon( superweaponname );
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                entindex = level.var_97e88aefcade05 % level.characters.size;
                ent = level.characters[ entindex ];
                level.var_97e88aefcade05++;
                
                if ( !isbot( ent ) || !isalive( ent ) || ent.sessionstate != "playing" )
                {
                    continue;
                }
                
                ent scripts\mp\perks\perkpackage::perkpackage_givedebug( super, blueprintindex );
                
                if ( isdefined( ent.super ) )
                {
                    if ( !isnullweapon( superweapon ) && superweapon.basename != "super_default_mp" )
                    {
                        ent giveandfireoffhandreliable( superweapon );
                    }
                    
                    ent thread scripts\mp\supers::trysuperusebegin( superweapon );
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1713e
// Size: 0x10d
function function_9a2083c197d32f9e()
{
    while ( true )
    {
        equipment = getdvar( @"hash_c1fa6ab185f57dc3", "" );
        
        if ( equipment != "" )
        {
            /#
                setdevdvar( @"hash_c1fa6ab185f57dc3", "<dev string:xca>" );
            #/
            
            equipweaponname = level.equipment.table[ equipment ].weaponname;
            
            if ( isdefined( equipweaponname ) )
            {
                equipweapon = makeweapon( equipweaponname );
                
                foreach ( ent in level.characters )
                {
                    if ( !isbot( ent ) || !isalive( ent ) || ent.sessionstate != "playing" )
                    {
                        continue;
                    }
                    
                    ent giveandfireoffhandreliable( equipweapon );
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17253
// Size: 0xcf
function function_d5f799537d36bf4e()
{
    while ( true )
    {
        perkname = getdvar( @"hash_7395b2297287b659", "" );
        
        if ( perkname != "" )
        {
            /#
                setdevdvar( @"hash_7395b2297287b659", "<dev string:xca>" );
            #/
            
            foreach ( ent in level.characters )
            {
                if ( !isbot( ent ) || !isalive( ent ) || ent.sessionstate != "playing" )
                {
                    continue;
                }
                
                ent giveperk( perkname );
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1732a
// Size: 0x172
function function_7d9b8ef37ebddb09()
{
    while ( true )
    {
        equipment = getdvar( @"hash_35f2aa5b08cbe390", "" );
        
        if ( equipment != "" )
        {
            /#
                setdevdvar( @"hash_35f2aa5b08cbe390", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            if ( !isdefined( level.var_3fcc58693862a700 ) )
            {
                level.var_3fcc58693862a700 = 0;
            }
            
            equipweaponname = level.equipment.table[ equipment ].weaponname;
            
            if ( !isdefined( equipweaponname ) )
            {
                continue;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_3fcc58693862a700 % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_3fcc58693862a700++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team != notbot.team )
                {
                    equipweapon = makeweapon( equipweaponname );
                    character giveandfireoffhandreliable( equipweapon );
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x174a4
// Size: 0x172
function function_15ca34dc96d59650()
{
    while ( true )
    {
        equipment = getdvar( @"hash_85cb9b5fe926bb55", "" );
        
        if ( equipment != "" )
        {
            /#
                setdevdvar( @"hash_85cb9b5fe926bb55", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            if ( !isdefined( level.var_523ee9a874d0430b ) )
            {
                level.var_523ee9a874d0430b = 0;
            }
            
            equipweaponname = level.equipment.table[ equipment ].weaponname;
            
            if ( !isdefined( equipweaponname ) )
            {
                continue;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_523ee9a874d0430b % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_523ee9a874d0430b++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team == notbot.team )
                {
                    equipweapon = makeweapon( equipweaponname );
                    character giveandfireoffhandreliable( equipweapon );
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1761e
// Size: 0x12f
function function_b8ff61b0eed9e1db()
{
    while ( true )
    {
        perk = getdvar( @"hash_68b0dc2de0ced92c", "" );
        
        if ( perk != "" )
        {
            /#
                setdevdvar( @"hash_68b0dc2de0ced92c", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            if ( !isdefined( level.var_6b3f8a4ff44a6070 ) )
            {
                level.var_6b3f8a4ff44a6070 = 0;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_6b3f8a4ff44a6070 % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_6b3f8a4ff44a6070++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team != notbot.team )
                {
                    character giveperk( perk );
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17755
// Size: 0x12f
function function_ff4d7a373beb6344()
{
    while ( true )
    {
        perk = getdvar( @"hash_34b71cf25a6f1703", "" );
        
        if ( perk != "" )
        {
            /#
                setdevdvar( @"hash_34b71cf25a6f1703", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            if ( !isdefined( level.var_5415cc0e0e574fa1 ) )
            {
                level.var_5415cc0e0e574fa1 = 0;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_5415cc0e0e574fa1 % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_5415cc0e0e574fa1++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team != notbot.team )
                {
                    character giveperk( perk );
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1788c
// Size: 0x18b
function function_8c8836efc7900575()
{
    while ( true )
    {
        powerup = getdvar( @"hash_6b8184e328167315", "" );
        
        if ( powerup != "" )
        {
            /#
                setdevdvar( @"hash_6b8184e328167315", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            equipweaponname = undefined;
            
            if ( powerup == "force_field_2" )
            {
                equipweaponname = level.equipment.table[ "equip_mutation_shield" ].weaponname;
            }
            
            if ( !isdefined( level.var_15f6880d938e8a28 ) )
            {
                level.var_15f6880d938e8a28 = 0;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_15f6880d938e8a28 % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_15f6880d938e8a28++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team != notbot.team )
                {
                    character namespace_dfe80adf32f5c14a::apply_powerup( powerup );
                    
                    if ( isdefined( equipweaponname ) )
                    {
                        waitframe();
                        equipweapon = makeweapon( equipweaponname );
                        character giveandfireoffhandreliable( equipweapon );
                    }
                    
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a1f
// Size: 0x18b
function function_c908e940d73342cc()
{
    while ( true )
    {
        powerup = getdvar( @"hash_9bc47722d769a158", "" );
        
        if ( powerup != "" )
        {
            /#
                setdevdvar( @"hash_9bc47722d769a158", "<dev string:xca>" );
            #/
            
            notbot = function_50dec82e76fa3cb6();
            
            if ( !isdefined( notbot ) )
            {
                return;
            }
            
            equipweaponname = undefined;
            
            if ( powerup == "force_field_2" )
            {
                equipweaponname = level.equipment.table[ "equip_mutation_shield" ].weaponname;
            }
            
            if ( !isdefined( level.var_541bddafd54ec7cf ) )
            {
                level.var_541bddafd54ec7cf = 0;
            }
            
            for (var_3b7bea3004fd87b7 = 0; var_3b7bea3004fd87b7 < level.characters.size; var_3b7bea3004fd87b7++) {
                characterindex = level.var_541bddafd54ec7cf % level.characters.size;
                character = level.characters[ characterindex ];
                level.var_541bddafd54ec7cf++;
                
                if ( isdefined( character ) && isbot( character ) && isalive( character ) && character.sessionstate == "playing" && character.team != notbot.team )
                {
                    character namespace_dfe80adf32f5c14a::apply_powerup( powerup );
                    
                    if ( isdefined( equipweaponname ) )
                    {
                        waitframe();
                        equipweapon = makeweapon( equipweaponname );
                        character giveandfireoffhandreliable( equipweapon );
                    }
                    
                    break;
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17bb2
// Size: 0x79
function function_50dec82e76fa3cb6()
{
    notbot = level.players[ 0 ];
    
    foreach ( player in level.players )
    {
        if ( !isbot( player ) && !istestclient( player ) )
        {
            return player;
        }
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c33
// Size: 0x11b
function function_25df3bae5ec9502c()
{
    while ( true )
    {
        killstreakref = getdvar( @"hash_20c7a16d77382d2b", "" );
        
        if ( killstreakref != "" )
        {
            /#
                setdevdvar( @"hash_20c7a16d77382d2b", "<dev string:xca>" );
            #/
            
            if ( isdefined( killstreakref ) && killstreakref != "" )
            {
                foreach ( ent in level.characters )
                {
                    if ( !isbot( ent ) || !isalive( ent ) || ent.sessionstate != "playing" )
                    {
                        continue;
                    }
                    
                    streakname = killstreakref;
                    streaksetupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo( streakname );
                    
                    if ( isdefined( streaksetupinfo ) && getkillstreakindex( streakname ) != -1 )
                    {
                        ent scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "other" );
                        ent scripts\mp\killstreaks\killstreaks::forceactivategimmekillstreak();
                    }
                }
            }
        }
        
        wait 0.25;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d56
// Size: 0x69
function devfindhost()
{
    hostplayer = undefined;
    
    foreach ( player in level.players )
    {
        if ( player ishost() )
        {
            hostplayer = player;
            break;
        }
    }
    
    return hostplayer;
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dc8
// Size: 0x2a
function watchlethaldelaycancel()
{
    while ( true )
    {
        if ( getdvarint( @"hash_6d6e240a9ede976e", 0 ) )
        {
            scripts\mp\equipment::cancellethaldelay();
            return;
        }
        
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dfa
// Size: 0x2a
function watchsuperdelaycancel()
{
    while ( true )
    {
        if ( getdvarint( @"hash_be71443f47c8632f", 0 ) )
        {
            scripts\mp\supers::cancelsuperdelay();
            return;
        }
        
        wait 1;
    }
}

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e2c
// Size: 0x6d
function watchslowmo()
{
    while ( true )
    {
        if ( getdvar( @"hash_a18e65eb2a8dfec6" ) != "" )
        {
            break;
        }
        
        wait 1;
    }
    
    time = getdvarfloat( @"hash_a18e65eb2a8dfec6" );
    setslowmotion( time, time, 0 );
    
    /#
        setdevdvar( @"hash_a18e65eb2a8dfec6", "<dev string:xca>" );
    #/
    
    thread watchslowmo();
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x17ea1
    // Size: 0x4d, Type: dev
    function function_3b9d5c6466052e2e( ent, radius, color )
    {
        ent endon( "<dev string:xb69>" );
        
        while ( true )
        {
            thread drawsphere( ent.origin, radius, 0.05, color );
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17ef6
    // Size: 0x74, Type: dev
    function function_5a05e17142c56074()
    {
        var_eaab56b615e0b703 = getdvarint( @"hash_21f13701dd027cd9", 0 );
        
        if ( var_eaab56b615e0b703 > 0 )
        {
            level.ball_starts = [];
            level.balls = [];
            level.devball = 1;
            level.ballreset = 0;
            level.satellitecount = 1;
            level.ballpickupscorefrozen = 0;
            setdevdvar( @"hash_21f13701dd027cd9", 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17f72
    // Size: 0x51, Type: dev
    function function_5b1cb8baef2fdc56()
    {
        var_eaab56b615e0b703 = getdvarint( @"hash_d58b0fd6e8a9a1e2", 0 );
        
        if ( var_eaab56b615e0b703 > 0 )
        {
            if ( isdefined( level.setupsoccerball ) )
            {
                level thread [[ level.setupsoccerball ]]();
            }
            
            setdevdvar( @"hash_d58b0fd6e8a9a1e2", 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17fcb
    // Size: 0x267, Type: dev
    function function_ff1ea3e0d41c1878()
    {
        level endon( "<dev string:x101>" );
        
        if ( getdvarint( @"hash_62458b790daf2c44" ) != 0 )
        {
            setdevdvar( @"hash_62458b790daf2c44", 0 );
            player = scripts\mp\gamelogic::gethostplayer();
            
            if ( isdefined( level.var_1b6b55efa67ba7a8 ) )
            {
                var_f36ab59f21d5828c = 1;
                var_8b2ecf7072c2e3b8 = int( 0.333333 );
                offsetfwd = var_8b2ecf7072c2e3b8 * 96;
                offsetlft = var_f36ab59f21d5828c * 48 - 48;
                
                if ( var_8b2ecf7072c2e3b8 % 2 != 0 )
                {
                    offsetlft += 24;
                }
                
                offsetfwd = ter_op( isdefined( offsetfwd ), offsetfwd, 0 );
                offsetlft = ter_op( isdefined( offsetlft ), offsetlft, 0 );
                fwd = anglestoforward( player.angles ) * ( 72 + offsetfwd ) + ( 0, 0, 48 );
                lft = anglestoleft( player.angles ) * offsetlft;
                target = player.origin + fwd + lft;
                result = player.origin + fwd + lft;
                spawnang = ( 0, player getplayerangles( 1 )[ 1 ] + 180, 0 );
                angles = ( 0, 30, 0 );
                up = anglestoup( angles );
                forward = anglestoforward( angles );
                force = up * 500 + ( 0, 0, 80 );
                
                foreach ( ball in level.var_1b6b55efa67ba7a8 )
                {
                    ball.visuals.origin = result + ( 0, 0, 18 );
                    ball.visuals physicslaunchserver( ball.visuals.origin, force );
                    
                    if ( isdefined( ball.var_5c83a6b4c46d2ff5 ) )
                    {
                        ball [[ ball.var_5c83a6b4c46d2ff5 ]]();
                    }
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1823a
    // Size: 0x70, Type: dev
    function function_5b12f5872c82005c()
    {
        giveemp = getdvarint( @"hash_35721bc6b305545e", 0 );
        
        if ( giveemp > 0 )
        {
            setdevdvar( @"hash_35721bc6b305545e", 0 );
            level.cyberemp.carrier = level.players[ 0 ];
            level.cyberemp scripts\mp\gameobjects::setpickedup( level.players[ 0 ] );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x182b2
    // Size: 0x3d, Type: dev
    function function_cc940c3c7c1a71da()
    {
        var_c5f9e0497cb8428d = getdvarint( @"hash_68576d3cfbb31217", 0 );
        
        if ( var_c5f9e0497cb8428d > 0 )
        {
            setdevdvar( @"hash_68576d3cfbb31217", 0 );
            scripts\cp_mp\utility\callback_group::callback_test();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x182f7
    // Size: 0x130, Type: dev
    function function_ab139aa828ef1bfc()
    {
        self endon( "<dev string:x273>" );
        level endon( "<dev string:x101>" );
        regen_interval = 0.15;
        self.var_b885a1491839b8a7 = 1;
        
        while ( true )
        {
            if ( getdvarint( @"scr_ammoregen" ) == 0 )
            {
                self.var_b885a1491839b8a7 = undefined;
                break;
            }
            
            foreach ( weapon in self.equippedweapons )
            {
                if ( !isnullweapon( weapon ) )
                {
                    ammostock = self getweaponammostock( weapon );
                    self setweaponammostock( weapon, ammostock + 1 );
                }
            }
            
            currentoffhand = self getcurrentoffhand( "<dev string:x2600>" );
            
            if ( !isnullweapon( currentoffhand ) )
            {
                currentammo = self getweaponammoclip( currentoffhand );
                self setweaponammoclip( currentoffhand, currentammo + 1 );
            }
            
            currentoffhand = self getcurrentoffhand( "<dev string:x2612>" );
            
            if ( !isnullweapon( currentoffhand ) )
            {
                currentammo = self getweaponammoclip( currentoffhand );
                self setweaponammoclip( currentoffhand, currentammo + 1 );
            }
            
            wait regen_interval;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1842f
    // Size: 0x2a1, Type: dev
    function function_ec09f2eb328e9346()
    {
        setdevdvarifuninitialized( @"scr_testshock", 0 );
        setdevdvarifuninitialized( @"hash_bae3e845f30eef22", "<dev string:xca>" );
        setdevdvarifuninitialized( @"hash_f72d0a271da2c57", 0 );
        level.var_2e493ef4d1e81b8 = "<dev string:x2626>";
        level.var_2a171f9e88af7947 = [];
        level.var_4b0847dcbc8d8d5 = [];
        level.var_f96621d32c3c0c82 = [];
        level.var_da36f9d75dc3ea3c = [];
        shockid = "<dev string:x2626>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2635>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x2649>";
        level.var_f96621d32c3c0c82[ shockid ] = 4;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x2652>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2635>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x2649>";
        level.var_f96621d32c3c0c82[ shockid ] = 6;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x2661>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2675>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x268e>";
        level.var_f96621d32c3c0c82[ shockid ] = 3;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x2696>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2675>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x268e>";
        level.var_f96621d32c3c0c82[ shockid ] = 6;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x26aa>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x26b7>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x26cf>";
        level.var_f96621d32c3c0c82[ shockid ] = 0.5;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x26d6>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x26e3>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x26cf>";
        level.var_f96621d32c3c0c82[ shockid ] = 0.5;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x26fb>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2708>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x26fb>";
        level.var_f96621d32c3c0c82[ shockid ] = 0.5;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
        shockid = "<dev string:x271b>";
        level.var_2a171f9e88af7947[ shockid ] = "<dev string:x2725>";
        level.var_4b0847dcbc8d8d5[ shockid ] = "<dev string:x271b>";
        level.var_f96621d32c3c0c82[ shockid ] = 0.5;
        level.var_da36f9d75dc3ea3c[ shockid ] = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x186d8
    // Size: 0xe2, Type: dev
    function shellshocktest( shockid )
    {
        if ( shockid == "<dev string:xca>" )
        {
            shockid = level.var_2e493ef4d1e81b8;
        }
        
        assertex( isdefined( level.var_2a171f9e88af7947 ), "<dev string:x2738>" );
        assertex( array_contains( getarraykeys( level.var_2a171f9e88af7947 ), shockid ), "<dev string:x276f>" );
        player = scripts\mp\gamelogic::gethostplayer();
        
        if ( !isdefined( player ) )
        {
            return;
        }
        
        if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
        {
            return;
        }
        
        name = level.var_2a171f9e88af7947[ shockid ];
        category = level.var_4b0847dcbc8d8d5[ shockid ];
        duration = level.var_f96621d32c3c0c82[ shockid ];
        interruptdelayms = level.var_da36f9d75dc3ea3c[ shockid ];
        player scripts\cp_mp\utility\shellshock_utility::_shellshock( name, category, duration, undefined, interruptdelayms );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x187c2
    // Size: 0x30, Type: dev
    function function_68eba26864084001()
    {
        player = scripts\mp\gamelogic::gethostplayer();
        
        if ( !isdefined( player ) )
        {
            return;
        }
        
        if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
        {
            return;
        }
        
        scripts\cp_mp\utility\shellshock_utility::_stopshellshock( 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x187fa
    // Size: 0x4b, Type: dev
    function function_6a39ebc23dfaa593( player )
    {
        if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
        {
            return 0;
        }
        
        if ( player isusingremote() )
        {
            return 0;
        }
        
        if ( istrue( player.inlaststand ) )
        {
            return 0;
        }
        
        if ( isdefined( player.vehicle ) )
        {
            return 0;
        }
        
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1884d
    // Size: 0x31, Type: dev
    function function_d0fe65eec3480b8a( vehicletype )
    {
        player = devfindhost();
        
        if ( !isdefined( player ) || !isalive( player ) )
        {
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x18886
    // Size: 0x31, Type: dev
    function function_5359ebb35b7ca1b5( vehicletype )
    {
        player = devfindhost();
        
        if ( !isdefined( player ) || !isalive( player ) )
        {
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x188bf
    // Size: 0x97, Type: dev
    function function_3ee37b5813de0a8a()
    {
        level notify( "<dev string:x95a>" );
        level endon( "<dev string:x95a>" );
        
        while ( true )
        {
            foreach ( player in level.players )
            {
                if ( isdefined( player scripts\mp\supers::getcurrentsuper() ) && !player scripts\mp\supers::issuperready() )
                {
                    player thread scripts\mp\supers::givesuperpoints( player scripts\mp\supers::getsuperpointsneeded(), undefined, 1 );
                }
            }
            
            wait 0.25;
        }
    }

#/

// Namespace dev / scripts\mp\dev
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1895e
// Size: 0xa
function rangefinder()
{
    thread scripts\mp\rangefinder::runmprangefinder();
}

/#

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18970
    // Size: 0xf8, Type: dev
    function function_5b7df3134bc981cd()
    {
        var_7c920286754b0ad1 = 0;
        
        while ( true )
        {
            var_c5e7955047c7609f = getdvarint( @"hash_969cec4a11333d98", 0 );
            
            if ( var_c5e7955047c7609f != var_7c920286754b0ad1 && isdefined( level.player ) )
            {
                attacker = level.players[ 0 ];
                var_7c920286754b0ad1 = var_c5e7955047c7609f;
                
                if ( var_c5e7955047c7609f == 0 )
                {
                    attacker notify( "<dev string:x27a2>" );
                    iprintlnbold( "<dev string:x27b4>" );
                }
                else
                {
                    level.var_4c6da5bcea4fd1ce = spawnstruct();
                    level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
                    level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
                    level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = 0;
                    attacker thread function_9321ed5022d179fc();
                    attacker thread function_6f68d17492fbeb7b();
                    attacker thread function_dc411c6c35f320f0();
                    attacker thread function_9bbf0d7d080c4266();
                    iprintlnbold( "<dev string:x27d1>" );
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18a70
    // Size: 0x13f, Type: dev
    function function_9bbf0d7d080c4266()
    {
        self endon( "<dev string:x27a2>" );
        var_ec82d4e95d4ce45a = 0;
        var_c2113f639fe7bc2c = 0;
        numkills = 0;
        
        while ( true )
        {
            if ( isdefined( level.var_4c6da5bcea4fd1ce ) )
            {
                if ( isdefined( level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c ) )
                {
                    numkills = level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c.size;
                }
                
                if ( isdefined( level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a ) )
                {
                    var_ec82d4e95d4ce45a = level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a;
                }
                
                if ( isdefined( level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c ) )
                {
                    var_c2113f639fe7bc2c = level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c;
                }
            }
            
            printtoscreen2d( 500, 170, "<dev string:x27ed>" + string( var_ec82d4e95d4ce45a ), ( 1, 1, 1 ), 2 );
            printtoscreen2d( 500, 200, "<dev string:x27fc>" + string( var_c2113f639fe7bc2c ), ( 1, 1, 1 ), 2 );
            printtoscreen2d( 500, 230, "<dev string:x2813>" + string( numkills ), ( 1, 1, 1 ), 2 );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18bb7
    // Size: 0x170, Type: dev
    function function_9321ed5022d179fc()
    {
        self endon( "<dev string:x27a2>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2828>", victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc );
            
            if ( !isdefined( victim.var_4c6da5bcea4fd1ce ) )
            {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
            
            if ( !isalive( victim ) && isdefined( victim.var_4c6da5bcea4fd1ce ) )
            {
                ttk = float( gettime() - victim.var_4c6da5bcea4fd1ce.time ) / 1000;
                level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a = ttk;
                print3d( victim.origin + ( 0, 0, 14 ), "<dev string:x283a>" + string( ttk ) + "<dev string:x2843>", ( 1, 0.843, 0 ), 1, 0.5, 400, 1 );
                level notify( "<dev string:x2848>" );
                victim.var_4c6da5bcea4fd1ce = undefined;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18d2f
    // Size: 0x6e, Type: dev
    function function_6f68d17492fbeb7b()
    {
        self endon( "<dev string:x27a2>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2859>", victim, inflictor );
            
            if ( !isdefined( victim.var_4c6da5bcea4fd1ce ) )
            {
                var_4c6da5bcea4fd1ce = spawnstruct();
                var_4c6da5bcea4fd1ce.time = gettime();
                victim.var_4c6da5bcea4fd1ce = var_4c6da5bcea4fd1ce;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18da5
    // Size: 0xc4, Type: dev
    function function_dc411c6c35f320f0()
    {
        self endon( "<dev string:x27a2>" );
        var_165c80293172d9af = 0;
        var_3cd3c0a57e9a1d79 = 0;
        var_b81fd881e830b135 = 1;
        
        while ( true )
        {
            if ( var_b81fd881e830b135 )
            {
                level notify( "<dev string:x2871>" );
                level.player thread function_6935c6ac9f722579();
                var_b81fd881e830b135 = 0;
            }
            
            if ( level.player isswitchingweapon() && !var_165c80293172d9af )
            {
                var_b81fd881e830b135 = 1;
                var_165c80293172d9af = 1;
            }
            else if ( !level.player isswitchingweapon() )
            {
                var_165c80293172d9af = 0;
            }
            
            if ( !isalive( level.player ) && !var_3cd3c0a57e9a1d79 )
            {
                var_b81fd881e830b135 = 1;
                var_3cd3c0a57e9a1d79 = 1;
            }
            else if ( isalive( level.player ) )
            {
                var_3cd3c0a57e9a1d79 = 0;
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18e71
    // Size: 0xbe, Type: dev
    function function_6935c6ac9f722579()
    {
        self endon( "<dev string:x27a2>" );
        level endon( "<dev string:x2871>" );
        level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = 0;
        level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c = [];
        
        while ( true )
        {
            level waittill( "<dev string:x2848>" );
            level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c[ level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c.size ] = level.var_4c6da5bcea4fd1ce.var_ec82d4e95d4ce45a;
            level.var_4c6da5bcea4fd1ce.var_c2113f639fe7bc2c = limitdecimalplaces( array_average( level.var_4c6da5bcea4fd1ce.var_a8017c8c3aa1f71c ), 3 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18f37
    // Size: 0xa1, Type: dev
    function watchdam()
    {
        var_95df9885ccb51576 = 0;
        
        while ( true )
        {
            var_dfc1ff4f9fcc5c60 = getdvarint( @"hash_81d89e4abec64203", 0 );
            
            if ( var_dfc1ff4f9fcc5c60 != var_95df9885ccb51576 )
            {
                attacker = level.players[ 0 ];
                var_95df9885ccb51576 = var_dfc1ff4f9fcc5c60;
                
                if ( var_dfc1ff4f9fcc5c60 == 0 )
                {
                    attacker notify( "<dev string:x2882>" );
                    iprintlnbold( "<dev string:x2894>" );
                }
                else
                {
                    attacker = level.players[ 0 ];
                    attacker thread function_7dad5750cfa24677();
                    attacker thread function_6e116b48adc0bbe();
                    attacker thread function_ec6f7076f4834d47();
                    iprintlnbold( "<dev string:x28b2>" );
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18fe0
    // Size: 0x192, Type: dev
    function function_ec6f7076f4834d47()
    {
        self endon( "<dev string:x2882>" );
        dam = 0;
        totaldam = 0;
        btk = 0;
        
        while ( true )
        {
            if ( isdefined( level.currentvictim ) && isdefined( level.currentvictim.damdata ) )
            {
                if ( isdefined( level.currentvictim.damdata.dam ) )
                {
                    dam = level.currentvictim.damdata.dam;
                }
                
                if ( isdefined( level.currentvictim.damdata.totaldam ) )
                {
                    totaldam = level.currentvictim.damdata.totaldam;
                }
                
                if ( isdefined( level.currentvictim.damdata.btk ) )
                {
                    btk = level.currentvictim.damdata.btk;
                }
            }
            
            printtoscreen2d( 900, 170, "<dev string:x28cf>" + string( dam ), ( 1, 0, 1 ), 2 );
            printtoscreen2d( 900, 200, "<dev string:x28d8>" + string( totaldam ), ( 1, 0.843, 0 ), 2 );
            printtoscreen2d( 900, 230, "<dev string:x28e7>" + string( btk ), ( 1, 0.843, 0 ), 2 );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1917a
    // Size: 0x83, Type: dev
    function function_7dad5750cfa24677()
    {
        self endon( "<dev string:x2882>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2828>", victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc );
            function_5c3b4e1eb3b441e3( victim, damage );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19205
    // Size: 0x45, Type: dev
    function function_6e116b48adc0bbe()
    {
        self endon( "<dev string:x2882>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2859>", victim, inflictor, damage );
            function_5c3b4e1eb3b441e3( victim, damage );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x19252
    // Size: 0x141, Type: dev
    function function_5c3b4e1eb3b441e3( victim, damage )
    {
        level.currentvictim = victim;
        
        if ( !isdefined( victim.damdata ) || victim.damdata.isalive == 0 )
        {
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
        
        if ( !isalive( victim ) && isdefined( victim.damdata ) )
        {
            victim.damdata.isalive = 0;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1939b
    // Size: 0xe4, Type: dev
    function function_acb7b4db275ee5f6()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_5d008081f52285c9", 0 ) == 1 && isdefined( level.player ) )
            {
                vel = level.player getvelocity();
                speed = length( vel );
                speedmph = ips_to_mph( speed );
                printtoscreen2d( 500, 260, "<dev string:x28f6>" + string( vel ), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 500, 290, "<dev string:x291d>" + string( speed ), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 500, 320, "<dev string:x2945>" + string( speedmph ), ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19487
    // Size: 0xeb, Type: dev
    function function_779046ca435993c5()
    {
        var_8d32861235d6abf4 = 0;
        sprintouttime = 0;
        var_36c0cc10f71ec417 = 0;
        var_4afc631e4ece9194 = 0;
        
        while ( true )
        {
            if ( getdvarint( @"hash_e8bf0eb1142e2bf0", 0 ) == 1 && isdefined( level.player ) )
            {
                if ( var_36c0cc10f71ec417 )
                {
                    if ( level.player attackbuttonpressed() )
                    {
                        var_4afc631e4ece9194 = 1;
                        var_8d32861235d6abf4 = gettime();
                    }
                }
                
                if ( level.player issprinting() )
                {
                    var_36c0cc10f71ec417 = 1;
                }
                else
                {
                    var_36c0cc10f71ec417 = 0;
                }
                
                if ( var_4afc631e4ece9194 && level.player isshooting() )
                {
                    sprintouttime = gettime() - var_8d32861235d6abf4;
                    sprintouttime /= 1000;
                    var_4afc631e4ece9194 = 0;
                }
                
                printtoscreen2d( 500, 350, "<dev string:x296a>" + string( sprintouttime ), ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1957a
    // Size: 0xe0, Type: dev
    function function_d7f6ef4be35f5827()
    {
        var_9cc56f74c62a0738 = 0;
        var_9cafac4d5323915a = 0;
        var_5c3edc0ae7852f7d = 1;
        var_b7de80ac7c3f093c = 0;
        
        while ( true )
        {
            if ( getdvarint( @"hash_debd4bed61a9b4dc", 0 ) == 1 && isdefined( level.player ) )
            {
                if ( level.player playerads() == 0 )
                {
                    var_5c3edc0ae7852f7d = 1;
                    var_b7de80ac7c3f093c = 0;
                }
                else if ( var_5c3edc0ae7852f7d )
                {
                    var_5c3edc0ae7852f7d = 0;
                    var_9cc56f74c62a0738 = gettime();
                }
                
                if ( level.player playerads() == 1 && !var_b7de80ac7c3f093c )
                {
                    var_9cafac4d5323915a = gettime() - var_9cc56f74c62a0738;
                    var_9cafac4d5323915a /= 1000;
                    var_b7de80ac7c3f093c = 1;
                }
                
                printtoscreen2d( 500, 380, "<dev string:x2985>" + string( var_9cafac4d5323915a ), ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19662
    // Size: 0xc7, Type: dev
    function watchreloadtime()
    {
        initreloadtime = 0;
        reloadtime = 0;
        var_8e999d0af5ad231a = 0;
        
        while ( true )
        {
            if ( getdvarint( @"hash_4fea842213b31f9b", 0 ) == 1 && isdefined( level.player ) )
            {
                if ( level.player isreloading() && !var_8e999d0af5ad231a )
                {
                    initreloadtime = gettime();
                    var_8e999d0af5ad231a = 1;
                }
                
                if ( !level.player isreloading() && var_8e999d0af5ad231a )
                {
                    reloadtime = gettime() - initreloadtime;
                    reloadtime /= 1000;
                    var_8e999d0af5ad231a = 0;
                }
                
                printtoscreen2d( 500, 410, "<dev string:x29a0>" + string( reloadtime ), ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19731
    // Size: 0xd9, Type: dev
    function function_ccc79f6ad0886c32()
    {
        level.targetdistance = 0;
        level.var_e8ac24aee14f09cd = 0;
        var_d1678cffa85440f5 = 0;
        
        while ( true )
        {
            if ( getdvarint( @"hash_11544fe0c704e8fd", 0 ) == 1 && isdefined( level.player ) )
            {
                level.player thread function_432e1da02f439de6();
                var_d1678cffa85440f5 = 1;
                printtoscreen2d( 500, 440, "<dev string:x29b7>" + string( level.targetdistance ), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 500, 470, "<dev string:x29d3>" + string( level.var_e8ac24aee14f09cd ), ( 1, 1, 1 ), 2 );
            }
            else if ( var_d1678cffa85440f5 )
            {
                level notify( "<dev string:x29f3>" );
                var_d1678cffa85440f5 = 0;
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19812
    // Size: 0xd7, Type: dev
    function function_432e1da02f439de6()
    {
        level endon( "<dev string:x29f3>" );
        
        while ( true )
        {
            self waittill( "<dev string:x2828>", victim, inflictor, damage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc );
            iprintlnbold( "<dev string:x2a10>" );
            playerorigin = level.player getorigin();
            targetorigin = victim getorigin();
            targetdistance = distance( playerorigin, targetorigin );
            level.targetdistance = targetdistance;
            level.var_e8ac24aee14f09cd = targetdistance / 39.37;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x198f1
    // Size: 0xca, Type: dev
    function function_4a576a04af06482a()
    {
        currentdvar = getdvarint( @"hash_4209eaa327e6b853" );
        
        while ( true )
        {
            if ( currentdvar != getdvarint( @"hash_4209eaa327e6b853" ) )
            {
                currentdvar = getdvarint( @"hash_4209eaa327e6b853" );
                
                foreach ( player in level.players )
                {
                    if ( isbot( player ) )
                    {
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
    // Checksum 0x0, Offset: 0x199c3
    // Size: 0x80, Type: dev
    function function_ee83a7b078f9aa0c()
    {
        while ( true )
        {
            level waittill( "<dev string:xdc4>", player );
            botmaxhealth = getdvarint( @"hash_4209eaa327e6b853" );
            
            if ( isbot( player ) && botmaxhealth )
            {
                player.maxhealth = getdvarint( @"hash_4209eaa327e6b853" );
                player.health = level.var_2efd8d3f18225429.maxhealth;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19a4b
    // Size: 0x114, Type: dev
    function function_ee00d21057357790()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_d1415bb7a04b48f9" ) == 1 && isdefined( level.player ) )
            {
                currentweapon = level.player getcurrentweapon();
                attachments = currentweapon.attachments;
                default_attachments = function_6527364c1ecca6c6( currentweapon );
                printtoscreen2d( 1000, 500, "<dev string:x2a20>", ( 1, 1, 1 ), 2 );
                i = 0;
                
                foreach ( attachment in attachments )
                {
                    if ( arraycontains( default_attachments, attachment ) )
                    {
                        attachment += "<dev string:x2a35>";
                    }
                    
                    printtoscreen2d( 1000, 530 + 30 * i, attachment, ( 1, 1, 1 ), 2 );
                    i++;
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19b67
    // Size: 0x54, Type: dev
    function function_97d547438038e8bb()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_a59b8462ed17fe6e" ) == 1 )
            {
                currentweapon = level.player getcurrentweapon();
                function_59ad1d1f7e6a7771( currentweapon );
                setdvar( @"hash_a59b8462ed17fe6e", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x19bc3
    // Size: 0xbf, Type: dev
    function function_59ad1d1f7e6a7771( weapon )
    {
        if ( !isweapon( weapon ) )
        {
            return;
        }
        
        attachments = weapon.attachments;
        filenum = openfile( "<dev string:x2a43>", "<dev string:x1e88>" );
        fprintln( filenum, weapon.basename );
        
        foreach ( attachment in attachments )
        {
            fprintln( filenum, "<dev string:x2a5d>" + attachment );
        }
        
        closefile( filenum );
        
        /#
            iprintln( "<dev string:x2a62>" );
        #/
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19c8a
    // Size: 0x131, Type: dev
    function function_14ebebd30eb1a6df()
    {
        level.var_3246cb2506b3080b = 0;
        
        while ( true )
        {
            if ( !level.var_3246cb2506b3080b && getdvarint( @"hash_53f9e61fbb5d9c84", 0 ) == 1 )
            {
                foreach ( player in level.players )
                {
                    if ( isai( player ) )
                    {
                        continue;
                    }
                    
                    player showminimap();
                }
                
                level.var_3246cb2506b3080b = 1;
            }
            else if ( level.var_3246cb2506b3080b && getdvarint( @"hash_53f9e61fbb5d9c84", 0 ) == 0 )
            {
                foreach ( player in level.players )
                {
                    if ( isai( player ) )
                    {
                        continue;
                    }
                    
                    player hideminimap( 1 );
                }
                
                level.var_3246cb2506b3080b = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x19dc3
    // Size: 0x74, Type: dev
    function function_dfb2ff04c76410f7( navpoints, color, heightoffset )
    {
        if ( !isdefined( navpoints ) || navpoints.size == 0 )
        {
            return;
        }
        
        if ( !isdefined( heightoffset ) )
        {
            heightoffset = 0;
        }
        
        offsetvec = ( 0, 0, heightoffset );
        
        for (i = 0; i < navpoints.size - 1; i++) {
            line( navpoints[ i ] + offsetvec, navpoints[ i + 1 ] + offsetvec, color );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19e3f
    // Size: 0xa6, Type: dev
    function function_173bf4a6910bc50e()
    {
        owner = devfindhost();
        
        if ( !owner scripts\cp_mp\utility\player_utility::_isalive() )
        {
            return;
        }
        
        position = owner.origin + ( 0, 0, 1000 );
        angles = owner.angles * ( 0, 1, 0 );
        thread scripts\cp_mp\killstreaks\airdrop::dropkillstreakcratefromscriptedheli( undefined, undefined, "<dev string:x4ec>", owner.origin, owner.origin, owner.angles + ( 0, 180, 0 ) );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19eed
    // Size: 0x6e, Type: dev
    function function_3e03b6f03515de77()
    {
        var_35d69a3d8ab30930 = 0;
        
        while ( true )
        {
            stickydvar = getdvarint( @"hash_b2e9bf0017ceeeae", 0 );
            
            if ( stickydvar && !istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2ab6>" );
                var_35d69a3d8ab30930 = 1;
            }
            else if ( !stickydvar && istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2aca>" );
                var_35d69a3d8ab30930 = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19f63
    // Size: 0x6e, Type: dev
    function function_b7a87d570052a0ba()
    {
        var_35d69a3d8ab30930 = 0;
        
        while ( true )
        {
            lockondvar = getdvarint( @"hash_10368af4dee3ba2c", 0 );
            
            if ( lockondvar && !istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2adf>" );
                var_35d69a3d8ab30930 = 1;
            }
            else if ( !lockondvar && istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2af6>" );
                var_35d69a3d8ab30930 = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19fd9
    // Size: 0x6e, Type: dev
    function function_90f098bb7de552ee()
    {
        var_35d69a3d8ab30930 = 0;
        
        while ( true )
        {
            animtypedvar = getdvarint( @"hash_a59a7da9fa17c00", 0 );
            
            if ( animtypedvar && !istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2b0e>" );
                var_35d69a3d8ab30930 = 1;
            }
            else if ( !animtypedvar && istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2b2a>" );
                var_35d69a3d8ab30930 = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a04f
    // Size: 0x6e, Type: dev
    function function_fc3b9cb52d62febf()
    {
        var_35d69a3d8ab30930 = 0;
        
        while ( true )
        {
            crashtypedvar = getdvarint( @"hash_302d41b2b6f9d002", 0 );
            
            if ( crashtypedvar && !istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2b46>" );
                var_35d69a3d8ab30930 = 1;
            }
            else if ( !crashtypedvar && istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( "<dev string:x2b5d>" );
                var_35d69a3d8ab30930 = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a0c5
    // Size: 0x11e, Type: dev
    function function_2d4f449ebc34bccc()
    {
        setdevdvarifuninitialized( @"hash_873b7ff40bb2a37e", 0 );
        setdevdvarifuninitialized( @"hash_5fbef6e1f0b6624c", 0 );
        level thread function_6c3ff8a589d13e3f( @"hash_5fbef6e1f0b6624c", 0, "<dev string:x2b77>", "<dev string:x2b90>" );
        level thread function_6c3ff8a589d13e3f( @"hash_2c01d701bac5d9d3", 0, "<dev string:x2baa>", "<dev string:x2bca>" );
        level thread function_6c3ff8a589d13e3f( @"hash_920f0586653a26d4", 0, "<dev string:x2beb>", "<dev string:x2c06>" );
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
    // Checksum 0x0, Offset: 0x1a1eb
    // Size: 0x51, Type: dev
    function function_b6744aebc11bdcb6()
    {
        level thread function_90f098bb7de552ee();
        level thread function_fc3b9cb52d62febf();
        level thread function_6c3ff8a589d13e3f( @"hash_9a9f1499825922aa", 0, "<dev string:x2c22>", "<dev string:x2c3d>" );
        level thread function_6c3ff8a589d13e3f( @"hash_cc9d9505b48bc357", 0, "<dev string:x2c59>", "<dev string:x2c73>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a244
    // Size: 0x5d, Type: dev
    function function_94c9f97944d54439()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_35e0e06e57d92306", 0, "<dev string:x2c8d>", "<dev string:x2c9e>" );
        level thread function_6c3ff8a589d13e3f( @"hash_aff3efc76e4dfeb2", 1, "<dev string:x2cb0>", "<dev string:x2cc4>" );
        level thread function_6c3ff8a589d13e3f( @"hash_7943c6ec7e44f87c", 0, "<dev string:x2cd9>", "<dev string:x2cfd>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a2a9
    // Size: 0x27, Type: dev
    function function_6ce7fcf80004a952()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_ac7f6a636682c52f", 0, "<dev string:x2d1e>", "<dev string:x2d34>", "<dev string:x2d4b>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a2d8
    // Size: 0x3f, Type: dev
    function function_97d7c7dc0e0c5869()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_91f047e0dec87b64", 0, "<dev string:x2d59>", "<dev string:x2d6e>" );
        level thread function_6c3ff8a589d13e3f( @"hash_fd16625ce7800c7e", 0, "<dev string:x2d84>", "<dev string:x2d97>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a31f
    // Size: 0x4d, Type: dev
    function function_aabbe914f9b10b07()
    {
        level thread function_3e03b6f03515de77();
        level thread function_6c3ff8a589d13e3f( @"hash_7acaaf8f4063ab02", 0, "<dev string:x2dab>", "<dev string:x2dc0>", "<dev string:x2dd5>" );
        level thread function_6c3ff8a589d13e3f( @"hash_a62fccdf77b23d67", 0, "<dev string:x2ded>", "<dev string:x2dfe>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a374
    // Size: 0x3f, Type: dev
    function function_947590e525e1f678()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_b72a0bb47130fb8e", 0, "<dev string:x2e10>", "<dev string:x2e27>" );
        level thread function_6c3ff8a589d13e3f( @"hash_51c63714caa01867", 0, "<dev string:x2e3f>", "<dev string:x2e58>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a3bb
    // Size: 0x5c, Type: dev
    function function_2f38117f9f0a3fdd()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_48714771f0d0b941", 0, "<dev string:x2e72>", "<dev string:x2e8f>" );
        level thread function_6c3ff8a589d13e3f( @"hash_de4ffc2e910521a1", 0, "<dev string:x2ead>", "<dev string:x2ece>" );
        level thread function_6c3ff8a589d13e3f( @"hash_125a1951df8627f5", 0, "<dev string:x2ef0>", "<dev string:x2f0b>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a41f
    // Size: 0x48, Type: dev
    function function_9dd2352219023ba2()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_3f1bd355bf340abb", 0, "<dev string:x2f27>", "<dev string:x2f44>" );
        level thread function_6c3ff8a589d13e3f( @"hash_4f7da19a233d6916", 0, "<dev string:x2f62>", "<dev string:x2f8a>" );
        level thread function_ffaafbb33f34f115();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a46f
    // Size: 0x3f, Type: dev
    function function_d3160ff8e89b90fc()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_7ea8f7418e6bf019", 0, "<dev string:x2fb3>", "<dev string:x2fd7>" );
        level thread function_6c3ff8a589d13e3f( @"hash_9564fda23c9d6dbd", 0, "<dev string:x2ff7>", "<dev string:x300f>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a4b6
    // Size: 0x3f, Type: dev
    function function_fb68070162b65898()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_f91acea7f6a68742", 0, "<dev string:x3028>", "<dev string:x303e>" );
        level thread function_6c3ff8a589d13e3f( @"hash_189e3806377f69dc", 0, "<dev string:x3055>", "<dev string:x3069>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a4fd
    // Size: 0x5c, Type: dev
    function function_c4cf61b73e0e7f4b()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_b23e7bb60bbe76a6", 0, "<dev string:x307e>", "<dev string:x3094>" );
        level thread function_6c3ff8a589d13e3f( @"hash_7d1382405485d79f", 0, "<dev string:x30ab>", "<dev string:x30c1>" );
        level thread function_6c3ff8a589d13e3f( @"hash_4ec1877ac00842c0", 0, "<dev string:x30d8>", "<dev string:x30fd>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a561
    // Size: 0x3f, Type: dev
    function function_a422e4b84d2a008a()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_c9bd691ce96079ac", 0, "<dev string:x3123>", "<dev string:x313e>" );
        level thread function_6c3ff8a589d13e3f( @"hash_e19e5d308effeda3", 0, "<dev string:x315a>", "<dev string:x316e>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a5a8
    // Size: 0x22, Type: dev
    function function_63036f1c49e5239a()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_30dee5c8d013379b", 0, "<dev string:x3182>", "<dev string:x3199>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a5d2
    // Size: 0x5c, Type: dev
    function function_45f8a3d0ce450808()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_f8c88d9bcfa63da3", 0, "<dev string:x31b1>", "<dev string:x31ca>" );
        level thread function_6c3ff8a589d13e3f( @"hash_e9159b47fbb642af", 0, "<dev string:x31e4>", "<dev string:x3200>" );
        level thread function_6c3ff8a589d13e3f( @"hash_94edbe8b5c5b8dd0", 0, "<dev string:x321d>", "<dev string:x3237>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a636
    // Size: 0x3f, Type: dev
    function function_dcd7126d6585b53c()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_b1fa07a51b801b6b", 0, "<dev string:x3252>", "<dev string:x3268>" );
        level thread function_6c3ff8a589d13e3f( @"hash_8a48b9267ed26d75", 0, "<dev string:x327f>", "<dev string:x3299>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a67d
    // Size: 0x22, Type: dev
    function function_38a3bff9ddb7ebfc()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_604652367665c1e0", 0, "<dev string:x32b3>", "<dev string:x32c7>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a6a7
    // Size: 0x22, Type: dev
    function function_2d780f27da8e6d91()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_a34a2f5a7d33e3bb", 0, "<dev string:x32dc>", "<dev string:x32f5>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a6d1
    // Size: 0x22, Type: dev
    function function_1f739dbb5568c8dc()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_7a4ebc4260fba96c", 0, "<dev string:x330f>", "<dev string:x331c>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a6fb
    // Size: 0xa3, Type: dev
    function function_6c3ff8a589d13e3f( scriptdvar, var_cc7522b1729707a5, var_7bf3ab514d551fb5, var_418a825a972eb223, optionalnotify )
    {
        level endon( "<dev string:x101>" );
        var_35d69a3d8ab30930 = 0;
        
        while ( true )
        {
            debugdvar = getdvarint( scriptdvar, var_cc7522b1729707a5 );
            
            if ( istrue( debugdvar ) && !istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( var_7bf3ab514d551fb5 );
                var_35d69a3d8ab30930 = 1;
                
                if ( isdefined( optionalnotify ) )
                {
                    level notify( optionalnotify );
                }
            }
            else if ( !istrue( debugdvar ) && istrue( var_35d69a3d8ab30930 ) )
            {
                iprintln( var_418a825a972eb223 );
                var_35d69a3d8ab30930 = 0;
                
                if ( isdefined( optionalnotify ) )
                {
                    level notify( optionalnotify );
                }
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a7a6
    // Size: 0x230, Type: dev
    function function_ffaafbb33f34f115()
    {
        level endon( "<dev string:x101>" );
        level waittill( "<dev string:xdc4>" );
        var_5423995a7effdf68 = @"hash_caba4093ed4a5d5d";
        
        while ( true )
        {
            if ( getdvarint( var_5423995a7effdf68, 0 ) == 1 )
            {
                numbots = 1;
                team = undefined;
                
                foreach ( player in level.players )
                {
                    if ( isdefined( player ) )
                    {
                        team = getotherteam( player.team )[ 0 ];
                        break;
                    }
                }
                
                setdvar( @"hash_12d23346fbacee91", 1 );
                setdvar( @"hash_6ce01b6572751b18", 1 );
                setdvar( @"bot_notarget", 1 );
                level thread [[ level.bot_funcs[ "<dev string:x3329>" ] ]]( numbots, team );
                println( "<dev string:x3337>" );
                level waittill( "<dev string:xdc4>" );
                setdvar( @"hash_1c423b4190c17fda", 1 );
                setdvar( @"hash_57d9d82755a3e076", 1 );
                var_77829ae42fcd6497 = undefined;
                
                foreach ( player in level.players )
                {
                    if ( isbot( player ) )
                    {
                        var_77829ae42fcd6497 = player;
                        break;
                    }
                }
                
                juggconfig = level.juggksglobals.config;
                var_77829ae42fcd6497 scripts\mp\juggernaut::jugg_makejuggernaut( juggconfig );
                var_77829ae42fcd6497 scripts\cp_mp\killstreaks\juggernaut::createjuggobjective();
                var_acf2963740b6f292 = makeweapon( juggconfig.classstruct.loadoutprimary );
                var_77829ae42fcd6497 _giveweapon( var_acf2963740b6f292 );
                var_77829ae42fcd6497 _switchtoweapon( var_acf2963740b6f292 );
                setdvar( var_5423995a7effdf68, 0 );
                juggcontext = var_77829ae42fcd6497.juggcontext;
                var_77829ae42fcd6497 waittill( "<dev string:x14db>" );
                var_77829ae42fcd6497 scripts\cp_mp\killstreaks\juggernaut::cleanupjuggobjective( juggcontext );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a9de
    // Size: 0x46b, Type: dev
    function function_15039377169d3bc()
    {
        level waittill( "<dev string:xdc4>" );
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        while ( true )
        {
            if ( getdvarint( @"hash_aa6b4147be329989" ) != 0 )
            {
                level.var_f6d131f17e81f033 = 1;
                level.exfilactivetimer = getdvarint( @"hash_e448cfb79f133678" );
                level.exfilextracttimer = getdvarint( @"hash_68d66133a48deb9b" );
                level.var_7a17738a1a272721 = [];
                goal = spawn( "<dev string:x335e>", host.origin, 0, 120, 128 );
                level.var_7a17738a1a272721[ level.var_7a17738a1a272721.size ] = goal;
                team = host.team;
                goal.team = team;
                exfilgoalent = spawn( "<dev string:x19e>", goal.origin );
                exfilgoalent.angles = ( 0, 270, 0 );
                exfilgoalent.team = team;
                exfilgoalent.visibleteam = "<dev string:x3370>";
                exfilgoalent.ownerteam = team;
                exfilgoalent.type = "<dev string:xca>";
                droppoint = exfilgoalent.origin;
                contentoverride = scripts\engine\trace::create_contents( 0, 1, 1, 0, 0, 1, 1 );
                ignoreents = [];
                trace = scripts\engine\trace::ray_trace( exfilgoalent.origin + ( 0, 0, 20 ), exfilgoalent.origin - ( 0, 0, 4000 ), ignoreents, contentoverride, 0 );
                
                if ( isplayer( trace[ "<dev string:x171>" ] ) )
                {
                    trace[ "<dev string:x171>" ] = undefined;
                }
                
                if ( isdefined( trace ) )
                {
                    tempangle = randomfloat( 360 );
                    droporigin = trace[ "<dev string:x1ae>" ];
                    forward = ( cos( tempangle ), sin( tempangle ), 0 );
                    forward = vectornormalize( forward - trace[ "<dev string:x3377>" ] * vectordot( forward, trace[ "<dev string:x3377>" ] ) );
                    dropangles = vectortoangles( forward );
                    exfilgoalent.origin = droporigin;
                    exfilgoalent setmodel( "<dev string:x3381>" );
                    exfilgoalent setscriptablepartstate( "<dev string:x339a>", "<dev string:x33a4>" );
                    exfilgoalent playloopsound( "<dev string:x33ab>" );
                }
                
                goal.exfilgoalent = exfilgoalent;
                goal.exfilgoalent.exfilobjid = scripts\mp\objidpoolmanager::requestobjectiveid( 99 );
                
                if ( goal.exfilgoalent.exfilobjid != -1 )
                {
                    objectivestate = "<dev string:x33bf>";
                    scripts\mp\objidpoolmanager::objective_add_objective( goal.exfilgoalent.exfilobjid, objectivestate, goal.origin + ( 0, 0, 60 ) );
                    scripts\mp\objidpoolmanager::objective_set_play_intro( goal.exfilgoalent.exfilobjid, 1 );
                    scripts\mp\objidpoolmanager::objective_set_play_outro( goal.exfilgoalent.exfilobjid, 1 );
                    scripts\mp\objidpoolmanager::objective_playermask_showtoall( goal.exfilgoalent.exfilobjid );
                    self.showworldicon = 1;
                }
                
                goal.exfilgoalent scripts\mp\gameobjects::setobjectivestatusicons( "<dev string:x33ca>", "<dev string:x33e9>", goal.exfilgoalent.exfilobjid );
                objective_sethot( goal.exfilgoalent.exfilobjid, 1 );
                waitframe();
                playfxontag( level.var_3c8617e34ae080b5[ "<dev string:x83>" ], goal.exfilgoalent, "<dev string:xa6a>" );
                exfilactivetime = level.exfilactivetimer;
                wait exfilactivetime;
                goal.exfilnotactive = 0;
                goal notify( "<dev string:x3408>" );
                goal.exfilgoalent scripts\mp\gameobjects::setobjectivestatusicons( "<dev string:x3422>", "<dev string:x33e9>", goal.exfilgoalent.exfilobjid );
                setdevdvar( @"hash_aa6b4147be329989", 0 );
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ae51
    // Size: 0x59, Type: dev
    function function_912799e4f03d89cb()
    {
        foreach ( player in level.players )
        {
            player notify( "<dev string:x3440>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aeb2
    // Size: 0x107, Type: dev
    function function_e89032807455937f()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_1ba5f3b69f0f55b8", 0 ) != 0 )
            {
                if ( !isdefined( level.players ) || !isdefined( level.players[ 0 ] ) )
                {
                    continue;
                }
                
                printtoscreen2d( 500, 500, "<dev string:x3456>" + level.players[ 0 ] getleftstickx(), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 500, 550, "<dev string:x3463>" + level.players[ 0 ] getleftsticky(), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 1000, 500, "<dev string:x3470>" + level.players[ 0 ] getrightstickx(), ( 1, 1, 1 ), 2 );
                printtoscreen2d( 1000, 550, "<dev string:x347d>" + level.players[ 0 ] getrightsticky(), ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1afc1
    // Size: 0x34, Type: dev
    function watchgunsmithdebugui()
    {
        if ( lpcfeaturegated() )
        {
            return;
        }
        
        while ( true )
        {
            level waittill( "<dev string:x348a>", player );
            player thread watchplayergunsmithdebugui();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1affd
    // Size: 0x56, Type: dev
    function watchplayergunsmithdebugui()
    {
        self endon( "<dev string:x273>" );
        
        while ( true )
        {
            self waittill( "<dev string:xe4b>", message, lootid );
            
            if ( message == "<dev string:x3497>" )
            {
                ref = scripts\cp_mp\utility\loot::function_793e8a72cedb8ef3( lootid );
                gui_giveattachment_internal( self, ref );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b05b
    // Size: 0x101, Type: dev
    function function_abe647f24253f963()
    {
        equippedgasmask = 0;
        
        while ( true )
        {
            maskon = getdvarint( @"hash_13631697f8fa7f58", 0 );
            
            if ( maskon )
            {
                if ( !istrue( equippedgasmask ) )
                {
                    foreach ( player in level.players )
                    {
                        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                        {
                            player scripts\cp_mp\gasmask::equipgasmask();
                        }
                    }
                    
                    equippedgasmask = 1;
                }
            }
            else if ( istrue( equippedgasmask ) )
            {
                foreach ( player in level.players )
                {
                    if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
                    {
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
    // Checksum 0x0, Offset: 0x1b164
    // Size: 0xac, Type: dev
    function function_62ce7a6edc4c6ad3()
    {
        self endon( "<dev string:x101>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_7a5e31b62cb508b0" ) != 0 )
            {
                level.teamtweaks[ "<dev string:x34ae>" ].value = 1;
                level.teamtweaks[ "<dev string:x34ae>" ].lastvalue = 1;
                level.teamtweaks[ "<dev string:x34ae>" ].dvar = 1;
                level.maxallowedteamkills = -1;
                level.friendlyfire = 1;
            }
            
            wait 1;
        }
        
        setdevdvar( @"hash_7a5e31b62cb508b0", 0 );
        thread function_62ce7a6edc4c6ad3();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b218
    // Size: 0xfa, Type: dev
    function function_363044d134c760aa()
    {
        println( "<dev string:x34b8>" );
        
        foreach ( root, struct in level.weaponmapdata )
        {
            weaponobj = scripts\cp_mp\weapon::buildweapon( root );
            attachments = getallselectableattachments( weaponobj );
            
            foreach ( attachment in attachments )
            {
                newweaponobj = scripts\mp\weapons::addattachmenttoweapon( weaponobj, attachment );
                
                if ( !isdefined( newweaponobj ) )
                {
                    println( "<dev string:x34e7>" + root + "<dev string:x31a>" + attachment );
                }
            }
            
            waitframe();
        }
        
        println( "<dev string:x34f3>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b31a
    // Size: 0x3f, Type: dev
    function function_43fe9f589d82275d( entry, groupa, groupb )
    {
        return entry == "<dev string:xca>" || entry == "<dev string:x3523>" || entry == groupa || entry == groupb;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b361
    // Size: 0x5b, Type: dev
    function function_2c8878dd66a5fc0c( tablename )
    {
        var_e68f00a90c25941e = [];
        idxcol = 1;
        
        for (attachtitle = tablelookupbyrow( tablename, 0, idxcol ); attachtitle != "<dev string:xca>"; attachtitle = tablelookupbyrow( tablename, 0, idxcol )) {
            var_e68f00a90c25941e[ attachtitle ] = 1;
            idxcol++;
        }
        
        return var_e68f00a90c25941e;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b3c4
    // Size: 0x63, Type: dev
    function function_6da8d8348378d8a2()
    {
        if ( !isdefined( level.var_3b3b12cc96932083 ) )
        {
            level.var_3b3b12cc96932083 = spawnstruct();
        }
        
        while ( true )
        {
            level waittill( "<dev string:x348a>", player );
            
            if ( !isdefined( player.devguiadded ) )
            {
                player thread function_c612857f342fb8a3( player );
                player.devguiadded = 1;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b42f
    // Size: 0x45, Type: dev
    function function_c612857f342fb8a3( player )
    {
        playername = player.name;
        playernum = player getentitynumber();
        
        if ( isdefined( playernum ) )
        {
            player thread setupdevguientries( playername, playernum );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b47c
    // Size: 0x56, Type: dev
    function function_f08f7e7ef0ba1885()
    {
        if ( isdefined( level.var_3b3b12cc96932083 ) )
        {
            level.var_3b3b12cc96932083.ent = undefined;
            level.var_3b3b12cc96932083.name = undefined;
            level.var_3b3b12cc96932083.entnum = undefined;
            iprintln( "<dev string:x3529>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b4da
    // Size: 0x3d, Type: dev
    function function_cb179ef63de05005( slotnumber )
    {
        if ( isdefined( level.var_3b3b12cc96932083 ) )
        {
            level.var_3b3b12cc96932083.killstreakslot = slotnumber;
            iprintln( "<dev string:x3543>" + slotnumber );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b51f
    // Size: 0x59, Type: dev
    function function_68069128fc606a7a( slotnumber )
    {
        if ( slotnumber != 0 && isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            level.var_3b3b12cc96932083.ent function_eb32cbc9ab60a822( level.var_3b3b12cc96932083.killstreakslot );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b580
    // Size: 0x36, Type: dev
    function function_c7bcca7a18e6103c()
    {
        if ( isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            level.var_3b3b12cc96932083.ent scripts\mp\killstreaks\killstreaks::clearkillstreaks();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b5be
    // Size: 0x34, Type: dev
    function function_eb32cbc9ab60a822( slotnumber )
    {
        for (i = 0; i <= slotnumber; i++) {
            scripts\mp\killstreaks\killstreaks::makekillstreakavailable( i, "<dev string:x4a4>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b5fa
    // Size: 0x3f, Type: dev
    function setupdevguientries( name, num )
    {
        cmd = "<dev string:x3558>" + name + "<dev string:x3583>" + num + "<dev string:x35a2>";
        addentrytodevgui( cmd );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b641
    // Size: 0x85, Type: dev
    function function_cd9a040b668ec554( num )
    {
        player = getentbynum( num );
        
        if ( isdefined( player ) )
        {
            level.var_3b3b12cc96932083.ent = player;
            level.var_3b3b12cc96932083.name = player.name;
            level.var_3b3b12cc96932083.entnum = num;
            iprintln( "<dev string:x35a9>" + player.name );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b6ce
    // Size: 0x3b, Type: dev
    function function_a130b73465e9ce5d()
    {
        host = devfindhost();
        target = host scripts\mp\teams::getplayerlookattarget();
        
        if ( !isdefined( target ) )
        {
            return;
        }
        
        function_cd9a040b668ec554( target getentitynumber() );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b711
    // Size: 0xaa, Type: dev
    function function_3f3a0a6721d16a7d()
    {
        if ( isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            host = devfindhost();
            targetangles = level.var_3b3b12cc96932083.ent getplayerangles();
            forward = anglestoforward( targetangles );
            warporigin = level.var_3b3b12cc96932083.ent.origin + forward * 100;
            host setorigin( warporigin );
            host setplayerangles( targetangles + ( 0, 180, 0 ) );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b7c3
    // Size: 0x63, Type: dev
    function function_13e3c70659983189()
    {
        playerarray = [];
        
        if ( isdefined( level.var_3b3b12cc96932083 ) && isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            playerarray = array_add( playerarray, level.var_3b3b12cc96932083.ent );
        }
        else
        {
            playerarray = level.players;
        }
        
        return playerarray;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b82e
    // Size: 0x18, Type: dev
    function addentrytodevgui( command )
    {
        level thread addentrytodevgui_internal( command );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b84e
    // Size: 0x176, Type: dev
    function addentrytodevgui_internal( command )
    {
        level endon( "<dev string:x101>" );
        
        if ( flag_exist( "<dev string:x35bc>" ) )
        {
            flag_wait( "<dev string:x35bc>" );
        }
        
        if ( flag_exist( "<dev string:x35d0>" ) )
        {
            flag_wait( "<dev string:x35d0>" );
        }
        
        final_command = "<dev string:xca>";
        toks = strtok( command, "<dev string:x1634>" );
        space = "<dev string:x31a>";
        num_toks = 0;
        
        foreach ( tok in toks )
        {
            new_toks = strtok( tok, "<dev string:x31a>" );
            count = 1;
            size = new_toks.size;
            
            foreach ( new_tok in new_toks )
            {
                if ( count < size )
                {
                    final_command = final_command + new_tok + space;
                }
                else
                {
                    final_command += new_tok;
                }
                
                count++;
            }
            
            num_toks++;
            
            if ( num_toks < toks.size )
            {
                final_command += "<dev string:x1634>";
            }
        }
        
        adddebugcommand( final_command );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b9cc
    // Size: 0xd2, Type: dev
    function function_db271c6d734c887c()
    {
        if ( !isdefined( level.var_439cf6979013d8fc ) )
        {
            level.var_439cf6979013d8fc = 0;
        }
        
        if ( level.var_439cf6979013d8fc == 0 )
        {
            if ( getdvarint( @"hash_14dd8475d8aea762", 0 ) == 1 )
            {
                level.var_439cf6979013d8fc = 1;
                
                foreach ( player in level.players )
                {
                    if ( player scripts\cp_mp\utility\player_utility::_isalive() )
                    {
                        player thread setplayeronfire();
                    }
                }
            }
            
            return;
        }
        
        if ( getdvarint( @"hash_14dd8475d8aea762", 0 ) == 0 )
        {
            level.var_439cf6979013d8fc = 0;
            level notify( "<dev string:x35e4>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1baa6
    // Size: 0x29, Type: dev
    function setplayeronfire()
    {
        self endon( "<dev string:xb69>" );
        self endon( "<dev string:x273>" );
        scripts\mp\weapons::enableburnfx();
        level waittill( "<dev string:x35e4>" );
        scripts\mp\weapons::disableburnfx();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bad7
    // Size: 0xef, Type: dev
    function outofboundsimmune()
    {
        isimmune = 0;
        
        while ( true )
        {
            current = getdvarint( @"hash_d197b236ea8564e", 0 );
            
            if ( current )
            {
                if ( !istrue( isimmune ) )
                {
                    foreach ( player in level.players )
                    {
                        scripts\mp\outofbounds::enableoobimmunity( player );
                    }
                    
                    isimmune = 1;
                }
            }
            else if ( istrue( isimmune ) )
            {
                foreach ( player in level.players )
                {
                    scripts\mp\outofbounds::disableoobimmunity( player );
                }
                
                isimmune = 0;
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1bbce
    // Size: 0xeb, Type: dev
    function private function_598312940d23c1fc()
    {
        var_adbb5e703c3a3785 = undefined;
        
        while ( true )
        {
            waitframe();
            debugactive = getdvarint( @"player_debugsprint" ) > 0;
            
            if ( !isdefined( var_adbb5e703c3a3785 ) || var_adbb5e703c3a3785 != debugactive )
            {
                var_adbb5e703c3a3785 = debugactive;
                
                if ( debugactive )
                {
                    foreach ( player in level.players )
                    {
                        player thread function_93df794342c60a43();
                    }
                    
                    continue;
                }
                
                foreach ( player in level.players )
                {
                    player function_6788cfb9818e0635();
                }
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1bcc1
    // Size: 0xb3, Type: dev
    function private function_93df794342c60a43()
    {
        self endon( "<dev string:x35ff>" );
        
        if ( !isdefined( self.debugsprintmeter ) )
        {
            self.debugsprintmeter = scripts\mp\hud_util::createbar( ( 0, 1, 0 ), 100, 10 );
        }
        
        thread function_1e8b61342e55a0ba();
        
        while ( true )
        {
            if ( isdefined( self.debugsprintmeter ) )
            {
                sprintfrac = self getsprintmeterfraction();
                sprintmax = self function_d2213561eb0876cb();
                sprintvalue = sprintfrac * sprintmax;
                barfrac = min( sprintvalue / sprintmax, 1 );
                self.debugsprintmeter scripts\mp\hud_util::updatebar( barfrac );
            }
            
            wait 0.05;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bd7c
    // Size: 0x57, Type: dev
    function function_1e8b61342e55a0ba()
    {
        hud = self.debugsprintmeter;
        waittill_any_2( "<dev string:x35ff>", "<dev string:x273>" );
        
        if ( isdefined( hud ) )
        {
            if ( isdefined( hud.bar ) )
            {
                hud.bar destroy();
            }
            
            hud destroy();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1bddb
    // Size: 0xd, Type: dev
    function private function_6788cfb9818e0635()
    {
        self notify( "<dev string:x35ff>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bdf0
    // Size: 0x2c, Type: dev
    function function_6bc9137bb455bd1d( player )
    {
        var_75c8b38b46b006ab = istestclient( player ) || player isplayerheadless();
        return var_75c8b38b46b006ab;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1be24
    // Size: 0x72, Type: dev
    function function_42b151a494105e10()
    {
        foreach ( player in level.players )
        {
            if ( !isbot( player ) && !istestclient( player ) && !function_6bc9137bb455bd1d( player ) )
            {
                return player;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1be9e
    // Size: 0xc5, Type: dev
    function function_9c425b22f7d1a9b9()
    {
        friendlies = [];
        realclient = function_42b151a494105e10();
        
        if ( !isdefined( realclient ) )
        {
            return friendlies;
        }
        
        foreach ( player in level.players )
        {
            if ( !isalive( player ) )
            {
                continue;
            }
            
            if ( player.sessionstate == "<dev string:x200>" )
            {
                continue;
            }
            
            if ( !function_6bc9137bb455bd1d( player ) )
            {
                continue;
            }
            
            if ( player.team == realclient.team )
            {
                friendlies[ friendlies.size ] = player;
            }
        }
        
        return friendlies;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bf6b
    // Size: 0xc5, Type: dev
    function function_e00acf9a4feba92e()
    {
        enemies = [];
        realclient = function_42b151a494105e10();
        
        if ( !isdefined( realclient ) )
        {
            return enemies;
        }
        
        foreach ( player in level.players )
        {
            if ( !isalive( player ) )
            {
                continue;
            }
            
            if ( player.sessionstate == "<dev string:x200>" )
            {
                continue;
            }
            
            if ( !function_6bc9137bb455bd1d( player ) )
            {
                continue;
            }
            
            if ( player.team != realclient.team )
            {
                enemies[ enemies.size ] = player;
            }
        }
        
        return enemies;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c038
    // Size: 0x94, Type: dev
    function function_59c2e0ed656c6e01()
    {
        headless = [];
        
        foreach ( player in level.players )
        {
            if ( !isalive( player ) )
            {
                continue;
            }
            
            if ( player.sessionstate == "<dev string:x200>" )
            {
                continue;
            }
            
            if ( !function_6bc9137bb455bd1d( player ) )
            {
                continue;
            }
            
            headless[ headless.size ] = player;
        }
        
        return headless;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c0d4
    // Size: 0xd4, Type: dev
    function function_dda4edd64aefb222()
    {
        if ( getdvarint( @"hash_892a0f1030eb66da", 0 ) != 0 )
        {
            players = function_9c425b22f7d1a9b9();
            
            foreach ( player in players )
            {
                player kill();
            }
            
            return;
        }
        
        if ( getdvarint( @"hash_99f113c180dfe22d", 0 ) != 0 )
        {
            players = function_e00acf9a4feba92e();
            
            foreach ( player in players )
            {
                player kill();
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c1b0
    // Size: 0x9f, Type: dev
    function function_61ffbb60b6cc59e0()
    {
        realclient = function_42b151a494105e10();
        
        if ( !isdefined( realclient ) )
        {
            return;
        }
        
        warpplayers = [];
        
        if ( getdvarint( @"hash_60951c4ee00ec45c", 0 ) != 0 )
        {
            warpplayers = function_9c425b22f7d1a9b9();
        }
        else if ( getdvarint( @"hash_8e93a66436d8d0bb", 0 ) != 0 )
        {
            warpplayers = function_e00acf9a4feba92e();
        }
        
        if ( warpplayers.size == 1 )
        {
            warp( realclient, warpplayers[ 0 ], 1 );
            return;
        }
        
        for (i = 0; i < warpplayers.size; i++) {
            warp( realclient, warpplayers[ i ], i );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c257
    // Size: 0x89, Type: dev
    function function_f56b2e8615f905ed( benable )
    {
        players = function_59c2e0ed656c6e01();
        
        foreach ( player in players )
        {
            if ( !benable )
            {
                player val::set( "<dev string:x3619>", "<dev string:x3629>", 0 );
                continue;
            }
            
            player val::reset_all( "<dev string:x3619>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c2e8
    // Size: 0x89, Type: dev
    function function_6dda0c3edae9407c( benable )
    {
        players = function_59c2e0ed656c6e01();
        
        foreach ( player in players )
        {
            if ( !benable )
            {
                player val::set( "<dev string:x363b>", "<dev string:x364d>", 0 );
                continue;
            }
            
            player val::reset_all( "<dev string:x363b>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c379
    // Size: 0x146, Type: dev
    function function_833e05046b8e38ff()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_603986725ce8d7c3" ) > 0 )
            {
                break;
            }
            
            wait 1;
        }
        
        addfallback = 0;
        
        if ( getdvarint( @"hash_603986725ce8d7c3" ) == 2 )
        {
            addfallback = 1;
        }
        
        host = devfindhost();
        
        if ( isreallyalive( host ) && getgametype() == "<dev string:x3655>" )
        {
            spawnclassname = "<dev string:x365c>";
            
            if ( addfallback )
            {
                spawnclassname = "<dev string:x366c>";
            }
            
            spawns = [];
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( spawnclassname, host.origin, host.angles );
            scripts\mp\spawnlogic::addscriptedspawnpoints( spawns );
            spawnstructarray = [ level.scriptedspawnpointarray[ spawnclassname ][ level.scriptedspawnpointarray[ spawnclassname ].size - 1 ] ];
            scripts\mp\spawnlogic::registerspawnpoints( "<dev string:x3f4>", spawnstructarray, 0 );
            
            if ( isdefined( level.reinitspawns ) )
            {
                [[ level.reinitspawns ]]();
            }
        }
        else if ( getgametype() != "<dev string:x3655>" )
        {
            iprintlnbold( 0, "<dev string:x3686>" );
        }
        
        setdevdvar( @"hash_603986725ce8d7c3", 0 );
        thread function_833e05046b8e38ff();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c4c7
    // Size: 0x103, Type: dev
    function function_19f8ce259f92c621()
    {
        waitframe();
        
        for ( ;; )
        {
            if ( getdvar( @"hash_435b27b2358cbe5" ) != "<dev string:xca>" )
            {
                thread function_af63b6f9d83af7fe();
            }
            
            if ( getdvarint( @"hash_bb5083a30a232081" ) != 0 )
            {
                thread function_e1c83dde130fe5c7();
            }
            
            if ( getdvar( @"hash_f0f5f0919b0e534f" ) != "<dev string:xca>" )
            {
                thread function_5a137678f1239061();
            }
            
            if ( getdvar( @"hash_46a5925d26c9f0fa" ) != "<dev string:xca>" )
            {
                thread function_c2b8b450a3cba9c0();
            }
            
            if ( getdvar( @"hash_f2d4c68bdb99bb05" ) != "<dev string:xca>" )
            {
                thread function_69716a0655c2632f();
            }
            
            if ( getdvar( @"hash_36dc6dae079401af", "<dev string:xca>" ) != "<dev string:xca>" )
            {
                thread function_5d6535026d8a0ba8();
            }
            
            if ( getdvar( @"hash_1613e9061d43f96f" ) != "<dev string:xca>" )
            {
                thread function_96c18d9ffd1d401a();
            }
            
            if ( getdvar( @"hash_1f832fa9bd6fab3c" ) != "<dev string:xca>" )
            {
                thread function_b07cec8c9e70afe3();
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c5d2
    // Size: 0xad, Type: dev
    function recordposition()
    {
        setdevdvar( @"hash_f7b7dc1629f731dd", 0 );
        
        if ( !isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            function_cd9a040b668ec554( 0 );
        }
        
        if ( isdefined( level.var_3b3b12cc96932083.ent ) )
        {
            p = level.var_3b3b12cc96932083.ent;
            file = openfile( "<dev string:x36b7>", "<dev string:x36d1>" );
            originstring = "<dev string:xca>" + p.origin;
            fprintln( file, originstring );
            closefile( file );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c687
    // Size: 0xba, Type: dev
    function function_c2edf5eae934b748()
    {
        vehhorn = getdvarint( @"hash_d7ac865ae726cebc", 0 );
        
        foreach ( player in level.players )
        {
            if ( player ishost() )
            {
                if ( isdefined( player.vehiclecustomization ) )
                {
                    player.vehiclecustomization scripts\cp_mp\vehicles\vehicle::function_fdf45700cfcd0c05( undefined, vehhorn );
                    println( "<dev string:x36db>" + vehhorn );
                }
                
                break;
            }
        }
        
        setdevdvar( @"hash_d7ac865ae726cebc", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c749
    // Size: 0xc7, Type: dev
    function function_5415edb8c8843131()
    {
        vehcamo = getdvar( @"hash_d51834b4d1b89a35", 0 );
        
        if ( !issubstr( vehcamo, "<dev string:x36f1>" ) )
        {
            vehcamo = int( vehcamo ) - 1;
        }
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) )
            {
                continue;
            }
            
            player.vehiclecustomization = scripts\cp_mp\vehicles\vehicle::function_fdf45700cfcd0c05( vehcamo, undefined );
        }
        
        println( "<dev string:x36f6>" + vehcamo );
        setdevdvar( @"hash_d51834b4d1b89a35", "<dev string:xca>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c818
    // Size: 0xd8, Type: dev
    function function_cc5f552a2f702a89()
    {
        if ( !isdefined( level.br_armory_kiosk ) )
        {
            return;
        }
        
        path = "<dev string:x370c>";
        rows = tablelookupgetnumrows( path );
        spawnlocs = [];
        
        for (i = 0; i < rows; i++) {
            veh = tablelookupbyrow( i, 0 );
            pos = ( float( tablelookupbyrow( path, i, 1 ) ), float( tablelookupbyrow( path, i, 2 ) ), float( tablelookupbyrow( path, i, 3 ) ) );
            angle = ( float( tablelookupbyrow( path, i, 4 ) ), float( tablelookupbyrow( path, i, 5 ) ), float( tablelookupbyrow( path, i, 6 ) ) );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c8f8
    // Size: 0x24, Type: dev
    function function_4b80a57530d92a82()
    {
        for ( ;; )
        {
            if ( getdvarint( @"hash_f7b7dc1629f731dd" ) != 0 )
            {
                thread recordposition();
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c924
    // Size: 0xd, Type: dev
    function function_789d76613635c972()
    {
        thread function_1f097ebf7869c487();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c939
    // Size: 0x75, Type: dev
    function function_1f097ebf7869c487()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_53575b577130f7f9" ) != 0 )
            {
                setdvar( @"hash_588c1ded10e6df94", 1 );
                setdevdvar( @"hash_53575b577130f7f9", 0 );
            }
            
            if ( getdvarint( @"hash_e7372af7cfe8d1da" ) != 0 )
            {
                setdvar( @"hash_588c1ded10e6df94", 0 );
                setdevdvar( @"hash_e7372af7cfe8d1da", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c9b6
    // Size: 0x22, Type: dev
    function function_e488dea1c20a5a96()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_ed5df81b887a95e2", 0, "<dev string:x3739>", "<dev string:x374e>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c9e0
    // Size: 0xcf, Type: dev
    function function_a46032e38e5f4fd2()
    {
        i = 0;
        
        for ( ;; )
        {
            if ( getdvarint( @"hash_f75720f29df3df7" ) != 0 && i == 0 )
            {
                host = devfindhost();
                
                if ( isdefined( host ) )
                {
                    host setsoundsubmix( "<dev string:x3764>", 1, 1 );
                    setglobalsoundcontext( "<dev string:x3782>", "<dev string:x3790>" );
                    host setclienttriggeraudiozone( "<dev string:x3790>", 1 );
                }
                
                i = 1;
            }
            else if ( getdvarint( @"hash_f75720f29df3df7" ) == 0 && i == 1 )
            {
                host = devfindhost();
                
                if ( isdefined( host ) )
                {
                    host clearsoundsubmix( "<dev string:x3764>", 2.2 );
                    setglobalsoundcontext( "<dev string:x3782>", "<dev string:xca>" );
                    host clearclienttriggeraudiozone( 1 );
                }
                
                i = 0;
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cab7
    // Size: 0x23, Type: dev
    function function_e47c81fb62e6b28f( targetent )
    {
        setdvar( @"hash_305a7db16a11dd02", targetent getentitynumber() );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cae2
    // Size: 0x5c, Type: dev
    function function_4a24cf99b1a11166()
    {
        level waittill( "<dev string:xdc4>", player );
        
        if ( getdvarint( @"scr_god", 0 ) == 1 )
        {
            adddebugcommand( "<dev string:x379e>" );
            return;
        }
        
        if ( getdvarint( @"hash_23c3e7fdfb7fdd84", 0 ) == 1 )
        {
            adddebugcommand( "<dev string:x37a6>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cb46
    // Size: 0x100, Type: dev
    function flipvehicle()
    {
        setdvar( @"hash_c43d3717389f4d37", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_c43d3717389f4d37", 0 ) == 0 )
            {
                wait 1;
            }
            
            setdvar( @"hash_c43d3717389f4d37", 0 );
            
            if ( isdefined( level.players ) && isdefined( level.players[ 0 ] ) && isdefined( level.players[ 0 ].vehicle ) )
            {
                vehicle = level.players[ 0 ].vehicle;
                vehicle vehicle_teleport( ( vehicle.origin[ 0 ], vehicle.origin[ 1 ], vehicle.origin[ 2 ] + 100 ), ( vehicle.angles[ 0 ] + 180, vehicle.angles[ 1 ], vehicle.angles[ 2 ] ) );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cc4e
    // Size: 0x2db, Type: dev
    function explodevehicle()
    {
        dvars = [ @"hash_7e959b6c6939bb44", @"hash_1fafe63a31eaf451", @"hash_330f2979a05f237b", @"hash_130359b22d6e3ba5", @"hash_b919610b324346ca", @"hash_f99c093ecda75788" ];
        
        foreach ( dvar in dvars )
        {
            setdvar( dvar, 0 );
        }
        
        while ( true )
        {
            shouldbreak = 0;
            
            while ( true )
            {
                foreach ( dvar in dvars )
                {
                    if ( getdvarint( dvar, 0 ) != 0 )
                    {
                        shouldbreak = 1;
                        break;
                    }
                }
                
                if ( shouldbreak )
                {
                    break;
                }
                
                wait 1;
            }
            
            if ( isdefined( level.players ) && isdefined( level.players[ 0 ] ) )
            {
                vehicle = level.players[ 0 ].vehicle;
                
                if ( !isdefined( vehicle ) )
                {
                    leveldata = scripts\cp_mp\vehicles\vehicle_compass::vehicle_compass_getleveldata();
                    
                    foreach ( testvehicle in leveldata.instances )
                    {
                        vehicle = testvehicle;
                        break;
                    }
                }
                
                if ( getdvarint( @"hash_7e959b6c6939bb44", 0 ) != 0 )
                {
                    vehicle scripts\cp_mp\vehicles\vehicle::vehicle_explode();
                }
                else if ( getdvarint( @"hash_330f2979a05f237b", 0 ) != 0 )
                {
                    if ( vehicle vehicle_isphysveh() && !vehicle scripts\cp_mp\vehicles\vehicle::isvehicleboat() )
                    {
                        vehicle function_b0af0dd0f9b4fddf( 0 );
                    }
                    
                    vehicle function_e4fe23e19f4bf900( "<dev string:x37b2>" );
                }
                else if ( getdvarint( @"hash_1fafe63a31eaf451", 0 ) != 0 )
                {
                    scripts\cp_mp\vehicles\vehicle_damage::function_ec4b6f058d183338( vehicle );
                }
                else if ( getdvarint( @"hash_f99c093ecda75788", 0 ) != 0 )
                {
                    scripts\cp_mp\vehicles\vehicle_damage::function_19953ff235374847( vehicle );
                }
                else if ( getdvarint( @"hash_b919610b324346ca", 0 ) != 0 )
                {
                    vehicle.fuel = getdvarint( @"hash_b919610b324346ca", 0 );
                }
            }
            
            foreach ( dvar in dvars )
            {
                setdvar( dvar, 0 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cf31
    // Size: 0x220, Type: dev
    function function_af8ffb35e1fba50b()
    {
        setdvar( @"hash_9b965b6b823e2661", 0 );
        
        for ( ;; )
        {
            while ( getdvarint( @"hash_9b965b6b823e2661", 0 ) == 0 )
            {
                wait 1;
            }
            
            setdvar( @"hash_9b965b6b823e2661", 0 );
            setdvar( @"hash_8ceb3dcd7f5efd88", 0 );
            instances = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstancesforall();
            
            if ( isdefined( instances ) && instances.size > 0 )
            {
                foreach ( instance in instances )
                {
                    model = instance scripts\common\vehicle_code::function_d0e99a4f0c29166e();
                    
                    if ( issubstr( model, "<dev string:x37d8>" ) )
                    {
                        continue;
                    }
                    
                    instance hidepart( "<dev string:x37e2>" );
                    instance hidepart( "<dev string:x3801>" );
                    instance hidepart( "<dev string:x3821>" );
                    instance hidepart( "<dev string:x383f>" );
                    instance hidepart( "<dev string:x385e>" );
                    instance hidepart( "<dev string:x3882>" );
                    instance hidepart( "<dev string:x38a7>" );
                    instance hidepart( "<dev string:x38ca>" );
                    
                    if ( issubstr( model, "<dev string:x38ee>" ) )
                    {
                        instance hidepart( "<dev string:x38fd>" );
                        instance hidepart( "<dev string:x391d>" );
                        instance hidepart( "<dev string:x393e>" );
                        instance hidepart( "<dev string:x3963>" );
                    }
                    
                    if ( issubstr( model, "<dev string:x3989>" ) )
                    {
                        instance hidepart( "<dev string:x3990>" );
                        instance hidepart( "<dev string:x39b1>" );
                        instance hidepart( "<dev string:x39d3>" );
                        instance hidepart( "<dev string:x39f4>" );
                        instance hidepart( "<dev string:x3a16>" );
                        instance hidepart( "<dev string:x3a3c>" );
                        instance hidepart( "<dev string:x3a63>" );
                        instance hidepart( "<dev string:x3a89>" );
                    }
                    
                    if ( issubstr( model, "<dev string:x3ab0>" ) )
                    {
                        instance hidepart( "<dev string:x3ac2>" );
                        instance hidepart( "<dev string:x3adb>" );
                        instance hidepart( "<dev string:x3af5>" );
                        instance hidepart( "<dev string:x3b0d>" );
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d159
    // Size: 0x6b, Type: dev
    function function_eec7cf6eeba7b18e()
    {
        waitframe();
        thread function_cb7d245329d3458a();
        thread function_69de277cc8fb7d38();
        
        while ( true )
        {
            if ( getdvarint( @"hash_feed6c94acdeb007", 0 ) )
            {
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
    // Checksum 0x0, Offset: 0x1d1cc
    // Size: 0x130, Type: dev
    function function_991360818ecedb4b()
    {
        if ( !getdvarint( @"hash_2853a457a04cedd" ) )
        {
            return;
        }
        
        switch ( level.player.team )
        {
            case #"hash_7c2d091e6337bf54":
                setdevdvar( @"hash_5e767ceb6b77e053", 1 );
                break;
            case #"hash_5f54b9bf7583687f":
                setdevdvar( @"hash_5e767ceb6b77e053", 2 );
                break;
            default:
                setdevdvar( @"hash_5e767ceb6b77e053", -1 );
                break;
        }
        
        setdevdvar( @"hash_2853a457a04cedd", 0 );
        setdevdvar( @"hash_2d5236cbe9894aff", 1 );
        level waittill( "<dev string:xdc4>", bot );
        host = devfindhost();
        point = getclosestpointonnavmesh( host.origin );
        setdevdvar( @"hash_12d23346fbacee91", 2 );
        bot setorigin( point );
        bot botsetstance( getdvar( @"hash_84f60afafd582b5a", "<dev string:xf8>" ) );
        bot botsetawareness( 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d304
    // Size: 0x1a1, Type: dev
    function function_df723c75aa9439cc()
    {
        bots = function_7b6b4827ac39b941();
        
        if ( !isdefined( bots ) )
        {
            return;
        }
        
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        foreach ( bot in bots )
        {
            dist = distance( host.origin, bot.origin );
            headpos = bot gettagorigin( "<dev string:xa83>" );
            scale = dist / 1000;
            print3d( headpos, "<dev string:x3b26>" + dist, ( 1, 1, 1 ), 1, 1 + scale );
            
            if ( !getdvarint( @"hash_eac0c331e6c7a19", 0 ) )
            {
                if ( !isdefined( bot.outlineid ) )
                {
                    outlineid = scripts\mp\utility\outline::outlineenableforall( bot, "<dev string:x11c8>", "<dev string:x3b34>" );
                    bot.outlineid = outlineid;
                }
                else
                {
                    scripts\mp\utility\outline::outlinerefresh( bot );
                }
            }
            
            if ( ( getdvarint( @"hash_eac0c331e6c7a19", 0 ) || !getdvarint( @"hash_feed6c94acdeb007", 0 ) ) && isdefined( bot.outlineid ) )
            {
                scripts\mp\utility\outline::outlinedisable( bot.outlineid, bot );
                bot.outlineid = undefined;
                setdevdvar( @"hash_eac0c331e6c7a19", 1 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d4ad
    // Size: 0x80, Type: dev
    function function_7b6b4827ac39b941()
    {
        bots = [];
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) && isalive( player ) )
            {
                bots[ bots.size ] = player;
            }
        }
        
        if ( bots.size == 0 )
        {
            return undefined;
        }
        
        return bots;
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d535
    // Size: 0xe1, Type: dev
    function function_7fa1d33727888ed3( dist, bots )
    {
        host = devfindhost();
        forward = anglestoforward( host getplayerangles() );
        tracestart = host geteye() + forward * dist + ( 0, 0, 50 );
        traceend = tracestart + ( 0, 0, -1000 );
        traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
        
        foreach ( bot in bots )
        {
            bot setorigin( traceresults[ "<dev string:x1ae>" ] );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d61e
    // Size: 0xad, Type: dev
    function function_64c38aaa56b64048()
    {
        if ( !getdvarint( @"hash_a4be290f0076f15f", 0 ) )
        {
            return;
        }
        
        setdevdvar( @"hash_a4be290f0076f15f", 0 );
        bots = function_7b6b4827ac39b941();
        
        if ( !isdefined( bots ) )
        {
            return;
        }
        
        foreach ( bot in bots )
        {
            newangles = bot.angles + ( 0, 90, 0 );
            bot setplayerangles( newangles );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d6d3
    // Size: 0x105, Type: dev
    function function_289339b65c8d45c0( movedist, bots )
    {
        foreach ( bot in bots )
        {
            host = devfindhost();
            forward = anglestoforward( host getplayerangles() );
            dist = distance( host.origin, bot.origin ) + movedist;
            tracestart = host geteye() + forward * dist + ( 0, 0, 1000 );
            traceend = tracestart + ( 0, 0, -1000 );
            traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, host );
            bot setorigin( traceresults[ "<dev string:x1ae>" ] );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d7e0
    // Size: 0x283, Type: dev
    function function_cb7d245329d3458a()
    {
        level endon( "<dev string:x101>" );
        
        while ( true )
        {
            if ( !getdvarint( @"hash_feed6c94acdeb007", 0 ) )
            {
                waitframe();
                continue;
            }
            
            if ( !getdvarint( @"hash_68c6be05e346d7f", 0 ) )
            {
                waitframe();
                continue;
            }
            
            bots = function_7b6b4827ac39b941();
            
            if ( !isdefined( bots ) )
            {
                setdevdvar( @"hash_68c6be05e346d7f", 0 );
                waitframe();
                continue;
            }
            
            setdevdvar( @"hash_12d23346fbacee91", 0 );
            
            if ( getdvarint( @"hash_68c6be05e346d7f", 0 ) == 1 )
            {
                foreach ( bot in bots )
                {
                    botstartpoint = getclosestpointonnavmesh( bot.origin );
                    bot setorigin( botstartpoint );
                    host = devfindhost();
                    forward = vectornormalize( bot.origin - host.origin );
                    closestpoint = getclosestpointonnavmesh( bot.origin + forward * 1000 );
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal( closestpoint, 1, "<dev string:x3b41>", undefined, undefined );
                }
            }
            
            if ( getdvarint( @"hash_68c6be05e346d7f", 0 ) == 2 )
            {
                foreach ( bot in bots )
                {
                    botstartpoint = getclosestpointonnavmesh( bot.origin );
                    bot setorigin( botstartpoint );
                    host = devfindhost();
                    closestpoint = getclosestpointonnavmesh( host.origin );
                    bot botclearscriptgoal();
                    waitframe();
                    bot botsetscriptgoal( closestpoint, 20, "<dev string:x3b41>", undefined, undefined );
                }
            }
            
            if ( getdvarint( @"hash_68c6be05e346d7f", 0 ) == 3 )
            {
                foreach ( bot in bots )
                {
                    setdevdvar( @"hash_12d23346fbacee91", 2 );
                    bot botclearscriptgoal();
                }
            }
            
            setdevdvar( @"hash_68c6be05e346d7f", 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1da6b
    // Size: 0xea, Type: dev
    function function_69de277cc8fb7d38()
    {
        level endon( "<dev string:x101>" );
        
        while ( true )
        {
            if ( !getdvarint( @"hash_feed6c94acdeb007", 0 ) )
            {
                waitframe();
                continue;
            }
            
            bots = function_7b6b4827ac39b941();
            
            if ( !isdefined( bots ) )
            {
                waitframe();
                continue;
            }
            
            foreach ( bot in bots )
            {
                if ( !isdefined( bot.stance ) )
                {
                    bot.stance = "<dev string:xf0>";
                }
                
                stancedvar = getdvar( @"hash_84f60afafd582b5a", "<dev string:xf8>" );
                
                if ( bot.stance != stancedvar )
                {
                    bot botsetstance( stancedvar );
                    bot.stance = stancedvar;
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1db5d
    // Size: 0x3a7, Type: dev
    function function_d2f5e543e4d6d558()
    {
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        consoledvar = getdvarint( @"hash_7593dee806228a1a", 0 );
        var_4fa67b773f078750 = getdvarint( @"hash_3100677c4c768b60", 0 );
        
        if ( !consoledvar )
        {
            return;
        }
        
        bots = function_7b6b4827ac39b941();
        
        if ( isdefined( bots ) )
        {
            foreach ( bot in bots )
            {
                if ( var_4fa67b773f078750 != 4 )
                {
                    volume = "<dev string:xca>";
                    
                    switch ( consoledvar )
                    {
                        case 1:
                            volume = "<dev string:x3b4d>";
                            break;
                        case 2:
                            volume = "<dev string:x3b55>";
                            break;
                        case 3:
                            volume = "<dev string:x3b5e>";
                            break;
                        case 4:
                            volume = "<dev string:x3b68>";
                            break;
                        default:
                            volume = "<dev string:x3b74>";
                            break;
                    }
                    
                    type = "<dev string:xca>";
                    
                    switch ( var_4fa67b773f078750 )
                    {
                        case 1:
                            type = "<dev string:x3b7e>";
                            break;
                        case 2:
                            type = "<dev string:x3b8b>";
                            break;
                        case 3:
                            type = "<dev string:x3b96>";
                            break;
                        case 4:
                            type = "<dev string:x3ba1>";
                            break;
                        default:
                            type = "<dev string:x1f8>";
                            break;
                    }
                    
                    dist = distance( host.origin, bot.origin );
                    println( "<dev string:x3bac>" );
                    println( "<dev string:x3bce>" + type );
                    println( "<dev string:x3bde>" + volume );
                    println( "<dev string:x3bf0>" + bot getentitynumber() );
                    println( "<dev string:x3c00>" + dist );
                    println( "<dev string:x3c12>" + bot.primaryweapon );
                    println( "<dev string:x3c22>" );
                }
            }
        }
        
        if ( !isdefined( level.devvehicles ) )
        {
            return;
        }
        
        foreach ( vehicle in level.devvehicles )
        {
            volume = "<dev string:xca>";
            
            switch ( consoledvar )
            {
                case 1:
                    volume = "<dev string:x3b4d>";
                    break;
                case 2:
                    volume = "<dev string:x3b55>";
                    break;
                case 3:
                    volume = "<dev string:x3b5e>";
                    break;
                case 4:
                    volume = "<dev string:x3b68>";
                    break;
                default:
                    volume = "<dev string:x3b74>";
                    break;
            }
            
            dist = distance( host.origin, vehicle.origin );
            println( "<dev string:x3bac>" );
            println( "<dev string:x3c42>" );
            println( "<dev string:x3bde>" + volume );
            println( "<dev string:x3c59>" + vehicle.vehiclename );
            println( "<dev string:x3c6b>" + dist );
            println( "<dev string:x3c22>" );
        }
        
        setdevdvar( @"hash_7593dee806228a1a", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1df0c
    // Size: 0xdd, Type: dev
    function function_a04e86ada26fed1b()
    {
        bots = function_7b6b4827ac39b941();
        
        if ( !isdefined( bots ) )
        {
            return;
        }
        
        dvar = getdvarint( @"hash_d91cce0b4aec39b4", 0 );
        
        switch ( dvar )
        {
            case 1:
                function_7fa1d33727888ed3( 100, bots );
                break;
            case 2:
                function_7fa1d33727888ed3( 500, bots );
                break;
            case 3:
                function_7fa1d33727888ed3( 1100, bots );
                break;
            case 4:
                function_289339b65c8d45c0( -50, bots );
                break;
            case 5:
                function_289339b65c8d45c0( 50, bots );
                break;
            default:
                break;
        }
        
        setdevdvar( @"hash_d91cce0b4aec39b4", 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dff1
    // Size: 0x54b, Type: dev
    function function_4d6e7ec55fd3917d()
    {
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        forward = anglestoforward( host.angles );
        vehicleref = getdvar( @"hash_6a4bdbee44239d75", "<dev string:xca>" );
        
        if ( vehicleref != "<dev string:xca>" )
        {
            setdevdvar( @"hash_6a4bdbee44239d75", "<dev string:xca>" );
            spawnposition = host.origin + ( 0, 0, 100 ) + forward * 300;
            spawnangles = host.angles * ( 0, 1, 0 );
            vehicle = undefined;
            seatid = undefined;
            spawndata = spawnstruct();
            spawndata.origin = spawnposition;
            spawndata.angles = spawnangles;
            spawndata.spawntype = "<dev string:x975>";
            [ vehicle, seatid ] = scripts\cp_mp\vehicles\vehicle::function_84033ce50b8afce2( vehicleref, spawndata );
            vehicle addcomponent( "<dev string:x3c81>" );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3c88>", 1 );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3c97>", 1 );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3cae>", 300 );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3cbf>", 1 );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3cd5>", 0.5 );
            vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3ce9>", 4 );
            vehicle vehicle_turnengineon();
            
            if ( !isdefined( level.devvehicles ) )
            {
                level.devvehicles = [ vehicle ];
            }
            else
            {
                level.devvehicles[ level.devvehicles.size ] = vehicle;
            }
        }
        
        drivedvar = getdvarint( @"hash_b48b64507c871c18", 0 );
        
        if ( isdefined( level.devvehicles ) && drivedvar )
        {
            setdevdvar( @"hash_b48b64507c871c18", 0 );
            
            foreach ( vehicle in level.devvehicles )
            {
                switch ( drivedvar )
                {
                    case 2:
                        if ( vehicle.vehiclename == "<dev string:x3cff>" || vehicle.vehiclename == "<dev string:x3d0e>" )
                        {
                            break;
                        }
                        
                        direction = vectornormalize( vehicle.origin - host.origin );
                        endpoint = direction * 3000 + vehicle.origin;
                        vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304( vehicle.origin, endpoint, 300 );
                        break;
                    case 1:
                        if ( vehicle.vehiclename == "<dev string:x3cff>" || vehicle.vehiclename == "<dev string:x3d0e>" )
                        {
                            break;
                        }
                        
                        direction = vectornormalize( host.origin - vehicle.origin );
                        endpoint = direction * -300 + host.origin;
                        vehicle thread namespace_9246f10206f50768::function_8f40a2c8678f8304( vehicle.origin, endpoint, 300 );
                        break;
                    case 3:
                        vehicle notify( "<dev string:x3d20>" );
                        vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3d30>", 0 );
                        vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3c88>", 1 );
                        vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3d3f>", vehicle.origin );
                        vehicle stoppath();
                        vehicle vehicle_setspeedimmediate( 0, 1, 1 );
                        vehicle vehicle_cleardrivingstate();
                        break;
                    default:
                        break;
                }
            }
        }
        
        destroydvar = getdvar( @"hash_aba9a0c99545e4f6", "<dev string:xca>" );
        
        if ( destroydvar != "<dev string:xca>" && isdefined( level.devvehicles ) )
        {
            setdevdvar( @"hash_aba9a0c99545e4f6", "<dev string:xca>" );
            
            foreach ( index, vehicle in level.devvehicles )
            {
                if ( vehicle.vehiclename == destroydvar )
                {
                    level.devvehicles[ index ] = undefined;
                    vehicle notify( "<dev string:x3d20>" );
                    vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3d30>", 0 );
                    vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3c88>", 1 );
                    vehicle function_77320e794d35465a( "<dev string:x3c81>", "<dev string:x3d3f>", vehicle.origin );
                    vehicle stoppath();
                    vehicle vehicle_setspeedimmediate( 0, 1, 1 );
                    vehicle vehicle_cleardrivingstate();
                    break;
                }
            }
            
            setdvar( @"hash_37b6962333b896f9", destroydvar );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e544
    // Size: 0x1cc, Type: dev
    function debugvehicles()
    {
        if ( !isdefined( level.devvehicles ) )
        {
            return;
        }
        
        if ( level.devvehicles.size < 1 )
        {
            return;
        }
        
        host = devfindhost();
        
        if ( !isdefined( host ) )
        {
            return;
        }
        
        foreach ( index, vehicle in level.devvehicles )
        {
            if ( !isdefined( vehicle.origin ) )
            {
                level.devvehicles[ index ] = undefined;
                continue;
            }
            
            dist = distance( host.origin, vehicle.origin );
            scale = dist / 1000;
            print3d( vehicle.origin + ( 0, 0, 50 ), "<dev string:x3b26>" + dist, ( 1, 1, 1 ), 1, 1 + scale );
            
            if ( !getdvarint( @"hash_eac0c331e6c7a19", 0 ) )
            {
                if ( !isdefined( vehicle.outlineid ) )
                {
                    outlineid = scripts\mp\utility\outline::outlineenableforall( vehicle, "<dev string:x11c8>", "<dev string:x3b34>" );
                    vehicle.outlineid = outlineid;
                }
                else
                {
                    scripts\mp\utility\outline::outlinerefresh( vehicle );
                }
            }
            
            if ( ( getdvarint( @"hash_eac0c331e6c7a19", 0 ) || !getdvarint( @"hash_feed6c94acdeb007", 0 ) ) && isdefined( vehicle.outlineid ) )
            {
                scripts\mp\utility\outline::outlinedisable( vehicle.outlineid, vehicle );
                vehicle.outlineid = undefined;
                setdevdvar( @"hash_eac0c331e6c7a19", 1 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e718
    // Size: 0x69, Type: dev
    function function_1b6f9f83855a61ce()
    {
        grenaderef = getdvar( @"hash_f717bc3454c9e8d4", "<dev string:xca>" );
        
        if ( grenaderef == "<dev string:xca>" )
        {
            return;
        }
        
        setdevdvar( @"hash_f717bc3454c9e8d4", "<dev string:xca>" );
        bots = function_7b6b4827ac39b941();
        
        if ( !isdefined( bots ) )
        {
            return;
        }
        
        setdevdvar( @"hash_c1fa6ab185f57dc3", grenaderef );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e789
    // Size: 0x10d, Type: dev
    function function_344c138dc3ceab1d()
    {
        setdvar( @"hash_5b211aca76235219", 0 );
        setdvar( @"hash_45f4dd24df5f8312", 0 );
        
        while ( true )
        {
            if ( getdvarint( @"hash_5b211aca76235219", 0 ) == 1 )
            {
                setdvar( @"hash_5b211aca76235219", 0 );
                scripts\mp\gametypes\dmz_dog_tag::function_f6d685cabfad2ce9( level.players[ 0 ] );
                dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
                namespace_aead94004cf4c147::function_8121cbee12383790( level.players[ 0 ], dropstruct );
                namespace_aead94004cf4c147::function_ae287e5eb2024104( level.players[ 0 ], dropstruct );
                level.players[ 0 ] namespace_aead94004cf4c147::clearbackpack();
            }
            
            if ( getdvarint( @"hash_45f4dd24df5f8312", 0 ) == 1 )
            {
                setdvar( @"hash_45f4dd24df5f8312", 0 );
                
                if ( isdefined( level.var_36827f5d10328424 ) )
                {
                    level.players[ 0 ] thread [[ level.var_36827f5d10328424 ]]();
                }
                
                level.players[ 0 ] notify( "<dev string:x3d4c>" );
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e89e
    // Size: 0x4d, Type: dev
    function function_ba9b45053e961b3b()
    {
        setdvar( @"hash_f45a5fd7bc382158", 0 );
        
        while ( true )
        {
            if ( getdvarint( @"hash_f45a5fd7bc382158", 0 ) == 1 )
            {
                level.players[ 0 ] scripts\mp\gametypes\br_gametype_dmz::attachbag( "<dev string:x3d5c>" );
                return;
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e8f3
    // Size: 0x5a, Type: dev
    function function_cdab8b6c45b3889f()
    {
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            return;
        }
        
        while ( true )
        {
            backpacksize = getdvarint( @"hash_f4ade8d604c72f7b", 0 );
            
            if ( backpacksize )
            {
                namespace_aead94004cf4c147::function_d28f52da6ede0191( level.players[ 0 ], backpacksize );
                setdvar( @"hash_f4ade8d604c72f7b", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e955
    // Size: 0x202, Type: dev
    function function_21b1037a002c9aaa()
    {
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            return;
        }
        
        lootids = [ 8486, 8369, 9104, 8554, 8548, 8372, 8600, 9171, 9250 ];
        
        while ( true )
        {
            var_962f13b3cb9d0ecb = getdvarint( @"hash_6b3fdb8f7cb8773e", 0 );
            
            if ( var_962f13b3cb9d0ecb )
            {
                setdvar( @"hash_6b3fdb8f7cb8773e", 0 );
                fakepickup = spawnstruct();
                var_479111fcc1c69c65 = namespace_a8b2b88699fc40fb::function_fc1ce25282bcba83();
                
                foreach ( player in level.players )
                {
                    if ( isbot( player ) )
                    {
                        namespace_aead94004cf4c147::function_d28f52da6ede0191( player, 9, undefined, 8545 );
                        waitframe();
                    }
                    
                    if ( isalive( player ) )
                    {
                        for (i = 0; i < namespace_aead94004cf4c147::getplayerbackpacksize( player ); i++) {
                            if ( var_479111fcc1c69c65 && isbot( player ) && i == 0 )
                            {
                                var_479111fcc1c69c65 = 0;
                                fakepickup.scriptablename = scripts\cp_mp\utility\loot::getscriptablefromlootid( 13358 );
                                fakepickup.count = 1;
                                player namespace_aead94004cf4c147::additemtobackpack( 13358, fakepickup );
                                continue;
                            }
                            
                            fakepickup.scriptablename = scripts\cp_mp\utility\loot::getscriptablefromlootid( lootids[ i ] );
                            maxcount = level.br_pickups.var_4138f9ddc1cd22d[ fakepickup.scriptablename ];
                            
                            if ( !isdefined( maxcount ) )
                            {
                                maxcount = level.br_pickups.maxcounts[ fakepickup.scriptablename ];
                            }
                            
                            fakepickup.count = maxcount;
                            player namespace_aead94004cf4c147::additemtobackpack( lootids[ i ], fakepickup );
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1eb5f
    // Size: 0x2d4, Type: dev
    function function_c561877ea8d01d6c()
    {
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            return;
        }
        
        while ( true )
        {
            var_962f13b3cb9d0ecb = getdvarint( @"hash_78f9417314344fb8", 0 );
            
            if ( var_962f13b3cb9d0ecb )
            {
                setdvar( @"hash_78f9417314344fb8", 0 );
                fakepickup = spawnstruct();
                
                foreach ( player in level.players )
                {
                    if ( isdefined( player.platecarrierlevel ) && player.platecarrierlevel < 3 )
                    {
                        player scripts\mp\gametypes\br_pickups::lootitem( 8410, 1 );
                        player scripts\cp_mp\armor::setarmorhealth( 150 );
                    }
                    
                    if ( isalive( player ) )
                    {
                        var_78f26565a3bb0026 = spawnstruct();
                        var_78f26565a3bb0026.scriptablename = "<dev string:x3d7e>";
                        var_78f26565a3bb0026.count = 800;
                        player scripts\mp\gametypes\br_plunder::takeplunderpickup( var_78f26565a3bb0026 );
                        var_a88b57639e11d229 = spawnstruct();
                        var_a88b57639e11d229.scriptablename = "<dev string:x3da0>";
                        var_a88b57639e11d229.count = 220;
                        player scripts\mp\gametypes\br_pickups::takegasmask( var_a88b57639e11d229 );
                        var_8a2b11e1f8c1b4e6 = spawnstruct();
                        var_8a2b11e1f8c1b4e6.scriptablename = "<dev string:x3dc0>";
                        var_8a2b11e1f8c1b4e6.count = 1;
                        player scripts\mp\gametypes\br_pickups::takekillstreakpickup( var_8a2b11e1f8c1b4e6 );
                        player scripts\mp\gametypes\br_pickups::takerevivepickup();
                        var_e6ab079a55858647 = spawnstruct();
                        var_e6ab079a55858647.scriptablename = "<dev string:x3de9>";
                        var_e6ab079a55858647.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup( var_e6ab079a55858647 );
                        var_fb6789db24cdd53e = spawnstruct();
                        var_fb6789db24cdd53e.scriptablename = "<dev string:x3dff>";
                        var_fb6789db24cdd53e.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup( var_fb6789db24cdd53e );
                        var_b340b487e7d78d4d = spawnstruct();
                        var_b340b487e7d78d4d.scriptablename = "<dev string:x3e16>";
                        var_b340b487e7d78d4d.count = 1;
                        player scripts\mp\gametypes\br_pickups::takeequipmentpickup( var_b340b487e7d78d4d );
                        var_637c68e35ac57e73 = spawnstruct();
                        var_637c68e35ac57e73.scriptablename = "<dev string:x3e2e>";
                        var_637c68e35ac57e73.count = 1;
                        player scripts\mp\gametypes\br_pickups::takesuperpickup( var_637c68e35ac57e73 );
                        var_1641c4955131ce58 = spawnstruct();
                        var_1641c4955131ce58.scriptablename = "<dev string:x3e4b>";
                        var_1641c4955131ce58.origin = player.origin;
                        var_1641c4955131ce58.count = 0;
                        var_1641c4955131ce58.countlefthand = 0;
                        player scripts\mp\gametypes\br_weapons::takeweaponpickup( var_1641c4955131ce58 );
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ee3b
    // Size: 0x18f, Type: dev
    function function_eab2f1dc0cb5d29a()
    {
        while ( true )
        {
            var_3461c8e7aa64d24d = getdvarint( @"hash_9e98f56356b76efb", 0 );
            
            if ( var_3461c8e7aa64d24d )
            {
                setdvar( @"hash_9e98f56356b76efb", 0 );
                player = level.players[ 0 ];
                player givemaxammo( player getcurrentweapon() );
                weapattachments = player getcurrentweapon().attachments;
                weapname = player getcurrentweapon().basename;
                weap = makeweapon( weapname, weapattachments );
                startpos = player.origin;
                dir = anglestoforward( player.angles );
                offset = 50;
                voffset = ( 0, 0, 45 );
                name = getcompleteweaponname( weap );
                var_5adbe3beba4e5fe9 = spawn( "<dev string:x665>" + name, startpos + offset * dir + voffset, 17 );
                centerofmass = var_5adbe3beba4e5fe9 physics_getentitycenterofmass();
                
                if ( isdefined( centerofmass ) )
                {
                    centerofmass = centerofmass[ "<dev string:x18a2>" ];
                }
                else
                {
                    centerofmass = var_5adbe3beba4e5fe9.origin;
                }
                
                launchforce = dir * 100 + ( 0, 0, 200 );
                var_5adbe3beba4e5fe9 physicslaunchserveritem( centerofmass, launchforce );
                var_5adbe3beba4e5fe9 dontcastshadows();
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1efd2
    // Size: 0x112, Type: dev
    function function_ea1435d097a761b3()
    {
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            return;
        }
        
        while ( true )
        {
            radiospawn = getdvarint( @"hash_a2d9af91b85e8792", 0 );
            
            if ( radiospawn )
            {
                setdvar( @"hash_a2d9af91b85e8792", 0 );
                
                foreach ( player in level.players )
                {
                    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
                    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles( dropstruct, player.origin, player.angles, player );
                    agentradio = scripts\mp\gametypes\br_pickups::spawnpickup( "<dev string:x3e6b>", dropinfo );
                    agentradio.entitynumber = player getentitynumber();
                    agentradio.poi = player.closestpoi;
                    thread scripts\mp\overseer::function_fc9a15646315764c( agentradio );
                }
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f0ec
    // Size: 0x65, Type: dev
    function function_3f8d230bc182470()
    {
        if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
        {
            return;
        }
        
        while ( true )
        {
            wishspawn = getdvarint( @"hash_adb23ce1f2a4c958", 0 );
            
            if ( wishspawn )
            {
                setdevdvar( @"hash_adb23ce1f2a4c958", "<dev string:xca>" );
                hostplayer = devfindhost();
                hostplayer thread function_1e7522498073119f( hostplayer );
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f159
    // Size: 0x12e, Type: dev
    function function_1e7522498073119f( player )
    {
        forward = anglestoforward( player.angles );
        targetpos = player.origin + forward * 256;
        var_e76c084d206cfb7f = scripts\engine\trace::create_itemclip_contents();
        deploytrace = scripts\engine\trace::ray_trace( targetpos + ( 0, 0, 1024 ), targetpos, undefined, var_e76c084d206cfb7f, 0, 0, 1 );
        
        if ( deploytrace[ "<dev string:x154>" ] != "<dev string:x3e86>" )
        {
            deploypos = deploytrace[ "<dev string:x1ae>" ];
        }
        else
        {
            deploypos = targetpos;
        }
        
        aitype = scripts\mp\ai_mp_controller::function_7f1a2e2ebe0c1693( "<dev string:x12e0>", 1 );
        agent = scripts\mp\ai_mp_controller::ai_mp_requestspawnagent( aitype, deploypos, player.angles, "<dev string:x3e96>", "<dev string:x3ea2>" );
        
        if ( !isdefined( agent ) )
        {
            return;
        }
        
        if ( !isdefined( level.var_95d2947b70d11edc ) )
        {
            level.var_95d2947b70d11edc = [];
        }
        
        level.var_95d2947b70d11edc[ level.var_95d2947b70d11edc.size ] = agent;
        agent scripts\mp\ai_behavior::function_304da84d9a815c01( deploypos, 4, 0 );
        agent.dontevershoot = 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f28f
    // Size: 0x19b, Type: dev
    function function_d091089932ce27a1()
    {
        setdvar( @"hash_4f11560b700207f", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_4f11560b700207f", 0 ) == 0 )
            {
                wait 0.5;
            }
            
            setdvar( @"hash_4f11560b700207f", 0 );
            host = level.players[ 0 ];
            bot = undefined;
            
            foreach ( player in level.players )
            {
                if ( isbot( player ) && player.team == host.team )
                {
                    bot = player;
                    break;
                }
            }
            
            if ( !isdefined( bot ) )
            {
                iprintlnbold( "<dev string:x3eaf>" );
                continue;
            }
            
            revivetrigger = undefined;
            
            if ( isdefined( level.revivetriggers ) )
            {
                foreach ( testtrigger in level.revivetriggers )
                {
                    if ( testtrigger.deadplayer == host )
                    {
                        revivetrigger = testtrigger;
                        break;
                    }
                }
            }
            
            if ( isdefined( revivetrigger ) || isinlaststand( host ) )
            {
                bot scripts\mp\supers\super_stimpistol::function_22044a9973aa399c( bot, host );
                continue;
            }
            
            iprintlnbold( "<dev string:x3efe>" );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f432
    // Size: 0xfa, Type: dev
    function function_da9bb330ce4c2309()
    {
        setdvar( @"hash_69a67e687db46395", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_69a67e687db46395", 0 ) == 0 )
            {
                wait 0.5;
            }
            
            setdvar( @"hash_69a67e687db46395", 0 );
            bot = undefined;
            
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    bot = player;
                    break;
                }
            }
            
            if ( !isdefined( bot ) )
            {
                iprintlnbold( "<dev string:x3f50>" );
                continue;
            }
            
            iprintlnbold( "<dev string:x3f69>" );
            bot thread scripts\mp\teamrevive::function_c86cf00d5859ce10( ( 0, 0, 0 ) );
            wait 10;
            iprintlnbold( "<dev string:x3f88>" );
            bot scripts\mp\teamrevive::function_a3ffe1d08888c2();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f534
    // Size: 0x146, Type: dev
    function function_e512f821db52c11()
    {
        setdvar( @"hash_79a6e942a524512d", 0 );
        setdvar( @"hash_ad3f4e532100b2d0", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_79a6e942a524512d", 0 ) == 0 )
            {
                wait 0.5;
            }
            
            setdvar( @"hash_7a5e31b62cb508b0", 1 );
            testdata = spawnstruct();
            testdata.dvarval = getdvarint( @"hash_79a6e942a524512d", 0 );
            testdata.shortwait = 1;
            testdata.medwait = 3;
            testdata.longwait = 5;
            testdata.dvarvalwait = getdvarfloat( @"hash_ad3f4e532100b2d0", 0 );
            testdata.revivetype = undefined;
            testdata.var_b34ec33a70953a71 = 0;
            testdata.participants = function_3153fcf9b8215d83( testdata );
            testdata.reviveents = function_e2d36d595bb206ce( testdata );
            testdata.var_805a6d3884a4fbff = function_95907c91ea217d77( testdata );
            function_fcfb461b887397e8( testdata );
            waitframe();
            setdvar( @"hash_7a5e31b62cb508b0", 0 );
            setdvar( @"hash_79a6e942a524512d", 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f682
    // Size: 0x1cf, Type: dev
    function private function_2f3ae3af12426b6d()
    {
        allycount = 0;
        enemycount = 0;
        var_cc3e8bc1bf3118b9 = 2;
        var_e399f9ef09f993b7 = 2;
        host = scripts\mp\gamelogic::gethostplayer();
        hostteam = host.team;
        hostenemyteam = scripts\engine\utility::get_enemy_team( host.team );
        
        foreach ( player in level.players )
        {
            if ( player == host )
            {
                continue;
            }
            
            if ( player.team == hostteam )
            {
                allycount++;
            }
            
            if ( player.team == hostenemyteam )
            {
                enemycount++;
            }
        }
        
        var_cc3e8bc1bf3118b9 -= allycount;
        var_e399f9ef09f993b7 -= enemycount;
        spawnorigin = scripts\mp\bots\bots::function_b771795f421ef637( host );
        var_93bed5aae5070beb = host getplayerangles();
        spawnangles = ( 0, var_93bed5aae5070beb[ 1 ] + 180, 0 );
        fixedspawndata = spawnstruct();
        fixedspawndata.origin = spawnorigin;
        fixedspawndata.angles = spawnangles;
        setdvar( @"hash_c2de8ca6dc8512c1", 1 );
        level [[ level.bot_funcs[ "<dev string:x3329>" ] ]]( var_cc3e8bc1bf3118b9, hostteam, undefined, undefined, "<dev string:x3f9b>", undefined, fixedspawndata );
        level waittill_any_timeout_1( 5, "<dev string:x3f9b>" );
        level [[ level.bot_funcs[ "<dev string:x3329>" ] ]]( var_cc3e8bc1bf3118b9, hostenemyteam, undefined, undefined, "<dev string:x3fb7>", undefined, fixedspawndata );
        level waittill_any_timeout_1( 5, "<dev string:x3fb7>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f859
    // Size: 0x116, Type: dev
    function private function_77ea3fd6a35c844c()
    {
        bots = [];
        dist = 200;
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) )
            {
                bots[ bots.size ] = player;
            }
        }
        
        rotationsteps = bots.size - 1;
        forward = anglestoforward( self.angles );
        up = anglestoup( self.angles );
        
        for (i = 0; i < rotationsteps; i++) {
            degrees = 0 + 30 * i;
            rot = rotatepointaroundvector( up, forward, degrees );
            rot = vectornormalize( rot ) * dist;
            rot = self.origin + rot;
            bots[ i ] moveto( rot, 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f977
    // Size: 0x215, Type: dev
    function private function_3153fcf9b8215d83( var_79cd16628cd9582 )
    {
        assert( isdefined( var_79cd16628cd9582 ) );
        participants = spawnstruct();
        participants.host = scripts\mp\gamelogic::gethostplayer();
        participants.bot_friendly = undefined;
        participants.var_f0c10f20746905b = undefined;
        participants.var_a11b0ce40186f569 = undefined;
        participants.var_fa2d26309ca2ac18 = undefined;
        participants.reviver = undefined;
        participants.revivee = undefined;
        participants.killer = undefined;
        
        foreach ( player in level.players )
        {
            if ( isbot( player ) )
            {
                if ( player.team == participants.host.team && !isdefined( participants.bot_friendly ) )
                {
                    participants.bot_friendly = player;
                    continue;
                }
                
                if ( player.team == participants.host.team && !isdefined( participants.var_a11b0ce40186f569 ) && player != participants.bot_friendly )
                {
                    participants.var_a11b0ce40186f569 = player;
                    continue;
                }
                
                if ( isenemyteam( participants.host.team, player.team ) && !isdefined( participants.var_f0c10f20746905b ) )
                {
                    participants.var_f0c10f20746905b = player;
                    continue;
                }
                
                if ( isenemyteam( participants.host.team, player.team ) && !isdefined( participants.var_fa2d26309ca2ac18 ) && player != participants.var_f0c10f20746905b )
                {
                    participants.var_fa2d26309ca2ac18 = player;
                }
            }
        }
        
        return participants;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1fb94
    // Size: 0x516, Type: dev
    function private function_e2d36d595bb206ce( var_79cd16628cd9582 )
    {
        assert( isdefined( var_79cd16628cd9582 ) );
        testdata = var_79cd16628cd9582;
        reviveents = spawnstruct();
        reviveents.var_bc37af116f73e671 = undefined;
        reviveents.var_67262d9240f49e33 = undefined;
        reviveents.var_ae077c08c7261bda = undefined;
        reviveents.laststandreviveent = undefined;
        reviveents.var_fdf0d3fed30ab8b2 = [];
        
        foreach ( ent in level.laststandreviveents )
        {
            if ( !isdefined( ent ) )
            {
                continue;
            }
            
            if ( ent.id != "<dev string:x3fd9>" )
            {
                continue;
            }
            
            if ( !isdefined( ent.owner ) )
            {
                continue;
            }
            
            reviveents.var_fdf0d3fed30ab8b2[ ent.owner getentitynumber() ] = ent;
            
            if ( isdefined( testdata.participants.host ) && ent.owner getentitynumber() == testdata.participants.host getentitynumber() )
            {
                reviveents.var_bc37af116f73e671 = ent;
            }
            
            if ( isdefined( testdata.participants.bot_friendly ) && ent.owner getentitynumber() == testdata.participants.bot_friendly getentitynumber() )
            {
                reviveents.var_67262d9240f49e33 = ent;
            }
            
            if ( isdefined( testdata.participants.var_f0c10f20746905b ) && ent.owner getentitynumber() == testdata.participants.var_f0c10f20746905b getentitynumber() )
            {
                reviveents.var_ae077c08c7261bda = ent;
            }
        }
        
        if ( isdefined( testdata.participants.revivee ) )
        {
            reviveents.laststandreviveent = reviveents.var_fdf0d3fed30ab8b2[ testdata.participants.revivee getentitynumber() ];
        }
        
        reviveents.var_533f3068f01bbf2f = undefined;
        reviveents.var_e1c5f2176310571 = undefined;
        reviveents.var_13a2807fa048a5f8 = undefined;
        reviveents.var_b7f019764cd541f6 = undefined;
        reviveents.var_dc714c04325425dd = undefined;
        reviveents.var_c22d884cb62e2365 = undefined;
        reviveents.var_3ef1f2f6c6768bf = [];
        
        if ( isdefined( level.revivetriggers ) )
        {
            foreach ( testtrigger in level.revivetriggers )
            {
                if ( !isdefined( testtrigger ) )
                {
                    continue;
                }
                
                reviveents.var_3ef1f2f6c6768bf[ testtrigger.owner getentitynumber() ] = testtrigger;
                
                if ( isdefined( testdata.participants.host ) && testtrigger.deadplayer getentitynumber() == testdata.participants.host getentitynumber() )
                {
                    reviveents.var_533f3068f01bbf2f = testtrigger;
                }
                
                if ( isdefined( testdata.participants.bot_friendly ) && testtrigger.deadplayer getentitynumber() == testdata.participants.bot_friendly getentitynumber() )
                {
                    reviveents.var_e1c5f2176310571 = testtrigger;
                }
                
                if ( isdefined( testdata.participants.var_a11b0ce40186f569 ) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_a11b0ce40186f569 getentitynumber() )
                {
                    reviveents.var_b7f019764cd541f6 = testtrigger;
                }
                
                if ( isdefined( testdata.participants.var_f0c10f20746905b ) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_f0c10f20746905b getentitynumber() )
                {
                    reviveents.var_13a2807fa048a5f8 = testtrigger;
                }
                
                if ( isdefined( testdata.participants.var_fa2d26309ca2ac18 ) && testtrigger.deadplayer getentitynumber() == testdata.participants.var_fa2d26309ca2ac18 getentitynumber() )
                {
                    reviveents.var_dc714c04325425dd = testtrigger;
                }
            }
            
            if ( isdefined( testdata.participants.revivee ) )
            {
                reviveents.var_c22d884cb62e2365 = reviveents.var_3ef1f2f6c6768bf[ testdata.participants.revivee getentitynumber() ];
            }
        }
        
        return reviveents;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x200b2
    // Size: 0x9c, Type: dev
    function private function_95907c91ea217d77( var_79cd16628cd9582 )
    {
        testdata = var_79cd16628cd9582;
        var_805a6d3884a4fbff = spawnstruct();
        var_805a6d3884a4fbff.setuplaststand = undefined;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = undefined;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = undefined;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = undefined;
        var_805a6d3884a4fbff.setuplaststand = &function_b0a79a4ae69d6961;
        var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a = &function_df9cc3c911f4f91d;
        var_805a6d3884a4fbff.var_adf31b8e1380965c = &scripts\mp\supers\super_stimpistol::function_ada94a4d4deecf34;
        var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_6c3a2274c9d28e55;
        return var_805a6d3884a4fbff;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x20156
    // Size: 0xee, Type: dev
    function private function_e519d591d680cf06( var_79cd16628cd9582 )
    {
        assert( isdefined( var_79cd16628cd9582 ) );
        testdata = var_79cd16628cd9582;
        
        if ( !isdefined( testdata.participants.revivee ) )
        {
            iprintlnbold( "<dev string:x3fee>" );
            return 0;
        }
        
        if ( !isdefined( testdata.participants.reviver ) )
        {
            iprintlnbold( "<dev string:x4029>" );
            return 0;
        }
        
        if ( isdefined( testdata.reviveents.var_c22d884cb62e2365 ) )
        {
            [[ testdata.var_805a6d3884a4fbff.var_adf31b8e1380965c ]]( testdata );
            return;
        }
        
        if ( isinlaststand( testdata.participants.revivee ) )
        {
            [[ testdata.var_805a6d3884a4fbff.var_1285c6e9e580dd71 ]]( testdata );
            return;
        }
        
        iprintlnbold( "<dev string:x3efe>" );
        return 0;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2024c
    // Size: 0x117, Type: dev
    function private function_6c3a2274c9d28e55( testdata )
    {
        setdvar( @"hash_a23e8f787d85f762", 1 );
        entref = getentbynum( testdata.participants.reviver getentitynumber() );
        entref.var_7f59448717b5aa63 = 1;
        wait 0.25;
        testdata.reviveents.laststandreviveent notify( "<dev string:x4064>", testdata.participants.reviver );
        
        if ( istrue( testdata.var_b34ec33a70953a71 ) )
        {
            var_a841eb961373d83e = [];
            var_a841eb961373d83e[ 0 ] = "<dev string:x406f>";
            var_a841eb961373d83e[ 1 ] = "<dev string:x3440>";
            var_a841eb961373d83e[ 2 ] = "<dev string:x408a>";
            var_a841eb961373d83e[ 3 ] = "<dev string:x14db>";
            var_a841eb961373d83e[ 4 ] = "<dev string:x40a1>";
            var_a841eb961373d83e[ 5 ] = "<dev string:x40bb>";
            msg = testdata.participants.revivee waittill_any_in_array_or_timeout_no_endon_death( var_a841eb961373d83e, 20 );
            return msg;
        }
        
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2036b
    // Size: 0x55, Type: dev
    function private function_ed9583c799dfe4b8( testdata )
    {
        testdata.participants.reviver thread scripts\mp\supers\super_stimpistol::function_22044a9973aa399c( testdata.participants.reviver, testdata.participants.revivee );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x203c8
    // Size: 0xe, Type: dev
    function private function_f55b03035f71d721( testdata )
    {
        
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x203de
    // Size: 0x55, Type: dev
    function private function_8f48082d56ac4fac( testdata )
    {
        testdata.participants.reviver thread scripts\mp\supers\super_stimpistol::function_22044a9973aa399c( testdata.participants.reviver, testdata.participants.revivee );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2043b
    // Size: 0xc0, Type: dev
    function private function_bfca4a5f93d1b4be( var_79cd16628cd9582 )
    {
        switch ( var_79cd16628cd9582.revivetype )
        {
            case #"hash_df6b3b2585101bc7":
                if ( isdefined( var_79cd16628cd9582.var_805a6d3884a4fbff.setuplaststand ) )
                {
                    [[ var_79cd16628cd9582.var_805a6d3884a4fbff.setuplaststand ]]( var_79cd16628cd9582 );
                }
                
                break;
            case #"hash_eb5e5f470e0c1dc2":
                if ( isdefined( var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a ) )
                {
                    [[ var_79cd16628cd9582.var_805a6d3884a4fbff.var_5ceaeb7f9aa6be4a ]]( var_79cd16628cd9582 );
                }
                
                break;
            default:
                assertmsg( "<dev string:x40e7>" );
                break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x20503
    // Size: 0x1ad, Type: dev
    function private function_b0a79a4ae69d6961( var_79cd16628cd9582 )
    {
        assert( isdefined( var_79cd16628cd9582 ) );
        testdata = var_79cd16628cd9582;
        
        if ( testdata.participants.revivee == testdata.participants.host )
        {
            setdvar( @"hash_9564fda23c9d6dbd", 1 );
        }
        else
        {
            testdata.participants.revivee dodamage( testdata.participants.revivee.maxhealth * 2, testdata.participants.revivee.origin, testdata.participants.reviver, undefined, undefined, testdata.participants.reviver getcurrentweapon() );
        }
        
        stringarray = [];
        stringarray[ 0 ] = "<dev string:x414c>";
        testdata.participants.revivee waittill_any_in_array_or_timeout_no_endon_death( stringarray, 10 );
        
        while ( !isinlaststand( testdata.participants.revivee ) || !isdefined( level.laststandreviveents ) )
        {
            waitframe();
        }
        
        if ( testdata.participants.revivee == testdata.participants.host )
        {
            setdvar( @"hash_9564fda23c9d6dbd", 0 );
        }
        else
        {
            setdvar( @"hash_9608479c0ddc550d", 0 );
        }
        
        return 1;
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x206b8
    // Size: 0x13e, Type: dev
    function private function_df9cc3c911f4f91d( var_79cd16628cd9582 )
    {
        killer = undefined;
        
        if ( !isdefined( var_79cd16628cd9582.participants.var_f0c10f20746905b ) )
        {
            killer = var_79cd16628cd9582.participants.host;
        }
        else
        {
            killer = var_79cd16628cd9582.participants.var_f0c10f20746905b;
        }
        
        var_79cd16628cd9582.participants.revivee dodamage( var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer );
        
        while ( level.revivetriggers.size < 1 )
        {
            var_79cd16628cd9582.participants.revivee dodamage( var_79cd16628cd9582.participants.revivee.health + 1, var_79cd16628cd9582.participants.revivee.origin, killer );
            wait var_79cd16628cd9582.shortwait;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x207fe
    // Size: 0x705, Type: dev
    function private function_fcfb461b887397e8( var_79cd16628cd9582 )
    {
        level notify( "<dev string:x416a>" );
        level endon( "<dev string:x416a>" );
        assert( isdefined( var_79cd16628cd9582 ) );
        testdata = var_79cd16628cd9582;
        
        switch ( testdata.dvarval )
        {
            case 999:
                function_2f3ae3af12426b6d();
                break;
            case 1:
                testdata.var_b34ec33a70953a71 = 1;
                testdata.revivetype = "<dev string:x40d1>";
                testdata.participants.reviver = testdata.participants.host;
                testdata.participants.revivee = testdata.participants.bot_friendly;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                break;
            case 2:
                testdata.revivetype = "<dev string:x40d1>";
                testdata.var_b34ec33a70953a71 = 1;
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.host;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            case 3:
                testdata.revivetype = "<dev string:x40d1>";
                testdata.var_b34ec33a70953a71 = 1;
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.var_a11b0ce40186f569;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            case 4:
                testdata.revivetype = "<dev string:x40d1>";
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.host;
                testdata.var_805a6d3884a4fbff.var_1285c6e9e580dd71 = &function_ed9583c799dfe4b8;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            case 11:
                testdata.var_b34ec33a70953a71 = 1;
                testdata.revivetype = "<dev string:x40de>";
                testdata.participants.reviver = testdata.participants.host;
                testdata.participants.revivee = testdata.participants.bot_friendly;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                break;
            case 12:
                testdata.revivetype = "<dev string:x40de>";
                testdata.var_b34ec33a70953a71 = 1;
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.host;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            case 13:
                testdata.revivetype = "<dev string:x40de>";
                testdata.var_b34ec33a70953a71 = 1;
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.var_a11b0ce40186f569;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            case 14:
                testdata.revivetype = "<dev string:x40de>";
                testdata.participants.reviver = testdata.participants.bot_friendly;
                testdata.participants.revivee = testdata.participants.host;
                testdata.var_805a6d3884a4fbff.var_adf31b8e1380965c = &function_8f48082d56ac4fac;
                scripts\mp\dev::function_bfca4a5f93d1b4be( testdata );
                wait testdata.longwait;
                testdata.reviveents = function_e2d36d595bb206ce( testdata );
                wait testdata.longwait;
                result = function_e519d591d680cf06( testdata );
                break;
            default:
                break;
        }
        
        waitframe();
        setdvar( @"hash_9564fda23c9d6dbd", 0 );
        
        if ( isdefined( testdata.participants.bot_friendly ) )
        {
            testdata.participants.bot_friendly.var_7f59448717b5aa63 = undefined;
        }
        
        if ( isdefined( testdata.participants.var_f0c10f20746905b ) )
        {
            testdata.participants.var_f0c10f20746905b.var_7f59448717b5aa63 = undefined;
        }
        
        testdata.participants.host.var_7f59448717b5aa63 = undefined;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20f0b
    // Size: 0x8f, Type: dev
    function function_670cf911ded0b7ec()
    {
        setdvar( @"hash_f613b218fa0c3df6", 0 );
        
        while ( true )
        {
            dvarval = getdvarfloat( @"hash_f613b218fa0c3df6", 0 );
            
            while ( dvarval <= 0 )
            {
                dvarval = getdvarfloat( @"hash_f613b218fa0c3df6", 0 );
                wait 0.5;
            }
            
            host = level.players[ 0 ];
            host waittill( "<dev string:x4189>" );
            wait dvarval;
            host kill();
            setdvar( @"hash_f613b218fa0c3df6", 0 );
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x20fa2
    // Size: 0x9e, Type: dev
    function function_3fa005bf200dc41b()
    {
        setdvar( @"hash_65941c6cedcf813d", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_65941c6cedcf813d", 0 ) == 0 )
            {
                wait 0.5;
            }
            
            foreach ( player in level.players )
            {
                player scripts\mp\supers\super_emp_pulse::function_4941256ee86725f8();
            }
            
            setdvar( @"hash_65941c6cedcf813d", 0 );
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21048
    // Size: 0x22, Type: dev
    function function_7f4bd5933ddab8b9()
    {
        level thread function_6c3ff8a589d13e3f( @"hash_62a47106347dc9c3", 0, "<dev string:x41a7>", "<dev string:x41bd>" );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21072
    // Size: 0x123, Type: dev
    function function_520075c1f7b910ab()
    {
        setdvar( @"hash_b5894713b17effdc", 0 );
        
        while ( true )
        {
            while ( getdvarint( @"hash_b5894713b17effdc", 0 ) == 0 )
            {
                wait 1;
            }
            
            setdvar( @"hash_b5894713b17effdc", 0 );
            spawndata = spawnstruct();
            spawndata.origin = level.players[ 0 ].origin + ( 0, 0, 300 );
            spawndata.initai = 1;
            ground = drop_to_ground( spawndata.origin );
            littlebird = scripts\cp_mp\vehicles\vehicle::vehicle_spawn( "<dev string:x3cff>", spawndata );
            hoverheight = undefined;
            
            while ( isdefined( littlebird ) )
            {
                newhoverheight = getdvarfloat( @"hash_113aed1a7952f7bf", 200 );
                
                if ( !isdefined( hoverheight ) || newhoverheight != hoverheight )
                {
                    littlebird vehicle_helisetai( ground + ( 0, 0, newhoverheight ), undefined, undefined, undefined, undefined, undefined, 0, undefined, 0, 1, 0, 0, 0 );
                }
                
                hoverheight = newhoverheight;
                wait 0.5;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2119d
    // Size: 0xaa, Type: dev
    function function_a9b2f9316ff36912()
    {
        setdvar( @"hash_524c399fc04122a3", 0 );
        
        while ( getdvarint( @"hash_524c399fc04122a3", 0 ) == 0 )
        {
            wait 1;
        }
        
        level.getspawnpoint = &function_ca0580bf0f9d51e;
        
        while ( true )
        {
            wait 4;
            
            foreach ( bot in level.players )
            {
                if ( !isbot( bot ) )
                {
                    continue;
                }
                
                bot kill();
                wait 1;
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2124f
    // Size: 0x334, Type: dev
    function function_ca0580bf0f9d51e()
    {
        self.wassquadspawned = 0;
        vehicleent = undefined;
        
        if ( isdefined( level.vehicle.instances ) && isdefined( level.vehicle.instances[ "<dev string:x41d4>" ] ) )
        {
            foreach ( vehicle in level.vehicle.instances[ "<dev string:x41d4>" ] )
            {
                vehicleent = vehicle;
                break;
            }
        }
        
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint( self, self.team, undefined, undefined, "<dev string:x41e2>" );
        
        if ( !isdefined( vehicleent ) )
        {
            return spawnpoint;
        }
        
        forwardoffset = -200;
        heightoffset = 64;
        spawnpoint.origin = vehicleent.origin + anglestoforward( vehicleent.angles ) * forwardoffset + ( 0, 0, heightoffset );
        spawnpoint.angles = ( 0, vehicleent.angles[ 1 ], 0 );
        seat = scripts\cp_mp\vehicles\vehicle_occupancy::function_d3d95972f58ad2bc( vehicleent );
        
        if ( isdefined( seat ) && istrue( scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_vehiclecanbeused( vehicleent ) ) && ( istrue( scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_getleveldataforvehicle( vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd() ).var_1ad50a59da38c8f5 ) || seat == "<dev string:x41e9>" ) )
        {
            data = spawnstruct();
            data.useonspawn = 1;
            data.enterstartwaitmsg = "<dev string:x106b>";
            thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_enter( vehicleent, seat, self, data );
        }
        else
        {
            exitboundinginfo = scripts\cp_mp\vehicles\vehicle_occupancy::function_517f60905f08bf96( vehicleent );
            var_b8e7e41430673dd2 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle( vehicleent.vehiclename );
            var_de71eef0ad57608 = 0;
            
            foreach ( ref, direction in var_b8e7e41430673dd2.exitdirections )
            {
                if ( direction == "<dev string:x41f3>" || direction == "<dev string:x41fa>" )
                {
                    position = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getexitposition( vehicleent, self, ref, exitboundinginfo, 1 );
                    
                    if ( isdefined( position ) )
                    {
                        spawnpoint.origin = position;
                        self.var_f109e15fae27ddc2 = vehicleent;
                        thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit( vehicleent, self );
                        break;
                    }
                    
                    if ( !var_de71eef0ad57608 )
                    {
                        var_de71eef0ad57608 = 1;
                        leveldataforvehicle = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle( vehicleent scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd() );
                        exitoffset = leveldataforvehicle.exitoffsets[ ref ];
                        spawnpoint.origin = vehicleent.origin + rotatevector( exitoffset, vehicleent.angles );
                        self.var_f109e15fae27ddc2 = vehicleent;
                        thread scripts\cp_mp\vehicles\vehicle::vehicle_preventplayercollisiondamagefortimeafterexit( vehicleent, self );
                    }
                }
            }
        }
        
        self.spawningintovehicle = 1;
        return spawnpoint;
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2158b
    // Size: 0xbd, Type: dev
    function function_b372047bb3d279b4()
    {
        setdvar( @"hash_191cedf037a1c0e", 0 );
        
        while ( getdvarint( @"hash_191cedf037a1c0e", 0 ) == 0 )
        {
            wait 1;
        }
        
        foreach ( a in level.ascendstructs )
        {
            drawduration = 10;
            spherecolor = ( 1, 0, 0 );
            thread scripts\cp_mp\utility\debug_utility::drawsphere( a.origin, 5, drawduration, spherecolor );
        }
        
        thread function_b372047bb3d279b4();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21650
    // Size: 0x3e, Type: dev
    function function_5fc8d22a4231b972()
    {
        setdvar( @"hash_1c59bb31183ed670", 0 );
        
        while ( getdvarint( @"hash_1c59bb31183ed670", 0 ) == 0 )
        {
            wait 1;
        }
        
        scripts\cp_mp\ent_manager::function_a5aa9e07f21b879e();
        thread function_5fc8d22a4231b972();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21696
    // Size: 0x248, Type: dev
    function function_a14582fb2297ccbd()
    {
        player = function_69dffe7a5cb1b4b9();
        
        if ( !isdefined( player ) )
        {
            iprintlnbold( "<dev string:x4204>" );
            return;
        }
        
        if ( istrue( player.var_f178ea6f6702f17c ) )
        {
            player controlsunlink( 1 );
            player.var_f178ea6f6702f17c = 0;
            player allowjump( 1 );
            player allowfire( 1 );
            player allowmelee( 1 );
            player enableoffhandweapons();
            return;
        }
        
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward( playerangles );
        tracestart = ( playerorigin[ 0 ], playerorigin[ 1 ], playerorigin[ 2 ] + player getplayerviewheight() );
        traceend = tracestart + playerforward * 5000;
        tracecontents = scripts\engine\trace::create_default_contents( 0 );
        trace = scripts\engine\trace::ray_trace( tracestart, traceend, player, tracecontents );
        
        if ( isdefined( trace[ "<dev string:x171>" ] ) && isbot( trace[ "<dev string:x171>" ] ) )
        {
            player controlslinkto( trace[ "<dev string:x171>" ] );
            player.var_f178ea6f6702f17c = 1;
            player allowjump( 0 );
            player allowfire( 0 );
            player allowmelee( 0 );
            player disableoffhandweapons();
            return;
        }
        
        closestbot = undefined;
        closestdist = 0;
        
        foreach ( otherplayer in level.players )
        {
            if ( isbot( otherplayer ) )
            {
                dist = distance2dsquared( otherplayer.origin, trace[ "<dev string:x1ae>" ] );
                
                if ( closestdist == 0 || dist < closestdist )
                {
                    closestdist = dist;
                    closestbot = otherplayer;
                }
            }
        }
        
        if ( isdefined( closestbot ) )
        {
            player controlslinkto( closestbot );
            player.var_f178ea6f6702f17c = 1;
            player allowjump( 0 );
            player allowfire( 0 );
            player allowmelee( 0 );
            player disableoffhandweapons();
            return;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x218e6
    // Size: 0x2f1, Type: dev
    function function_19068dd111569111()
    {
        level endon( "<dev string:x101>" );
        
        if ( getdvarint( @"hash_eb038ca43332e718", 0 ) == 0 )
        {
            setdvar( @"hash_eb038ca43332e718", 1 );
            iprintlnbold( "<dev string:x4225>" );
            return;
        }
        
        player = function_69dffe7a5cb1b4b9();
        playerorigin = player.origin;
        playerangles = player getplayerangles();
        playerforward = anglestoforward( playerangles );
        tracestart = ( playerorigin[ 0 ], playerorigin[ 1 ], playerorigin[ 2 ] + player getplayerviewheight() );
        traceend = tracestart + playerforward * 5000;
        tracecontents = scripts\engine\trace::create_default_contents( 0 );
        trace = scripts\engine\trace::ray_trace( tracestart, traceend, player, tracecontents );
        
        if ( isdefined( trace[ "<dev string:x171>" ] ) && isbot( trace[ "<dev string:x171>" ] ) )
        {
            targetbot = trace[ "<dev string:x171>" ];
        }
        else
        {
            closestdist = 0;
            targetbot = undefined;
            
            foreach ( otherplayer in level.players )
            {
                if ( isbot( otherplayer ) )
                {
                    dist = distance2dsquared( otherplayer.origin, trace[ "<dev string:x1ae>" ] );
                    
                    if ( closestdist == 0 || dist < closestdist )
                    {
                        closestdist = dist;
                        targetbot = otherplayer;
                    }
                }
            }
        }
        
        if ( isdefined( targetbot ) )
        {
            var_387ea36d35dcafbd = undefined;
            closestdist = 0;
            
            foreach ( otherplayer in level.players )
            {
                dist = distance2dsquared( otherplayer.origin, trace[ "<dev string:x1ae>" ] );
                
                if ( otherplayer isenemy( targetbot ) && ( closestdist == 0 || dist < closestdist ) )
                {
                    closestdist = dist;
                    var_387ea36d35dcafbd = otherplayer;
                }
            }
            
            if ( isdefined( var_387ea36d35dcafbd ) )
            {
                targetangles = var_387ea36d35dcafbd getplayerangles();
                targetforward = anglestoforward( targetangles );
                var_f7ef71d15e0afd17 = var_387ea36d35dcafbd.origin + targetforward * ( -35, -35, 0 );
                targetbot setorigin( var_f7ef71d15e0afd17 );
                targetbot setplayerangles( targetangles );
                var_addfaa239c709035 = var_387ea36d35dcafbd gettagorigin( "<dev string:x426b>" );
                targetbot botlookatpoint( var_addfaa239c709035, 3.5 );
                wait 0.5;
                targetbot enableexecutionattack();
                targetbot botpressbutton( "<dev string:x427b>", 3 );
            }
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21bdf
    // Size: 0xf1, Type: dev
    function function_59012b384deffea6()
    {
        while ( !isdefined( level.player ) )
        {
            waitframe();
        }
        
        foreach ( player in array_randomize( level.players ) )
        {
            if ( !is_equal( player.pers[ "<dev string:x7fd>" ], level.player.pers[ "<dev string:x7fd>" ] ) )
            {
                continue;
            }
            
            if ( is_equal( player, level.player ) )
            {
                continue;
            }
            
            if ( !isreallyalive( player ) )
            {
                continue;
            }
            
            player dodamage( player.maxhealth + 1, player.origin, player, player, "<dev string:x4284>", undefined, "<dev string:x14a3>" );
            break;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21cd8
    // Size: 0x3b, Type: dev
    function function_a8eab8a41bbd80f7()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_1f68298a5bbf604b" ) )
            {
                function_59012b384deffea6();
                setdvar( @"hash_1f68298a5bbf604b", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21d1b
    // Size: 0x3b, Type: dev
    function function_a87badf6fb3813e3()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_4ad91d42246ab0eb" ) )
            {
                function_a14582fb2297ccbd();
                setdvar( @"hash_4ad91d42246ab0eb", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21d5e
    // Size: 0x3c, Type: dev
    function function_851035ff671bdc1f()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_9121a70517dea5ff" ) )
            {
                thread function_19068dd111569111();
                setdvar( @"hash_9121a70517dea5ff", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21da2
    // Size: 0xc2, Type: dev
    function function_bbe2150913f65c2a()
    {
        setdvar( @"hash_8ad8ec07fa623e0e", "<dev string:xca>" );
        playing = 0;
        
        while ( true )
        {
            if ( !playing && getdvar( @"hash_8ad8ec07fa623e0e", "<dev string:xca>" ) != "<dev string:xca>" )
            {
                level.players[ 0 ] setplayermusicstate( "<dev string:x4296>", [ getdvar( @"hash_8ad8ec07fa623e0e", "<dev string:xca>" ) ] );
                playing = 1;
            }
            else if ( playing && getdvar( @"hash_8ad8ec07fa623e0e", "<dev string:xca>" ) == "<dev string:xca>" )
            {
                level.players[ 0 ] stopplayermusicstate( "<dev string:x4296>" );
                playing = 0;
            }
            
            wait 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21e6c
    // Size: 0xba, Type: dev
    function splashesdevgui()
    {
        while ( getdvar( @"hash_2c0beeb4679914a5", "<dev string:xf0>" ) == "<dev string:xf0>" )
        {
            wait 1;
        }
        
        var_af386172f63848bd = getdvar( @"hash_2c0beeb4679914a5", "<dev string:xf0>" );
        
        if ( getsubgametype() == "<dev string:x736>" || getsubgametype() == "<dev string:x42a3>" )
        {
            scripts\mp\gametypes\br_gametype_dmz::showdmzsplash( var_af386172f63848bd, level.players, "<dev string:x42ab>" );
        }
        else
        {
            setdvar( @"hash_c39067c564e9be9", 0 );
            setdvar( @"hash_31d5d7a79355909c", var_af386172f63848bd );
        }
        
        setdvar( @"hash_2c0beeb4679914a5", "<dev string:xf0>" );
        thread splashesdevgui();
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21f2e
    // Size: 0x52, Type: dev
    function devprint()
    {
        while ( true )
        {
            msg = getdvar( @"scr_print" );
            
            if ( msg != "<dev string:xca>" )
            {
                iprintlnbold( msg );
                setdvar( @"scr_print", "<dev string:xca>" );
            }
            
            wait 0.5;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21f88
    // Size: 0x1d9, Type: dev
    function function_9c32d0bcea4c4746()
    {
        level.var_8739ee0d5a9db983 = [];
        
        while ( true )
        {
            radius = getdvarint( @"hash_f4fa79a3a067cddd", 0 );
            
            if ( radius > 0 )
            {
                setdvar( @"hash_f4fa79a3a067cddd", 0 );
                host = level.players[ 0 ];
                
                if ( !isdefined( host ) )
                {
                    wait 0.5;
                    continue;
                }
                
                origin = host.origin;
                circleobjective = spawnstruct();
                circleobjective.curorigin = origin;
                circleobjective.offset3d = ( 0, 0, 100 );
                circleobjective scripts\mp\gameobjects::requestid( 1, 1, undefined, 1, 0 );
                scripts\mp\objidpoolmanager::update_objective_setbackground( circleobjective.objidnum, 1 );
                scripts\mp\objidpoolmanager::update_objective_setzoffset( circleobjective.objidnum, 100 );
                scripts\mp\objidpoolmanager::update_objective_ownerteam( circleobjective.objidnum, host.team );
                scripts\mp\objidpoolmanager::objective_playermask_showtoall( circleobjective.objidnum );
                circleobjective scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522( "<dev string:x42b3>", origin, radius, host );
                circleobjective scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
                level.var_8739ee0d5a9db983[ level.var_8739ee0d5a9db983.size ] = circleobjective;
            }
            
            clearcircles = getdvarint( @"hash_63104a285423756a", 0 );
            
            if ( clearcircles )
            {
                setdvar( @"hash_63104a285423756a", 0 );
                
                foreach ( circleobjective in level.var_8739ee0d5a9db983 )
                {
                    circleobjective notify( "<dev string:x42c1>" );
                    circleobjective scripts\mp\gameobjects::releaseid();
                    circleobjective scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
                }
            }
            
            wait 0.5;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x22169
    // Size: 0x47, Type: dev
    function function_46f83fe8ffc7244()
    {
        level.spawnpos = level.players[ 0 ].origin;
        level.spawnang = ( 0, level.players[ 0 ] getplayerangles( 1 )[ 1 ] + 180, 0 );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x221b8
    // Size: 0x3c, Type: dev
    function function_6033c33f117d9dc4( bot )
    {
        bot setorigin( level.spawnpos + ( 0, 0, 18 ) );
        bot setplayerangles( level.spawnang );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x221fc
    // Size: 0x9f, Type: dev
    function function_ee24307f577b6886()
    {
        bookmarkstart = "<dev string:x42d2>";
        bookmarkend = "<dev string:x434f>";
        
        if ( !isdefined( level.debugbookmark ) )
        {
            level.debugbookmark = 1;
        }
        
        while ( true )
        {
            if ( getdvarint( @"hash_8d64d93609b4dda" ) == 1 )
            {
                debugmark = ter_op( level.debugbookmark, bookmarkstart, bookmarkend );
                println( debugmark );
                setdvar( @"hash_8d64d93609b4dda", 0 );
                level.debugbookmark = !level.debugbookmark;
            }
            
            waitframe();
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x222a3
    // Size: 0x288, Type: dev
    function function_4010e425c0a3a12a()
    {
        dvarstring = getdvar( @"hash_6a93ed78e507e165" );
        filepath = "<dev string:x43cc>" + dvarstring;
        fileid = openfile( filepath, "<dev string:x1e88>" );
        axisplayers = [];
        alliesplayers = [];
        
        foreach ( player in level.players )
        {
            if ( player.team == "<dev string:x3fe>" )
            {
                axisplayers[ axisplayers.size ] = player;
                continue;
            }
            
            alliesplayers[ alliesplayers.size ] = player;
        }
        
        foreach ( axis in axisplayers )
        {
            var_5448741dba3c2ee2 = axis.origin[ 0 ] + "<dev string:x31a>" + axis.origin[ 1 ] + "<dev string:x31a>" + axis.origin[ 2 ] + "<dev string:x1634>" + axis.angles[ 0 ] + "<dev string:x31a>" + axis.angles[ 1 ] + "<dev string:x31a>" + axis.angles[ 2 ] + "<dev string:x1634>" + axis.team;
            fprintln( fileid, var_5448741dba3c2ee2 );
        }
        
        foreach ( allies in alliesplayers )
        {
            var_5448741dba3c2ee2 = allies.origin[ 0 ] + "<dev string:x31a>" + allies.origin[ 1 ] + "<dev string:x31a>" + allies.origin[ 2 ] + "<dev string:x1634>" + allies.angles[ 0 ] + "<dev string:x31a>" + allies.angles[ 1 ] + "<dev string:x31a>" + allies.angles[ 2 ] + "<dev string:x1634>" + allies.team;
            fprintln( fileid, var_5448741dba3c2ee2 );
        }
        
        closefile( fileid );
    }

    // Namespace dev / scripts\mp\dev
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x22533
    // Size: 0x167, Type: dev
    function function_3096e29a61a6456d( list )
    {
        axisplayers = [];
        alliesplayers = [];
        axiscounter = 0;
        alliescounter = 0;
        
        foreach ( player in level.players )
        {
            if ( player.team == "<dev string:x3fe>" )
            {
                axisplayers[ axisplayers.size ] = player;
                continue;
            }
            
            alliesplayers[ alliesplayers.size ] = player;
        }
        
        foreach ( item in list )
        {
            if ( item.teams == "<dev string:x3fe>" )
            {
                axisplayers[ axiscounter ] setorigin( item.origin );
                axisplayers[ axiscounter ] setplayerangles( item.angles );
                axiscounter += 1;
                continue;
            }
            
            alliesplayers[ alliescounter ] setorigin( item.origin );
            alliesplayers[ alliescounter ] setplayerangles( item.angles );
            alliescounter += 1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x226a2
    // Size: 0x151, Type: dev
    function function_3bbc64340510aeab()
    {
        dvarstring = getdvar( @"hash_6a93ed78e507e165" );
        filepath = "<dev string:x43cc>" + dvarstring;
        fileid = openfile( filepath, "<dev string:x43db>" );
        filecontent = function_4b6fff8cec79433( fileid );
        filecontent = function_4b6fff8cec79433( fileid );
        contentlist = strtok( filecontent, "<dev string:x12ff>" );
        var_7f775fc896818128 = [];
        
        foreach ( lineitem in contentlist )
        {
            tempstring = strtok( lineitem, "<dev string:x1634>" );
            test = strtok( lineitem, "<dev string:x2ef>" );
            loc_info = spawnstruct();
            loc_info.origin = stringtovec3( tempstring[ 0 ] );
            loc_info.angles = stringtovec3( tempstring[ 1 ] );
            loc_info.teams = tempstring[ 2 ];
            var_7f775fc896818128[ var_7f775fc896818128.size ] = loc_info;
        }
        
        function_3096e29a61a6456d( var_7f775fc896818128 );
        closefile( fileid );
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x227fb
    // Size: 0x3b, Type: dev
    function spawnsnapshot()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_5b8a4bfaae3c12f4" ) )
            {
                function_4010e425c0a3a12a();
                setdvar( @"hash_5b8a4bfaae3c12f4", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2283e
    // Size: 0x3b, Type: dev
    function function_c501cf55f653e738()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_f2d32cd17a068abf" ) )
            {
                function_3bbc64340510aeab();
                setdvar( @"hash_f2d32cd17a068abf", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x22881
    // Size: 0x3f, Type: dev
    function function_94d8d463937bccf1()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_7d0eb445e2ed360c" ) )
            {
                level.var_f55a78de40f16b44 = 1;
                setdvar( @"hash_7d0eb445e2ed360c", 0 );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x228c8
    // Size: 0x9d, Type: dev
    function function_9e1848a733ce0c17()
    {
        while ( true )
        {
            if ( getdvar( @"hash_17a1591e3fe7c036" ) != "<dev string:xca>" )
            {
                foreach ( player in level.players )
                {
                    player scripts\mp\teams::createoperatorcustomization();
                }
                
                level.var_f55a78de40f16b44 = 1;
                setdvar( @"hash_17a1591e3fe7c036", "<dev string:xca>" );
            }
            
            wait 0.1;
        }
    }

    // Namespace dev / scripts\mp\dev
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2296d
    // Size: 0x93, Type: dev
    function function_4ab8a4d4bb3168ba()
    {
        while ( true )
        {
            if ( getdvarint( @"hash_17bb7ff71c139bfe" ) )
            {
                level.var_f55a78de40f16b44 = 1;
                
                foreach ( player in level.players )
                {
                    scripts\mp\bots\bots::function_84fead845cc1c1ff( player );
                }
                
                setdvar( @"hash_17bb7ff71c139bfe", 0 );
            }
            
            wait 0.1;
        }
    }

#/
