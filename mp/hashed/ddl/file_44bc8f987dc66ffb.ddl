// file ddl_44bc8f987dc66ffb

// bitSize: 0x2f80, members: 2
struct root {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x2e80(0x5d0B)
    Player players[24];
}

// bitSize: 0x1f0, members: 5
struct Player {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 damageDone;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 longestKillstreak;
    // offset: 0x40, bitSize: 0x20(0x4B)
    int32 shutdowns;
    // offset: 0x80, bitSize: 0x170(0x2eB)
    char username[46];
    // offset: 0x60, bitSize: 0x20(0x4B)
    int32 gametypePoints;
}

