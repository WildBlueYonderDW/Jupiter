// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gamescore.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_14183df6f9af8737;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_128d1a71fc850b8a;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\br_ai_encounters.gsc;
#using script_268c4da1ef6a20a8;
#using script_1c47017ba325709a;
#using script_2bc0b0102f9b7751;
#using script_640cf1641c03e2a0;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\events.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_a34750d17473c49;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using script_5bab271917698dc4;
#using script_7c40fa80892a721;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_4cdabcd91a92977;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_57ce8f0135b8b312;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_bbb7af4f07fb391c;

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be1
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_6176022cc9d5b3f::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c00
// Size: 0x67
function init() {
    function_528570ceb9dc7bf4();
    thread function_7269c88a927e7937();
    function_67caacec6ddd6a25();
    function_dbe2065974832286();
    level thread function_8af96d3889f46280();
    level thread function_d7a7aa9ee1cc1071();
    setdvarifuninitialized(@"hash_98fad011285f3011", 0);
    setdvarifuninitialized(@"hash_e82b8618853a182c", 2000);
    /#
        setdevdvarifuninitialized(@"hash_5a1dae481ef5d089", 0);
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6e
// Size: 0x128
function function_97b175cec5b685be(table) {
    if (!isdefined(level.var_c04b5edf3f9ea340)) {
        level.var_c04b5edf3f9ea340 = [];
    }
    var_a78225c464121e51 = level.var_c04b5edf3f9ea340.size;
    var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    level.var_c04b5edf3f9ea340[var_a78225c464121e51] = [];
    for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
        level.var_c04b5edf3f9ea340[var_a78225c464121e51][level.var_c04b5edf3f9ea340[var_a78225c464121e51].size] = function_aa8a954d66bf39b4(classindex, table);
    }
    level.var_77c121d31e587ba8 = [];
    foreach (circleindex, var_1a9e152363126a93 in level.var_c04b5edf3f9ea340) {
        if (isdefined(level.var_c04b5edf3f9ea340[circleindex]) && level.var_c04b5edf3f9ea340[circleindex].size > 0) {
            level.var_77c121d31e587ba8[circleindex] = randomintrange(0, level.var_c04b5edf3f9ea340[circleindex].size);
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9d
// Size: 0x34b
function function_aa8a954d66bf39b4(classindex, table) {
    var_cfa6985254954fb3 = namespace_d19129e4fa5d176::function_c7a0b640c398497(table, classindex);
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = var_cfa6985254954fb3.primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = var_cfa6985254954fb3.primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = var_cfa6985254954fb3.primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = var_cfa6985254954fb3.primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = var_cfa6985254954fb3.primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = var_cfa6985254954fb3.primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = var_cfa6985254954fb3.primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = var_cfa6985254954fb3.primaryweapon.reticle;
    loadout["loadoutSecondary"] = var_cfa6985254954fb3.secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = var_cfa6985254954fb3.secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = var_cfa6985254954fb3.secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = var_cfa6985254954fb3.secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = var_cfa6985254954fb3.secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = var_cfa6985254954fb3.secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = var_cfa6985254954fb3.secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = var_cfa6985254954fb3.secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = var_cfa6985254954fb3.equipment.primary;
    loadout["loadoutEquipmentSecondary"] = var_cfa6985254954fb3.equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:var_cfa6985254954fb3.perks.perk1, 1:var_cfa6985254954fb3.perks.perk2, 2:var_cfa6985254954fb3.perks.perk3, 3:var_cfa6985254954fb3.extraperks.perk1, 4:var_cfa6985254954fb3.extraperks.perk2, 5:var_cfa6985254954fb3.extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f0
// Size: 0xb38
function function_d7a7aa9ee1cc1071() {
    setomnvar("ui_br_resurgence_respawn_enabled", 1);
    level.brgametype.var_f25f680fb993ccef = getdvarint(@"hash_b06743df480e3bb6", 0) == 1;
    if (istrue(level.brgametype.var_f25f680fb993ccef)) {
        function_e793259b8f9d5b2d();
    }
    level.brgametype.var_4ad7c03ec4fa687 = namespace_36f464722d326bbe::function_4fb37368ae3585bb() == 1;
    level.brgametype.var_9524142eb719a321 = !istrue(level.brgametype.var_b43745b85f249e68) && getdvarint(@"hash_13ba9ee48d08ee48", 1) == 1;
    level.brgametype.var_bb9b77186cb79ae6 = getdvarint(@"hash_f1ef637b3ab006fb", 1) == 1;
    level.brgametype.var_bbde847aed85512a = !level.brgametype.var_4ad7c03ec4fa687 && !istrue(level.brgametype.var_b43745b85f249e68) && getdvarint(@"hash_effcc0523bc99bb9", 1) == 1;
    level.brgametype.var_836c1fc36b00559d = getdvarint(@"hash_dddfb37f0d106b0f", 1) == 1;
    level.brgametype.var_574951d2eff9c094 = !level.brgametype.var_4ad7c03ec4fa687 && getdvarint(@"hash_5a17d3c422c65887", 0) == 1;
    level.brgametype.var_36dbca9d337b4930 = getdvarint(@"hash_7f1cabf5a72f2647", 1) == 1;
    level.brgametype.var_8947d8f4e61494fa = getdvarint(@"hash_4abdfd8d72cdf072", 1) == 1 && level.brgametype.var_bb9b77186cb79ae6;
    level.brgametype.var_fb997d1846bd5cf4 = getdvarint(@"hash_fb2c9f57e35f736", 1) == 1 && level.brgametype.var_9524142eb719a321;
    /#
        namespace_3c37cb17ade254d::registersharedfunc("loadoutSuper", "resurgenceVengeanceDecreaseRespawnDelay", &function_98609987fbc9bcc3);
    #/
    if (level.brgametype.var_bbde847aed85512a) {
        level.brgametype.var_523779ad4c01fd7c = getdvarint(@"hash_d514b6128f4be10d", 1) == 1;
        level.brgametype.var_f8da748df2368691 = getdvarint(@"hash_23641e104db7afc6", 3);
        level.brgametype.var_8f48d3f93ac1204c = getdvarint(@"hash_bce5ae6c10bb74cb", 60);
        level.brgametype.var_74427b8346a538df = getdvarint(@"hash_8aacc13e4663f7e5", 15);
    }
    function_e30bfec8b3d65b77();
    level.brgametype.var_6420b42c7add53cc = getdvarint(@"hash_d2891d4180de0553", 1);
    level.brgametype.var_840b848760f488a4 = getdvarint(@"hash_96c8e4682ff85b5f", 0);
    level.brgametype.var_428c736511619824 = getdvarfloat(@"hash_dc284649b5343df1", 2.5);
    level.brgametype.var_6ee71092be57820c = getdvarfloat(@"hash_8217b0dfa2d04c31", 10);
    level.brgametype.var_f6682c80c3c868d6 = getmatchrulesdata("brData", "resurgenceUseVengeance");
    level.brgametype.var_fbc20f6d398b973e = getmatchrulesdata("brData", "resurgenceVengeanceUseAnyKill");
    level.brgametype.var_7b3746fd57041fb7 = getmatchrulesdata("brData", "resurgenceUseVengeanceDecreaseRespawnTimer");
    level.brgametype.var_3dd997e45e444b3d = getmatchrulesdata("brData", "resurgenceUsePointsToReduceRespawnTime");
    level.respawnheightoverride = getdvarint(@"hash_ae35e4bb8a3aa9e7", 7500);
    level.brgametype.var_2cfdc1d6e92251bf = getmatchrulesdata("brData", "resurgenceVengeanceDecreaseRespawnDelay");
    level.brgametype.var_b30e180b0b50d598 = getdvarint(@"hash_5dc7ba56c5253ee8", 1);
    level.brgametype.var_14afb82aa29bc57c = getdvarint(@"hash_77028b51cd3d0a56", -1);
    level.brgametype.var_f439c17a413f05c3 = getdvarint(@"hash_e77b23156a69cbc1", 1) == 1;
    level.brgametype.var_b8a3736f232f201a = getdvarint(@"hash_51697d665f5b67fe", 1000);
    level.brgametype.var_4af675f2894744ae = squared(level.brgametype.var_b8a3736f232f201a);
    level.brgametype.var_76ba167fab191869 = getdvarint(@"hash_8d276da6fab8c5e", 2500);
    level.brgametype.var_4c9d8cddc19303ed = squared(level.brgametype.var_76ba167fab191869);
    level.brgametype.var_a11c00bd12593a72 = getdvarfloat(@"hash_7652a62713e7e3d", 15);
    level.brgametype.var_cf8a4ef13ed2f5ba = getdvarint(@"hash_ed51351f11220d40", 1) == 1;
    level.brgametype.var_f9623a041e743669 = level.brgametype.var_f439c17a413f05c3 && getdvarint(@"hash_4c1efe20b495c492", 0) == 1;
    if (level.brgametype.var_f9623a041e743669) {
        level.brgametype.var_87d4766b5816bbf5 = getdvarint(@"hash_44552acab369e55b", 2);
        level.brgametype.var_3de07078c89e05f0 = getdvarint(@"hash_a5958c5664ccb954", 3);
        level.brgametype.var_96e126d983a6bcb = getdvarint(@"hash_5093e1a58adbb3ea", 4);
    }
    level.brgametype.var_4a73ad987e2857e1 = getdvarint(@"hash_4d634ba058318a25", -1);
    level.brgametype.var_ed0962f69d72e5b1 = getdvarint(@"hash_8a84225861f51e28", -1);
    level.brgametype.var_12d3d7f14586d634 = getdvarint(@"hash_129e6244045a81b6", -1);
    level.brgametype.var_dd674d15153f7aab = getdvarint(@"hash_85db29695ad16662", -1);
    level.brgametype.var_bc6456d93d2e9053 = getdvarint(@"hash_717b2ab5fd9216df", -1);
    level.brgametype.var_a922c322aa7d8e27 = getdvarint(@"hash_59be9f022aae99b1", -1);
    level.brgametype.var_dca0e6fef4e95fa9 = getdvarint(@"hash_c11e2240978a14ab", -1);
    level.brgametype.var_4a10a8dd79fb5ab4 = getdvarint(@"hash_4f0bcedaa99a517f", -1);
    level.brgametype.var_a8ffbf7c6f0e152b = getdvarint(@"hash_398cc06dc285f5b6", -1);
    level.brgametype.var_53911fa2d60ccb40 = getdvarint(@"hash_4928f88cf598f176", -1);
    level.brgametype.var_79155a61db265b6e = getdvarint(@"hash_b49ec960bcba14bc", -1);
    level.brgametype.var_e3c11803759b1678 = getdvarint(@"hash_76fa3ffc4eb3f38c", -1);
    level.brgametype.var_eac57b0b307ab1ef = getdvarint(@"hash_af651e107ec02598", -1);
    level.brgametype.var_8cb996b879748bb1 = getdvarfloat(@"hash_6772e6c744d1d962", 30);
    level.brgametype.var_59af2e5140d3fed7 = getdvarfloat(@"hash_e9b60187d57107b9", 1);
    level.brgametype.var_a916b204f027af6b = getdvarint(@"hash_a91b489383d89274", 0);
    level.brgametype.var_6f3c4d74a8c614ab = getdvarint(@"hash_38aff65bda44b82a", 1);
    level.brgametype.var_be0c10911fec189f = 1;
    level.brgametype.var_92c7e81d45c2ea1f = getdvarint(@"hash_6072057c2f747227", 0);
    level.brgametype.var_3406c5ecf91c3b86 = getdvarint(@"hash_268ddaf57143b953", 0);
    level.brgametype.var_7a149071627b69e9 = getdvarint(@"hash_1d4ec9141e6b4a64", 0);
    level.brgametype.var_3fc59bce0c73b8cf = getdvarint(@"hash_25f058368af3bc5a", 400);
    level.brgametype.var_eaa971da207c8bb5 = getdvarint(@"hash_590ae68d2c03b69b", 5);
    namespace_71073fa38f11492::registerbrgametypefunc("circleTimer", &circletimer);
    namespace_71073fa38f11492::registerbrgametypefunc("mayConsiderPlayerDead", &function_411af8132ca77d3a);
    namespace_71073fa38f11492::registerbrgametypefunc("triggerRespawnOverlay", &function_2e712bc64fde7);
    namespace_71073fa38f11492::registerbrgametypefunc("playerNakedDropLoadout", &function_6ab3fa08604ded12);
    namespace_71073fa38f11492::registerbrgametypefunc("getDefaultLoadout", &function_b0fc27ec6e239628);
    namespace_71073fa38f11492::registerbrgametypefunc("playerDropBonuses", &function_decd4293c451c70);
    namespace_71073fa38f11492::registerbrgametypefunc("playerKilledSpawn", &function_f99a079543f11bf7);
    namespace_71073fa38f11492::registerbrgametypefunc("markPlayerAsEliminatedOnKilled", &function_4001b05bdb048819);
    namespace_71073fa38f11492::registerbrgametypefunc("assignLastStandAttacker", &function_f39fa02f6ed912fc);
    namespace_71073fa38f11492::registerbrgametypefunc("kioskRevivePlayer", &function_f9a2b6ae09e7a00);
    namespace_71073fa38f11492::registerbrgametypefunc("dropOnPlayerDeath", &function_59e26a5b68b2b39a);
    namespace_71073fa38f11492::registerbrgametypefunc("vipRespawnPlayer", &function_f9d21088ed2c3306);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerKilled", &function_277c5d414a129608);
    namespace_71073fa38f11492::registerbrgametypefunc("getPlacementXPShareValues", &function_b0bb8889afbb0c83);
    namespace_71073fa38f11492::registerbrgametypefunc("getBRBonusXPperMillisecond", &function_843d05502816cbce);
    waittillframeend();
    if (level.brgametype.var_3dd997e45e444b3d) {
        level.var_5dfd73c97bf5d03d = &function_3709903d7ad3f711;
    }
    thread function_c3aa670d2773db51();
    thread function_aa202a5e20886406();
    thread function_9f61893413e0093c();
    thread function_3ee5f100eb900caf();
    thread function_809485f51d59ebb();
    thread function_797b21b78b5e0a26();
    thread function_4f5568cf15d60b8();
    thread function_90507e372a40c684();
    thread function_22ef1cd58a8d87e8();
    thread namespace_fc28fc5402338af6::init();
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&function_f13ec0f9fbe36171);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_7ea88dd9bc483463);
    thread function_81baad6d96ff2130();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2f
// Size: 0x42
function function_e30bfec8b3d65b77() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("initResurgenceLoadouts")) {
        namespace_71073fa38f11492::runbrgametypefunc("initResurgenceLoadouts");
        return;
    }
    function_97b175cec5b685be("classtable:classtable_br_resurgence");
    function_97b175cec5b685be("classtable:classtable_br_resurgence_circle2");
    function_97b175cec5b685be("classtable:classtable_br_resurgence_circle3");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c78
// Size: 0x96
function function_528570ceb9dc7bf4() {
    if (getdvarint(@"hash_5a1dae481ef5d089", 0) == 1) {
        namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    }
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("randomizeCircleCenter");
    if (getdvarint(@"hash_32bd10766631266f", 0) != 0) {
        if (getdvarint(@"hash_6a54f6ff93e297ba", 1) == 1) {
            namespace_71073fa38f11492::disablefeature("planeSnapToOOB");
        }
        namespace_71073fa38f11492::enablefeature("planeUseCircleRadius");
        namespace_71073fa38f11492::enablefeature("circleEarlyStart");
    }
    namespace_71073fa38f11492::enablefeature("infilParachuteVfx");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d15
// Size: 0x5b
function function_67caacec6ddd6a25() {
    namespace_33ca1c63d4300adc::init();
    if (getdvarint(@"hash_58495ad861147d94", 0)) {
        level.var_428703950599c9e9 = &namespace_b27abd42d87cb8c0::function_428703950599c9e9;
        level thread namespace_43bf74a2ee9234c0::function_7f4d3080c6e8748b();
        level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
        level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
        namespace_3c37cb17ade254d::registersharedfunc("paraReinforce", "onChutePull", &namespace_885300a47c2b51e6::function_6a8ad55c5a4036d1);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d77
// Size: 0xf7
function function_8af96d3889f46280() {
    namespace_3c37cb17ade254d::registersharedfunc("resurgence", "packClientMatchData", &function_ece0d8ae46d230c8);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &playerwelcomesplashes);
    waittillframeend();
    if (getdvarint(@"hash_32bd10766631266f", 0) != 0 || getdvarint(@"hash_6c0e9a2ac5ece4b5", 1)) {
        namespace_71073fa38f11492::registerbrgametypefunc("createC130PathStruct", &function_38a46a469c73dc2c);
        namespace_71073fa38f11492::registerbrgametypefunc("addToC130Infil", &function_c338e39db41d9374);
        if (getdvarint(@"hash_bb3cfa989a77b2c5", 1) == 1) {
            function_10870c1a437402b();
        }
    }
    if (getdvarint(@"hash_82dd678ebec737e0", 0) == 1) {
        level thread function_9680317afd0e4558();
    }
    /#
        level thread function_721a7410f27c2d8f();
    #/
    level.ontimelimit = &function_60a9f05beb5e480;
    function_171e7f7d10b8131();
    if (getdvarint(@"hash_b3eb77522192e559", 1) != 0) {
        namespace_c5622898120e827f::function_eca79fa0f341ee08(13, undefined, undefined, undefined, &function_cee78f828e373996);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e75
// Size: 0x62
function function_cee78f828e373996() {
    level.br_circle.dangercircleui.origin = namespace_c5622898120e827f::getdangercircleorigin() + (0, 0, namespace_c5622898120e827f::getdangercircleradius());
    namespace_c5622898120e827f::setstaticuicircles(500, level.br_circle.safecircleui, level.br_circle.dangercircleui, 0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ede
// Size: 0x12c
function function_b79b55c5a0aaa08(var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8) {
    player = var_939b8e8818bfd5ae getentitynumber();
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(player)) {
        player = 0;
    }
    if (!isdefined(missionid)) {
        missionid = 0;
    }
    var_936b577d2320099a = 4;
    var_17662f483f270d8 = var_936b577d2320099a;
    var_4110e41370f4d67c = 8;
    var_d8354a49cc36aa44 = var_17662f483f270d8 + var_4110e41370f4d67c;
    var_d950a79d86f32708 = 16;
    var_d5f8c4084a83331b = 0;
    var_3faa24937366bd8c = var_d8354a49cc36aa44 + var_d950a79d86f32708;
    foreach (reviveplayer in var_c08e41851ed100e8) {
        var_d5f8c4084a83331b = var_d5f8c4084a83331b | reviveplayer << var_3faa24937366bd8c;
        var_3faa24937366bd8c++;
    }
    value = 0;
    value = var_d5f8c4084a83331b | missionid << var_d8354a49cc36aa44 | player << var_17662f483f270d8 | state;
    self setclientomnvar("ui_br_expanded_obit_message", value);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3011
// Size: 0x8a
function function_4bb3153d2bc88c04(team, var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8) {
    foreach (player in getteamdata(team, "players")) {
        player function_b79b55c5a0aaa08(var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a2
// Size: 0x1ad
function function_5367b756a0eeb9db(attacker, var_e48b3d05087e93f5, var_73cacd5a645aab1f) {
    if (getdvarint(@"hash_5b0a580d2ed6f60e", 1) == 0) {
        return;
    }
    var_4af8655668df58e2 = var_e48b3d05087e93f5 getentitynumber();
    attackerentnum = attacker getentitynumber();
    var_af9cbb6cb7344131 = [];
    index = 1;
    teamplayers = getteamdata(level.players[attackerentnum].team, "players");
    foreach (entry in teamplayers) {
        if (entry == level.players[attackerentnum]) {
            var_af9cbb6cb7344131[index] = 0;
            index++;
        } else {
            var_af9cbb6cb7344131[index] = 0;
            foreach (var_22080d73ae745a4b in var_73cacd5a645aab1f) {
                if (entry == var_22080d73ae745a4b) {
                    var_af9cbb6cb7344131[index] = 1;
                    break;
                }
            }
            index++;
        }
    }
    for (var_ac61d946afdba08b = index; var_ac61d946afdba08b < 4; var_ac61d946afdba08b++) {
        var_af9cbb6cb7344131[var_ac61d946afdba08b] = 0;
    }
    function_4bb3153d2bc88c04(level.players[attackerentnum].team, level.players[attackerentnum], 15, var_4af8655668df58e2, var_af9cbb6cb7344131);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3256
// Size: 0xdc
function function_7269c88a927e7937() {
    level endon("game_ended");
    waitframe();
    game["dialog"]["match_start"] = "rsrg_grav_gmtr";
    game["dialog"]["primary_objective_solo"] = "rsrg_grav_rdsl";
    game["dialog"]["primary_objective"] = "rsrg_grav_gmdr";
    game["dialog"]["resurgence_redeploy"] = "rsrg_grav_rdpl";
    game["dialog"]["resurgence_disabled"] = "rsrg_grav_rnfd";
    game["dialog"]["resurgence_ending"] = "rsrg_grav_rnfn";
    game["dialog"]["last_man_standing"] = "rsrg_grav_rsla";
    game["dialog"]["resurgence_avenge_teammate"] = "rsrg_grav_vngt";
    game["dialog"]["resurgence_teammate_respawn"] = "rsrg_grav_tmrs";
    game["dialog"]["resurgence_hunt_reminder"] = "rsrg_grav_hnsp";
    game["dialog"]["resurgence_on_player_disconnect"] = "rsrg_grav_tmrd";
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3339
// Size: 0x16
function function_683452dfa2b09ccd() {
    game["dialog"]["last_man_standing"] = "rsrg_grav_rnfd";
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3356
// Size: 0x3e
function function_171e7f7d10b8131() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339b
// Size: 0x43
function function_c3aa670d2773db51() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level.brgametype.var_c42e40ec22a1f0d4 = 1;
    level.var_843573804b98eb7e = 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e5
// Size: 0x156
function function_aa202a5e20886406() {
    waittillframeend();
    var_8dbb05ff88408c71 = level.allteamnamelist;
    foreach (index, team in var_8dbb05ff88408c71) {
        level.teamdata[team]["index"] = index;
    }
    if (istrue(level.brgametype.var_840b848760f488a4)) {
        foreach (name, team in level.teamdata) {
            level.teamdata[name]["trackedTeams"] = [];
        }
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
        foreach (player in level.players) {
            player.trackedteams = [];
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3542
// Size: 0xc5
function function_9f61893413e0093c() {
    foreach (name, team in level.teamdata) {
        level.teamdata[name]["deadPlayers"] = [];
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_3ead79441fb2c7be = [];
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360e
// Size: 0x25
function function_60a9f05beb5e480() {
    if (isdefined(level.numendgame)) {
        level thread namespace_d20f8ef223912e12::startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363a
// Size: 0x4d
function function_411af8132ca77d3a(player) {
    if (namespace_4b0406965e556711::gameflag("prematch_done") && namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        if (istrue(player.var_1e309fa83f9fbe2e)) {
            return function_afb309407c44fc11(player);
        } else {
            return function_c76781b1d95bb338(player);
        }
    }
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368f
// Size: 0x37
function function_c76781b1d95bb338(player) {
    if (namespace_d3d40f75bb4e4c32::hasrespawntoken() && !namespace_cb965d2f71fefddc::respawntokendisabled()) {
        player function_f9a2b6ae09e7a00(undefined, 1);
        return 0;
    }
    player thread function_b1dfe6c6434fc16c();
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ce
// Size: 0xba
function function_afb309407c44fc11(player) {
    if (namespace_d3d40f75bb4e4c32::hasrespawntoken() && !namespace_cb965d2f71fefddc::respawntokendisabled()) {
        player.respawndelay = 0;
        player.var_ea1c01dc368298b2 = 1;
        player namespace_cb965d2f71fefddc::removerespawntoken();
        return 0;
    } else if (istrue(level.brgametype.var_c42e40ec22a1f0d4) || istrue(self.var_8a52130c321aa8a)) {
        if (!isdefined(player.respawndelay)) {
            player.respawndelay = 0;
        }
        if (player.respawndelay <= 0) {
            player.var_ea1c01dc368298b2 = 1;
            return 0;
        }
    }
    player function_bbee565c7645ea29();
    player notify("squad_wiped");
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3790
// Size: 0xdc
function function_2ffb02751eba32df(var_f99d56bcb582a8ba) {
    if (istrue(level.brgametype.var_f25f680fb993ccef)) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    foreach (player in getteamdata(var_f99d56bcb582a8ba.team, "players")) {
        if (!istrue(player.var_6f75c711f7773c67) && isalive(player) && var_f99d56bcb582a8ba != player) {
            player.var_6f75c711f7773c67 = 1;
            player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_first_dead_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3873
// Size: 0x8e
function function_ece0d8ae46d230c8() {
    if (!isdefined(self.var_9efaa5d4f566b9d8)) {
        self.var_9efaa5d4f566b9d8 = 0;
    }
    var_81dab8953b9df82 = self.var_9efaa5d4f566b9d8;
    if (var_81dab8953b9df82 > 255) {
        var_81dab8953b9df82 = 255;
    }
    self.extrascore0 = var_81dab8953b9df82;
    self.pers["extrascore0"] = var_81dab8953b9df82;
    var_c5c0c138d608be6a = 0;
    if (isdefined(self.brmissionscompleted)) {
        var_c5c0c138d608be6a = var_c5c0c138d608be6a + self.brmissionscompleted;
    }
    if (var_c5c0c138d608be6a > 15) {
        var_c5c0c138d608be6a = 15;
    }
    var_81dab8953b9df82 = var_81dab8953b9df82 + (var_c5c0c138d608be6a << 8);
    return var_81dab8953b9df82;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3909
// Size: 0x186
function function_fb9ed4b8a0e55bfc(teamdata, var_75c8cc005e7e9f3) {
    if (namespace_71073fa38f11492::isfeaturedisabled("registerReviveCount")) {
        return;
    }
    if (!istrue(self.var_1e309fa83f9fbe2e)) {
        var_2f945dac0cd1edcb = !istrue(level.teamdata[self.team]["teamHadFirstRevive"]);
        if (var_2f945dac0cd1edcb) {
            level.teamdata[self.team]["teamHadFirstRevive"] = 1;
        }
        foreach (var_b46423b1979cb10e in teamdata) {
            if (isdefined(var_b46423b1979cb10e) && !isdefined(var_b46423b1979cb10e.var_9efaa5d4f566b9d8)) {
                var_b46423b1979cb10e.var_9efaa5d4f566b9d8 = 0;
            }
            var_b46423b1979cb10e.var_9efaa5d4f566b9d8++;
            var_b46423b1979cb10e namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("reviveCount", var_b46423b1979cb10e.var_9efaa5d4f566b9d8);
            var_b46423b1979cb10e function_ece0d8ae46d230c8();
            var_75a087e96d31ddc5 = !isdefined(var_75c8cc005e7e9f3) || var_b46423b1979cb10e != var_75c8cc005e7e9f3;
            var_4b59e709fd5bcc45 = var_2f945dac0cd1edcb && var_75a087e96d31ddc5;
            if (var_4b59e709fd5bcc45) {
                var_b46423b1979cb10e thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_first_revive_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
            }
        }
    } else {
        if (!isdefined(self.var_9efaa5d4f566b9d8)) {
            self.var_9efaa5d4f566b9d8 = 0;
        }
        self.var_9efaa5d4f566b9d8++;
        namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("reviveCount", self.var_9efaa5d4f566b9d8);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a96
// Size: 0x84
function function_4001b05bdb048819() {
    var_1ab32500a7d5b09a = istrue(self.var_8a52130c321aa8a);
    self.var_8a52130c321aa8a = undefined;
    if (!istrue(self.var_1e309fa83f9fbe2e)) {
        return 1;
    }
    var_838d3619fb1ff27b = isdefined(self.respawndelay) && self.respawndelay > 0;
    return namespace_4b0406965e556711::gameflag("prematch_fade_done") && (var_838d3619fb1ff27b || !istrue(level.brgametype.var_c42e40ec22a1f0d4) && !var_1ab32500a7d5b09a);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b22
// Size: 0x1e
function function_f9d21088ed2c3306(var_84e2123aaca9a965) {
    if (isalive(self)) {
        return;
    }
    function_f9a2b6ae09e7a00(var_84e2123aaca9a965);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b47
// Size: 0x69
function function_f9a2b6ae09e7a00(var_84e2123aaca9a965, var_57d71760971f748f) {
    if (istrue(self.var_1e309fa83f9fbe2e)) {
        return;
    }
    var_c7869d69dbcf7fd3 = self;
    var_c7869d69dbcf7fd3 thread namespace_47fd1e79a44628cd::playergulagautowin("resurgenceEarlyRevive", var_84e2123aaca9a965, var_57d71760971f748f);
    var_c7869d69dbcf7fd3 function_fb9ed4b8a0e55bfc(level.teamdata[var_c7869d69dbcf7fd3.team]["alivePlayers"], var_84e2123aaca9a965);
    function_c3c91f0dfbf4f683();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb8
// Size: 0x5f
function function_59e26a5b68b2b39a(attacker) {
    if (istrue(level.brgametype.var_574951d2eff9c094) || istrue(level.brgametype.var_d6dc578c217f88cf) && !isdefined(self.var_5fb036c33cddd360)) {
        namespace_d20f8ef223912e12::function_10ffa1071b1c2681();
    }
    if (istrue(self.var_1e309fa83f9fbe2e)) {
        return;
    }
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1f
// Size: 0x377
function function_277c5d414a129608(var_642470e1abc1bbf9) {
    if (!istrue(level.br_prematchstarted)) {
        return;
    }
    if (level.gameended) {
        return;
    }
    if (!isdefined(var_642470e1abc1bbf9.victim)) {
        return;
    }
    thread namespace_71073fa38f11492::runbrgametypefunc("preOnPlayerKilled", var_642470e1abc1bbf9);
    thread function_2ffb02751eba32df(var_642470e1abc1bbf9.victim);
    if (!isdefined(var_642470e1abc1bbf9.attacker) || !isplayer(var_642470e1abc1bbf9.attacker) || var_642470e1abc1bbf9.attacker == var_642470e1abc1bbf9.victim) {
        if (!istrue(var_642470e1abc1bbf9.victim.var_1e309fa83f9fbe2e)) {
            function_28fe2aed2424b8f(var_642470e1abc1bbf9.victim);
        }
        return;
    }
    if (istrue(level.brgametype.var_f9623a041e743669)) {
        var_642470e1abc1bbf9.victim.var_3b90a1ee7a57f5b1 = undefined;
        var_642470e1abc1bbf9.victim.var_84f4b10a80c5ce0a = 0;
    }
    alivecount = getteamdata(var_642470e1abc1bbf9.attacker.team, "aliveCount");
    if (alivecount <= 0) {
        return;
    }
    var_642470e1abc1bbf9.attacker function_266b9fb5e9453ef1(var_642470e1abc1bbf9.victim);
    var_642470e1abc1bbf9.attacker function_2a897cd68a200cb2();
    var_642470e1abc1bbf9.attacker function_1ee2942f2a3ba7b();
    function_60f89ea387e4fd31(var_642470e1abc1bbf9.victim);
    var_642470e1abc1bbf9.victim thread function_183e83cf14bfeb7a(var_642470e1abc1bbf9.attacker);
    if (istrue(var_642470e1abc1bbf9.victim.var_1e309fa83f9fbe2e)) {
        function_140be6f794c627c9(var_642470e1abc1bbf9);
        if (!isdefined(var_642470e1abc1bbf9.victim.var_3ead79441fb2c7be)) {
            var_642470e1abc1bbf9.victim.var_3ead79441fb2c7be = [];
        }
        if (!array_contains(var_642470e1abc1bbf9.victim.var_3ead79441fb2c7be, var_642470e1abc1bbf9.attacker)) {
            array_add(var_642470e1abc1bbf9.victim.var_3ead79441fb2c7be, var_642470e1abc1bbf9.attacker);
        }
        var_642470e1abc1bbf9.attacker thread function_d17aa77ca39e8d00(var_642470e1abc1bbf9.victim);
        var_642470e1abc1bbf9.attacker thread function_d0262f6a0c49edbb(var_642470e1abc1bbf9.victim);
    } else {
        var_642470e1abc1bbf9.attacker function_778d96c94679909c(var_642470e1abc1bbf9.attacker.team, var_642470e1abc1bbf9.victim.team);
        function_28fe2aed2424b8f(var_642470e1abc1bbf9.victim);
    }
    if (istrue(var_642470e1abc1bbf9.attacker.var_1e309fa83f9fbe2e)) {
        var_642470e1abc1bbf9.attacker thread function_2c7bb4c045e81497(var_642470e1abc1bbf9.victim);
    } else {
        var_642470e1abc1bbf9.attacker thread function_8cc833b706d330bf(var_642470e1abc1bbf9.attacker.team, var_642470e1abc1bbf9.victim);
    }
    var_642470e1abc1bbf9.attacker thread function_2d3b9a726feb5dc2(var_642470e1abc1bbf9.attacker.team, var_642470e1abc1bbf9.objweapon);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9d
// Size: 0xbb
function function_28fe2aed2424b8f(victim) {
    victim.var_9470762801d7ebd9 = 0;
    if (!istrue(level.brgametype.var_f439c17a413f05c3)) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    foreach (player in getteamdata(victim.team, "players")) {
        if (!istrue(player.var_9470762801d7ebd9)) {
            player thread function_5a5bb23fc0b48595();
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x405f
// Size: 0x277
function function_5a5bb23fc0b48595() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self.var_9470762801d7ebd9 = 1;
    while (!isalive(self) || !self isonground() && !self isswimming() && !namespace_f8065cafc523dba5::isinvehicle()) {
        wait(1);
    }
    self.var_9470762801d7ebd9 = getteamcount(self.team, 1) < getteamcount(self.team);
    self.var_3a570a6d7cea7826 = self.origin;
    self.var_bfba4165ebae7169 = 0;
    if (namespace_f8065cafc523dba5::isinvehicle()) {
        self.var_b3d3d6102f5b1bcb = 1;
        self.var_42bd6dc51ab8c2b0 = level.brgametype.var_76ba167fab191869;
        self.var_71359c6a4ceab6d1 = level.brgametype.var_4c9d8cddc19303ed;
    } else {
        self.var_b3d3d6102f5b1bcb = 0;
        self.var_42bd6dc51ab8c2b0 = level.brgametype.var_b8a3736f232f201a;
        self.var_71359c6a4ceab6d1 = level.brgametype.var_4af675f2894744ae;
    }
    while (istrue(self.var_9470762801d7ebd9)) {
        var_ca9845d32ae88521 = namespace_f8065cafc523dba5::isinvehicle();
        if (self.var_b3d3d6102f5b1bcb != var_ca9845d32ae88521) {
            self.var_b3d3d6102f5b1bcb = var_ca9845d32ae88521;
            var_234f5a6c3524f185 = distance2d(self.var_3a570a6d7cea7826, self.origin);
            var_41668e7944a5e5e = ter_op(var_ca9845d32ae88521, level.brgametype.var_76ba167fab191869, level.brgametype.var_b8a3736f232f201a);
            self.var_bfba4165ebae7169 = var_234f5a6c3524f185 / self.var_42bd6dc51ab8c2b0;
            self.var_42bd6dc51ab8c2b0 = var_234f5a6c3524f185 + (1 - self.var_bfba4165ebae7169) * var_41668e7944a5e5e;
            self.var_71359c6a4ceab6d1 = squared(self.var_42bd6dc51ab8c2b0);
        }
        if (distance2dsquared(self.var_3a570a6d7cea7826, self.origin) > self.var_71359c6a4ceab6d1) {
            namespace_48a08c5037514e04::doscoreevent(#"resurgence_on_the_move");
            self.var_3a570a6d7cea7826 = self.origin;
        }
        wait(1);
        self.var_9470762801d7ebd9 = getteamcount(self.team, 1) < getteamcount(self.team);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42dd
// Size: 0x47
function function_778d96c94679909c(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98) {
    if (!level.brgametype.var_6420b42c7add53cc) {
        return;
    }
    function_63c057f27dc906b5(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, level.brgametype.var_428c736511619824);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x432b
// Size: 0xa8
function function_8cc833b706d330bf(team, var_3e59c6682b60d27e) {
    level endon("game_ended");
    if (!level.brgametype.var_f6682c80c3c868d6) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    alivecount = getteamdata(team, "aliveCount");
    if (alivecount <= 0) {
        return;
    }
    var_d0b996fde8bfc937 = level.teamdata[team]["deadPlayers"];
    if (var_d0b996fde8bfc937.size <= 0) {
        return;
    }
    var_4e776a22240ff174 = function_d99ec654fcd96cc6(var_d0b996fde8bfc937, var_3e59c6682b60d27e);
    function_ffcd45c1b7a5355a(var_4e776a22240ff174, var_3e59c6682b60d27e);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43da
// Size: 0x120
function function_d99ec654fcd96cc6(var_d0b996fde8bfc937, var_3e59c6682b60d27e) {
    var_4e776a22240ff174 = [];
    if (istrue(level.brgametype.var_fbc20f6d398b973e)) {
        foreach (item in var_d0b996fde8bfc937) {
            if (!isdefined(item)) {
                continue;
            }
            var_4e776a22240ff174 = array_add(var_4e776a22240ff174, item);
            break;
        }
    } else {
        foreach (item in var_d0b996fde8bfc937) {
            if (!isdefined(item)) {
                continue;
            }
            if (isdefined(item.killer) && item.killer == var_3e59c6682b60d27e && isdefined(item.player)) {
                var_4e776a22240ff174 = array_add(var_4e776a22240ff174, item.player);
            }
        }
    }
    return var_4e776a22240ff174;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4502
// Size: 0xc3
function function_2d3b9a726feb5dc2(team, weaponused) {
    level endon("game_ended");
    switch (weaponused.basename) {
    case #"hash_97a0f357d729e163":
        if (!istrue(level.brgametype.var_b7b9228fd4af172f)) {
            return;
        }
        var_8aaca974612ab844 = level.teamdata[team]["deadPlayers"];
        if (var_8aaca974612ab844.size <= 0) {
            return;
        }
        /#
            assert(isdefined(level.brgametype.var_9ecf3b1626f1599a), "level.brGametype.snowballRespawnTimeReduce is not set!");
        #/
        function_366c394e9dc1e32d(self, level.brgametype.var_9ecf3b1626f1599a);
        break;
    default:
        return;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45cc
// Size: 0x63
function function_a045bcdb0d1bebf9(victim, attacker) {
    if (isdefined(attacker) && (!isdefined(victim) || victim != attacker || isdefined(victim.team) && victim.team != attacker.team)) {
        attacker namespace_48a08c5037514e04::doscoreevent(#"resurgence_armor_break");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4636
// Size: 0x131
function function_266b9fb5e9453ef1(victim) {
    if (!istrue(level.brgametype.var_f439c17a413f05c3)) {
        return;
    }
    if (!isdefined(self.var_f968dc3adf6c967e)) {
        self.var_f968dc3adf6c967e = [];
        return;
    }
    trackedteams = function_f6686365221e78cb();
    var_3e00d2d6fb1bd934 = function_85fee305e2d829c1(trackedteams, victim.team);
    if (var_3e00d2d6fb1bd934 < 0 || var_3e00d2d6fb1bd934 >= 4) {
        return;
    }
    var_cf7d42708e58bb98 = trackedteams[var_3e00d2d6fb1bd934];
    nowtime = gettime();
    elapsedtime = nowtime - var_cf7d42708e58bb98["startTime"];
    if (elapsedtime < level.brgametype.var_a11c00bd12593a72 * 1000) {
        if (isdefined(self.var_f968dc3adf6c967e[victim.team])) {
            self.var_f968dc3adf6c967e[victim.team]++;
        } else {
            self.var_f968dc3adf6c967e[victim.team] = 1;
        }
        function_4e3aa4dbe97c98c4(victim);
    } else {
        self.var_f968dc3adf6c967e[victim.team] = undefined;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476e
// Size: 0x70
function function_4e3aa4dbe97c98c4(victim) {
    var_ab149e767ffaaea = self.var_f968dc3adf6c967e[victim.team];
    if (var_ab149e767ffaaea == 1) {
        namespace_48a08c5037514e04::doscoreevent(#"resurgence_hunter");
    } else if (var_ab149e767ffaaea == 2) {
        namespace_48a08c5037514e04::doscoreevent(#"resurgence_hunter_double");
    } else {
        namespace_48a08c5037514e04::doscoreevent(#"resurgence_hunter_spree");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e5
// Size: 0x5d
function function_2a897cd68a200cb2() {
    if (!istrue(level.brgametype.var_f439c17a413f05c3) || istrue(self.var_1e309fa83f9fbe2e)) {
        return;
    }
    alivecount = getteamcount(self.team, 1);
    if (alivecount == 1) {
        namespace_48a08c5037514e04::doscoreevent(#"resurgence_fearless_kill");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4849
// Size: 0x14c
function function_1ee2942f2a3ba7b() {
    if (!istrue(level.brgametype.var_f9623a041e743669)) {
        return;
    }
    if (!isdefined(self.var_84f4b10a80c5ce0a)) {
        self.var_84f4b10a80c5ce0a = 0;
    }
    if (self.var_84f4b10a80c5ce0a >= level.brgametype.var_96e126d983a6bcb) {
        return;
    }
    if (!isdefined(self.var_3b90a1ee7a57f5b1)) {
        self.var_3b90a1ee7a57f5b1 = level.brgametype.var_3b90a1ee7a57f5b1;
    }
    var_250ca808e7137065 = 1;
    if (self.var_84f4b10a80c5ce0a >= level.brgametype.var_3de07078c89e05f0) {
        var_250ca808e7137065 = 3;
    } else if (self.var_84f4b10a80c5ce0a >= level.brgametype.var_87d4766b5816bbf5) {
        var_250ca808e7137065 = 2;
    }
    var_652429904b5eb1c5 = undefined;
    hasperk = 1;
    while (hasperk && self.var_3b90a1ee7a57f5b1[var_250ca808e7137065].size > 0) {
        var_652429904b5eb1c5 = random(self.var_3b90a1ee7a57f5b1[var_250ca808e7137065]);
        hasperk = _hasperk(var_652429904b5eb1c5);
        self.var_3b90a1ee7a57f5b1[var_250ca808e7137065] = array_remove(self.var_3b90a1ee7a57f5b1[var_250ca808e7137065], var_652429904b5eb1c5);
    }
    if (!hasperk) {
        function_df2259f42d74d342(var_652429904b5eb1c5);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499c
// Size: 0x7f
function function_df2259f42d74d342(perk) {
    giveperk(perk);
    self.var_84f4b10a80c5ce0a++;
    lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_" + perk];
    /#
        assert(isdefined(lootid), "Obtained perk" + perk + "which is not lootable.");
    #/
    if (!isdefined(lootid)) {
        return;
    }
    view_origin = self getvieworigin();
    namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, 0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a22
// Size: 0x14a
function function_60f89ea387e4fd31(victim) {
    if (!istrue(level.brgametype.var_cf8a4ef13ed2f5ba) || getteamdata(victim.team, "aliveCount") > 0) {
        return;
    }
    perkpackagelist = getscriptbundle("perkpackagelist:" + "perkpackagelist_wz");
    package = function_7a2aaa4a09a4d250(perkpackagelist.var_1dace216d1a32d14);
    tokens = strtok(package.package, "_");
    var_82fdf4c0d6ca802c = tokens[tokens.size - 1];
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    droporigin = victim.origin;
    dropangles = victim.angles;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, droporigin, dropangles, victim);
    var_2b7395b3855ce24f = "br_loot_perkpack_" + var_82fdf4c0d6ca802c + "_jup";
    itemdef = getscriptbundle("loot_item_def:" + var_2b7395b3855ce24f);
    if (isdefined(itemdef)) {
        namespace_cb965d2f71fefddc::spawnpickup(itemdef.name, var_cb4fad49263e20c4, 1, 1);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b73
// Size: 0x194
function function_183e83cf14bfeb7a(nemesis) {
    if (!istrue(level.brgametype.var_36dbca9d337b4930) || !isdefined(nemesis) || !isplayer(nemesis)) {
        return;
    }
    level endon("game_ended");
    teamplayers = getteamdata(self.team, "players");
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || squadmemberindex == -1) {
        return;
    }
    foreach (player in teamplayers) {
        if (isdefined(player)) {
            var_99dfd5ec21dadcf8 = nemesis getentitynumber();
            /#
                assert(var_99dfd5ec21dadcf8 < 255, "Nemesis entity num over the limit");
            #/
            var_50f4785a0782e768 = int(clamp(var_99dfd5ec21dadcf8 + 1, 1, 255));
            player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_resurgence_team_nemeses", squadmemberindex * 8, 8, var_50f4785a0782e768);
        }
    }
    waittill_any_3("disconnect", "started_spawnPlayer", "avenged");
    foreach (player in teamplayers) {
        if (isdefined(player)) {
            player namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_resurgence_team_nemeses", squadmemberindex * 8, 8, 0);
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d0e
// Size: 0x4a
function function_2c7bb4c045e81497(victim) {
    level endon("game_ended");
    if (!level.brgametype.var_f6682c80c3c868d6) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    function_c86eefdaf13d0d81(victim);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5f
// Size: 0x7b
function function_d0262f6a0c49edbb(victim) {
    level endon("game_ended");
    self endon("disconnect");
    victim endon("disconnect");
    victim endon("squad_wiped");
    if (!level.brgametype.var_6420b42c7add53cc) {
        return;
    }
    if (!isdefined(victim)) {
        return;
    }
    victim waittill("respawn_done");
    function_63c057f27dc906b5(self.team, victim.team, level.brgametype.var_6ee71092be57820c);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de1
// Size: 0x59
function function_d17aa77ca39e8d00(victim) {
    attacker = self;
    if (istrue(victim.br_iseliminated)) {
        attacker thread namespace_391de535501b0143::killeventtextpopup("enemy_wiped", 0);
        attacker thread namespace_48a08c5037514e04::giveunifiedpoints("enemy_wiped", attacker.wipeweapon);
        attacker thread function_58d39d7db7e05d7a(victim);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e41
// Size: 0x65
function function_58d39d7db7e05d7a(victim) {
    lastweapon = namespace_d20f8ef223912e12::brchooselaststandweapon();
    namespace_d20f8ef223912e12::teamwipedobituary(victim, self, lastweapon);
    var_6a9853a7ef309b8f = [];
    if (!isdefined(var_6a9853a7ef309b8f[self.team])) {
        var_6a9853a7ef309b8f[self.team] = 1;
        self playsoundtoteam("ui_team_wipe_splash", self.team);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ead
// Size: 0xbd
function function_ffcd45c1b7a5355a(var_4e776a22240ff174, var_e48b3d05087e93f5) {
    if (var_4e776a22240ff174.size <= 0) {
        return;
    }
    foreach (teammate in var_4e776a22240ff174) {
        if (!isdefined(teammate)) {
            continue;
        }
        function_d33f6589a1c04ee9(teammate);
    }
    if (!istrue(level.brgametype.var_7b3746fd57041fb7)) {
        function_5367b756a0eeb9db(self, var_e48b3d05087e93f5, var_4e776a22240ff174);
    }
    thread namespace_391de535501b0143::killeventtextpopup("br_resurgence_vengeance", 0, 0);
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("resurgence_avenge_teammate", self);
    namespace_aad14af462a74d08::function_8359cadd253f9604(self, "avenge_teammate", 1);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f71
// Size: 0x103
function function_d33f6589a1c04ee9(var_92a674d94df29e77) {
    if (istrue(level.brgametype.var_574951d2eff9c094)) {
        var_92a674d94df29e77.avenged = 1;
    }
    var_92a674d94df29e77 notify("avenged");
    if (istrue(level.brgametype.var_7b3746fd57041fb7)) {
        var_92a674d94df29e77.respawndelay = int(max(0, var_92a674d94df29e77.respawndelay - level.brgametype.var_2cfdc1d6e92251bf));
        if (!isdefined(var_92a674d94df29e77.var_c54afd6e867e686b)) {
            var_92a674d94df29e77.var_c54afd6e867e686b = 0;
        }
        var_92a674d94df29e77.var_c54afd6e867e686b = var_92a674d94df29e77.var_c54afd6e867e686b + level.brgametype.var_2cfdc1d6e92251bf;
        namespace_71073fa38f11492::runbrgametypefunc("updateRespawnDelay", var_92a674d94df29e77);
    } else {
        var_92a674d94df29e77 thread function_7cb9398c136b6a50(1, level.teamdata[var_92a674d94df29e77.team]["alivePlayers"]);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x507b
// Size: 0xd2
function function_c86eefdaf13d0d81(victim) {
    if (self.respawndelay <= 0) {
        return;
    }
    if (!isdefined(self.var_3ead79441fb2c7be)) {
        self.var_3ead79441fb2c7be = [];
    }
    if (isdefined(self.var_3ead79441fb2c7be) && array_contains(self.var_3ead79441fb2c7be, victim)) {
        if (istrue(level.brgametype.var_7b3746fd57041fb7)) {
            function_366c394e9dc1e32d(self, level.brgametype.var_2cfdc1d6e92251bf);
            namespace_71073fa38f11492::runbrgametypefunc("updateRespawnDelay", self);
            function_aae3ac84b3ff8e6d();
            wait(1);
            function_1f013990c19fcd88();
        }
        array_remove(self.var_3ead79441fb2c7be, victim);
        thread namespace_391de535501b0143::killeventtextpopup("br_resurgence_vengeance", 0, 0);
        namespace_aad14af462a74d08::function_8359cadd253f9604(self, "avenge_teammate", 1);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5154
// Size: 0x87
function function_6f0f4e7b3ff7b57c(trackedteams) {
    oldestindex = -1;
    var_3071102f98cbed33 = 2147483647;
    foreach (var_109ebf347b2f2ece, var_cf7d42708e58bb98 in trackedteams) {
        if (var_cf7d42708e58bb98["startTime"] < var_3071102f98cbed33) {
            oldestindex = var_109ebf347b2f2ece;
            var_3071102f98cbed33 = var_cf7d42708e58bb98["startTime"];
        }
    }
    return oldestindex;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e3
// Size: 0x79
function function_85fee305e2d829c1(array, teamname) {
    foundindex = -1;
    foreach (index, team in array) {
        if (team["name"] == teamname) {
            foundindex = index;
            break;
        }
    }
    return foundindex;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5264
// Size: 0x100
function function_611500f4751aaf1(bitfield, teamindex, var_109ebf347b2f2ece) {
    var_5ba62be302f54d98 = int(pow(2, 8));
    /#
        assertex(level.teamdata.size < var_5ba62be302f54d98, "All the " + level.teamdata.size + " teams can't be packed into " + 8 + " bits to fill 32bits");
    #/
    /#
        assertex(teamindex < var_5ba62be302f54d98, "Trying to pass a team index that is higher then " + var_5ba62be302f54d98 - 1 + ", there is " + level.teamdata.size + " teams");
    #/
    /#
        assertex(var_109ebf347b2f2ece >= 0 && var_109ebf347b2f2ece < 4, "Array index can't be packed into 32 bits");
    #/
    var_8501f555ea8dbe78 = 8 * var_109ebf347b2f2ece;
    bitmask = var_5ba62be302f54d98 - 1;
    bitmask = bitmask << var_8501f555ea8dbe78;
    var_f8f977081d3da8b4 = ~bitmask;
    bitfield = bitfield & var_f8f977081d3da8b4;
    var_1cc902f24ef7cc11 = teamindex << var_8501f555ea8dbe78;
    bitfield = bitfield | var_1cc902f24ef7cc11;
    return bitfield;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536c
// Size: 0x18d
function function_d6d795db2cae2c1b(var_29412b34af141c29, var_38678fa9bdc12fdf, var_3e00d2d6fb1bd934, var_8db0c8d0a8da2329) {
    bitfield = -1;
    shouldshow = !var_3e00d2d6fb1bd934 == 0;
    foreach (player in var_29412b34af141c29) {
        if (isdefined(player)) {
            if (bitfield < 0) {
                bitfield = player getclientomnvar("ui_br_resurgence_tracked_teams");
                bitfield = function_611500f4751aaf1(bitfield, var_3e00d2d6fb1bd934, var_8db0c8d0a8da2329);
            }
            player setclientomnvar("ui_br_resurgence_tracked_teams", bitfield);
            player setclientomnvar("ui_br_interrogate_tracking_other_team", shouldshow);
            foreach (trackedplayer in var_38678fa9bdc12fdf) {
                if (isdefined(trackedplayer)) {
                    player function_8f6193af4627dd8b(2, trackedplayer, shouldshow);
                }
            }
        }
    }
    if (istrue(level.brgametype.var_836c1fc36b00559d)) {
        foreach (trackedplayer in var_38678fa9bdc12fdf) {
            if (isdefined(trackedplayer)) {
                trackedplayer setclientomnvar("ui_br_interrogate_team_is_being_tracked", shouldshow);
            }
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5500
// Size: 0x62
function function_f6686365221e78cb() {
    trackedteams = [];
    if (istrue(level.brgametype.var_840b848760f488a4)) {
        trackedteams = getteamdata(self.team, "trackedTeams");
    } else {
        if (!isdefined(self.trackedteams)) {
            self.trackedteams = [];
        }
        trackedteams = self.trackedteams;
    }
    return trackedteams;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x556a
// Size: 0x95
function function_63c057f27dc906b5(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, var_9622b10ea4acbc01) {
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    var_bb58bcc7b0654344 = -1;
    trackedteams = function_f6686365221e78cb();
    var_bb58bcc7b0654344 = function_85fee305e2d829c1(trackedteams, var_cf7d42708e58bb98);
    if (var_bb58bcc7b0654344 < 0) {
        if (trackedteams.size == 4) {
            var_bb58bcc7b0654344 = function_6f0f4e7b3ff7b57c(trackedteams);
        } else {
            var_bb58bcc7b0654344 = trackedteams.size;
        }
    }
    if (var_bb58bcc7b0654344 < 0 || var_bb58bcc7b0654344 >= 4) {
        return;
    }
    thread function_7278f9076c781224(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, var_bb58bcc7b0654344, var_9622b10ea4acbc01);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5606
// Size: 0x158
function function_7278f9076c781224(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, var_bb58bcc7b0654344, var_9622b10ea4acbc01) {
    if (var_bb58bcc7b0654344 < 0 || var_bb58bcc7b0654344 >= 4) {
        return;
    }
    notifyname = "trackTeam" + var_a1b4fab5a3b4fa5e + var_bb58bcc7b0654344;
    var_29412b34af141c29 = [];
    var_5b1596320df748c = [];
    var_5b1596320df748c["name"] = var_cf7d42708e58bb98;
    var_5b1596320df748c["startTime"] = gettime();
    if (getteamdata(var_cf7d42708e58bb98, "players").size > 1 && getteamdata(var_cf7d42708e58bb98, "aliveCount") >= 1) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("resurgence_hunt_reminder", self);
    }
    if (istrue(level.brgametype.var_840b848760f488a4)) {
        level notify(notifyname);
        level endon(notifyname);
        level.teamdata[var_a1b4fab5a3b4fa5e]["trackedTeams"][var_bb58bcc7b0654344] = var_5b1596320df748c;
        var_29412b34af141c29 = getteamdata(var_a1b4fab5a3b4fa5e, "players");
    } else {
        self notify(notifyname);
        self endon(notifyname);
        self.trackedteams[var_bb58bcc7b0654344] = var_5b1596320df748c;
        var_29412b34af141c29 = [0:self];
    }
    var_3e00d2d6fb1bd934 = namespace_f8065cafc523dba5::getteamindex(var_cf7d42708e58bb98);
    var_38678fa9bdc12fdf = getteamdata(var_cf7d42708e58bb98, "players");
    function_d6d795db2cae2c1b(var_29412b34af141c29, var_38678fa9bdc12fdf, var_3e00d2d6fb1bd934, var_bb58bcc7b0654344);
    wait(var_9622b10ea4acbc01);
    function_d6d795db2cae2c1b(var_29412b34af141c29, var_38678fa9bdc12fdf, 0, var_bb58bcc7b0654344);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5765
// Size: 0x27e
function function_3ee5f100eb900caf() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    if (istrue(level.brgametype.var_b43745b85f249e68)) {
        return;
    }
    if (getdvarint(@"hash_32bd10766631266f", 0) == 0) {
        level waittill("infils_ready");
    }
    var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
    totaltime = 0;
    if (getdvarint(@"hash_32bd10766631266f", 0)) {
        totaltime = 1;
    }
    for (i = 0; i < var_10b5c13c81db5079; i++) {
        totaltime = totaltime + level.br_level.br_circleclosetimes[i] + level.br_level.br_circledelaytimes[i];
    }
    var_f9f04f141ae1e4d4 = int(totaltime * 1000);
    var_7bf1255a3715a632 = gettime();
    var_3112e3de7bf7f005 = var_7bf1255a3715a632 + var_f9f04f141ae1e4d4;
    setomnvarforallclients("ui_br_timed_feature_end_time", var_3112e3de7bf7f005);
    level.var_1fcba68efd8d4bf = totaltime;
    level.var_463a99b72cf43096 = var_3112e3de7bf7f005;
    if (level.brgametype.var_9524142eb719a321) {
        level.brgametype.var_d851832a0f677c60 = getdvarint(@"hash_d83ff6d2e0647bc5", totaltime);
        thread function_5a44c88bdf9b01ae(level.brgametype.var_d851832a0f677c60);
    }
    var_a9a4271fa4d4acee = var_f9f04f141ae1e4d4;
    var_eb17c8739491b838 = getdvarint(@"hash_342776b421ce99fa", 90000);
    thread function_852d53966b46f329(var_a9a4271fa4d4acee / 1000);
    while (var_a9a4271fa4d4acee > var_eb17c8739491b838) {
        wait((var_a9a4271fa4d4acee - var_eb17c8739491b838) / 1000);
        var_6cf8e0bf922944ae = gettime() - var_7bf1255a3715a632;
        var_a9a4271fa4d4acee = var_f9f04f141ae1e4d4 - var_6cf8e0bf922944ae;
    }
    setomnvarforallclients("ui_br_timed_feature_end_time", int(gettime() + var_a9a4271fa4d4acee) - 1);
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(namespace_71073fa38f11492::runbrgametypefunc("resurgenceDisableSkipForPlayer", player))) {
            continue;
        }
        player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_reinforcement_closing_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ea
// Size: 0x2a
function function_5a44c88bdf9b01ae(remainingtime) {
    level endon("game_ended");
    wait(remainingtime);
    level.brgametype.var_9524142eb719a321 = 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a1b
// Size: 0x29
function function_852d53966b46f329(remainingtime) {
    level endon("game_ended");
    wait(remainingtime - 90);
    namespace_d3d40f75bb4e4c32::brleaderdialog("resurgence_ending", undefined, undefined, undefined, undefined, undefined);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4b
// Size: 0x19d
function function_809485f51d59ebb() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level.brgametype.respawndelay = [];
    level.brgametype.var_34af112c77c2c381 = [0:"_solos", 1:"_duos", 2:"_trios", 3:"_quads"];
    function_e6ca3c2ca24b16f();
    var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
    /#
        assertex(var_10b5c13c81db5079 < 10, "Error: disableRespawnCloseIndex is larger than the DVAR table");
    #/
    foreach (var_53a4a1c920def4bd in level.brgametype.var_34af112c77c2c381) {
        for (i = 0; i < var_10b5c13c81db5079; i++) {
            var_33bfdc2307cf55b4 = getdvarint(function_2ef675c13ca1c4af(@"hash_fa5f73966eb446d7", i + 1, var_53a4a1c920def4bd), -1);
            if (var_33bfdc2307cf55b4 >= 0) {
                level.brgametype.respawndelay[var_53a4a1c920def4bd][i] = var_33bfdc2307cf55b4;
            } else if (i >= level.brgametype.respawndelay[var_53a4a1c920def4bd].size) {
                level.brgametype.respawndelay[var_53a4a1c920def4bd][i] = level.brgametype.respawndelay[var_53a4a1c920def4bd][i - 1];
            }
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bef
// Size: 0x21b
function function_e6ca3c2ca24b16f() {
    level.brgametype.respawndelay["_solos"][0] = getdvarint(@"hash_d474ae8371b653a7", 15);
    level.brgametype.respawndelay["_solos"][1] = getdvarint(@"hash_d474af8371b655da", 20);
    level.brgametype.respawndelay["_solos"][2] = getdvarint(@"hash_d474b08371b6580d", 30);
    level.brgametype.respawndelay["_duos"][0] = getdvarint(@"hash_98b57a9986390134", 15);
    level.brgametype.respawndelay["_duos"][1] = getdvarint(@"hash_98b57d99863907cd", 20);
    level.brgametype.respawndelay["_duos"][2] = getdvarint(@"hash_98b57c998639059a", 30);
    level.brgametype.respawndelay["_trios"][0] = getdvarint(@"hash_c0d316efc3ef6b12", 20);
    level.brgametype.respawndelay["_trios"][1] = getdvarint(@"hash_c0d315efc3ef68df", 30);
    level.brgametype.respawndelay["_trios"][2] = getdvarint(@"hash_c0d314efc3ef66ac", 40);
    level.brgametype.respawndelay["_quads"][0] = getdvarint(@"hash_6c1ffb69e01548fb", 25);
    level.brgametype.respawndelay["_quads"][1] = getdvarint(@"hash_6c1ffc69e0154b2e", 35);
    level.brgametype.respawndelay["_quads"][2] = getdvarint(@"hash_6c1ffd69e0154d61", 45);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e11
// Size: 0x37
function function_bbee565c7645ea29() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue & ~16384;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4f
// Size: 0x36
function function_fff107d76eb56064() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue | 16384;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e8c
// Size: 0x36
function function_aae3ac84b3ff8e6d() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue | 32768;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec9
// Size: 0x37
function function_1f013990c19fcd88() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue & ~32768;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f07
// Size: 0x62
function function_b12988fdf64efe98(value) {
    /#
        assert(value <= 16384 - 1);
    #/
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    var_a31ae8d2963fa9d = currentvalue & ~(16384 - 1);
    newvalue = var_a31ae8d2963fa9d | value;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f70
// Size: 0xc9
function function_230ea867cd69c598(value) {
    /#
        assert(value <= 16384 - 1);
    #/
    var_270cd077009199a0 = 0;
    if (istrue(self.var_14afb82aa29bc57c)) {
        var_270cd077009199a0 = 2147483648;
        self.var_14afb82aa29bc57c = 0;
    }
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    var_a31ae8d2963fa9d = currentvalue & ~(1073741824 - 65536 + 1073741824 + 2147483648);
    forceupdate = currentvalue & 1073741824;
    if (forceupdate != 0) {
        forceupdate = 0;
    } else {
        forceupdate = 1073741824;
    }
    newvalue = var_a31ae8d2963fa9d | value << 16 | forceupdate | var_270cd077009199a0;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6040
// Size: 0x111
function function_77b9dedb0b66ca96(data) {
    if (!isdefined(data)) {
        self setclientomnvar("ui_resurgence_action_feedback", 0);
        return;
    }
    var_e47695ef0b8f3142 = 0;
    var_b896b356a2893e12 = undefined;
    var_ad37e6684f9bfb21 = undefined;
    foreach (playerid, var_c14ff75a269f0428 in data) {
        if (var_c14ff75a269f0428.var_7ba2c5f32045574 > var_e47695ef0b8f3142) {
            var_e47695ef0b8f3142 = var_c14ff75a269f0428.var_7ba2c5f32045574;
            var_b896b356a2893e12 = playerid;
            var_ad37e6684f9bfb21 = var_c14ff75a269f0428;
        }
    }
    eventid = 0;
    if (isdefined(var_ad37e6684f9bfb21.event)) {
        eventid = namespace_62c556437da28f50::getscoreinfocategory(var_ad37e6684f9bfb21.event, #"eventid");
    }
    value = var_b896b356a2893e12 + 1 + (eventid << 3);
    self setclientomnvar("ui_resurgence_action_feedback", value);
    self.var_c1e15642efb69421 = undefined;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6158
// Size: 0xba
function function_d04daab64ea0d3df(player) {
    teamplayers = getteamdata(player.team, "players");
    foreach (teammate in teamplayers) {
        var_f5aa9c197c4cf398 = teammate namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
        var_73409c2edfa9e4f9 = isalive(teammate) && !istrue(teammate.inlaststand);
        if (teammate != player && var_73409c2edfa9e4f9 && !var_f5aa9c197c4cf398) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621a
// Size: 0x80
function function_eb172b91a9fdf684() {
    player = self;
    if (player namespace_47fd1e79a44628cd::function_4a25d64251fab1b7()) {
        player function_fb9ed4b8a0e55bfc(level.teamdata[player.team]["alivePlayers"]);
        function_c3c91f0dfbf4f683();
        player namespace_99ac021a7547cae3::addtoalivecount("resurgence1");
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        var_4911936f026c8e38 = namespace_d20f8ef223912e12::brmayconsiderplayerdead(player);
        if (!var_4911936f026c8e38) {
            namespace_47fd1e79a44628cd::entergulag(player);
        }
        self.waitingtospawn = 0;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62a1
// Size: 0xb2
function function_2310e5a630ab167c() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("doingRespawn");
    if (istrue(level.brgametype.var_55f0d9f2a10553c4)) {
        while (function_d04daab64ea0d3df(self)) {
            waitframe();
        }
        function_bbee565c7645ea29();
        self notify("squad_wiped");
        waitframe();
        function_eb172b91a9fdf684();
    } else {
        var_849d01afb2fc0f0a = getteamdata(self.team, "aliveCount");
        while (var_849d01afb2fc0f0a > 0) {
            waitframe();
            var_849d01afb2fc0f0a = getteamdata(self.team, "aliveCount");
        }
        function_bbee565c7645ea29();
        namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", 0);
        self notify("squad_wiped");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x635a
// Size: 0xb9
function function_140be6f794c627c9(var_642470e1abc1bbf9) {
    if (!isdefined(var_642470e1abc1bbf9.victim) || !isdefined(var_642470e1abc1bbf9.attacker)) {
        return;
    }
    if (var_642470e1abc1bbf9.victim == var_642470e1abc1bbf9.attacker || !isplayer(var_642470e1abc1bbf9.attacker) && !isagent(var_642470e1abc1bbf9.attacker)) {
        return;
    }
    var_849d01afb2fc0f0a = getteamdata(var_642470e1abc1bbf9.victim.team, "aliveCount");
    if (var_849d01afb2fc0f0a == 0) {
        var_642470e1abc1bbf9.attacker namespace_aad14af462a74d08::oncollectitem("t_wipe");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x641a
// Size: 0x552
function function_3709903d7ad3f711(player, evictim, event, points, var_645b1a1d2a1ddfb7) {
    if (!isdefined(player)) {
        return;
    }
    if (!isalive(player)) {
        return;
    }
    if (points <= 0) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || !namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (is_equal(event, "br_kioskBuy") && is_equal(var_645b1a1d2a1ddfb7, "br_team_revive")) {
        var_780d8a24242378d5 = namespace_54d20dd0dd79277f::getteamdata(player.team, "aliveCount");
        squadsize = namespace_54d20dd0dd79277f::getteamdata(player.team, "teamCount");
        var_de1f625722d92973 = squadsize - var_780d8a24242378d5;
        if (var_de1f625722d92973 == 1) {
            return;
        }
    }
    var_9a5e708d6675417 = getmatchrulesdata("brData", "resurgencePointsToSecondRatio");
    var_36a08dc900babaf2 = getmatchrulesdata("brData", "resurgencePointsToFirstSecondOffset");
    var_91f726fa8b73ddd5 = int(floor((points + var_36a08dc900babaf2) * var_9a5e708d6675417));
    if (isdefined(event)) {
        if (event == "br_kioskBuy") {
            var_c7c9a35c374fa86f = getmatchrulesdata("brData", "resurgencePointsToSecondKioskBuyRatio");
            var_91f726fa8b73ddd5 = int(ceil(var_91f726fa8b73ddd5 * var_c7c9a35c374fa86f));
        } else if (event == "kill") {
            if (isplayer(evictim)) {
                if (level.brgametype.var_ed0962f69d72e5b1 >= 0) {
                    var_91f726fa8b73ddd5 = level.brgametype.var_ed0962f69d72e5b1;
                } else {
                    var_91f726fa8b73ddd5 = int(floor((250 + var_36a08dc900babaf2) * var_9a5e708d6675417));
                }
            } else if (level.brgametype.var_12d3d7f14586d634 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_12d3d7f14586d634;
            } else {
                var_91f726fa8b73ddd5 = int(floor((150 + var_36a08dc900babaf2) * var_9a5e708d6675417));
            }
        } else if (event == "headshot") {
            if (level.brgametype.var_dd674d15153f7aab >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_dd674d15153f7aab;
            }
        } else if (event == "team_wiped") {
            if (level.brgametype.var_a922c322aa7d8e27 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_a922c322aa7d8e27;
            }
        } else if (event == "br_cacheOpen") {
            if (level.brgametype.var_dca0e6fef4e95fa9 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_dca0e6fef4e95fa9;
            } else {
                var_91f726fa8b73ddd5 = int(floor((100 + var_36a08dc900babaf2) * var_9a5e708d6675417));
            }
        } else if (event == "br_pe_capNode") {
            var_91f726fa8b73ddd5 = int(floor((700 + var_36a08dc900babaf2) * var_9a5e708d6675417));
        } else if (event == "resurgence_on_the_move") {
            if (level.brgametype.var_4a10a8dd79fb5ab4 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_4a10a8dd79fb5ab4;
            }
        } else if (event == "resurgence_hunter") {
            if (level.brgametype.var_a8ffbf7c6f0e152b >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_a8ffbf7c6f0e152b;
            }
        } else if (event == "resurgence_hunter_double") {
            if (level.brgametype.var_53911fa2d60ccb40 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_53911fa2d60ccb40;
            }
        } else if (event == "resurgence_hunter_spree") {
            if (level.brgametype.var_79155a61db265b6e >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_79155a61db265b6e;
            }
        } else if (event == "resurgence_armor_break") {
            if (level.brgametype.var_bc6456d93d2e9053 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_bc6456d93d2e9053;
            }
        } else if (event == "resurgence_fearless_kill") {
            if (level.brgametype.var_e3c11803759b1678 >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_e3c11803759b1678;
            }
        } else if (event == #"hash_607cd099425b81c7") {
            if (level.brgametype.var_eac57b0b307ab1ef >= 0) {
                var_91f726fa8b73ddd5 = level.brgametype.var_eac57b0b307ab1ef;
            } else {
                var_91f726fa8b73ddd5 = int(floor((200 + var_36a08dc900babaf2) * var_9a5e708d6675417));
            }
        } else if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            circle = min(max(1, level.br_circle.circleindex), 6);
            var_6b00b1e8a043c2a0 = "br_downEnemy_circle_" + string(circle);
            if (event == var_6b00b1e8a043c2a0) {
                if (level.brgametype.var_4a73ad987e2857e1 >= 0) {
                    var_91f726fa8b73ddd5 = level.brgametype.var_4a73ad987e2857e1;
                }
            }
        }
    }
    function_366c394e9dc1e32d(player, var_91f726fa8b73ddd5, event);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6973
// Size: 0x56
function function_366c394e9dc1e32d(player, var_91f726fa8b73ddd5, event) {
    if (var_91f726fa8b73ddd5 <= 0) {
        return;
    }
    namespace_71073fa38f11492::runbrgametypefunc("onResurgenceScoreworthyModifier", player, var_91f726fa8b73ddd5);
    if (istrue(player.var_1e309fa83f9fbe2e)) {
        function_4e47f37a50cbac36(player, var_91f726fa8b73ddd5);
    } else {
        function_249ed663848b0e5f(player, var_91f726fa8b73ddd5, event);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d0
// Size: 0x9a
function function_4e47f37a50cbac36(player, var_91f726fa8b73ddd5) {
    if (isdefined(player.respawndelay) && player.respawndelay > 0) {
        player.respawndelay = int(max(0, player.respawndelay - var_91f726fa8b73ddd5));
        namespace_71073fa38f11492::runbrgametypefunc("updateRespawnDelay", player);
        if (!isdefined(player.var_c54afd6e867e686b)) {
            player.var_c54afd6e867e686b = 0;
        }
        player.var_c54afd6e867e686b = player.var_c54afd6e867e686b + var_91f726fa8b73ddd5;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a71
// Size: 0x3b4
function function_249ed663848b0e5f(player, var_91f726fa8b73ddd5, event) {
    if (!isdefined(player.team)) {
        return;
    }
    playerteam = level.teamdata[player.team];
    if (!isdefined(playerteam)) {
        return;
    }
    deadplayers = playerteam["deadPlayers"];
    if (!isdefined(deadplayers)) {
        return;
    }
    var_7cd081d8bbc27830 = 0;
    foreach (dead in deadplayers) {
        if (isdefined(dead) && isdefined(dead.player) && dead.player != player) {
            if (dead.player.respawndelay > 0) {
                dead.player.respawndelay = int(max(0, dead.player.respawndelay - var_91f726fa8b73ddd5));
                namespace_71073fa38f11492::runbrgametypefunc("updateRespawnDelay", dead.player);
                if (!isdefined(dead.player.var_c54afd6e867e686b)) {
                    dead.player.var_c54afd6e867e686b = 0;
                }
                dead.player.var_c54afd6e867e686b = dead.player.var_c54afd6e867e686b + var_91f726fa8b73ddd5;
                var_7cd081d8bbc27830 = 1;
                playerid = player.var_3f78c6a0862f9e25;
                if (!isdefined(playerid) || playerid == -1) {
                    continue;
                }
                if (!isdefined(dead.player.var_c1e15642efb69421)) {
                    dead.player.var_c1e15642efb69421 = [];
                }
                if (!isdefined(dead.player.var_c1e15642efb69421[playerid])) {
                    dead.player.var_c1e15642efb69421[playerid] = spawnstruct();
                    dead.player.var_c1e15642efb69421[playerid].var_7ba2c5f32045574 = 0;
                }
                dead.player.var_c1e15642efb69421[playerid].var_7ba2c5f32045574 = dead.player.var_c1e15642efb69421[playerid].var_7ba2c5f32045574 + var_91f726fa8b73ddd5;
                if (isdefined(event)) {
                    text = namespace_62c556437da28f50::getscoreinfocategory(event, #"text");
                    if (isdefined(text) && text != "") {
                        var_72907823769ef142 = dead.player.var_c1e15642efb69421[playerid].var_72907823769ef142;
                        if (!isdefined(var_72907823769ef142) || var_91f726fa8b73ddd5 > var_72907823769ef142) {
                            dead.player.var_c1e15642efb69421[playerid].var_72907823769ef142 = var_91f726fa8b73ddd5;
                            dead.player.var_c1e15642efb69421[playerid].event = event;
                        }
                    }
                }
            }
        }
    }
    if (var_7cd081d8bbc27830) {
        if (istrue(player.var_5c3b157495f480a2)) {
            player.var_5449b5708779ee8e = player.var_5449b5708779ee8e + var_91f726fa8b73ddd5;
        } else {
            player.var_5c3b157495f480a2 = 1;
            player.var_5449b5708779ee8e = var_91f726fa8b73ddd5;
            player thread function_5d3d825b6d78b130();
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e2c
// Size: 0x6e
function function_5d3d825b6d78b130() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("squad_wiped");
    if (!isplayer(self)) {
        return;
    }
    wait(0.5);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.var_5449b5708779ee8e) && self.var_5449b5708779ee8e > 0) {
        function_230ea867cd69c598(self.var_5449b5708779ee8e);
    }
    self.var_5449b5708779ee8e = undefined;
    self.var_5c3b157495f480a2 = 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea1
// Size: 0x429
function function_b1dfe6c6434fc16c() {
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4) && !istrue(self.var_8a52130c321aa8a)) {
        return;
    }
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("squad_wiped");
    player endon("force_stop_respawn");
    if (!istrue(level.brgametype.var_b43745b85f249e68)) {
        player thread function_2310e5a630ab167c();
    }
    player thread function_f1262ab9b4bf1697();
    if (level.brgametype.var_bbde847aed85512a) {
        if (level.brgametype.var_523779ad4c01fd7c) {
            player thread function_263e1e65ec02113b();
        } else {
            player thread function_b3b332f4d23eb080();
        }
    }
    player.respawndelay = player getrespawndelay();
    if (level.brgametype.var_14afb82aa29bc57c > 0 && self.attacker == self) {
        player thread function_46261e8da3c3005e();
    }
    if (!isdefined(player.respawndelay)) {
        errormsg = "";
        var_75c7789394667f32 = "
";
        var_79b9159e31664699 = getarraykeys(game["flags"]);
        foreach (name in var_79b9159e31664699) {
            var_75c7789394667f32 = var_75c7789394667f32 + name + " -> " + game["flags"][name] + "
";
        }
        errormsg = errormsg + var_75c7789394667f32;
        namespace_9c840bb9f2ecbf00::demoforcesre(errormsg);
        player.respawndelay = 30;
    }
    if (getdvarint(@"hash_d31b1c01a86089c2", 1) == 1 && isalive(player)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Alive player added to resurgence countdown. IsAlive: " + isalive(player) + ". Sessionstate: " + player.sessionstate);
        waitframe();
        namespace_9c840bb9f2ecbf00::demoforcesre("Alive player added to resurgence countdown - after waitframe. IsAlive: " + isalive(player) + ". Sessionstate: " + player.sessionstate);
    }
    player function_1f013990c19fcd88();
    player function_fff107d76eb56064();
    player function_b12988fdf64efe98(player.respawndelay);
    player.var_c54afd6e867e686b = 0;
    while (player.respawndelay > 0) {
        if (isalive(player)) {
            player.respawndelay = 0;
        } else {
            player function_b12988fdf64efe98(player.respawndelay);
        }
        player function_230ea867cd69c598(player.var_c54afd6e867e686b);
        player function_77b9dedb0b66ca96(player.var_c1e15642efb69421);
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", player.respawndelay);
        player.var_c54afd6e867e686b = 0;
        wait(1);
        player.respawndelay--;
    }
    player.var_c1e15642efb69421 = undefined;
    player function_bbee565c7645ea29();
    player function_b12988fdf64efe98(0);
    player function_230ea867cd69c598(0);
    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", 0);
    if (istrue(player.var_632bad3edb4e449e)) {
        self waittill("resurgence_rejoin_successful");
    }
    if (!isalive(player)) {
        if (isdefined(player.team)) {
            displaysquadmessagetoteam(player.team, player, 14, 1);
            foreach (teammate in level.teamdata[player.team]["alivePlayers"]) {
                if (!istrue(teammate.var_24278e2ec4540e)) {
                    teammate thread function_4c5ae16ac1a3265f();
                }
            }
        }
        player thread function_7cb9398c136b6a50(0, level.teamdata[player.team]["alivePlayers"]);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d1
// Size: 0x4c
function function_46261e8da3c3005e() {
    level endon("game_ended");
    self endon("disconnect");
    while (self.sessionstate != "intermission") {
        waitframe();
    }
    self.var_14afb82aa29bc57c = 1;
    function_230ea867cd69c598(level.brgametype.var_14afb82aa29bc57c);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7324
// Size: 0x17b
function function_8d7079499b5b7d01() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("squad_wiped");
    self endon("force_stop_respawn");
    self endon("started_spawnPlayer");
    namespace_a9c534dc7832aba4::waittillspectating(self);
    while (1) {
        if (istrue(self.var_4d92a54b804bafc)) {
            function_123793b0882ec6fb(2);
            self waittill("team_care_request_cooldown_clear");
        }
        teamdata = level.teamdata[self.team];
        teammates = teamdata["players"];
        if (teamdata["aliveCount"] > int(getteamcount(self.team) * 0.5)) {
            function_123793b0882ec6fb(0);
            waittill_any_ents_array(teammates, "death");
            continue;
        }
        function_123793b0882ec6fb(1);
        request = waittill_any_return_3("request_care", "team_care_request_sent", "alive_count_change");
        if (request == "request_care") {
            alivecount = level.teamdata[self.team]["aliveCount"];
            foreach (teammate in teammates) {
                teammate thread function_4744bb1db1b48f9a(alivecount);
            }
            wait(level.brgametype.var_8f48d3f93ac1204c);
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a6
// Size: 0x65
function function_4744bb1db1b48f9a(alivecount) {
    level endon("game_ended");
    self endon("disconnect");
    function_bd49896ab411c64c(alivecount);
    function_123793b0882ec6fb(2);
    if (!level.brgametype.var_523779ad4c01fd7c) {
        thread function_dd82fe8b8e1d0ecb();
    }
    wait(level.brgametype.var_f8da748df2368691);
    function_123793b0882ec6fb(0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7512
// Size: 0x4a
function function_dd82fe8b8e1d0ecb() {
    level endon("game_ended");
    self endon("disconnect");
    self.var_4d92a54b804bafc = 1;
    self notify("team_care_request_sent");
    wait(level.brgametype.var_74427b8346a538df);
    self.var_4d92a54b804bafc = 0;
    self notify("team_care_request_cooldown_clear");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7563
// Size: 0xdb
function function_b3b332f4d23eb080() {
    level endon("game_ended");
    self endon("disconnect");
    if (!isbot(self)) {
        self notifyonplayercommand("request_care", "+ping");
        self notifyonplayercommand("request_care", "+actionslot 1");
    }
    function_8d7079499b5b7d01();
    function_123793b0882ec6fb(0);
    if (!isbot(self)) {
        self notifyonplayercommandremove("request_care", "+ping");
        self notifyonplayercommandremove("request_care", "+actionslot 1");
    }
    foreach (teammate in level.teamdata[self.team]["players"]) {
        teammate notify("alive_count_change");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7645
// Size: 0xf7
function function_263e1e65ec02113b() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("squad_wiped");
    self endon("force_stop_respawn");
    self endon("started_spawnPlayer");
    waitframe();
    teamdata = level.teamdata[self.team];
    teammates = teamdata["players"];
    alivecount = teamdata["aliveCount"];
    if (alivecount <= int(getteamcount(self.team) * 0.5) && !istrue(self.var_b9c8734ebc34ee6c)) {
        foreach (teammate in teammates) {
            if (isalive(teammate)) {
                teammate thread function_4744bb1db1b48f9a(alivecount);
            }
        }
        thread function_9dd5db08596c6a71(teammates);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7743
// Size: 0xc4
function function_9dd5db08596c6a71(teammates) {
    foreach (teammate in teammates) {
        if (isdefined(teammate)) {
            teammate.var_b9c8734ebc34ee6c = 1;
        }
    }
    wait(level.brgametype.var_74427b8346a538df);
    foreach (teammate in teammates) {
        if (isdefined(teammate)) {
            teammate.var_b9c8734ebc34ee6c = undefined;
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x780e
// Size: 0x30
function function_4c5ae16ac1a3265f() {
    level endon("game_ended");
    self.var_24278e2ec4540e = 1;
    thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("resurgence_teammate_respawn", self);
    wait(5);
    self.var_24278e2ec4540e = undefined;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7845
// Size: 0x19
function function_f1262ab9b4bf1697() {
    level endon("game_ended");
    self endon("disconnect");
    waitframe();
    function_65114ae4a91a1013();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7865
// Size: 0x160
function function_65114ae4a91a1013() {
    if (istrue(level.brgametype.var_ad3c825b1dd7d9a8)) {
        return;
    }
    newentry = self;
    if (!istrue(level.brgametype.var_fbc20f6d398b973e)) {
        newentry = spawnstruct();
        newentry.player = self;
        newentry.killer = self.lastkilledby;
    }
    var_7193e062042f638d = [];
    deadplayers = level.teamdata[self.team]["deadPlayers"];
    foreach (dead in deadplayers) {
        if (isdefined(dead)) {
            var_7193e062042f638d[var_7193e062042f638d.size] = dead.player.name;
        }
    }
    /#
        assertex(!array_contains(var_7193e062042f638d, newentry.player.name), "trying to add a duplicate");
    #/
    level.teamdata[self.team]["deadPlayers"] = array_add(level.teamdata[self.team]["deadPlayers"], newentry);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79cc
// Size: 0xee
function function_c3c91f0dfbf4f683() {
    if (istrue(level.brgametype.var_ad3c825b1dd7d9a8)) {
        return;
    }
    deadplayers = level.teamdata[self.team]["deadPlayers"];
    if (istrue(level.brgametype.var_fbc20f6d398b973e)) {
        deadplayers = array_remove(deadplayers, self);
    } else {
        var_d674d7970eef9653 = [];
        foreach (item in deadplayers) {
            if (isdefined(item) && item.player != self) {
                var_d674d7970eef9653[var_d674d7970eef9653.size] = item;
            }
        }
        deadplayers = var_d674d7970eef9653;
    }
    level.teamdata[self.team]["deadPlayers"] = deadplayers;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ac1
// Size: 0x112
function function_cd4132b03ffcf8cf() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("squad_wiped");
    player endon("respawn_disabled");
    while (player.respawndelay > 0) {
        if (player.respawndelay <= 5) {
            player playsoundtoplayer("ui_mp_resurgence_timer_quarter_sec", player);
        } else if (player.respawndelay <= 10) {
            player playsoundtoplayer("ui_mp_resurgence_timer_half_sec", player);
        } else if (player.respawndelay % 4 == 2) {
            player playsoundtoplayer("ui_mp_resurgence_timer", player);
        } else {
            player playsoundtoplayer("ui_mp_resurgence_timer_tick", player);
        }
        player function_b12988fdf64efe98(player.respawndelay);
        player function_230ea867cd69c598(player.var_c54afd6e867e686b);
        player.var_c54afd6e867e686b = 0;
        wait(1);
        player.respawndelay--;
    }
    player function_bbee565c7645ea29();
    player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_respawn_active_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bda
// Size: 0xa7
function function_e37ac9f8cbed03eb() {
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    player = self;
    level endon("game_ended");
    player endon("squad_wiped");
    player endon("respawn_disabled");
    player endon("death_or_disconnect");
    player.respawndelay = player getrespawndelay();
    player waittill("respawn_done");
    player function_b12988fdf64efe98(player.respawndelay);
    player function_fff107d76eb56064();
    player.var_c54afd6e867e686b = 0;
    while (!player isonground() && !player isswimming()) {
        waitframe();
    }
    player thread function_cd4132b03ffcf8cf();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c88
// Size: 0x91
function function_f99a079543f11bf7(var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    if (!istrue(self.var_1e309fa83f9fbe2e)) {
        return;
    }
    if (!istrue(level.br_prematchstarted)) {
        return undefined;
    }
    player = self;
    if (istrue(player.var_ea1c01dc368298b2)) {
        player.alreadyaddedtoalivecount = 1;
        player thread function_7cb9398c136b6a50();
        player thread function_e37ac9f8cbed03eb();
    } else {
        var_642470e1abc1bbf9.victim thread namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
    }
    player.var_ea1c01dc368298b2 = undefined;
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d21
// Size: 0x63
function function_7cb9398c136b6a50(var_cb5ba4c3282c39c1, var_54ebfc906d9a55e7) {
    /#
        assertex(isdefined(self), "Trying to respawn an invalid player");
    #/
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("doingRespawn");
    var_30a91e1938cfd1b2 = function_2d7ef4d534930df4(var_cb5ba4c3282c39c1, var_54ebfc906d9a55e7);
    player namespace_8bfdb6eb5a3df67a::function_d5ee3d3fad992d43(undefined, var_30a91e1938cfd1b2);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d8b
// Size: 0xb
function function_2e712bc64fde7() {
    wait(0.5);
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d9e
// Size: 0x214
function function_8a747fed5fdc31ed(spawnpoint, streamtimeout) {
    if (level.br_circle.circleindex < 2) {
        var_7b693900ad4aed24 = getclosestpointonnavmesh(spawnpoint.origin);
        maxdistance = getdvarint(@"hash_cd6b7daed2ab5024", 2500);
        if (distance2d(var_7b693900ad4aed24, spawnpoint.origin) > maxdistance) {
            targetpos = getrandomnavpoint(var_7b693900ad4aed24, randomfloat(maxdistance));
            spawnpoint.origin = (targetpos[0], targetpos[1], spawnpoint.origin[2]);
        }
    }
    if (isdefined(self.lastdeathpos)) {
        maxdistance = getdvarint(@"hash_cd6b7daed2ab5024", 2500);
        var_ac55bc4e66da14a7 = maxdistance * maxdistance;
        if (distance2dsquared(self.lastdeathpos, spawnpoint.origin) > var_ac55bc4e66da14a7) {
            offset = spawnpoint.origin - self.lastdeathpos;
            offset = vectornormalize(offset);
            offset = (offset[0] * maxdistance, offset[1] * maxdistance, offset[2]);
            targetpos = (self.lastdeathpos[0] + offset[0], self.lastdeathpos[1] + offset[1], offset[2]);
            targetpos = getclosestpointonnavmesh(targetpos);
            spawnpoint.origin = (targetpos[0], targetpos[1], spawnpoint.origin[2]);
        }
    }
    if (namespace_8bfdb6eb5a3df67a::function_61b5424aa3fe974e(spawnpoint.origin, streamtimeout)) {
        safeorigin = namespace_c5622898120e827f::getsafecircleorigin();
        var_f434d604c09196aa = namespace_c5622898120e827f::getsafecircleradius();
        offset = spawnpoint.origin - safeorigin;
        offset = vectornormalize(offset);
        offset = (offset[0] * var_f434d604c09196aa, offset[1] * var_f434d604c09196aa, offset[2]);
        targetpos = safeorigin + offset;
        spawnpoint.origin = (targetpos[0], targetpos[1], spawnpoint.origin[2]);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fb9
// Size: 0xa8
function function_2d7ef4d534930df4(var_cb5ba4c3282c39c1, var_54ebfc906d9a55e7) {
    rs = namespace_8bfdb6eb5a3df67a::function_ade48af7c782e202(&function_179991a5f6040f91, "br_ac130_flyby", undefined);
    rs namespace_8bfdb6eb5a3df67a::function_9fd565bcd654ed48(&function_47f3ced79ed3a338);
    rs namespace_8bfdb6eb5a3df67a::function_b4c313df5d7fb216(&function_777d7ef570638306, 20);
    rs namespace_8bfdb6eb5a3df67a::function_8cb232cdf47da79c(&function_ff75bbd246d432ec, 20);
    rs namespace_8bfdb6eb5a3df67a::function_2556973693d6315(&function_e762446073ac085, "br_resurgence_redeploy_improvement", 20, "splash_list_iw9_br_resurgence_mp", "resurgence_redeploy");
    rs.var_9fdc1f9e4fc628e4.var_cb5ba4c3282c39c1 = var_cb5ba4c3282c39c1;
    rs.var_9fdc1f9e4fc628e4.var_54ebfc906d9a55e7 = var_54ebfc906d9a55e7;
    return rs;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8069
// Size: 0x20
function function_ff75bbd246d432ec(var_9fdc1f9e4fc628e4) {
    if (!istrue(self.var_1e309fa83f9fbe2e)) {
        namespace_cb965d2f71fefddc::removerespawntoken();
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8090
// Size: 0x9a
function function_e762446073ac085(var_9fdc1f9e4fc628e4) {
    if (istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        if (istrue(self.var_1e309fa83f9fbe2e) && !istrue(self.var_36a7cb5e6f04de78)) {
            thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_survive_countdown_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
            self.var_36a7cb5e6f04de78 = 1;
        }
    } else if (istrue(self.var_1e309fa83f9fbe2e)) {
        thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_reinforcement_closed_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
    }
    if (istrue(self.var_1e309fa83f9fbe2e)) {
        self notify("respawn_done");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8131
// Size: 0x7d
function function_777d7ef570638306(var_9fdc1f9e4fc628e4) {
    player = self;
    if (istrue(player.var_1e309fa83f9fbe2e)) {
        player function_fff107d76eb56064();
    } else {
        player function_bbee565c7645ea29();
    }
    if (!istrue(player.var_1e309fa83f9fbe2e)) {
        player function_1f013990c19fcd88();
    }
    /#
        println("getBRBonusXPperMillisecond" + self.name);
    #/
    function_c04b5edf3f9ea340();
    var_d4066589fef0017 = 0;
    return var_d4066589fef0017;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81b6
// Size: 0xb9
function function_47f3ced79ed3a338(var_9fdc1f9e4fc628e4) {
    player = self;
    if (!istrue(player.var_1e309fa83f9fbe2e)) {
        if (istrue(player.respawningfromtoken)) {
            return 0;
        }
        player.respawningfromtoken = 1;
        if (istrue(var_9fdc1f9e4fc628e4.var_cb5ba4c3282c39c1)) {
            player function_aae3ac84b3ff8e6d();
            player thread namespace_391de535501b0143::killeventtextpopup("br_resurgence_vengeance", 0, 0);
            wait(1.5);
        }
        player function_fb9ed4b8a0e55bfc(var_9fdc1f9e4fc628e4.var_54ebfc906d9a55e7);
        function_c3c91f0dfbf4f683();
        player namespace_99ac021a7547cae3::addtoalivecount("resurgence2");
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        player namespace_cb965d2f71fefddc::addrespawntoken(1);
    } else {
        player function_fb9ed4b8a0e55bfc();
    }
    return 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8277
// Size: 0x45
function function_179991a5f6040f91(var_9fdc1f9e4fc628e4) {
    self notify("resurgenceRespawn");
    self.health = self.maxhealth;
    val::set("resurgenceRespawn", "player_for_spawn_logic", 0);
    namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isRespawning", 0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82c3
// Size: 0x31
function function_c04b5edf3f9ea340() {
    if (isdefined(level.br_standard_loadout) || getdvarint(@"hash_f97d261e2f377ad9", 1) != 0) {
        self.gulagtableloadout = 1;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82fb
// Size: 0x17
function function_b0fc27ec6e239628() {
    var_33d4cdf6cb6338fd = namespace_8bfdb6eb5a3df67a::function_eee8abc18302f5ef();
    return var_33d4cdf6cb6338fd[0];
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x831a
// Size: 0x11d
function function_6ab3fa08604ded12() {
    var_a0c010617b88d7bc = istrue(level.brgametype.var_574951d2eff9c094) && istrue(self.avenged);
    if ((var_a0c010617b88d7bc || istrue(level.brgametype.var_d6dc578c217f88cf)) && isdefined(self.var_5fb036c33cddd360)) {
        namespace_d20f8ef223912e12::function_7fbb2e52f100474e();
        if (var_a0c010617b88d7bc) {
            thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_vengeance_loadout", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
        }
    } else {
        var_33d4cdf6cb6338fd = namespace_8bfdb6eb5a3df67a::function_eee8abc18302f5ef();
        level.br_standard_loadout = var_33d4cdf6cb6338fd[0];
        var_c179e44bd14d2d12 = var_33d4cdf6cb6338fd[1];
        if (istrue(getdvarint(@"hash_5c757e0c9c8827c4")) && istrue(self.br_isininfil)) {
            function_b1eaa06eea44951b();
            self.br_isininfil = 0;
        } else {
            namespace_d20f8ef223912e12::givestandardtableloadout(0, 1, var_c179e44bd14d2d12);
        }
    }
    if (!isdefined(self.equipment) || !isdefined(self.equipment["health"])) {
        namespace_f8d3520d3483c1::function_be5c0cdfa0202544();
    }
    self.avenged = undefined;
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843f
// Size: 0xdd
function function_decd4293c451c70() {
    if (!istrue(level.br_prematchstarted)) {
        return;
    }
    if (!isdefined(self.var_b2b6316d154f7468)) {
        self.var_b2b6316d154f7468 = 1;
        var_ce214afc7b96a3a7 = getdvarint(@"hash_e67c864263196598", 1);
        if (var_ce214afc7b96a3a7) {
            namespace_cb965d2f71fefddc::addselfrevivetoken(1);
        }
        var_bc5632ffdb336731 = getdvarint(@"hash_5868a46b12b1b4dd", 0);
        if (var_bc5632ffdb336731) {
            namespace_b6a8027f477010e1::addspecialistbonus();
        }
    } else {
        var_ce214afc7b96a3a7 = getdvarint(@"hash_cd33c7ad9a88587f", 0);
        if (var_ce214afc7b96a3a7) {
            namespace_cb965d2f71fefddc::addselfrevivetoken(1);
        }
        var_bc5632ffdb336731 = getdvarint(@"hash_5868a46b12b1b4dd", 0);
        if (var_bc5632ffdb336731) {
            namespace_b6a8027f477010e1::addspecialistbonus();
        }
    }
    if (!isdefined(self.equipment) || !isdefined(self.equipment["health"])) {
        namespace_f8d3520d3483c1::function_be5c0cdfa0202544();
    }
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8524
// Size: 0x5b
function function_b1eaa06eea44951b() {
    struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    struct.loadoutarchetype = "archetype_assault";
    struct.loadoutequipmentprimary = "equip_snowball";
    struct.loadoutstreaktype = "assault";
    namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1);
    namespace_d20f8ef223912e12::br_giveselectedclass(self, 0, 0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8586
// Size: 0x31
function function_53382489ff523151() {
    var_b1f627237929640e = [0:"brloot_self_revive", 1:"brloot_equip_gasmask", 2:"brloot_equip_gasmask_durable"];
    return function_7a2aaa4a09a4d250(var_b1f627237929640e);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85bf
// Size: 0x1d
function getrandomkillstreak(var_d1c6815242045d90) {
    return pickscriptablelootitem("killstreak", 0, var_d1c6815242045d90, "mp/loot/br/default/lootset_cache_base.csv");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85e4
// Size: 0x13
function function_b398acc9ba21ecb5() {
    return getdvarint(@"hash_5c872af62541d1d", 3);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85ff
// Size: 0x41
function circletimer(circleindex) {
    if (istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
        if (circleindex >= var_10b5c13c81db5079) {
            function_1a3782804d2407e5();
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8647
// Size: 0xf0
function function_338ba9b353a9a78b() {
    var_89850b370a87aa3c = 0;
    if (level.brgametype.var_bb9b77186cb79ae6) {
        players = getteamarray(self.team);
        var_89850b370a87aa3c = players.size - 1;
        foreach (player in players) {
            if (isdefined(player) && istrue(player.var_632bad3edb4e449e)) {
                var_89850b370a87aa3c--;
            }
        }
    } else {
        var_89850b370a87aa3c = namespace_36f464722d326bbe::function_4fb37368ae3585bb() - 1;
    }
    var_89850b370a87aa3c = int(max(min(var_89850b370a87aa3c, level.brgametype.var_34af112c77c2c381.size - 1), 0));
    return level.brgametype.var_34af112c77c2c381[var_89850b370a87aa3c];
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x873f
// Size: 0x157
function getrespawndelay() {
    var_53a4a1c920def4bd = function_338ba9b353a9a78b();
    if (isdefined(level.brgametype.var_88a254227da87c7f) && isdefined(level.brgametype.var_88a254227da87c7f[self.team])) {
        respawndelay = level.brgametype.var_88a254227da87c7f[self.team].var_96197ae66bd1d8c3[var_53a4a1c920def4bd];
    } else if (isdefined(level.brgametype.var_c655c38108f1827f)) {
        respawndelay = level.brgametype.var_c655c38108f1827f;
    } else {
        circleindex = int(max(0, int(min(level.br_circle.circleindex, level.brgametype.respawndelay[var_53a4a1c920def4bd].size - 1))));
        respawndelay = level.brgametype.respawndelay[var_53a4a1c920def4bd][circleindex];
    }
    if (level.brgametype.var_14afb82aa29bc57c > 0 && self.attacker == self) {
        respawndelay = respawndelay + level.brgametype.var_14afb82aa29bc57c;
    }
    return respawndelay;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889e
// Size: 0x7a
function function_f39fa02f6ed912fc(attackers) {
    if (!istrue(self.var_1e309fa83f9fbe2e)) {
        return;
    }
    victim = self;
    if (!isdefined(victim.respawndelay)) {
        victim.respawndelay = 0;
    }
    if (victim.respawndelay > 0 || !istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        attackers[attackers.size] = victim.laststandattacker;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x891f
// Size: 0x1b9
function function_1a3782804d2407e5() {
    level.brgametype.var_c42e40ec22a1f0d4 = 0;
    level.brgametype.var_bbde847aed85512a = 0;
    if (!level.brgametype.var_4ad7c03ec4fa687) {
        function_683452dfa2b09ccd();
        namespace_71073fa38f11492::runbrgametypefunc("resurgenceDisable");
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(namespace_71073fa38f11492::runbrgametypefunc("resurgenceDisableSkipForPlayer", player))) {
            continue;
        }
        if (isinlaststand(player)) {
            player.var_8a52130c321aa8a = 1;
            player thread function_3d8918359e1b33c5();
        }
        player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_reinforcement_closed_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
        player setclientomnvar("ui_br_timed_feature_end_time", 0);
        if (istrue(level.br_pickups.var_a181de0ed6a505d5) && player namespace_d3d40f75bb4e4c32::hasrespawntoken()) {
            player namespace_cb965d2f71fefddc::removerespawntoken();
            if (level.brgametype.var_3fc59bce0c73b8cf > 0) {
                player namespace_c6ccccd95254983f::playerplunderpickup(level.brgametype.var_3fc59bce0c73b8cf);
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_redeploy_conversion", undefined, level.brgametype.var_eaa971da207c8bb5);
            }
        }
        if (istrue(player.var_1e309fa83f9fbe2e)) {
            player notify("respawn_disabled");
        } else {
            player namespace_71073fa38f11492::runbrgametypefunc("playerResurgenceDisable");
        }
    }
    namespace_d3d40f75bb4e4c32::brleaderdialog("resurgence_disabled", undefined, undefined, undefined, undefined, undefined);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8adf
// Size: 0x1c
function function_3d8918359e1b33c5() {
    self endon("death_or_disconnect");
    self waittill("last_stand_revived");
    self.var_8a52130c321aa8a = undefined;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b02
// Size: 0xe4
function function_38a46a469c73dc2c() {
    /#
        assertex(isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters) && isdefined(level.br_level.br_circleradii), "brResurgence_createC130PathStruct: Trying to create a C130 path within BR Resurgence, without level.br_level defined!");
    #/
    var_f9cbff5134da960b = (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], 0);
    var_e5bd279d3767139f = level.br_level.br_circleradii[1];
    c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path(var_f9cbff5134da960b, var_e5bd279d3767139f, level.brgametype.var_b024f80fc9886fc4, level.brgametype.var_92fcc390c4c0acd7);
    return c130pathstruct;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bee
// Size: 0xb
function function_c338e39db41d9374() {
    thread namespace_d3d40f75bb4e4c32::kickplayersatcircleedge();
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c00
// Size: 0x25
function function_f13ec0f9fbe36171() {
    if (isdefined(level.var_463a99b72cf43096)) {
        self setclientomnvar("ui_br_timed_feature_end_time", level.var_463a99b72cf43096);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2c
// Size: 0x149
function function_7ea88dd9bc483463(player) {
    if (!namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (istrue(level.gameended)) {
        return;
    }
    if (level.brgametype.var_4ad7c03ec4fa687) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    if (namespace_d20f8ef223912e12::function_f8167aab51948bf0(player.team) && !istrue(level.brgametype.var_b43745b85f249e68)) {
        return;
    }
    remainingplayers = getteamarray(player.team);
    foreach (var_55604b242897e62e in remainingplayers) {
        function_c17a21e7020df4c(var_55604b242897e62e, 0, player);
    }
    if (istrue(level.brgametype.var_bb9b77186cb79ae6) && istrue(level.brgametype.var_c42e40ec22a1f0d4) && !istrue(level.brgametype.var_2b5ee6212b58e7a6)) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("resurgence_on_player_disconnect", 1, remainingplayers, undefined, 0, undefined);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7c
// Size: 0x27
function function_9bf15d9bf66ead8d(player) {
    if (!istrue(player.var_632bad3edb4e449e)) {
        thread function_c4d09e34eb4d8e2b(player, 1);
    }
    return [];
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dab
// Size: 0x16
function function_e60ebcdf4083532e(player) {
    thread function_c4d09e34eb4d8e2b(player, 0);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc8
// Size: 0x182
function function_c4d09e34eb4d8e2b(player, var_51c0c03bb238c17) {
    level endon("game_ended");
    if (!namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (istrue(level.gameended)) {
        return;
    }
    if (level.brgametype.var_4ad7c03ec4fa687) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    if (namespace_d20f8ef223912e12::function_f8167aab51948bf0(player.team) && !istrue(level.brgametype.var_b43745b85f249e68)) {
        return;
    }
    if (istrue(var_51c0c03bb238c17)) {
        player notify("force_stop_respawn");
    } else {
        player notify("resurgence_rejoin_successful");
    }
    remainingplayers = getteamarray(player.team);
    if (istrue(level.brgametype.var_bb9b77186cb79ae6)) {
        if (level.brgametype.var_8947d8f4e61494fa) {
            foreach (var_55604b242897e62e in remainingplayers) {
                var_f7b6cc6c062a7a43 = "br_resurgence_ally_rejoin_improvement";
                if (istrue(var_51c0c03bb238c17)) {
                    var_f7b6cc6c062a7a43 = "br_resurgence_ally_left_improvement";
                }
                var_55604b242897e62e thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43, undefined, player, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
            }
        }
        if (var_51c0c03bb238c17) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("resurgence_on_player_disconnect", 1, remainingplayers, undefined, 0, undefined);
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f51
// Size: 0xa4
function function_cc9995519d9cee6(player, var_8adb6861b69910e) {
    level endon("game_ended");
    self endon("disconnect");
    while (!isalive(player) || !player isonground() && !player isswimming()) {
        wait(1);
    }
    if (!var_8adb6861b69910e && istrue(level.brgametype.var_fb997d1846bd5cf4)) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_left_behind_improvement", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp");
    }
    player.respawndelay = 0;
    player.var_1e309fa83f9fbe2e = 1;
    player setclientomnvar("ui_br_resurgence_respawn_type", 1);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ffc
// Size: 0xe9
function function_22ef1cd58a8d87e8() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    foreach (team in level.teamnamelist) {
        if (getteamcount(team) < teamsize) {
            teamplayers = getteamarray(team);
            foreach (player in teamplayers) {
                if (isdefined(player)) {
                    function_c17a21e7020df4c(player, 1);
                }
            }
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ec
// Size: 0xa5
function function_c17a21e7020df4c(player, var_8adb6861b69910e, var_3dc09661d4d00956) {
    if (getteamcount(player.team) == 1 && istrue(level.brgametype.var_9524142eb719a321)) {
        thread function_cc9995519d9cee6(player, var_8adb6861b69910e);
    } else if (!var_8adb6861b69910e && istrue(level.brgametype.var_8947d8f4e61494fa) && !istrue(level.brgametype.var_2b5ee6212b58e7a6)) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_ally_left_improvement", undefined, var_3dc09661d4d00956, undefined, 1, "splash_list_iw9_br_resurgence_mp");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9198
// Size: 0x74
function function_81baad6d96ff2130() {
    level endon("game_ended");
    level namespace_3c37cb17ade254d::flag_wait("StartGameTypeCallbackFinished");
    level.brgametype.var_2b5ee6212b58e7a6 = namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25() && getdvarint(@"hash_b14d64e76f160241", 1);
    if (istrue(level.brgametype.var_2b5ee6212b58e7a6)) {
        namespace_bf9ffd2b22c7d819::function_8ce5b106fbba9e9f(&function_9bf15d9bf66ead8d);
        namespace_bf9ffd2b22c7d819::function_8fe6d6539ed31a88(&function_e60ebcdf4083532e);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9213
// Size: 0x114
function function_797b21b78b5e0a26(respawntype) {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    foreach (player in level.players) {
        if (isdefined(player)) {
            var_ec0fc26262ef7791 = level.brgametype.var_4ad7c03ec4fa687 || level.brgametype.var_9524142eb719a321 && getteamcount(player.team) == 1;
            if (var_ec0fc26262ef7791) {
                player.respawndelay = 0;
                player.var_1e309fa83f9fbe2e = 1;
                player setclientomnvar("ui_br_resurgence_respawn_type", 1);
            } else {
                player.var_1e309fa83f9fbe2e = 0;
                player setclientomnvar("ui_br_resurgence_respawn_type", 0);
            }
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932e
// Size: 0xb8
function function_4f5568cf15d60b8() {
    if (!istrue(level.brgametype.var_f439c17a413f05c3)) {
        return;
    }
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    foreach (player in level.players) {
        if (isdefined(player)) {
            /#
                assert(!isdefined(player.var_8c5c47f81a1869e5), "Armor break function already defined.");
            #/
            player.var_8c5c47f81a1869e5 = &function_a045bcdb0d1bebf9;
        }
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93ed
// Size: 0xe8
function function_90507e372a40c684() {
    if (!istrue(level.brgametype.var_f9623a041e743669)) {
        return;
    }
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    var_3b90a1ee7a57f5b1 = [];
    foreach (perkref in level.var_ffc23517bdb76237) {
        if (function_793956fb93de9504(perkref)) {
            var_4a0e5042ce1ae1e2 = level.var_a1ad2758fcbd2f5e[perkref].var_4a0e5042ce1ae1e2;
            if (!isdefined(var_3b90a1ee7a57f5b1[var_4a0e5042ce1ae1e2])) {
                var_3b90a1ee7a57f5b1[var_4a0e5042ce1ae1e2] = [];
            }
            var_bb58bcc7b0654344 = var_3b90a1ee7a57f5b1[var_4a0e5042ce1ae1e2].size;
            var_3b90a1ee7a57f5b1[var_4a0e5042ce1ae1e2][var_bb58bcc7b0654344] = perkref;
        }
    }
    level.brgametype.var_3b90a1ee7a57f5b1 = var_3b90a1ee7a57f5b1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94dc
// Size: 0x66
function function_793956fb93de9504(perkref) {
    return isdefined(level.var_a1ad2758fcbd2f5e[perkref]) && istrue(level.var_a1ad2758fcbd2f5e[perkref].var_594af43597023062) && istrue(level.var_a1ad2758fcbd2f5e[perkref].specialistbr) && !istrue(level.var_a1ad2758fcbd2f5e[perkref].var_806f83b21ea91e21);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x954a
// Size: 0xe7
function function_10870c1a437402b() {
    var_faeedaf859fd76f6 = [];
    deltatime = -15;
    circleindex = getdvarint(@"hash_d8b0fcd21faaa19", 1);
    closetime = namespace_c5622898120e827f::getcircleclosetime(circleindex);
    defaultval = max(0, closetime + deltatime);
    var_7b76b8bb6b541a17 = getdvarfloat(@"hash_b81b25bcd8c7d749", defaultval);
    if (var_7b76b8bb6b541a17 == -1) {
        var_7b76b8bb6b541a17 = defaultval;
    }
    var_faeedaf859fd76f6[var_faeedaf859fd76f6.size] = var_7b76b8bb6b541a17;
    circleindex = getdvarint(@"hash_ddcef5da1224b559", -1);
    if (circleindex > 0) {
        closetime = namespace_c5622898120e827f::getcircleclosetime(circleindex);
        defaultval = max(0, closetime + deltatime);
        var_7b76b8bb6b541a17 = getdvarfloat(@"hash_3771b5264b3f0789", defaultval);
        if (var_7b76b8bb6b541a17 == -1) {
            var_7b76b8bb6b541a17 = defaultval;
        }
        var_faeedaf859fd76f6[var_faeedaf859fd76f6.size] = var_7b76b8bb6b541a17;
    }
    namespace_71073fa38f11492::registerbrgametypedata("dropBagDelay", var_faeedaf859fd76f6);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9638
// Size: 0x15c
function function_9680317afd0e4558() {
    level endon("game_ended");
    circleindex = getdvarint(@"hash_18ddb1ff66d76c3e", 5);
    closetime = namespace_c5622898120e827f::getcircleclosetime(circleindex);
    level waittill("prematch_started");
    wait(closetime);
    circlecenter = level.br_level.br_circlecenters[circleindex];
    radius = level.br_level.br_circleradii[circleindex];
    count = getdvarint(@"hash_d56a2151b61e380c", 3);
    step = 360 / count;
    yaw = 0;
    for (i = 0; i < count; i++) {
        yaw = yaw + step;
        var_f7d73ac7e17aa57e = (0, yaw, 0);
        var_45fe3f8f3e08e301 = circlecenter + anglestoforward(var_f7d73ac7e17aa57e) * radius * 0.5;
        randompoint = namespace_c5622898120e827f::getrandompointinboundscircle(var_45fe3f8f3e08e301, radius * 0.5, 0.25, 0.75, 1, 0, 1);
        /#
            level thread namespace_f2ffc0540883e1ad::drawline(circlecenter, var_45fe3f8f3e08e301, 999, (1, 1, 0));
        #/
        namespace_118d21fe30d82c84::function_590979ef771686a8(undefined, randompoint);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x979b
// Size: 0x15f
function function_721a7410f27c2d8f() {
    /#
        level endon("splash_list_iw9_br_resurgence_mp");
        while (1) {
            circleindex = getdvarint(@"hash_14d4db7faf2d7cd1", -1);
            if (circleindex > 0) {
                setdvar(@"hash_14d4db7faf2d7cd1", -1);
                circlecenter = level.br_level.br_circlecenters[circleindex];
                radius = level.br_level.br_circleradii[circleindex];
                count = getdvarint(@"hash_ac62a62c1d7f665d", 3);
                step = 360 / count;
                yaw = 0;
                for (i = 0; i < count; i++) {
                    yaw = yaw + step;
                    var_f7d73ac7e17aa57e = (0, yaw, 0);
                    var_45fe3f8f3e08e301 = circlecenter + anglestoforward(var_f7d73ac7e17aa57e) * radius * 0.5;
                    randompoint = namespace_c5622898120e827f::getrandompointinboundscircle(var_45fe3f8f3e08e301, radius * 0.5, 0, 0.9, 1, 0, 1);
                    level thread namespace_f2ffc0540883e1ad::drawline(circlecenter, var_45fe3f8f3e08e301, 999, (1, 1, 0));
                    namespace_118d21fe30d82c84::function_590979ef771686a8(undefined, randompoint);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9901
// Size: 0x26
function function_c2e48f2200bd249b() {
    circlecenter = getdvarvector(@"hash_eb589c6bd2884bbb", level.var_e6bdefd8842bdd49);
    return circlecenter;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x992f
// Size: 0xc9
function function_98609987fbc9bcc3(args) {
    /#
        if (args.size == 0) {
            return;
        }
        command = args[0];
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        switch (command) {
        case #"hash_a172f0299633692c":
            var_e79995fa243ca9 = 0;
            if (isdefined(args[1]) && int(args[1]) == 1) {
                var_e79995fa243ca9 = 1;
            }
            host function_9e3c77b199d3c8c8(var_e79995fa243ca9);
            break;
        case #"hash_e56d45470c871021":
            host function_cb7114374c912a6f();
            break;
        case #"hash_2c58990905f03e75":
            event = "enemy_wiped";
            if (isdefined(args[1])) {
                event = args[1];
            }
            host function_927f6139e79412c1(event);
            break;
        }
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99ff
// Size: 0x12c
function function_9e3c77b199d3c8c8(var_e79995fa243ca9) {
    /#
        /#
            assert(level.brgametype.var_bbde847aed85512a, "name");
        #/
        teamdata = level.teamdata[self.team];
        alivecount = teamdata["t_wipe"];
        /#
            assert(alivecount > 0, "br_pe_capNode");
        #/
        if (var_e79995fa243ca9) {
            function_4744bb1db1b48f9a(alivecount);
        } else {
            teammates = array_remove(teamdata["resurgence_rejoin_successful"], self);
            var_7c67ef304283bd06 = undefined;
            foreach (teammate in teammates) {
                var_7c67ef304283bd06 = teammate getspectatingplayer();
                if (isdefined(var_7c67ef304283bd06) && var_7c67ef304283bd06.team == self.team) {
                    teammate notify("trying to add a duplicate");
                    break;
                }
            }
            /#
                assert(isdefined(var_7c67ef304283bd06), "resurgence2");
            #/
        }
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b32
// Size: 0x140
function function_cb7114374c912a6f() {
    /#
        if (istrue(self.var_1e309fa83f9fbe2e)) {
            return;
        }
        aliveplayers = getteamdata(self.team, "ui_br_resurgence_respawn_type");
        var_d0b996fde8bfc937 = level.teamdata[self.team]["squad_wipe_streak_"];
        if (var_d0b996fde8bfc937.size <= 0 || aliveplayers.size <= 0) {
            /#
                assertmsg("five_squads");
            #/
            return;
        }
        foreach (item in var_d0b996fde8bfc937) {
            if (!isdefined(item)) {
                continue;
            }
            if (isdefined(item.killer) && item.killer != item && isdefined(item.player)) {
                attackername = namespace_e4c20df2c9115a56::function_5d92949cc218ebdd(item.killer.name);
                victimname = namespace_e4c20df2c9115a56::function_5d92949cc218ebdd(aliveplayers[0].name);
                namespace_e4c20df2c9115a56::function_5b5ab8ab53c49d4d(attackername, victimname);
            }
        }
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c79
// Size: 0x41
function function_927f6139e79412c1(event) {
    /#
        aliveplayers = getteamdata(self.team, "ui_br_resurgence_respawn_type");
        event = function_1823ff50bb28148d(event);
        aliveplayers[0] namespace_48a08c5037514e04::doscoreevent(event);
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc1
// Size: 0x43
function function_e793259b8f9d5b2d() {
    namespace_71073fa38f11492::registerbrgametypefunc("isTeamEliminated", &function_ed345d3efb37c25c);
    level.checkforlaststandwipe = &function_7657b6775b05e1b9;
    level.brgametype.var_b43745b85f249e68 = 1;
    level.var_9f2c0d537922a861 = 1;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d0b
// Size: 0xd
function function_ed345d3efb37c25c(teamname) {
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d20
// Size: 0x15
function function_7657b6775b05e1b9(victim, var_9c14ae6e04bbd667) {
    return 0;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d3d
// Size: 0x1c
function private function_123793b0882ec6fb(newstate) {
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_resurgence_care_request", 0, 2, newstate);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d60
// Size: 0x1d
function private function_bd49896ab411c64c(alivecount) {
    namespace_e0a7597be4f2b843::function_63437fca39c681dc("ui_resurgence_care_request", 2, 3, alivecount);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d84
// Size: 0x8e
function playerwelcomesplashes(data) {
    self endon("disconnect");
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    if (istrue(self.var_1e309fa83f9fbe2e)) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective_solo", self, undefined, undefined, 1.5);
    } else {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective", self, undefined, undefined, 1.5);
        if (istrue(self.isbrsquadleader)) {
            namespace_d3d40f75bb4e4c32::brleaderdialogplayer("deploy_squad_leader", self, 1, 0, 4.5);
        }
    }
    while (!self isonground()) {
        waitframe();
    }
    namespace_a011fbf6d93f25e5::branalytics_landing(self);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e19
// Size: 0x5c
function private function_dbe2065974832286() {
    if (getdvarint(@"hash_ff0013edaa24f162", 0)) {
        level callback::add("register_team_data", &register_team_data);
        level callback::add("on_squad_wiped", &on_squad_wiped);
    }
    level callback::add("on_squad_eliminated", &function_8882e0941c41b8ce);
    function_f94d1138d1114c5d();
    /#
        debug_init();
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e7c
// Size: 0xb2
function private function_f94d1138d1114c5d() {
    game["dialog"]["squad_wipe_streak_" + "leader"] = "rsec_grav_rwsl_01";
    game["dialog"]["squad_wipe_streak_" + "kill_leader"] = "rsec_grav_rwsk";
    game["dialog"]["squad_wipe_streak_" + "fun_killer"] = "rses_grav_rwsf";
    game["dialog"]["squad_wipe_streak_" + "milestone"] = "rses_grav_rwsm";
    game["dialog"]["squad_count_" + "ten_squads"] = "rsre_grav_rtsr";
    game["dialog"]["squad_count_" + "five_squads"] = "rsre_grav_rfsr";
    game["dialog"]["squad_count_" + "three_squads"] = "rsre_grav_rtss";
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f35
// Size: 0x23a
function on_squad_wiped(params) {
    attackers = params.attackers;
    victim = params.victim;
    if (!isdefined(victim.attacker)) {
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE] There was no attacker on the victim.");
        }
        return;
    }
    if (!isdefined(attackers) || attackers.size == 0) {
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE] There were no attackers for the victim.");
        }
        return;
    }
    if (!isplayer(victim.attacker)) {
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE] Attacker wasn't a player it was: " + (isdefined(victim.attacker.classname) ? "undefined" : victim.attacker.classname));
        }
        return;
    }
    if (victim.attacker == victim) {
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE] Attacker was the victim, it was a suicide? Player: " + victim.name + " Team: " + victim.team);
        }
        return;
    }
    var_388c4f7d6815a09f = function_fc64178f71375137(attackers, victim.attacker);
    /#
        assertex(var_388c4f7d6815a09f, "br_gametype_resurgence::on_squad_wiped" + " did not find a valid attacker somehow in the attackers list compared to the victim's attacker.");
    #/
    params = {notification:"team_wiped", victim:victim, attacker:victim.attacker, var_e6b4a44e236fd54f:"squad_wipes"};
    level function_c2154554e89d5e91(params);
    attacker_streak = level teams::getteamdata(victim.attacker.team, "squad_wipes");
    if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
        logstring("[SQUAD WIPE] Attacker: " + victim.attacker.name + " | Victim: " + victim.name + " | Attacker Wipe Count: " + attacker_streak);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa176
// Size: 0xab
function function_8882e0941c41b8ce(params) {
    switch (params.var_5d9b595857f46dee.size) {
    case 10:
        dialog = "squad_count_" + "ten_squads";
        break;
    case 5:
        dialog = "squad_count_" + "five_squads";
        break;
    case 3:
        dialog = "squad_count_" + "three_squads";
        break;
    default:
        dialog = undefined;
        break;
    }
    if (isdefined(dialog)) {
        namespace_a548bd428a566cf3::brleaderdialog(dialog, 1, undefined, undefined, 1, undefined, "dx_br_smis_");
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa228
// Size: 0x58e
function private function_c2154554e89d5e91(params) {
    var_e6b4a44e236fd54f = params.var_e6b4a44e236fd54f;
    attacker = params.attacker;
    victim = params.victim;
    notification = params.notification;
    var_6fd43d70ed5ba724 = [];
    level teams::modifyteamdata(attacker.team, var_e6b4a44e236fd54f, 1);
    victim_streak = level teams::getteamdata(victim.team, "curr_" + var_e6b4a44e236fd54f);
    if (victim_streak > 0) {
        var_6fd43d70ed5ba724[var_6fd43d70ed5ba724.size] = {priority:50, dialog:"fun_killer"};
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE COMMON] " + attacker.team + " stopped team " + victim.team + " that was on a streak of " + victim_streak);
        }
    }
    var_cbb8478f9cd15285 = function_1e1cf28c03396eb0(var_e6b4a44e236fd54f);
    if (isdefined(var_cbb8478f9cd15285)) {
        if (var_cbb8478f9cd15285.team == victim.team) {
            var_6fd43d70ed5ba724[var_6fd43d70ed5ba724.size] = {priority:75, dialog:"kill_leader"};
            if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
                logstring("[SQUAD WIPE COMMON] " + attacker.team + " eliminated the best team " + victim.team);
            }
        }
    }
    level teams::setteamdata(victim.team, "curr_" + var_e6b4a44e236fd54f, 0);
    level teams::modifyteamdata(attacker.team, "curr_" + var_e6b4a44e236fd54f, 1);
    attacker_streak = level teams::getteamdata(attacker.team, "curr_" + var_e6b4a44e236fd54f);
    var_4cc70810cb57584a = level teams::getteamdata(attacker.team, "best_" + var_e6b4a44e236fd54f);
    if (attacker_streak > var_4cc70810cb57584a) {
        level teams::setteamdata(attacker.team, "best_" + var_e6b4a44e236fd54f, attacker_streak);
    }
    level function_541b1f28c772eb1f(attacker.team, attacker_streak, var_e6b4a44e236fd54f, notification);
    level notify(notification + "_" + victim.team);
    var_8bda9e622887d5bb = var_cbb8478f9cd15285;
    var_cbb8478f9cd15285 = function_1e1cf28c03396eb0(var_e6b4a44e236fd54f);
    if (isdefined(var_cbb8478f9cd15285)) {
        if (!isdefined(var_8bda9e622887d5bb) || isdefined(var_8bda9e622887d5bb) && var_8bda9e622887d5bb.team != var_cbb8478f9cd15285.team) {
            var_6fd43d70ed5ba724[var_6fd43d70ed5ba724.size] = {priority:100, dialog:"leader"};
            if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
                logstring("[SQUAD WIPE COMMON] " + var_cbb8478f9cd15285.team + " became the best team beating team " + (isdefined(var_8bda9e622887d5bb) ? "none" : var_8bda9e622887d5bb.team) + " with count of " + var_cbb8478f9cd15285.streak);
            }
        }
    }
    if (attacker_streak > 1 && attacker_streak % 2 == 1) {
        var_6fd43d70ed5ba724[var_6fd43d70ed5ba724.size] = {priority:25, dialog:"milestone"};
        if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
            logstring("[SQUAD WIPE COMMON] " + attacker.team + " is on a consecutive streak at " + attacker_streak);
        }
    }
    if (var_6fd43d70ed5ba724.size > 0) {
        var_f22cacb25f3f532b = var_6fd43d70ed5ba724[0];
        if (var_6fd43d70ed5ba724.size > 1) {
            foreach (entry in var_6fd43d70ed5ba724) {
                if (entry.priority >= var_f22cacb25f3f532b.priority) {
                    var_f22cacb25f3f532b = entry;
                }
            }
        }
        if (getdvarint(@"hash_898f9c951ebe309d", 1)) {
            namespace_a548bd428a566cf3::brleaderdialogteam("squad_wipe_streak_" + var_f22cacb25f3f532b.dialog, attacker.team, 1, 2.5, undefined, "dx_br_smis_");
            if (getdvarint(@"hash_30bdc56c2a2ef592", 1)) {
                logstring("[SQUAD WIPE COMMON] Playing dialog: " + var_f22cacb25f3f532b.dialog + " to " + attacker.team);
            }
        }
    }
    if (getdvarint(@"hash_a6bf6be37dfd1198", 1)) {
        var_ba4f4b9b7988606f = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
        contents = trace::create_contents(0, 1, 1);
        trace = trace::ray_trace((victim.origin[0], victim.origin[1], var_ba4f4b9b7988606f.origin[2]), victim.origin, [0:victim], contents);
        var_304e706c24ee331b = isdefined(trace["position"]) ? trace["position"] : victim.origin;
        utility::delaythread(0.2, &function_36a7e4c6cbac83d6, var_304e706c24ee331b);
    }
    namespace_aad14af462a74d08::function_b8e86c6dea0ac027(params.attacker, attacker_streak);
    function_234b304f15f0399a(attacker_streak, victim_streak);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa7bd
// Size: 0xd9
function private function_1e1cf28c03396eb0(var_e6b4a44e236fd54f) {
    var_cbb8478f9cd15285 = {team:undefined, streak:0};
    foreach (team in level.teamnamelist) {
        streak = level teams::getteamdata(team, "curr_" + var_e6b4a44e236fd54f);
        if (streak > 0 && streak > var_cbb8478f9cd15285.streak) {
            var_cbb8478f9cd15285.streak = streak;
            var_cbb8478f9cd15285.team = team;
        }
    }
    return var_cbb8478f9cd15285.streak > 0 ? var_cbb8478f9cd15285 : undefined;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa89e
// Size: 0x20
function private function_36a7e4c6cbac83d6(var_304e706c24ee331b) {
    level endon("game_ended");
    namespace_c133516bfc1d803c::utilflare_shootflare(var_304e706c24ee331b, "elimination_flare");
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa8c5
// Size: 0x65
function private function_dbbb1cb5b53ea9e5(a, b) {
    if (!isdefined(a.var_14110ad8d5069e7)) {
        a.var_14110ad8d5069e7 = -1;
    }
    if (!isdefined(b.var_14110ad8d5069e7)) {
        b.var_14110ad8d5069e7 = -1;
    }
    return a.var_14110ad8d5069e7 <= b.var_14110ad8d5069e7;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa932
// Size: 0xf3
function private function_541b1f28c772eb1f(team, streak, var_e6b4a44e236fd54f, notification) {
    level endon("game_ended");
    timer = function_3e57da11d0b56753(team, streak);
    if (getdvarint(@"hash_4cff443e8f01394f", 0) && streak > 1) {
        timer = timer + function_9c7dc3a5c44b7ab5(team);
    }
    level thread function_15795adcb3808397(team, timer, var_e6b4a44e236fd54f, notification);
    timer = int(gettime() + timer * 1000);
    foreach (player in teams::getteamdata(team, "players")) {
        player setclientomnvar("ui_br_squad_wipe_streak_timer_end_ms", timer);
        player setclientomnvar("ui_br_squad_wipe_streak_count", streak);
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa2c
// Size: 0x24
function private function_3e57da11d0b56753(team, streak) {
    return getdvarint(@"hash_980df9696fd73176", 90);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa58
// Size: 0xa2
function private function_9c7dc3a5c44b7ab5(team) {
    timer = 0;
    foreach (player in teams::getteamdata(team, "players")) {
        timer = player getclientomnvar("ui_br_squad_wipe_streak_timer_end_ms");
        if (timer > 0) {
            timer = timer - gettime();
            timer = timer * 0.001;
            break;
        }
    }
    /#
        assertex(timer > 0, "Timer wasn't greater than 0 for wipestreak calculation.");
    #/
    return timer;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab02
// Size: 0xe0
function private function_15795adcb3808397(team, time, var_e6b4a44e236fd54f, notification) {
    level endon("game_ended");
    level endon(notification + "_" + team);
    level endon("wipestreak_ended_" + team);
    level notify("wipestreak_timer_" + team);
    level endon("wipestreak_timer_" + team);
    wait(time);
    foreach (player in teams::getteamdata(team, "players")) {
        player setclientomnvar("ui_br_squad_wipe_streak_timer_end_ms", 0);
        player setclientomnvar("ui_br_squad_wipe_streak_count", 0);
    }
    level teams::setteamdata(team, "curr_" + var_e6b4a44e236fd54f, 0);
    level notify("wipestreak_ended_" + team);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabe9
// Size: 0x92
function private register_team_data(params) {
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["squad_wipes"] = 0;
        level.teamdata[team]["curr_squad_wipes"] = 0;
        level.teamdata[team]["best_squad_wipes"] = 0;
    }
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac82
// Size: 0x48
function private function_234b304f15f0399a(attacker_streak, victim_streak) {
    eventparams = [0:"attacker_streak", 1:attacker_streak, 2:"victim_streak", 3:victim_streak];
    dlog_recordevent("dlog_event_br_squad_wipe", eventparams);
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd1
// Size: 0x3b
function function_b0bb8889afbb0c83() {
    var_e0f4d3685ff5c5bc = 50000;
    var_2121aa51c2c8132e = 80;
    var_409d356961c27474 = 15;
    return [0:var_e0f4d3685ff5c5bc, 1:var_2121aa51c2c8132e, 2:var_409d356961c27474];
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad14
// Size: 0x8
function function_843d05502816cbce() {
    return 0.001;
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad24
// Size: 0x6b
function debug_init() {
    /#
        setdvarifuninitialized(@"hash_980df9696fd73176", function_3e57da11d0b56753());
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b(" became the best team beating team ");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_cec96fed16a6d8e8);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_eaf6e107769f9877);
        namespace_b032b0cc17b10064::function_df648211d66cd3dd("<unknown string>", "<unknown string>");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad96
// Size: 0x51
function function_cec96fed16a6d8e8() {
    /#
        var_a326b171ff507f5d = level.players[0].origin + anglestoforward(level.players[0].angles) * 240;
        namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_a326b171ff507f5d, "<unknown string>");
    #/
}

// Namespace namespace_bbb7af4f07fb391c/namespace_6176022cc9d5b3f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xadee
// Size: 0x10f
function function_eaf6e107769f9877() {
    /#
        if (!isdefined(level.teamdata[level.players[0].team]["<unknown string>"])) {
            setdvar(@"hash_6ffa7b0113bccfb7", 0);
            register_team_data();
        }
        player = level.players[0];
        foreach (player in level.players) {
            if (!player ishost()) {
                break;
            }
        }
        /#
            assertex(!player ishost(), "<unknown string>");
        #/
        player.attacker = level.players[0];
        params = {victim:player, attackers:[0:level.players[0]]};
        on_squad_wiped(params);
    #/
}

