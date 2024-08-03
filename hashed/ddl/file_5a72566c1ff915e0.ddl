// file ddl_5a72566c1ff915e0

// bitSize: 0xb80, members: 19
struct root {
    // offset: 0x0, bitSize: 0x10(0x2B)
    uint16 hits;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte rank;
    // offset: 0x18, bitSize: 0x10(0x2B)
    uint16 downs;
    // offset: 0x28, bitSize: 0x10(0x2B)
    uint16 kills;
    // offset: 0x38, bitSize: 0x388(0x71B)
    Match match;
    // offset: 0x3c0, bitSize: 0x10(0x2B)
    uint16 shots;
    // offset: 0x3d0, bitSize: 0x10(0x2B)
    uint16 revives;
    // offset: 0x3e0, bitSize: 0x8(0x1B)
    byte waveEnd;
    // offset: 0x3e8, bitSize: 0x8(0x1B)
    byte waveStart;
    // offset: 0x3f0, bitSize: 0x20(0x4B)
    int32 moneyEarned;
    // offset: 0x410, bitSize: 0x8(0x1B)
    byte prestige;
    // offset: 0x418, bitSize: 0x20(0x4B)
    int32 totalGameplayTime;
    // offset: 0x438, bitSize: 0x6c0(0xd8B)
    TelemetryInteractionHeader metadata;
    // offset: 0xaf8, bitSize: 0x20(0x4B)
    int32 gamesPlayed;
    // offset: 0xb18, bitSize: 0x40(0x8B)
    uint64 hostXuid;
    // offset: 0xb58, bitSize: 0x10(0x2B)
    uint16 doorsOpened;
    // offset: 0xb68, bitSize: 0x10(0x2B)
    uint16 headShots;
    // offset: 0xb78, bitSize: 0x1
    bit quit;
    // offset: 0xb79, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x6c0, members: 14
struct TelemetryInteractionHeader {
    // offset: 0x0, bitSize: 0x200(0x40B)
    char ip[64];
    // offset: 0x200, bitSize: 0x18(0x3B)
    char country[3];
    // offset: 0x218, bitSize: 0x100(0x20B)
    char action_type[32];
    // offset: 0x318, bitSize: 0x100(0x20B)
    char session_id[32];
    // offset: 0x418, bitSize: 0x20(0x4B)
    char platform[4];
    // offset: 0x438, bitSize: 0x20(0x4B)
    uint32 nat_type;
    // offset: 0x458, bitSize: 0x20(0x4B)
    uint32 title_id;
    // offset: 0x478, bitSize: 0xa0(0x14B)
    char language[20];
    // offset: 0x518, bitSize: 0x100(0x20B)
    char game_version[32];
    // offset: 0x618, bitSize: 0x20(0x4B)
    uint32 utc_timestamp;
    // offset: 0x638, bitSize: 0x40(0x8B)
    uint64 uno_id;
    // offset: 0x678, bitSize: 0x40(0x8B)
    uint64 user_id;
    // offset: 0x6b8, bitSize: 0x1
    bit is_splitscreen;
    // offset: 0x6b9, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x388, members: 11
struct Match {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x8(0x1B)
    byte playerCountEnd;
    // offset: 0x108, bitSize: 0x128(0x25B)
    char matchGUID[37];
    // offset: 0x230, bitSize: 0x20(0x4B)
    uint32 utcEndTimeSeconds;
    // offset: 0x250, bitSize: 0x20(0x4B)
    uint32 utcStartTimeSeconds;
    // offset: 0x270, bitSize: 0x8(0x1B)
    byte playerCountStart;
    // offset: 0x278, bitSize: 0x100(0x20B)
    char gametype[32];
    // offset: 0x378, bitSize: 0x8(0x1B)
    byte playerCountLeft;
    // offset: 0x380, bitSize: 0x1
    bit isPrivateMatch;
    // offset: 0x381, bitSize: 0x1
    bit isRankedMatch;
    // offset: 0x382, bitSize: 0x6
    pad __pad[6];
}

