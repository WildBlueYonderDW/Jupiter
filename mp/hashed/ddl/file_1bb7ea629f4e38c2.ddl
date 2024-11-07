// file ddl_1bb7ea629f4e38c2

// bitSize: 0x1d78, members: 38
struct root {
    // offset: 0x0, bitSize: 0x170(0x2eB)
    char host[46];
    // offset: 0x170, bitSize: 0x20(0x4B)
    int32 party_maxplayers;
    // offset: 0x190, bitSize: 0x8(0x1B)
    byte firstOvertimeRoundIndex;
    // offset: 0x198, bitSize: 0x20(0x4B)
    uint32 dataCenterId;
    // offset: 0x1b8, bitSize: 0x20(0x4B)
    uint32 breadcrumb_count;
    // offset: 0x1d8, bitSize: 0x300(0x60B)
    uint32 utcRoundEndTimeSeconds[24];
    // offset: 0x4d8, bitSize: 0x40(0x8B)
    uint64 tournamentId;
    // offset: 0x518, bitSize: 0x8(0x1B)
    byte globalWeaponXpModifier;
    // offset: 0x520, bitSize: 0x10(0x2B)
    uint16 tournamentMatch;
    // offset: 0x530, bitSize: 0x10(0x2B)
    uint16 tournamentRound;
    // offset: 0x540, bitSize: 0x20(0x4B)
    int32 serverScriptTimeExceedTotal;
    // offset: 0x560, bitSize: 0x20(0x4B)
    int32 alliesScore;
    // offset: 0x580, bitSize: 0x20(0x4B)
    int32 axisScore;
    // offset: 0x5a0, bitSize: 0x300(0x60B)
    uint32 utcRoundStartTimeSeconds[24];
    // offset: 0x8a0, bitSize: 0x10(0x2B)
    short killstreakCount;
    // offset: 0x8b0, bitSize: 0x20(0x4B)
    int32 playlistID;
    // offset: 0x8d0, bitSize: 0x20(0x4B)
    int32 isDedicated;
    // offset: 0x8f0, bitSize: 0x20(0x4B)
    int32 cmdQueuedHistogramRange;
    // offset: 0x910, bitSize: 0x20(0x4B)
    int32 cmdBurstHistogramRange;
    // offset: 0x930, bitSize: 0xd40(0x1a8B)
    CommonMatchData commonMatchData;
    // offset: 0x1670, bitSize: 0x20(0x4B)
    int32 serverScriptTimeTotal;
    // offset: 0x1690, bitSize: 0x20(0x4B)
    int32 serverScriptTimeMax;
    // offset: 0x16b0, bitSize: 0x10(0x2B)
    short killstreakAvailableCount;
    // offset: 0x16c0, bitSize: 0x20(0x4B)
    int32 playlistVersion;
    // offset: 0x16e0, bitSize: 0x20(0x4B)
    int32 scoreProgressLimit;
    // offset: 0x1700, bitSize: 0x8(0x1B)
    Team victor;
    // offset: 0x1708, bitSize: 0x300(0x60B)
    int32 alliesRoundScore[24];
    // offset: 0x1a08, bitSize: 0x300(0x60B)
    int32 axisRoundScore[24];
    // offset: 0x1d08, bitSize: 0x20(0x4B)
    int32 serverScriptCalcTimeTotal;
    // offset: 0x1d28, bitSize: 0x8(0x1B)
    byte globalPlayerXpModifier;
    // offset: 0x1d30, bitSize: 0x10(0x2B)
    short lifeCount;
    // offset: 0x1d40, bitSize: 0x10(0x2B)
    short gameEventCount;
    // offset: 0x1d50, bitSize: 0x20(0x4B)
    int32 cmdReceivedHistogramRange;
    // offset: 0x1d70, bitSize: 0x1
    bit cmdBufferingEnabled;
    // offset: 0x1d71, bitSize: 0x1
    bit hasBots;
    // offset: 0x1d72, bitSize: 0x1
    bit hostMigrationOccurred;
    // offset: 0x1d73, bitSize: 0x1
    bit codESportsRules;
    // offset: 0x1d74, bitSize: 0x4
    pad __pad[4];
}

