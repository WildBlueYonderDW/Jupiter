// file ddl_9a3d7030f1c2f3

// bitSize: 0x29ee0, members: 16
struct root {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x20(0x4B)
    float alliesTTB;
    // offset: 0x120, bitSize: 0x20(0x4B)
    int32 alliesKills;
    // offset: 0x140, bitSize: 0x20(0x4B)
    int32 alliesScore;
    // offset: 0x160, bitSize: 0x20(0x4B)
    int32 axisScore;
    // offset: 0x180, bitSize: 0x8(0x1B)
    byte scoreboardPlayerCount;
    // offset: 0x188, bitSize: 0x1f40(0x3e8B)
    byte scoreboards[1000];
    // offset: 0x20c8, bitSize: 0x20(0x4B)
    int32 maxPlayerCount;
    // offset: 0x20e8, bitSize: 0x3840(0x708B)
    Death deaths[300];
    // offset: 0x5928, bitSize: 0x20(0x4B)
    int32 scoreProgressLimit;
    // offset: 0x5948, bitSize: 0x20(0x4B)
    int32 alliesDeaths;
    // offset: 0x5968, bitSize: 0x20(0x4B)
    float axisTTB;
    // offset: 0x5988, bitSize: 0x24540(0x48a8B)
    Player players[200];
    // offset: 0x29ec8, bitSize: 0x10(0x2B)
    short deathCount;
    // offset: 0x29ed8, bitSize: 0x1
    bit isPublicMatch;
    // offset: 0x29ed9, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x30, members: 4
struct Death {
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte attacker;
    // offset: 0x18, bitSize: 0x8(0x1B)
    byte player;
    // offset: 0x20, bitSize: 0x10(0x2B)
    byte attackerPos[2];
    // offset: 0x0, bitSize: 0x10(0x2B)
    byte deathPos[2];
}

// bitSize: 0x2e8, members: 23
struct Player {
    // offset: 0x0, bitSize: 0x10(0x2B)
    short rank;
    // offset: 0x10, bitSize: 0x8(0x1B)
    Team team;
    // offset: 0x18, bitSize: 0x10(0x2B)
    short kills;
    // offset: 0x28, bitSize: 0x20(0x4B)
    int32 score;
    // offset: 0x48, bitSize: 0x20(0x4B)
    char clanTag[4];
    // offset: 0x68, bitSize: 0x20(0x4B)
    int32 timeplayed;
    // offset: 0x88, bitSize: 0x8(0x1B)
    ClientPlatform platform;
    // offset: 0x90, bitSize: 0x10(0x2B)
    short extrascore0;
    // offset: 0xa0, bitSize: 0x10(0x2B)
    short extrascore1;
    // offset: 0xb0, bitSize: 0x10(0x2B)
    short extrascore2;
    // offset: 0xc0, bitSize: 0x10(0x2B)
    short extrascore3;
    // offset: 0xd0, bitSize: 0x10(0x2B)
    short extrascore4;
    // offset: 0xe0, bitSize: 0x10(0x2B)
    short extrascore5;
    // offset: 0xf0, bitSize: 0x20(0x4B)
    int32 xuidHigh;
    // offset: 0x110, bitSize: 0x20(0x4B)
    int32 xuidLow;
    // offset: 0x130, bitSize: 0x10(0x2B)
    short deaths;
    // offset: 0x140, bitSize: 0x10(0x2B)
    short prestige;
    // offset: 0x150, bitSize: 0x8(0x1B)
    Factions faction;
    // offset: 0x158, bitSize: 0x10(0x2B)
    short assists;
    // offset: 0x168, bitSize: 0x170(0x2eB)
    char username[46];
    // offset: 0x2d8, bitSize: 0x8(0x1B)
    byte uniqueClientId;
    // offset: 0x2e0, bitSize: 0x1
    bit isBot;
    // offset: 0x2e1, bitSize: 0x7
    pad __pad[7];
}

// members: a
enum Factions {
    "none" = 0x0,
    "USMC" = 0x1,
    "RUSF" = 0x2,
    "SAS" = 0x3,
    "SABF" = 0x4,
    "FIVE" = 0x5,
    "SIX" = 0x6,
    "ZVIR" = 0x7,
    "ICORPS" = 0x8,
    "GRP9" = 0x9,
}

// members: cb
enum Team {
    "none" = 0x0,
    "spectator" = 0x1,
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
    "team_fifty_one" = 0x34,
    "team_fifty_two" = 0x35,
    "team_fifty_three" = 0x36,
    "team_fifty_four" = 0x37,
    "team_fifty_five" = 0x38,
    "team_fifty_six" = 0x39,
    "team_fifty_seven" = 0x3a,
    "team_fifty_eight" = 0x3b,
    "team_fifty_nine" = 0x3c,
    "team_sixty" = 0x3d,
    "team_sixty_one" = 0x3e,
    "team_sixty_two" = 0x3f,
    "team_sixty_three" = 0x40,
    "team_sixty_four" = 0x41,
    "team_sixty_five" = 0x42,
    "team_sixty_six" = 0x43,
    "team_sixty_seven" = 0x44,
    "team_sixty_eight" = 0x45,
    "team_sixty_nine" = 0x46,
    "team_seventy" = 0x47,
    "team_seventy_one" = 0x48,
    "team_seventy_two" = 0x49,
    "team_seventy_three" = 0x4a,
    "team_seventy_four" = 0x4b,
    "team_seventy_five" = 0x4c,
    "team_seventy_six" = 0x4d,
    "team_seventy_seven" = 0x4e,
    "team_seventy_eight" = 0x4f,
    "team_seventy_nine" = 0x50,
    "team_eighty" = 0x51,
    "team_eighty_one" = 0x52,
    "team_eighty_two" = 0x53,
    "team_eighty_three" = 0x54,
    "team_eighty_four" = 0x55,
    "team_eighty_five" = 0x56,
    "team_eighty_six" = 0x57,
    "team_eighty_seven" = 0x58,
    "team_eighty_eight" = 0x59,
    "team_eighty_nine" = 0x5a,
    "team_ninety" = 0x5b,
    "team_ninety_one" = 0x5c,
    "team_ninety_two" = 0x5d,
    "team_ninety_three" = 0x5e,
    "team_ninety_four" = 0x5f,
    "team_ninety_five" = 0x60,
    "team_ninety_six" = 0x61,
    "team_ninety_seven" = 0x62,
    "team_ninety_eight" = 0x63,
    "team_ninety_nine" = 0x64,
    "team_hundred" = 0x65,
    "team_hundred_one" = 0x66,
    "team_hundred_two" = 0x67,
    "team_hundred_three" = 0x68,
    "team_hundred_four" = 0x69,
    "team_hundred_five" = 0x6a,
    "team_hundred_six" = 0x6b,
    "team_hundred_seven" = 0x6c,
    "team_hundred_eight" = 0x6d,
    "team_hundred_nine" = 0x6e,
    "team_hundred_ten" = 0x6f,
    "team_hundred_eleven" = 0x70,
    "team_hundred_twelve" = 0x71,
    "team_hundred_thirteen" = 0x72,
    "team_hundred_fourteen" = 0x73,
    "team_hundred_fifteen" = 0x74,
    "team_hundred_sixteen" = 0x75,
    "team_hundred_seventeen" = 0x76,
    "team_hundred_eightteen" = 0x77,
    "team_hundred_nineteen" = 0x78,
    "team_hundred_twenty" = 0x79,
    "team_hundred_twenty_one" = 0x7a,
    "team_hundred_twenty_two" = 0x7b,
    "team_hundred_twenty_three" = 0x7c,
    "team_hundred_twenty_four" = 0x7d,
    "team_hundred_twenty_five" = 0x7e,
    "team_hundred_twenty_six" = 0x7f,
    "team_hundred_twenty_seven" = 0x80,
    "team_hundred_twenty_eight" = 0x81,
    "team_hundred_twenty_nine" = 0x82,
    "team_hundred_thirty" = 0x83,
    "team_hundred_thirty_one" = 0x84,
    "team_hundred_thirty_two" = 0x85,
    "team_hundred_thirty_three" = 0x86,
    "team_hundred_thirty_four" = 0x87,
    "team_hundred_thirty_five" = 0x88,
    "team_hundred_thirty_six" = 0x89,
    "team_hundred_thirty_seven" = 0x8a,
    "team_hundred_thirty_eight" = 0x8b,
    "team_hundred_thirty_nine" = 0x8c,
    "team_hundred_forty" = 0x8d,
    "team_hundred_forty_one" = 0x8e,
    "team_hundred_forty_two" = 0x8f,
    "team_hundred_forty_three" = 0x90,
    "team_hundred_forty_four" = 0x91,
    "team_hundred_forty_five" = 0x92,
    "team_hundred_forty_six" = 0x93,
    "team_hundred_forty_seven" = 0x94,
    "team_hundred_forty_eight" = 0x95,
    "team_hundred_forty_nine" = 0x96,
    "team_hundred_fifty" = 0x97,
    "team_hundred_fifty_one" = 0x98,
    "team_hundred_fifty_two" = 0x99,
    "team_hundred_fifty_three" = 0x9a,
    "team_hundred_fifty_four" = 0x9b,
    "team_hundred_fifty_five" = 0x9c,
    "team_hundred_fifty_six" = 0x9d,
    "team_hundred_fifty_seven" = 0x9e,
    "team_hundred_fifty_eight" = 0x9f,
    "team_hundred_fifty_nine" = 0xa0,
    "team_hundred_sixty" = 0xa1,
    "team_hundred_sixty_one" = 0xa2,
    "team_hundred_sixty_two" = 0xa3,
    "team_hundred_sixty_three" = 0xa4,
    "team_hundred_sixty_four" = 0xa5,
    "team_hundred_sixty_five" = 0xa6,
    "team_hundred_sixty_six" = 0xa7,
    "team_hundred_sixty_seven" = 0xa8,
    "team_hundred_sixty_eight" = 0xa9,
    "team_hundred_sixty_nine" = 0xaa,
    "team_hundred_seventy" = 0xab,
    "team_hundred_seventy_one" = 0xac,
    "team_hundred_seventy_two" = 0xad,
    "team_hundred_seventy_three" = 0xae,
    "team_hundred_seventy_four" = 0xaf,
    "team_hundred_seventy_five" = 0xb0,
    "team_hundred_seventy_six" = 0xb1,
    "team_hundred_seventy_seven" = 0xb2,
    "team_hundred_seventy_eight" = 0xb3,
    "team_hundred_seventy_nine" = 0xb4,
    "team_hundred_eighty" = 0xb5,
    "team_hundred_eighty_one" = 0xb6,
    "team_hundred_eighty_two" = 0xb7,
    "team_hundred_eighty_three" = 0xb8,
    "team_hundred_eighty_four" = 0xb9,
    "team_hundred_eighty_five" = 0xba,
    "team_hundred_eighty_six" = 0xbb,
    "team_hundred_eighty_seven" = 0xbc,
    "team_hundred_eighty_eight" = 0xbd,
    "team_hundred_eighty_nine" = 0xbe,
    "team_hundred_ninety" = 0xbf,
    "team_hundred_ninety_one" = 0xc0,
    "team_hundred_ninety_two" = 0xc1,
    "team_hundred_ninety_three" = 0xc2,
    "team_hundred_ninety_four" = 0xc3,
    "team_hundred_ninety_five" = 0xc4,
    "team_hundred_ninety_six" = 0xc5,
    "team_hundred_ninety_seven" = 0xc6,
    "team_hundred_ninety_eight" = 0xc7,
    "team_hundred_ninety_nine" = 0xc8,
    "team_two_hundred" = 0xc9,
    "codcaster" = 0xca,
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

