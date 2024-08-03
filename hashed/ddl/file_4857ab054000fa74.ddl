// file ddl_4857ab054000fa74

// bitSize: 0x5688, members: 3
struct root {
    // offset: 0x0, bitSize: 0x5680(0xad0B)
    codcaster_map_data codcaster_maps[16];
    // offset: 0x5680, bitSize: 0x1
    bit shoutcaster_hasbeenread;
    // offset: 0x5681, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x568, members: 3
struct codcaster_map_data {
    // offset: 0x460, bitSize: 0x8(0x1B)
    uint8 mapIndex;
    // offset: 0x468, bitSize: 0x100(0x20B)
    char map_name[32];
    // offset: 0x0, bitSize: 0x460(0x8cB)
    codcaster_camera_pose poses[10];
}

// bitSize: 0x70, members: 6
struct codcaster_camera_pose {
    // offset: 0x8, bitSize: 0x10(0x2B)
    int12 angles_yaw;
    // offset: 0x18, bitSize: 0x10(0x2B)
    int12 angles_pitch;
    // offset: 0x28, bitSize: 0x18(0x3B)
    int24 origin_x;
    // offset: 0x40, bitSize: 0x18(0x3B)
    int24 origin_y;
    // offset: 0x58, bitSize: 0x18(0x3B)
    int24 origin_z;
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint8 fov;
}