// bitSize: 0xd40, members: 36
struct CommonMatchData {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x100(0x20B)
    char mapB[32];
    // offset: 0x200, bitSize: 0x8(0x1B)
    byte player_count;
    // offset: 0x208, bitSize: 0x208(0x41B)
    char dmlRegion[65];
    // offset: 0x410, bitSize: 0x10(0x2B)
    uint16 weapon_map_watermark;
    // offset: 0x420, bitSize: 0x40(0x8B)
    uint64 match_id;
    // offset: 0x460, bitSize: 0x18(0x3B)
    char dmlCountryCode[3];
    // offset: 0x478, bitSize: 0x20(0x4B)
    uint32 dataCenterId;
    // offset: 0x498, bitSize: 0x88(0x11B)
    char dw_lobby_id[17];
    // offset: 0x520, bitSize: 0x8(0x1B)
    byte player_count_end;
    // offset: 0x528, bitSize: 0x20(0x4B)
    int32 serverTimeCount;
    // offset: 0x548, bitSize: 0x20(0x4B)
    int32 serverTimeTotal;
    // offset: 0x568, bitSize: 0x48(0x9B)
    char dmlTimezone[9];
    // offset: 0x5b0, bitSize: 0x20(0x4B)
    uint32 patchManifestVersion;
    // offset: 0x5d0, bitSize: 0x20(0x4B)
    int32 serverTimeTotalExceed;
    // offset: 0x5f0, bitSize: 0x20(0x4B)
    float dmlLatitude;
    // offset: 0x610, bitSize: 0x20(0x4B)
    uint32 protocolVersion;
    // offset: 0x630, bitSize: 0x408(0x81B)
    char dmlCity[129];
    // offset: 0xa38, bitSize: 0x80(0x10B)
    char build_version[16];
    // offset: 0xab8, bitSize: 0x40(0x8B)
    uint64 boot_guid;
    // offset: 0xaf8, bitSize: 0x100(0x20B)
    char gametype[32];
    // offset: 0xbf8, bitSize: 0x20(0x4B)
    int32 matchMakingSettingsVersion;
    // offset: 0xc18, bitSize: 0x20(0x4B)
    uint32 utc_end_time_s;
    // offset: 0xc38, bitSize: 0x20(0x4B)
    uint32 utc_start_time_s;
    // offset: 0xc58, bitSize: 0x8(0x1B)
    byte player_count_start;
    // offset: 0xc60, bitSize: 0x20(0x4B)
    uint32 dmlASN;
    // offset: 0xc80, bitSize: 0x20(0x4B)
    uint32 titleID;
    // offset: 0xca0, bitSize: 0x20(0x4B)
    int32 build_number;
    // offset: 0xcc0, bitSize: 0x10(0x2B)
    uint16 srcDDLVersion;
    // offset: 0xcd0, bitSize: 0x20(0x4B)
    int32 serverTimeExceedCount;
    // offset: 0xcf0, bitSize: 0x8(0x1B)
    byte player_count_left;
    // offset: 0xcf8, bitSize: 0x20(0x4B)
    int32 serverTimeMax;
    // offset: 0xd18, bitSize: 0x20(0x4B)
    float dmlLongitude;
    // offset: 0xd38, bitSize: 0x1
    bit is_ranked_match;
    // offset: 0xd39, bitSize: 0x1
    bit is_private_match;
    // offset: 0xd3a, bitSize: 0x6
    pad __pad[6];
}

// members: 36
enum Team {
    "none" = 0x0,
    "free" = 0x1,
    "axis" = 0x2,
    "allies" = 0x3,
    "team_three" = 0x4,
    "team_four" = 0x5,
    "team_five" = 0x6,
    "team_six" = 0x7,
    "team_seven" = 0x8,
    "team_eight" = 0x9,
    "team_nine" = 0xa,
    "team_ten" = 0xb,
    "team_eleven" = 0xc,
    "team_twelve" = 0xd,
    "team_thirteen" = 0xe,
    "team_fourteen" = 0xf,
    "team_fifteen" = 0x10,
    "team_sixteen" = 0x11,
    "team_seventeen" = 0x12,
    "team_eighteen" = 0x13,
    "team_nineteen" = 0x14,
    "team_twenty" = 0x15,
    "team_twenty_one" = 0x16,
    "team_twenty_two" = 0x17,
    "team_twenty_three" = 0x18,
    "team_twenty_four" = 0x19,
    "team_twenty_five" = 0x1a,
    "team_twenty_six" = 0x1b,
    "team_twenty_seven" = 0x1c,
    "team_twenty_eight" = 0x1d,
    "team_twenty_nine" = 0x1e,
    "team_thirty" = 0x1f,
    "team_thirty_one" = 0x20,
    "team_thirty_two" = 0x21,
    "team_thirty_three" = 0x22,
    "team_thirty_four" = 0x23,
    "team_thirty_five" = 0x24,
    "team_thirty_six" = 0x25,
    "team_thirty_seven" = 0x26,
    "team_thirty_eight" = 0x27,
    "team_thirty_nine" = 0x28,
    "team_forty" = 0x29,
    "team_forty_one" = 0x2a,
    "team_forty_two" = 0x2b,
    "team_forty_three" = 0x2c,
    "team_forty_four" = 0x2d,
    "team_forty_five" = 0x2e,
    "team_forty_six" = 0x2f,
    "team_forty_seven" = 0x30,
    "team_forty_eight" = 0x31,
    "team_forty_nine" = 0x32,
    "team_fifty" = 0x33,
    "spectator" = 0x34,
    "codcaster" = 0x35,
}

