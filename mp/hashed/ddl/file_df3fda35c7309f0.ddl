// file ddl_df3fda35c7309f0

// bitSize: 0xd48, members: 2
struct root {
    // offset: 0x8, bitSize: 0xd40(0x1a8B)
    CommonMatchData commonMatchData;
    // offset: 0x0, bitSize: 0x8(0x1B)
    byte playerCountMaxConcurrent;
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

