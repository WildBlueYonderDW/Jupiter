// file ddl_3515a9ec703168d8

// bitSize: 0x70, members: 1
struct root {
    // offset: 0x0, bitSize: 0x70(0xeB)
    LiveInfo live;
}

// bitSize: 0x70, members: 6
struct LiveInfo {
    // offset: 0x0, bitSize: 0x20(0x4B)
    ToSInfo tos;
    // offset: 0x20, bitSize: 0x28(0x5B)
    EventInfo event;
    // offset: 0x48, bitSize: 0x20(0x4B)
    AppReview appReview;
    // offset: 0x68, bitSize: 0x1
    MotDInfo motd;
    // offset: 0x69, bitSize: 0x1
    PushNotifications pushNotifications;
    // offset: 0x6a, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x1, members: 1
struct MotDInfo {
    // offset: 0x0, bitSize: 0x1
    bit seen;
}

// bitSize: 0x20, members: 1
struct ToSInfo {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 accept;
}

// bitSize: 0x28, members: 3
struct EventInfo {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 currentEventIndex;
    // offset: 0x20, bitSize: 0x1
    bit ftueSeen;
    // offset: 0x21, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x1, members: 1
struct PushNotifications {
    // offset: 0x0, bitSize: 0x1
    bit seenSoftPrompt;
}

// bitSize: 0x20, members: 1
struct AppReview {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 timesShown;
}

