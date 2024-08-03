// file ddl_41a668a61d6ad7f8

// bitSize: 0x40a8, members: 1
struct root {
    // offset: 0x0, bitSize: 0x40a8(0x815B)
    CompositeEmblem emblem;
}

// bitSize: 0x40a8, members: 6
struct CompositeEmblem {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint7 id;
    // offset: 0x88, bitSize: 0x8(0x1B)
    uint2 type;
    // offset: 0x90, bitSize: 0x10(0x2B)
    uint16 background;
    // offset: 0xa0, bitSize: 0x4000(0x800B)
    EmblemLayer layers[64];
    // offset: 0x40a0, bitSize: 0x8(0x1B)
    uint7 layerCount;
    // offset: 0x8, bitSize: 0x80(0x10B)
    char name[16];
}

// bitSize: 0x100, members: 26
struct EmblemLayer {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint8 red;
    // offset: 0x8, bitSize: 0x8(0x1B)
    uint8 blue;
    // offset: 0x10, bitSize: 0x10(0x2B)
    uint16 icon;
    // offset: 0x20, bitSize: 0x10(0x2B)
    uint10 posX;
    // offset: 0x30, bitSize: 0x10(0x2B)
    uint10 posY;
    // offset: 0x40, bitSize: 0x8(0x1B)
    uint8 red1;
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint8 alpha;
    // offset: 0x50, bitSize: 0x10(0x2B)
    uint9 angle;
    // offset: 0x60, bitSize: 0x8(0x1B)
    uint8 blue1;
    // offset: 0x68, bitSize: 0x8(0x1B)
    uint8 green;
    // offset: 0x70, bitSize: 0x8(0x1B)
    uint7 gradientFill;
    // offset: 0x78, bitSize: 0x10(0x2B)
    uint16 groupIndex;
    // offset: 0x88, bitSize: 0x10(0x2B)
    uint9 gradientAngle;
    // offset: 0x98, bitSize: 0x8(0x1B)
    uint8 materialScaleX;
    // offset: 0xa0, bitSize: 0x8(0x1B)
    uint8 materialScaleY;
    // offset: 0xa8, bitSize: 0x8(0x1B)
    uint8 alpha1;
    // offset: 0xb0, bitSize: 0x8(0x1B)
    uint8 green1;
    // offset: 0xb8, bitSize: 0x10(0x2B)
    uint9 materialAngle;
    // offset: 0xc8, bitSize: 0x10(0x2B)
    uint10 scaleX;
    // offset: 0xd8, bitSize: 0x10(0x2B)
    uint10 scaleY;
    // offset: 0xe8, bitSize: 0x10(0x2B)
    uint16 materialID;
    // offset: 0xf8, bitSize: 0x1
    bit flip;
    // offset: 0xf9, bitSize: 0x1
    bit blend;
    // offset: 0xfa, bitSize: 0x1
    bit gradientType;
    // offset: 0xfb, bitSize: 0x1
    bit outline;
    // offset: 0xfc, bitSize: 0x4
    pad __pad[4];
}

