// file ddl_352a60d12e91d25e

// bitSize: 0x1548, members: 5
struct root {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 lootedCash;
    // offset: 0x20, bitSize: 0x60(0xcB)
    float lostGearOrigin[3];
    // offset: 0x80, bitSize: 0x20(0x4B)
    int32 dollars;
    // offset: 0xa0, bitSize: 0x14a0(0x294B)
    LostItem lostGear[110];
    // offset: 0x1540, bitSize: 0x8(0x1B)
    ValidationData validationData;
}

// bitSize: 0x8, members: 2
struct ValidationData {
    // offset: 0x0, bitSize: 0x5
    bit validationHint[5];
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x30, members: 2
struct LostItem {
    // offset: 0x10, bitSize: 0x20(0x4B)
    int32 lootID;
    // offset: 0x0, bitSize: 0x10(0x2B)
    short quantity;
}

