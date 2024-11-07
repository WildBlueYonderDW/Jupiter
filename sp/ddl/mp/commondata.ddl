// file ddl\mp\commondata.ddl

// bitSize: 0x8c90, members: 2
struct root {
    // offset: 0x8c88, bitSize: 0x8(0x1B)
    ValidationData validationData;
    // offset: 0x0, bitSize: 0x8c88(0x1191B)
    CommonData commonData;
}

// bitSize: 0x8, members: 2
struct ValidationData {
    // offset: 0x0, bitSize: 0x5
    bit validationHint[5];
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x8c88, members: 59
struct CommonData {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 extraCustomClassesEntitlement;
    // offset: 0x20, bitSize: 0x100(0x20B)
    char brSubGameType[32];
    // offset: 0x120, bitSize: 0x6c0(0xd8B)
    RoundStats round;
    // offset: 0x7e0, bitSize: 0x8(0x1B)
    byte sp_upsell_view_time_0;
    // offset: 0x7e8, bitSize: 0x8(0x1B)
    byte sp_upsell_view_time_1;
    // offset: 0x7f0, bitSize: 0x10(0x2B)
    short common_last_vote_base_counter;
    // offset: 0x800, bitSize: 0x8(0x1B)
    byte sp_upsell_recent_updated_record;
    // offset: 0x808, bitSize: 0x20(0x4B)
    int32 eliteClanLevel;
    // offset: 0x828, bitSize: 0x8(0x1B)
    byte previousProgressUpsellPopupRank;
    // offset: 0x830, bitSize: 0x28(0x5B)
    char clanTag[5];
    // offset: 0x858, bitSize: 0x190(0x32B)
    PetWatchData petWatchData;
    // offset: 0x9e8, bitSize: 0x8(0x1B)
    byte isbad_preview;
    // offset: 0x9f0, bitSize: 0x3078(0x60fB)
    SharedProgression sharedProgression;
    // offset: 0x3a68, bitSize: 0x20(0x4B)
    int32 firstPlayedSPTime;
    // offset: 0x3a88, bitSize: 0x10(0x2B)
    short common_scenario_flags;
    // offset: 0x3a98, bitSize: 0x20(0x4B)
    uint32 CODAccountRestrictedTimestamp;
    // offset: 0x3ab8, bitSize: 0x20(0x4B)
    char loggingCohort[4];
    // offset: 0x3ad8, bitSize: 0x80(0x10B)
    int32 quartermasterEventIDs[4];
    // offset: 0x3b58, bitSize: 0x20(0x4B)
    int32 common_entitlement_xp;
    // offset: 0x3b78, bitSize: 0x8(0x1B)
    byte useEliteClanTag;
    // offset: 0x3b80, bitSize: 0x8(0x1B)
    byte clanTagType;
    // offset: 0x3b88, bitSize: 0x120(0x24B)
    uint32 favoriteColors[9];
    // offset: 0x3ca8, bitSize: 0x8(0x1B)
    byte mp_announcer_type;
    // offset: 0x3cb0, bitSize: 0x20(0x4B)
    int32 sp_upsell_open_timestamp_0;
    // offset: 0x3cd0, bitSize: 0x20(0x4B)
    int32 sp_upsell_open_timestamp_1;
    // offset: 0x3cf0, bitSize: 0xc0(0x18B)
    short common_read_news_articles[12];
    // offset: 0x3db0, bitSize: 0x20(0x4B)
    int32 numConsumables;
    // offset: 0x3dd0, bitSize: 0x20(0x4B)
    int32 lastPlayedTime;
    // offset: 0x3df0, bitSize: 0x20(0x4B)
    int32 common_clan_wars_xp;
    // offset: 0x3e10, bitSize: 0x8(0x1B)
    byte common_mounted_dlc_bits;
    // offset: 0x3e18, bitSize: 0x38(0x7B)
    MPProgression mpProgression;
    // offset: 0x3e50, bitSize: 0x1d40(0x3a8B)
    FilteredPlaylist filteredPlaylists[26];
    // offset: 0x5b90, bitSize: 0x8(0x1B)
    byte season_pass_upsell_count;
    // offset: 0x5b98, bitSize: 0x400(0x80B)
    int32 consumablesUsed[32];
    // offset: 0x5f98, bitSize: 0x1800(0x300B)
    int32 awards[192];
    // offset: 0x7798, bitSize: 0x80(0x10B)
    byte lastMatchGUID[16];
    // offset: 0x7818, bitSize: 0x48(0x9B)
    commonCustomization commonCustomization;
    // offset: 0x7860, bitSize: 0x20(0x4B)
    int32 extraCustomClassesPrestige;
    // offset: 0x7880, bitSize: 0x190(0x32B)
    PetWatchData petWatchDataTurboAlt;
    // offset: 0x7a10, bitSize: 0x28(0x5B)
    char eliteClanTag[5];
    // offset: 0x7a38, bitSize: 0x98(0x13B)
    PastTitleData pastTitleData;
    // offset: 0x7ad0, bitSize: 0x190(0x32B)
    PetWatchData petWatchDataBlack;
    // offset: 0x7c60, bitSize: 0x190(0x32B)
    PetWatchData petWatchDataTurbo;
    // offset: 0x7df0, bitSize: 0x8(0x1B)
    byte sp_upsell_action_0;
    // offset: 0x7df8, bitSize: 0x8(0x1B)
    byte sp_upsell_action_1;
    // offset: 0x7e00, bitSize: 0x800(0x100B)
    int32 lastLootDrops[64];
    // offset: 0x8600, bitSize: 0x200(0x40B)
    PetWatchGoData petWatchGoData;
    // offset: 0x8800, bitSize: 0x400(0x80B)
    byte reserved[128];
    // offset: 0x8c00, bitSize: 0x20(0x4B)
    int32 lastLootDropIndex;
    // offset: 0x8c20, bitSize: 0x20(0x4B)
    uint32 favoriteColorsCount;
    // offset: 0x8c40, bitSize: 0x1
    bit shouldCheckCohortSampling;
    // offset: 0x8c41, bitSize: 0x1
    bit quartermasterSale;
    // offset: 0x8c42, bitSize: 0x1
    bit newCrateRewards;
    // offset: 0x8c43, bitSize: 0x1
    bit shouldLogCohortData;
    // offset: 0x8c44, bitSize: 0x1
    bit gender;
    // offset: 0x8c45, bitSize: 0x1
    bit isPrivatePartyOpen;
    // offset: 0x8c46, bitSize: 0x1
    bit CODAccountSignupRequest;
    // offset: 0x8c47, bitSize: 0x40(0x8B)
    bit spCompletion[64];
    // offset: 0x8c87, bitSize: 0x1
    pad __pad[1];
}

// bitSize: 0x98, members: 10
struct PastTitleData {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 nextreadGhosts;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 nextreadBO3;
    // offset: 0x40, bitSize: 0x10(0x2B)
    short prestigeAW;
    // offset: 0x50, bitSize: 0x10(0x2B)
    short prestigeGhosts;
    // offset: 0x60, bitSize: 0x10(0x2B)
    short prestigeBO3;
    // offset: 0x70, bitSize: 0x20(0x4B)
    int32 nextreadAW;
    // offset: 0x90, bitSize: 0x1
    bit playedAW;
    // offset: 0x91, bitSize: 0x1
    bit playedBO3;
    // offset: 0x92, bitSize: 0x1
    bit playedGhosts;
    // offset: 0x93, bitSize: 0x5
    pad __pad[5];
}

// bitSize: 0x190, members: 24
struct PetWatchData {
    // offset: 0x0, bitSize: 0x10(0x2B)
    short phase;
    // offset: 0x10, bitSize: 0x10(0x2B)
    short killsCharge;
    // offset: 0x20, bitSize: 0x10(0x2B)
    int16 dirtyDmg;
    // offset: 0x30, bitSize: 0x10(0x2B)
    short reproductionStreak;
    // offset: 0x40, bitSize: 0x10(0x2B)
    int16 hungryDmg;
    // offset: 0x50, bitSize: 0x10(0x2B)
    short charged;
    // offset: 0x60, bitSize: 0x10(0x2B)
    short killstreakCharge;
    // offset: 0x70, bitSize: 0x10(0x2B)
    short winGamesTop3;
    // offset: 0x80, bitSize: 0x10(0x2B)
    short winGamesCharge;
    // offset: 0x90, bitSize: 0x10(0x2B)
    short bonusTime;
    // offset: 0xb0, bitSize: 0x10(0x2B)
    int16 boredDmg;
    // offset: 0xc0, bitSize: 0x10(0x2B)
    short nukeCharge;
    // offset: 0xd0, bitSize: 0x10(0x2B)
    short objectiveScoreCharge;
    // offset: 0xe0, bitSize: 0x10(0x2B)
    short apachePoints;
    // offset: 0xf0, bitSize: 0x10(0x2B)
    short damage;
    // offset: 0x100, bitSize: 0x10(0x2B)
    short topKillstreakCharge;
    // offset: 0x110, bitSize: 0x10(0x2B)
    short orcaPoints;
    // offset: 0x120, bitSize: 0x10(0x2B)
    short growthTime;
    // offset: 0x130, bitSize: 0x10(0x2B)
    short plantsCharge;
    // offset: 0x140, bitSize: 0x10(0x2B)
    int16 unrulyDmg;
    // offset: 0x150, bitSize: 0x10(0x2B)
    short executionsCharge;
    // offset: 0x160, bitSize: 0x10(0x2B)
    short dragonPoints;
    // offset: 0x170, bitSize: 0x20(0x4B)
    int32 lastUpdateTime;
    // offset: 0xa0, bitSize: 0x10(0x2B)
    short frontEndTeenPick;
}

// bitSize: 0x200, members: 1
struct PetWatchGoData {
    // offset: 0x0, bitSize: 0x200(0x40B)
    short growth[32];
}

// bitSize: 0x3078, members: 3
struct SharedProgression {
    // offset: 0x0, bitSize: 0x3070(0x60eB)
    WeaponLevel weaponLevel[155];
    // offset: 0x3070, bitSize: 0x5
    bit classicWeapons[5];
    // offset: 0x3075, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x50, members: 3
struct WeaponLevel {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 cpXP;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 mpXP;
    // offset: 0x40, bitSize: 0x10(0x2B)
    short prestige;
}

// bitSize: 0x38, members: 3
struct MPProgression {
    // offset: 0x0, bitSize: 0x30(0x6B)
    PlayerLevel playerLevel;
    // offset: 0x30, bitSize: 0x1
    bit thirdPerson;
    // offset: 0x31, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x30, members: 2
struct PlayerLevel {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 xp;
    // offset: 0x20, bitSize: 0x10(0x2B)
    short prestige;
}

// bitSize: 0x48, members: 3
struct commonCustomization {
    // offset: 0x18, bitSize: 0x18(0x3B)
    uint19 parachute;
    // offset: 0x30, bitSize: 0x18(0x3B)
    uint19 contrail;
    // offset: 0x0, bitSize: 0x18(0x3B)
    uint19 musicbox;
}

// bitSize: 0x6c0, members: 52
struct RoundStats {
    // offset: 0x0, bitSize: 0xa0(0x14B)
    char map[20];
    // offset: 0xa0, bitSize: 0x20(0x4B)
    int32 bonusXp;
    // offset: 0xc0, bitSize: 0x10(0x2B)
    short downs;
    // offset: 0xd0, bitSize: 0x10(0x2B)
    short kills;
    // offset: 0xe0, bitSize: 0x20(0x4B)
    int32 score;
    // offset: 0x100, bitSize: 0x10(0x2B)
    short stabs;
    // offset: 0x110, bitSize: 0x8(0x1B)
    byte awardCount;
    // offset: 0x118, bitSize: 0x60(0xcB)
    int32 weaponXpEarned[3];
    // offset: 0x178, bitSize: 0x10(0x2B)
    short fieldgoals;
    // offset: 0x188, bitSize: 0x20(0x4B)
    int32 timePlayed;
    // offset: 0x1a8, bitSize: 0x20(0x4B)
    int32 gamemodeScore;
    // offset: 0x1c8, bitSize: 0x20(0x4B)
    int32 matchXp;
    // offset: 0x1e8, bitSize: 0x20(0x4B)
    int32 medalXp;
    // offset: 0x208, bitSize: 0x10(0x2B)
    short killsAsSurvivor;
    // offset: 0x218, bitSize: 0x10(0x2B)
    short rescues;
    // offset: 0x228, bitSize: 0x10(0x2B)
    short returns;
    // offset: 0x238, bitSize: 0x10(0x2B)
    short squadMemberIndex;
    // offset: 0x248, bitSize: 0x20(0x4B)
    int32 matchBonusXp;
    // offset: 0x268, bitSize: 0x10(0x2B)
    short setbacks;
    // offset: 0x278, bitSize: 0x8(0x1B)
    ScoreboardType scoreboardType;
    // offset: 0x280, bitSize: 0x10(0x2B)
    short defends;
    // offset: 0x290, bitSize: 0x10(0x2B)
    short defuses;
    // offset: 0x2a0, bitSize: 0x20(0x4B)
    int32 scoreXp;
    // offset: 0x2c0, bitSize: 0x10(0x2B)
    short killChains;
    // offset: 0x2d0, bitSize: 0x8(0x1B)
    byte clientMatchIndex;
    // offset: 0x2d8, bitSize: 0x8(0x1B)
    BaseGameMode gameMode;
    // offset: 0x2e0, bitSize: 0x10(0x2B)
    short objTime;
    // offset: 0x2f0, bitSize: 0x10(0x2B)
    short segmentCaptures;
    // offset: 0x300, bitSize: 0x10(0x2B)
    short touchdowns;
    // offset: 0x310, bitSize: 0x10(0x2B)
    short killsAsInfected;
    // offset: 0x320, bitSize: 0x10(0x2B)
    short killStreak;
    // offset: 0x330, bitSize: 0x190(0x32B)
    AwardInfo awards[10];
    // offset: 0x4c0, bitSize: 0x10(0x2B)
    short damage;
    // offset: 0x4d0, bitSize: 0x10(0x2B)
    short deaths;
    // offset: 0x4e0, bitSize: 0x10(0x2B)
    short denied;
    // offset: 0x4f0, bitSize: 0xc0(0x18B)
    AARData aarData;
    // offset: 0x5b0, bitSize: 0x20(0x4B)
    int32 totalXp;
    // offset: 0x5d0, bitSize: 0x20(0x4B)
    int32 fieldOrderXp;
    // offset: 0x5f0, bitSize: 0x20(0x4B)
    int32 miscXp;
    // offset: 0x610, bitSize: 0x10(0x2B)
    short plants;
    // offset: 0x620, bitSize: 0x10(0x2B)
    short destructions;
    // offset: 0x630, bitSize: 0x8(0x1B)
    byte endReasonTextIndex;
    // offset: 0x638, bitSize: 0x10(0x2B)
    short confirmed;
    // offset: 0x648, bitSize: 0x10(0x2B)
    short assists;
    // offset: 0x658, bitSize: 0x20(0x4B)
    int32 challengeXp;
    // offset: 0x678, bitSize: 0x10(0x2B)
    short contracts;
    // offset: 0x688, bitSize: 0x10(0x2B)
    short challengeNumCompleted;
    // offset: 0x698, bitSize: 0x10(0x2B)
    short captures;
    // offset: 0x6a8, bitSize: 0x1
    bit win;
    // offset: 0x6a9, bitSize: 0x1
    bit loss;
    // offset: 0x6aa, bitSize: 0x14
    Challenge challengesCompleted[20];
    // offset: 0x6be, bitSize: 0x2
    pad __pad[2];
}

// bitSize: 0x28, members: 2
struct AwardInfo {
    // offset: 0x0, bitSize: 0x8(0x1B)
    Awards award;
    // offset: 0x8, bitSize: 0x20(0x4B)
    int32 value;
}

// bitSize: 0xc0, members: 6
struct AARData {
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 logistics_xp;
    // offset: 0x40, bitSize: 0x20(0x4B)
    int32 combat_xp;
    // offset: 0x60, bitSize: 0x20(0x4B)
    int32 strategy_xp;
    // offset: 0x80, bitSize: 0x20(0x4B)
    int32 recon_xp;
    // offset: 0xa0, bitSize: 0x20(0x4B)
    int32 support_xp;
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 use_featured_operator_skin_xp;
}

// bitSize: 0x120, members: 5
struct FilteredPlaylist {
    // offset: 0x20, bitSize: 0x40(0x8B)
    uint64 localFilter;
    // offset: 0x60, bitSize: 0x40(0x8B)
    uint64 high2Filter;
    // offset: 0xa0, bitSize: 0x40(0x8B)
    uint64 high3Filter;
    // offset: 0xe0, bitSize: 0x40(0x8B)
    uint64 filter;
    // offset: 0x0, bitSize: 0x20(0x4B)
    uint32 crc32;
}

// members: 65
enum BaseGameMode {
    "aon" = 0x0,
    "dm" = 0x1,
    "war" = 0x2,
    "sd" = 0x3,
    "sab" = 0x4,
    "dom" = 0x5,
    "koth" = 0x6,
    "ctf" = 0x7,
    "dd" = 0x8,
    "conf" = 0x9,
    "control" = 0xa,
    "tdef" = 0xb,
    "siege" = 0xc,
    "grnd" = 0xd,
    "tjugg" = 0xe,
    "jugg" = 0xf,
    "gun" = 0x10,
    "infect" = 0x11,
    "oic" = 0x12,
    "mugger" = 0x13,
    "blitz" = 0x14,
    "sr" = 0x15,
    "grind" = 0x16,
    "sotf" = 0x17,
    "sotf_ffa" = 0x18,
    "assault" = 0x19,
    "aliens" = 0x1a,
    "cp_survival" = 0x1b,
    "cp_wave_sv" = 0x1c,
    "cp_specops" = 0x1d,
    "zombie" = 0x1e,
    "escape" = 0x1f,
    "cp_pvpve" = 0x20,
    "cp_strike" = 0x21,
    "cp_trials" = 0x22,
    "ball" = 0x23,
    "front" = 0x24,
    "arena" = 0x25,
    "cmd" = 0x26,
    "br" = 0x27,
    "dmz" = 0x28,
    "cyber" = 0x29,
    "rush" = 0x2a,
    "esc" = 0x2b,
    "vip" = 0x2c,
    "btm" = 0x2d,
    "rugby" = 0x2e,
    "arm" = 0x2f,
    "mtmc" = 0x30,
    "snatch" = 0x31,
    "hq" = 0x32,
    "defcon" = 0x33,
    "pill" = 0x34,
    "brm" = 0x35,
    "hvt" = 0x36,
    "trial" = 0x37,
    "brtdm" = 0x38,
    "br_risk" = 0x39,
    "incursion" = 0x3a,
    "missions" = 0x3b,
    "cqc" = 0x3c,
    "plunder" = 0x3d,
    "ko" = 0x3e,
    "risk" = 0x3f,
    "hstg" = 0x40,
    "fr" = 0x41,
    "gwbomb" = 0x42,
    "rescue" = 0x43,
    "landgrab" = 0x44,
    "elim" = 0x45,
    "gwai" = 0x46,
    "bounty" = 0x47,
    "zm_rb" = 0x48,
    "gwtdm" = 0x49,
    "ob" = 0x4a,
    "dungeons" = 0x4b,
    "resurgence" = 0x4c,
    "exgm" = 0x4d,
    "kingslayer" = 0x4e,
    "mini" = 0x4f,
    "mini_mgl" = 0x50,
    "resurgence_mgl" = 0x51,
    "rsurge" = 0x52,
    "truckwar" = 0x53,
    "vanilla" = 0x54,
    "zxp" = 0x55,
    "benchmark" = 0x56,
    "ballmode" = 0x57,
    "brtdm_mgl" = 0x58,
    "conflict" = 0x59,
    "havoc" = 0x5a,
    "bigctf" = 0x5b,
    "xfire" = 0x5c,
    "robj" = 0x5d,
    "zm_turned" = 0x5e,
    "wm" = 0x5f,
    "escort" = 0x60,
    "training_course" = 0x61,
    "br_auto" = 0x62,
    "gold_gun" = 0x63,
    "team_gun" = 0x64,
}

// members: c0
enum Awards {
    "none" = 0x0,
    "firstblood" = 0x1,
    "headshot" = 0x2,
    "avenger" = 0x3,
    "assistedsuicide" = 0x4,
    "buzzkill" = 0x5,
    "comeback" = 0x6,
    "knifethrow" = 0x7,
    "longshot" = 0x8,
    "pointblank" = 0x9,
    "revenge" = 0xa,
    "double" = 0xb,
    "triple" = 0xc,
    "four" = 0xd,
    "five" = 0xe,
    "six" = 0xf,
    "seven" = 0x10,
    "eight" = 0x11,
    "multi" = 0x12,
    "defender" = 0x13,
    "posthumous" = 0x14,
    "first_place_kill" = 0x15,
    "one_shot_kill" = 0x16,
    "kill_juggernaut" = 0x17,
    "mo_money" = 0x18,
    "gun_butt" = 0x19,
    "grenade_double" = 0x1a,
    "fist_kill" = 0x1b,
    "mantle_kill" = 0x1c,
    "throwback_kill" = 0x1d,
    "slide_kill" = 0x1e,
    "stunned_kill" = 0x1f,
    "knife_bounce" = 0x20,
    "backstab" = 0x21,
    "backfire" = 0x22,
    "quad_feed" = 0x23,
    "save_teammate" = 0x24,
    "one_shot_two_kills" = 0x25,
    "explosive_stick" = 0x26,
    "launcher_direct_hit" = 0x27,
    "throwingknife_kill" = 0x28,
    "hack_package_kill" = 0x29,
    "kill_wallrunner" = 0x2a,
    "kill_jumper" = 0x2b,
    "wallrun_kill" = 0x2c,
    "air_kill" = 0x2d,
    "low_health_kill" = 0x2e,
    "air_to_air_kill" = 0x2f,
    "item_impact" = 0x30,
    "streak_5" = 0x31,
    "streak_10" = 0x32,
    "streak_15" = 0x33,
    "streak_20" = 0x34,
    "streak_25" = 0x35,
    "streak_30" = 0x36,
    "streak_max" = 0x37,
    "ss_kill_manual_turret" = 0x38,
    "ss_kill_toma_strike" = 0x39,
    "ss_kill_multi_airstrike" = 0x3a,
    "ss_kill_cruise_predator" = 0x3b,
    "ss_kill_pac_sentry" = 0x3c,
    "ss_kill_chopper_gunner" = 0x3d,
    "ss_kill_gunship" = 0x3e,
    "ss_kill_sentry_gun" = 0x3f,
    "ss_kill_precision_airstrike" = 0x40,
    "ss_kill_jackal" = 0x41,
    "ss_kill_trinity" = 0x42,
    "ss_kill_fuel_airstrike" = 0x43,
    "ss_kill_chopper_support" = 0x44,
    "ss_kill_white_phosphorus" = 0x45,
    "ss_kill_hover_jet" = 0x46,
    "ss_kill_death_switch" = 0x47,
    "ss_kill_bradley" = 0x48,
    "ss_kill_juggernaut" = 0x49,
    "ss_kill_assault_drone" = 0x4a,
    "ss_kill_auto_drone" = 0x4b,
    "ss_kill_switchblade_drone" = 0x4c,
    "ss_kill_loitering_munition" = 0x4d,
    "ss_kill_juggernaut_recon" = 0x4e,
    "ss_kill_drone_swarm" = 0x4f,
    "ss_use_airdrop" = 0x50,
    "ss_use_enemy_airdrop" = 0x51,
    "kill_ss_radar_drone_escort" = 0x52,
    "kill_ss_radar_drone_recon" = 0x53,
    "kill_ss_radar_drone_overwatch" = 0x54,
    "kill_ss_scrambler_drone_escort" = 0x55,
    "kill_ss_scrambler_drone_guard" = 0x56,
    "kill_ss_support_box" = 0x57,
    "kill_ss_manual_turret" = 0x58,
    "kill_ss_toma_strike" = 0x59,
    "kill_ss_multi_airstrike" = 0x5a,
    "kill_ss_cruise_predator" = 0x5b,
    "kill_ss_pac_sentry" = 0x5c,
    "kill_ss_chopper_gunner" = 0x5d,
    "kill_ss_gunship" = 0x5e,
    "kill_ss_sentry_gun" = 0x5f,
    "kill_ss_jackal" = 0x60,
    "kill_ss_airdrop" = 0x61,
    "kill_ss_uav" = 0x62,
    "kill_ss_counter_uav" = 0x63,
    "kill_ss_directional_uav" = 0x64,
    "kill_ss_drone_hive" = 0x65,
    "kill_ss_fuel_airstrike" = 0x66,
    "kill_ss_chopper_support" = 0x67,
    "kill_ss_hover_jet" = 0x68,
    "kill_ss_emp_drone" = 0x69,
    "kill_ss_bradley" = 0x6a,
    "kill_ss_assault_drone" = 0x6b,
    "kill_ss_auto_drone" = 0x6c,
    "kill_ss_airdrop_escort" = 0x6d,
    "kill_ss_switchblade_drone" = 0x6e,
    "kill_ss_lrad" = 0x6f,
    "kill_ss_loitering_munition" = 0x70,
    "kill_ss_drone_swarm" = 0x71,
    "super_kill_steeldragon" = 0x72,
    "super_kill_amplify" = 0x73,
    "super_kill_overdrive" = 0x74,
    "super_kill_claw" = 0x75,
    "super_kill_armorup" = 0x76,
    "super_kill_bull_charge" = 0x77,
    "super_kill_armmgs" = 0x78,
    "super_kill_reaper" = 0x79,
    "super_kill_rewind" = 0x7a,
    "super_kill_atomizer" = 0x7b,
    "super_kill_phaseshift" = 0x7c,
    "super_kill_teleport" = 0x7d,
    "super_kill_blackholegun" = 0x7e,
    "super_kill_supertrophy" = 0x7f,
    "super_kill_microturret" = 0x80,
    "super_kill_penetrationrailgun" = 0x81,
    "super_kill_visionpulse" = 0x82,
    "super_kill_invisible" = 0x83,
    "super_shutdown_steeldragon" = 0x84,
    "super_shutdown_amplify" = 0x85,
    "super_shutdown_overdrive" = 0x86,
    "super_shutdown_claw" = 0x87,
    "super_shutdown_armorup" = 0x88,
    "super_shutdown_bull_charge" = 0x89,
    "super_shutdown_armmgs" = 0x8a,
    "super_shutdown_reaper" = 0x8b,
    "super_shutdown_rewind" = 0x8c,
    "super_shutdown_atomizer" = 0x8d,
    "super_shutdown_phaseshift" = 0x8e,
    "super_shutdown_teleport" = 0x8f,
    "super_shutdown_blackholegun" = 0x90,
    "super_shutdown_supertrophy" = 0x91,
    "super_shutdown_microturret" = 0x92,
    "super_shutdown_penetrationrailgun" = 0x93,
    "super_shutdown_visionpulse" = 0x94,
    "super_shutdown_invisible" = 0x95,
    "mode_ctf_cap" = 0x96,
    "mode_ctf_kill_carrier" = 0x97,
    "mode_ctf_kill_with_flag" = 0x98,
    "mode_ctf_close_return" = 0x99,
    "mode_ctf_nope" = 0x9a,
    "mode_x_last_alive" = 0x9b,
    "mode_x_eliminate" = 0x9c,
    "mode_sd_last_defuse" = 0x9d,
    "mode_sd_defuse" = 0x9e,
    "mode_sd_detonate" = 0x9f,
    "mode_sd_plant_save" = 0xa0,
    "mode_sd_defuse_save" = 0xa1,
    "mode_x_clear" = 0xa2,
    "mode_hp_secure" = 0xa3,
    "mode_hp_secure_reduced" = 0xa4,
    "mode_hp_assault" = 0xa5,
    "mode_hp_quick_cap" = 0xa6,
    "mode_kc_own_tags" = 0xa7,
    "mode_kc_3_tags" = 0xa8,
    "mode_dom_secure_b" = 0xa9,
    "mode_dom_secure_neutral" = 0xaa,
    "mode_dom_assault" = 0xab,
    "mode_dom_secure_assist" = 0xac,
    "mode_dom_secure" = 0xad,
    "mode_dom_neutralized" = 0xae,
    "mode_dom_neutralized_cap" = 0xaf,
    "mode_arm_secure_mid" = 0xb0,
    "mode_arm_secure_outer_mid" = 0xb1,
    "mode_arm_secure_outer" = 0xb2,
    "mode_cyber_kill_with_emp" = 0xb3,
    "mode_cyber_kill_carrier" = 0xb4,
    "mode_x_assault" = 0xb5,
    "mode_x_defend" = 0xb6,
    "mode_x_wipeout" = 0xb7,
    "mode_siege_secure" = 0xb8,
    "mode_gun_quick_kill" = 0xb9,
    "mode_gun_melee_1st_place" = 0xba,
    "mode_gun_melee" = 0xbb,
    "match_complete" = 0xbc,
    "match_complete_win" = 0xbd,
    "rock_paper_scissors_win" = 0xbe,
    "simultaneous_kill" = 0xbf,
}

// members: 1
enum Challenge {
    "ch_none" = 0x0,
}

// members: 5
enum ScoreboardType {
    "none" = 0x0,
    "neutral" = 0x1,
    "allies" = 0x2,
    "axis" = 0x3,
    "multiteam" = 0x4,
}

