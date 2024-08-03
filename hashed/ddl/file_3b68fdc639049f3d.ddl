// file ddl_3b68fdc639049f3d

// bitSize: 0x17c38, members: 14
struct root {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x10(0x2B)
    short waves_survived;
    // offset: 0x110, bitSize: 0x8(0x1B)
    byte scoreboardPlayerCount;
    // offset: 0x118, bitSize: 0x8(0x1B)
    byte numQuestPiecesCompleted;
    // offset: 0x120, bitSize: 0x20(0x4B)
    int32 stars_earned;
    // offset: 0x140, bitSize: 0x20(0x4B)
    int32 time_survived;
    // offset: 0x160, bitSize: 0x20(0x4B)
    int32 team_score;
    // offset: 0x180, bitSize: 0x17a80(0x2f50B)
    Player player[8];
    // offset: 0x17c00, bitSize: 0x8(0x1B)
    byte totalNumOfQuestPieces;
    // offset: 0x17c08, bitSize: 0x10(0x2B)
    short deathCount;
    // offset: 0x17c18, bitSize: 0x18(0x3B)
    bit questPieces[24];
    // offset: 0x17c30, bitSize: 0x4
    bit playOutroVideo[4];
    // offset: 0x17c34, bitSize: 0x1
    bit isPublicMatch;
    // offset: 0x17c35, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x2f50, members: 18
struct Player {
    // offset: 0x0, bitSize: 0x10(0x2B)
    short rank;
    // offset: 0x10, bitSize: 0x20(0x4B)
    int32 total_headshots;
    // offset: 0x30, bitSize: 0x8(0x1B)
    byte characterIndex;
    // offset: 0x38, bitSize: 0x20(0x4B)
    int32 currency_earned;
    // offset: 0x58, bitSize: 0x8(0x1B)
    LoadoutWeapon DeadliestWeapon;
    // offset: 0x60, bitSize: 0x10(0x2B)
    short zombie_death;
    // offset: 0x70, bitSize: 0x10(0x2B)
    short revived_another_player;
    // offset: 0x88, bitSize: 0x1600(0x2c0B)
    uint32 killsPerWeapon[176];
    // offset: 0x1688, bitSize: 0x20(0x4B)
    int32 xuidHigh;
    // offset: 0x16a8, bitSize: 0x20(0x4B)
    int32 xuidLow;
    // offset: 0x16c8, bitSize: 0x10(0x2B)
    short dropped_to_last_stand;
    // offset: 0x16d8, bitSize: 0x10(0x2B)
    short entering_afterlife_arcade;
    // offset: 0x16e8, bitSize: 0x10(0x2B)
    short prestige;
    // offset: 0x16f8, bitSize: 0x20(0x4B)
    uint32 DeadliestWeaponKills;
    // offset: 0x1718, bitSize: 0x170(0x2eB)
    char username[46];
    // offset: 0x1888, bitSize: 0x1600(0x2c0B)
    int32 headShots[176];
    // offset: 0x2e88, bitSize: 0xc8(0x19B)
    cards_used cardsUsed[5];
    // offset: 0x80, bitSize: 0x8(0x1B)
    ClientPlatform platform;
}

// bitSize: 0x28, members: 2
struct cards_used {
    // offset: 0x0, bitSize: 0x20(0x4B)
    uint32 loot_ID;
    // offset: 0x20, bitSize: 0x8(0x1B)
    byte num_of_times_used;
}

// members: f
enum ClientPlatform {
    "none" = 0x0,
    "steam" = 0x1,
    "bnet" = 0x2,
    "xb3" = 0x3,
    "xb4" = 0x4,
    "ps4" = 0x5,
    "ps5" = 0x6,
    "wegame" = 0x7,
    "ios" = 0x8,
    "android" = 0x9,
    "switch" = 0xa,
    "bot" = 0xb,
    "msstore" = 0xc,
    "ubiconnect" = 0xd,
    "any" = 0xe,
}

// members: b0
enum LoadoutWeapon {
    "none" = 0x0,
    "iw9_me_fists" = 0x1,
    "iw9_me_riotshield" = 0x2,
    "iw9_ar_golf3" = 0x3,
    "iw9_ar_kilo53" = 0x4,
    "iw9_ar_mike4" = 0x5,
    "iw9_ar_mike16" = 0x6,
    "iw9_ar_acharlie300" = 0x7,
    "iw9_ar_akilo" = 0x8,
    "iw9_ar_akilo105" = 0x9,
    "iw9_ar_akilo74" = 0xa,
    "iw9_ar_augolf" = 0xb,
    "iw9_ar_schotel" = 0xc,
    "iw9_ar_mcharlie" = 0xd,
    "iw9_ar_mcbravo" = 0xe,
    "iw9_ar_scharlie" = 0xf,
    "iw9_br_msecho" = 0x10,
    "iw9_br_soscar14" = 0x11,
    "iw9_br_ngsierra" = 0x12,
    "iw9_sm_aviktor" = 0x13,
    "iw9_sm_alpha57" = 0x14,
    "iw9_sm_mpapa5" = 0x15,
    "iw9_sm_mpapa7" = 0x16,
    "iw9_sm_beta" = 0x17,
    "iw9_sm_victor" = 0x18,
    "iw9_sm_apapa" = 0x19,
    "iw9_sm_mpapax" = 0x1a,
    "iw9_sm_papa90" = 0x1b,
    "iw9_pi_decho" = 0x1c,
    "iw9_pi_papa220" = 0x1d,
    "iw9_pi_golf17" = 0x1e,
    "iw9_pi_golf18" = 0x1f,
    "iw9_pi_swhiskey" = 0x20,
    "iw9_sn_alpha50" = 0x21,
    "iw9_sn_mromeo" = 0x22,
    "iw9_sn_limax" = 0x23,
    "iw9_lm_kilo21" = 0x24,
    "iw9_lm_slima" = 0x25,
    "iw9_lm_foxtrot" = 0x26,
    "iw9_lm_rkilo" = 0x27,
    "iw9_lm_ahotel" = 0x28,
    "iw9_lm_ngolf7" = 0x29,
    "iw9_sh_mbravo" = 0x2a,
    "iw9_sh_mike1014" = 0x2b,
    "iw9_sh_mviktor" = 0x2c,
    "iw9_sh_charlie725" = 0x2d,
    "iw9_sh_vecho" = 0x2e,
    "iw9_dm_mike24" = 0x2f,
    "iw9_dm_xmike2010" = 0x30,
    "iw9_dm_pgolf1" = 0x31,
    "iw9_dm_sa700" = 0x32,
    "iw9_dm_la700" = 0x33,
    "iw9_dm_sbeta" = 0x34,
    "iw9_dm_mike14" = 0x35,
    "iw9_dm_scromeo" = 0x36,
    "iw9_dm_stango25" = 0x37,
    "iw9_la_rpapa7" = 0x38,
    "iw9_la_juliet" = 0x39,
    "iw9_la_mike32" = 0x3a,
    "iw9_la_gromeo" = 0x3b,
    "iw9_la_kgolf" = 0x3c,
    "iw9_me_knife" = 0x3d,
    "iw9_lm_dblmg" = 0x3e,
    "iw9_me_sword01" = 0x3f,
    "jup_jp20_lm_evictor" = 0x40,
    "jup_jp08_lm_qbravo95lsw" = 0x41,
    "jup_jp19_dm_acharlied" = 0x42,
    "jup_ar_dg2" = 0x43,
    "jup_jp16_sh_recho870" = 0x44,
    "jup_jp09_sh_oromeo12" = 0x45,
    "iw9_swimfists" = 0x46,
    "iw9_me_diveknife" = 0x47,
    "iw9_me_climbfists" = 0x48,
    "jup_pi_raygun" = 0x49,
    "jup_pi_goldengun" = 0x4a,
    "iw9_pi_stimpistol" = 0x4b,
    "iw9_knifestab" = 0x4c,
    "iw9_lm_dblmg2" = 0x4d,
    "iw9_sn_india" = 0x4e,
    "iw9_pi_tango9" = 0x4f,
    "iw9_pi_dechoauto" = 0x50,
    "iw9_me_tonfa" = 0x51,
    "iw9_cyberemp" = 0x52,
    "iw9_me_rusherknife" = 0x53,
    "jup_me_zombie_hellhound" = 0x54,
    "jup_me_zombie_melee" = 0x55,
    "jup_me_zombie_mimic" = 0x56,
    "jup_jp07_sm_uzulup" = 0x57,
    "jup_jp01_ar_golf36" = 0x58,
    "jup_jp02_ar_bromeo805" = 0x59,
    "jup_jp19_ar_acharlie" = 0x5a,
    "jup_jp17_sn_hsierra" = 0x5b,
    "jup_jp05_ar_foxtrot2000" = 0x5c,
    "jup_jp07_pi_uzulum" = 0x5d,
    "jup_jp07_sm_uzulu" = 0x5e,
    "jup_jp02_sm_scharlie3" = 0x5f,
    "jup_jp01_dm_slima8" = 0x60,
    "jup_jp01_lm_mgolf36" = 0x61,
    "jup_cp01_sm_coscar635" = 0x62,
    "jup_jp13_dm_svictork" = 0x63,
    "jup_jp13_sn_svictor" = 0x64,
    "jup_jp04_sm_umike" = 0x65,
    "jup_jp04_sm_lwhiskey" = 0x66,
    "jup_jp06_lm_pkilop" = 0x67,
    "jup_jp12_pi_mike93" = 0x68,
    "jup_cp24_pi_glima21" = 0x69,
    "jup_jp14_pi_rsierra12" = 0x6a,
    "jup_jp02_br_bromeo2" = 0x6b,
    "jup_jp02_dm_bromeop" = 0x6c,
    "jup_jp19_br_acharlie450" = 0x6d,
    "jup_cp08_br_xmike5" = 0x6e,
    "jup_jp22_la_dromeo" = 0x6f,
    "jup_jp23_me_knife" = 0x70,
    "iw9_dm_crossbow" = 0x71,
    "jup_jp26_la_mike32" = 0x72,
    "iw9_la_mike32biolab" = 0x73,
    "jup_me_glassshiv" = 0x74,
    "jup_jp03_ar_aromeo160" = 0x75,
    "jup_jp03_sm_pmike" = 0x76,
    "jup_jp03_br_aromeo200" = 0x77,
    "jup_jp10_sn_cdelta50" = 0x78,
    "jup_jp25_ar_talpha95" = 0x79,
    "jup_jp26_la_cluster" = 0x7a,
    "jup_jp26_la_cluster32" = 0x7b,
    "jup_jp23_me_kalpha" = 0x7c,
    "jup_cp05_lm_halpha" = 0x7d,
    "jup_jp36_sn_boscar" = 0x7e,
    "jup_jp36_ar_anov94" = 0x7f,
    "jup_cp01_sh_aromeo410" = 0x80,
    "iw9_oxygenmask" = 0x81,
    "iw9_me_buzzsaw" = 0x82,
    "jup_me_axe" = 0x83,
    "jup_jp08_ar_qbravo97" = 0x84,
    "iw9_ar_helima" = 0x85,
    "iw9_sm_acharlie45" = 0x86,
    "iw9_ar_falpha" = 0x87,
    "iw9_ar_fecho" = 0x88,
    "iw9_sh_tsierra12" = 0x89,
    "iw9_me_superfists" = 0x8a,
    "iw9_ar_ralpha" = 0x8b,
    "iw9_sn_walpha" = 0x8c,
    "iw9_pi_mike2011" = 0x8d,
    "iw9_nukecore_mp" = 0x8e,
    "iw9_lm_dblmg_jup" = 0x8f,
    "iw9_drown" = 0x90,
    "support_box_mp" = 0x91,
    "specialty_null" = 0x92,
    "briefcase_bomb_mp" = 0x93,
    "iw9_sm_sdelta" = 0x94,
    "iw9_me_pickaxe" = 0x95,
    "jup_la_plasmagun" = 0x96,
    "iw9_ar_malima" = 0x97,
    "iw9_sm_acharlie9" = 0x98,
    "iw9_lm_mkilo3" = 0x99,
    "iw9_me_kamas" = 0x9a,
    "jup_cp06_ar_falpha" = 0x9b,
    "jup_cp15_lm_mkilo3" = 0x9c,
    "jup_jp31_dm_compound" = 0x9d,
    "jup_jp23_me_swhiskey" = 0x9e,
    "jup_jp32_pi_mpapa9" = 0x9f,
    "jup_jp34_ar_balpha27" = 0xa0,
    "jup_jp25_sm_talpham" = 0xa1,
    "jup_jp35_sn_moscar" = 0xa2,
    "jup_jp23_me_pdango" = 0xa3,
    "jup_cp01_sm_pcharlie9" = 0xa4,
    "jup_jp38_sh_spapa12" = 0xa5,
    "jup_jp37_dm_kappa98" = 0xa6,
    "jup_jp23_me_shotel" = 0xa7,
    "jup_jp41_sm_kpappa50" = 0xa8,
    "jup_jp23_me_spear" = 0xa9,
    "jup_jp44_ar_stango44" = 0xaa,
    "jup_jp23_me_pdango_arcade" = 0xab,
    "jup_jp28_lm_rpapa20" = 0xac,
    "jup_jp40_br_hcharlie36" = 0xad,
    "jup_jp23_me_shotel_arcade" = 0xae,
    "jup_amp_knifestab_mp" = 0xaf,
}

