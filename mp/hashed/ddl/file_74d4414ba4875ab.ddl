// file ddl_74d4414ba4875ab

// bitSize: 0x2832c8, members: 13
struct root {
    // offset: 0x0, bitSize: 0xbb80(0x1770B)
    PlayerStats playerStats[200];
    // offset: 0xbb80, bitSize: 0x100(0x20B)
    char mapname[32];
    // offset: 0xbc80, bitSize: 0x40(0x8B)
    uint64 matchID;
    // offset: 0xbcc0, bitSize: 0x277400(0x4ee80B)
    PlayerBestPlay bestPlays[200];
    // offset: 0x2830c0, bitSize: 0x20(0x4B)
    uint32 matchLength;
    // offset: 0x2830e0, bitSize: 0x20(0x4B)
    int32 compassBuildID;
    // offset: 0x283100, bitSize: 0x20(0x4B)
    int32 dataBuildNumber;
    // offset: 0x283120, bitSize: 0x40(0x8B)
    uint64 serverGUID;
    // offset: 0x283160, bitSize: 0x100(0x20B)
    char gametype[32];
    // offset: 0x283260, bitSize: 0x20(0x4B)
    int32 codeBuildNumber;
    // offset: 0x283280, bitSize: 0x40(0x8B)
    uint64 hostXUID;
    // offset: 0x2832c0, bitSize: 0x1
    bit isHostDedi;
    // offset: 0x2832c1, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0xf0, members: 8
struct PlayerStats {
    // offset: 0x0, bitSize: 0x40(0x8B)
    uint64 xuid;
    // offset: 0x40, bitSize: 0x20(0x4B)
    uint32 time_in_match;
    // offset: 0x60, bitSize: 0x10(0x2B)
    uint16 kills;
    // offset: 0x70, bitSize: 0x20(0x4B)
    int32 xpEarned;
    // offset: 0x90, bitSize: 0x20(0x4B)
    float accuracy;
    // offset: 0xb0, bitSize: 0x10(0x2B)
    uint16 deaths;
    // offset: 0xe0, bitSize: 0x10(0x2B)
    uint16 headshots;
    // offset: 0xc0, bitSize: 0x20(0x4B)
    int32 subpartyIndex;
}

// bitSize: 0x3280, members: 4
struct PlayerBestPlay {
    // offset: 0x0, bitSize: 0x40(0x8B)
    uint64 xuid;
    // offset: 0x40, bitSize: 0x20(0x4B)
    uint32 endFrameByteOffset;
    // offset: 0x3260, bitSize: 0x20(0x4B)
    uint32 startFrameByteOffset;
    // offset: 0x60, bitSize: 0x3200(0x640B)
    uint64 clientIndexToUnoMap[200];
}

