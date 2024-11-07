// file ddl_482f9274124aeb73

// bitSize: 0x800, members: 6
struct root {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x8(0x1B)
    byte lowestDifficulty;
    // offset: 0x108, bitSize: 0x8(0x1B)
    byte highestDifficulty;
    // offset: 0x110, bitSize: 0x10(0x2B)
    uint16 duration;
    // offset: 0x140, bitSize: 0x6c0(0xd8B)
    TelemetryInteractionHeader metadata;
    // offset: 0x120, bitSize: 0x20(0x4B)
    int32 totalGameplayTime;
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

