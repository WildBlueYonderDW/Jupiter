// file ddl_200ffe0198bc4cd6

// bitSize: 0x11f30, members: 12
struct root {
    // offset: 0x0, bitSize: 0x1e0(0x3cB)
    sboxLoadoutData sandboxLoadoutData[6];
    // offset: 0x1e0, bitSize: 0x548(0xa9B)
    sboxLastCheckpointData sandboxLastCheckpointData;
    // offset: 0x728, bitSize: 0x80(0x10B)
    gameplaytutorialData gameplaytutorials;
    // offset: 0x7a8, bitSize: 0x20(0x4B)
    DDLVersionInfo sandboxddlversion;
    // offset: 0x7c8, bitSize: 0x5c8(0xb9B)
    SBProgressionData spProgData;
    // offset: 0xd90, bitSize: 0x10(0x2B)
    SboxAchievements SandBoxAchievementData;
    // offset: 0xda0, bitSize: 0x70(0xeB)
    JupMissionProgression JupMissionDifficulties;
    // offset: 0xe10, bitSize: 0xe000(0x1c00B)
    FogOfWarData fogOfWarData;
    // offset: 0xee10, bitSize: 0x1a20(0x344B)
    SPProgression spData;
    // offset: 0x10830, bitSize: 0x60(0xcB)
    sboxMissionObjectiveData sandboxMissionObjectiveData[6];
    // offset: 0x108b0, bitSize: 0x1680(0x2d0B)
    sboxInventoryData sandboxInventoryData[6];
    // offset: 0x10890, bitSize: 0x20(0x4B)
    Features features;
}

// bitSize: 0x3c0, members: 1
struct sboxInventoryData {
    // offset: 0x0, bitSize: 0x3c0(0x78B)
    sboxItemData SboxItems[40];
}

// bitSize: 0x18, members: 4
struct sboxItemData {
    // offset: 0x0, bitSize: 0x10(0x2B)
    uint16 itemID;
    // offset: 0x10, bitSize: 0x1
    bit isNewUnlock;
    // offset: 0x11, bitSize: 0x1
    bit unlockState;
    // offset: 0x12, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x10, members: 16
struct sboxMissionObjectiveData {
    // offset: 0x0, bitSize: 0x1
    bit objective_0;
    // offset: 0x1, bitSize: 0x1
    bit objective_1;
    // offset: 0x2, bitSize: 0x1
    bit objective_2;
    // offset: 0x3, bitSize: 0x1
    bit objective_3;
    // offset: 0x4, bitSize: 0x1
    bit objective_4;
    // offset: 0x5, bitSize: 0x1
    bit objective_5;
    // offset: 0x6, bitSize: 0x1
    bit objective_6;
    // offset: 0x7, bitSize: 0x1
    bit objective_7;
    // offset: 0x8, bitSize: 0x1
    bit objective_8;
    // offset: 0x9, bitSize: 0x1
    bit objective_9;
    // offset: 0xa, bitSize: 0x1
    bit objective_10;
    // offset: 0xb, bitSize: 0x1
    bit objective_11;
    // offset: 0xc, bitSize: 0x1
    bit objective_12;
    // offset: 0xd, bitSize: 0x1
    bit objective_13;
    // offset: 0xe, bitSize: 0x1
    bit objective_14;
    // offset: 0xf, bitSize: 0x1
    bit objective_15;
}

// bitSize: 0x548, members: 11
struct sboxLastCheckpointData {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char last_checkpoint_angles[32];
    // offset: 0x100, bitSize: 0x200(0x40B)
    char last_checkpoint[64];
    // offset: 0x300, bitSize: 0x100(0x20B)
    char last_checkpoint_map[32];
    // offset: 0x400, bitSize: 0x8(0x1B)
    int4 last_checkpoint_difficulty;
    // offset: 0x408, bitSize: 0x10(0x2B)
    uint16 last_checkpoint_armor_health;
    // offset: 0x418, bitSize: 0x8(0x1B)
    int4 last_checkpoint_armor_plates;
    // offset: 0x420, bitSize: 0x20(0x4B)
    uint32 sandboxCheckpointTimestamp;
    // offset: 0x440, bitSize: 0x100(0x20B)
    char last_checkpoint_position[32];
    // offset: 0x540, bitSize: 0x1
    bit last_checkpoint_nvg_state;
    // offset: 0x541, bitSize: 0x1
    bit last_checkpoint_self_revive;
    // offset: 0x542, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x50, members: 10
struct sboxLoadoutData {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint8 tacticalGrenade;
    // offset: 0x10, bitSize: 0x8(0x1B)
    uint8 molle;
    // offset: 0x18, bitSize: 0x8(0x1B)
    uint8 plate;
    // offset: 0x20, bitSize: 0x8(0x1B)
    uint8 secondaryWeapon;
    // offset: 0x28, bitSize: 0x8(0x1B)
    uint8 gloves;
    // offset: 0x30, bitSize: 0x8(0x1B)
    uint8 helmet;
    // offset: 0x38, bitSize: 0x8(0x1B)
    uint8 fieldEquipment;
    // offset: 0x40, bitSize: 0x8(0x1B)
    uint8 lethalGrenade;
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint8 primaryWeapon;
    // offset: 0x8, bitSize: 0x8(0x1B)
    uint8 boots;
}

// bitSize: 0x80, members: 16
struct gameplaytutorialData {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint4 tutorial_9_displays;
    // offset: 0x8, bitSize: 0x8(0x1B)
    uint4 tutorial_8_displays;
    // offset: 0x10, bitSize: 0x8(0x1B)
    uint4 tutorial_7_displays;
    // offset: 0x20, bitSize: 0x8(0x1B)
    uint4 tutorial_6_displays;
    // offset: 0x28, bitSize: 0x8(0x1B)
    uint4 tutorial_14_displays;
    // offset: 0x30, bitSize: 0x8(0x1B)
    uint4 tutorial_5_displays;
    // offset: 0x38, bitSize: 0x8(0x1B)
    uint4 tutorial_13_displays;
    // offset: 0x40, bitSize: 0x8(0x1B)
    uint4 tutorial_4_displays;
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint4 tutorial_12_displays;
    // offset: 0x50, bitSize: 0x8(0x1B)
    uint4 tutorial_3_displays;
    // offset: 0x58, bitSize: 0x8(0x1B)
    uint4 tutorial_11_displays;
    // offset: 0x60, bitSize: 0x8(0x1B)
    uint4 tutorial_2_displays;
    // offset: 0x68, bitSize: 0x8(0x1B)
    uint4 tutorial_10_displays;
    // offset: 0x70, bitSize: 0x8(0x1B)
    uint4 tutorial_1_displays;
    // offset: 0x78, bitSize: 0x8(0x1B)
    uint4 tutorial_0_displays;
    // offset: 0x18, bitSize: 0x8(0x1B)
    uint4 tutorial_15_displays;
}

// bitSize: 0x5c8, members: 68
struct SBProgressionData {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint5 cp_jup_resort_checkpoint_id;
    // offset: 0x8, bitSize: 0x8(0x1B)
    uint8 cp_jup_ranch_attempts;
    // offset: 0x10, bitSize: 0x8(0x1B)
    uint3 cp_jup_chemical_plate_level;
    // offset: 0x18, bitSize: 0x8(0x1B)
    uint8 cp_jup_apt_attempts;
    // offset: 0x20, bitSize: 0x8(0x1B)
    uint3 cp_jup_resort_plate_level;
    // offset: 0x28, bitSize: 0x8(0x1B)
    uint3 cp_jup_port_plate_level;
    // offset: 0x30, bitSize: 0x8(0x1B)
    uint8 cp_jup_apt_successes;
    // offset: 0x38, bitSize: 0x8(0x1B)
    uint8 cp_jup_resort_attempts;
    // offset: 0x40, bitSize: 0x8(0x1B)
    uint3 cp_jup_apt_plate_level;
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint5 cp_jup_apt_checkpoint_id;
    // offset: 0x50, bitSize: 0x8(0x1B)
    uint5 cp_jup_chemical_checkpoint_id;
    // offset: 0x58, bitSize: 0x8(0x1B)
    uint8 cp_jup_dam_successes;
    // offset: 0x60, bitSize: 0x8(0x1B)
    uint8 cp_jup_chemical_successes;
    // offset: 0x68, bitSize: 0x8(0x1B)
    uint5 cp_jup_dam_checkpoint_id;
    // offset: 0x70, bitSize: 0x8(0x1B)
    uint3 cp_jup_dam_plate_level;
    // offset: 0x78, bitSize: 0x8(0x1B)
    uint8 cp_jup_resort_successes;
    // offset: 0x80, bitSize: 0x8(0x1B)
    uint5 cp_jup_port_checkpoint_id;
    // offset: 0x88, bitSize: 0x8(0x1B)
    uint5 cp_jup_ranch_checkpoint_id;
    // offset: 0x90, bitSize: 0x8(0x1B)
    uint8 cp_jup_chemical_attempts;
    // offset: 0x98, bitSize: 0x8(0x1B)
    uint8 cp_jup_port_successes;
    // offset: 0xa0, bitSize: 0x8(0x1B)
    uint8 cp_jup_dam_attempts;
    // offset: 0xa8, bitSize: 0x8(0x1B)
    uint8 cp_jup_ranch_successes;
    // offset: 0xb0, bitSize: 0x8(0x1B)
    uint3 cp_jup_ranch_plate_level;
    // offset: 0xb8, bitSize: 0x8(0x1B)
    uint8 cp_jup_port_attempts;
    // offset: 0xc0, bitSize: 0x1
    bit cp_jup_parachute_activated;
    // offset: 0xc1, bitSize: 0x1
    bit cp_jup_resort_nvg;
    // offset: 0xc2, bitSize: 0x1
    bit cp_jup_apt_nvg;
    // offset: 0xc3, bitSize: 0x1
    bit cp_jup_resort_ascender_tool;
    // offset: 0xc4, bitSize: 0x1
    bit cp_jup_resort_should_show_loadout;
    // offset: 0xc5, bitSize: 0x80(0x10B)
    bit cp_jup_apt_discoverables[128];
    // offset: 0x145, bitSize: 0x4
    bit cp_jup_dam_ks_unlocks[4];
    // offset: 0x149, bitSize: 0x15e
    bit cp_jup_chemical_discoverables[350];
    // offset: 0x2a7, bitSize: 0x4
    bit cp_jup_resort_ks_unlocks[4];
    // offset: 0x2ab, bitSize: 0x1
    bit cp_jup_ranch_nvg;
    // offset: 0x2ac, bitSize: 0x19
    bit cp_jup_chemical_plate_carriers[25];
    // offset: 0x2c5, bitSize: 0x10(0x2B)
    bit cp_jup_ranch_map_unlocks[16];
    // offset: 0x2d5, bitSize: 0x4
    bit cp_jup_chemical_ks_unlocks[4];
    // offset: 0x2d9, bitSize: 0x1
    bit cp_jup_dam_should_show_loadout;
    // offset: 0x2da, bitSize: 0x1
    bit cp_jup_apt_ascender_tool;
    // offset: 0x2db, bitSize: 0x1
    bit cp_jup_port_nvg;
    // offset: 0x2dc, bitSize: 0x80(0x10B)
    bit cp_jup_dam_discoverables[128];
    // offset: 0x35c, bitSize: 0x1
    bit cp_jup_chemical_ascender_tool;
    // offset: 0x35d, bitSize: 0x4
    bit cp_jup_ranch_ks_unlocks[4];
    // offset: 0x361, bitSize: 0x10(0x2B)
    bit cp_jup_chemical_map_unlocks[16];
    // offset: 0x371, bitSize: 0xc8(0x19B)
    bit cp_jup_port_discoverables[200];
    // offset: 0x439, bitSize: 0x10(0x2B)
    bit cp_jup_resort_map_unlocks[16];
    // offset: 0x449, bitSize: 0x19
    bit cp_jup_resort_plate_carriers[25];
    // offset: 0x462, bitSize: 0x40(0x8B)
    bit cp_jup_ranch_discoverables[64];
    // offset: 0x4a2, bitSize: 0x10(0x2B)
    bit cp_jup_port_map_unlocks[16];
    // offset: 0x4b2, bitSize: 0x19
    bit cp_jup_apt_plate_carriers[25];
    // offset: 0x4cb, bitSize: 0x10(0x2B)
    bit cp_jup_apt_map_unlocks[16];
    // offset: 0x4db, bitSize: 0x1
    bit cp_jup_dam_nvg;
    // offset: 0x4dc, bitSize: 0x1
    bit cp_jup_dam_ascender_tool;
    // offset: 0x4dd, bitSize: 0x1
    bit cp_jup_apt_should_show_loadout;
    // offset: 0x4de, bitSize: 0x19
    bit cp_jup_port_plate_carriers[25];
    // offset: 0x4f7, bitSize: 0x4
    bit cp_jup_apt_ks_unlocks[4];
    // offset: 0x4fb, bitSize: 0x1
    bit cp_jup_ranch_should_show_loadout;
    // offset: 0x4fc, bitSize: 0x1
    bit cp_jup_port_ascender_tool;
    // offset: 0x4fd, bitSize: 0x1
    bit cp_jup_ranch_ascender_tool;
    // offset: 0x4fe, bitSize: 0x19
    bit cp_jup_ranch_plate_carriers[25];
    // offset: 0x517, bitSize: 0x1
    bit cp_jup_port_should_show_loadout;
    // offset: 0x518, bitSize: 0x80(0x10B)
    bit cp_jup_resort_discoverables[128];
    // offset: 0x598, bitSize: 0x4
    bit cp_jup_port_ks_unlocks[4];
    // offset: 0x59c, bitSize: 0x1
    bit cp_jup_chemical_should_show_loadout;
    // offset: 0x59d, bitSize: 0x10(0x2B)
    bit cp_jup_dam_map_unlocks[16];
    // offset: 0x5ad, bitSize: 0x1
    bit cp_jup_chemical_nvg;
    // offset: 0x5ae, bitSize: 0x19
    bit cp_jup_dam_plate_carriers[25];
    // offset: 0x5c7, bitSize: 0x1
    pad __pad[1];
}

// bitSize: 0x1a20, members: 39
struct SPProgression {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint3 achievementSuitUp;
    // offset: 0x8, bitSize: 0x20(0x4B)
    int32 achievementHangtime;
    // offset: 0x28, bitSize: 0x20(0x4B)
    int32 focusCounter;
    // offset: 0x48, bitSize: 0x100(0x20B)
    char achievementBoom[32];
    // offset: 0x148, bitSize: 0x20(0x4B)
    int32 kleenexSessionGameplayTime;
    // offset: 0x168, bitSize: 0xc00(0x180B)
    char usedMunitions[32][12];
    // offset: 0xd68, bitSize: 0x78(0xfB)
    MissionState missionStateData[15];
    // offset: 0xde0, bitSize: 0x20(0x4B)
    int32 playerMountCounter;
    // offset: 0xe00, bitSize: 0x20(0x4B)
    uint32 cheatPoints;
    // offset: 0xe20, bitSize: 0x20(0x4B)
    int32 sessionGameplayTime;
    // offset: 0xe40, bitSize: 0x438(0x87B)
    MissionData playerMissionData[15];
    // offset: 0x1278, bitSize: 0x100(0x20B)
    byte missionHighestDifficulty[32];
    // offset: 0x1378, bitSize: 0x8(0x1B)
    uint4 currentGameskill;
    // offset: 0x1380, bitSize: 0x8(0x1B)
    uint6 achievementILikeToPretendIHaveAPlan;
    // offset: 0x1388, bitSize: 0x20(0x4B)
    uint32 spTutorialLevel2;
    // offset: 0x13a8, bitSize: 0x8(0x1B)
    uint4 takeCoverWarnings;
    // offset: 0x13b0, bitSize: 0x20(0x4B)
    uint32 cheat_items_set1;
    // offset: 0x13d0, bitSize: 0x20(0x4B)
    uint32 cheat_items_set2;
    // offset: 0x13f0, bitSize: 0x20(0x4B)
    int32 achievementDriveBy;
    // offset: 0x1410, bitSize: 0x20(0x4B)
    int32 startPointDeaths;
    // offset: 0x1430, bitSize: 0x20(0x4B)
    int32 achievementWallOfDuty;
    // offset: 0x1450, bitSize: 0x1e0(0x3cB)
    int32 civiliansKilledGradeBest[15];
    // offset: 0x1630, bitSize: 0x20(0x4B)
    int32 startPointFails;
    // offset: 0x1650, bitSize: 0x20(0x4B)
    uint32 spTutorialLevel;
    // offset: 0x1670, bitSize: 0x20(0x4B)
    int32 totalGameplayTime;
    // offset: 0x1690, bitSize: 0x20(0x4B)
    int32 percentCompleteSP;
    // offset: 0x16b0, bitSize: 0x8(0x1B)
    Missions currentMission;
    // offset: 0x16b8, bitSize: 0x20(0x4B)
    int32 numMunitions;
    // offset: 0x16d8, bitSize: 0x1e0(0x3cB)
    int32 civiliansKilledGrade[15];
    // offset: 0x18b8, bitSize: 0x20(0x4B)
    int32 kleenexSectionTime;
    // offset: 0x18d8, bitSize: 0x20(0x4B)
    int32 curDifficulty;
    // offset: 0x18f8, bitSize: 0x20(0x4B)
    int32 achievementEngineeringDegree;
    // offset: 0x1918, bitSize: 0x100(0x20B)
    char achievementGentlemanThief[32];
    // offset: 0x1a18, bitSize: 0x1
    bit achievementDoorPeekKick;
    // offset: 0x1a19, bitSize: 0x1
    bit achievementDoorPeekOpen;
    // offset: 0x1a1a, bitSize: 0x1
    bit beatRealism;
    // offset: 0x1a1b, bitSize: 0x1
    bit unlockedRealism;
    // offset: 0x1a1c, bitSize: 0x1
    bit achievementDoorPeekGrenade;
    // offset: 0x1a1d, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x48, members: 11
struct MissionData {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint5 majorStoryChoiceIndex;
    // offset: 0x8, bitSize: 0x8(0x1B)
    uint5 numObtainedSpyKitPuzzleResource1;
    // offset: 0x10, bitSize: 0x8(0x1B)
    uint5 numObtainedSpyKitPuzzleResource2;
    // offset: 0x18, bitSize: 0x8(0x1B)
    uint5 numObtainedSpyKitPuzzleResource3;
    // offset: 0x20, bitSize: 0x8(0x1B)
    uint5 numObtainedSpyKitPuzzleResource4;
    // offset: 0x28, bitSize: 0x8(0x1B)
    uint5 numEvidenceObtained;
    // offset: 0x30, bitSize: 0x8(0x1B)
    uint5 numOperatorsObtained;
    // offset: 0x38, bitSize: 0x8(0x1B)
    uint5 numResourceKeyObtained;
    // offset: 0x40, bitSize: 0x1
    bit completedResourceMission;
    // offset: 0x41, bitSize: 0x1
    bit completedAllyLoyalty;
    // offset: 0x42, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x70, members: 1
struct JupMissionProgression {
    // offset: 0x0, bitSize: 0x70(0xeB)
    uint4 JupMissionDifficulty[14];
}

// bitSize: 0x20, members: 1
struct DDLVersionInfo {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 version;
}

// bitSize: 0xe000, members: 2
struct FogOfWarData {
    // offset: 0xc000, bitSize: 0x2000(0x400B)
    FogOfWarMapData fogOfWarTemporalMapData;
    // offset: 0x0, bitSize: 0xc000(0x1800B)
    FogOfWarMapData fogOfWarMapData[6];
}

// bitSize: 0x2000, members: 4
struct FogOfWarMapData {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 rows;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 version;
    // offset: 0x40, bitSize: 0x20(0x4B)
    int32 columns;
    // offset: 0x60, bitSize: 0x1fa0(0x3f4B)
    bit tilesDiscovered[8096];
}

// bitSize: 0x10, members: 13
struct SboxAchievements {
    // offset: 0x0, bitSize: 0x1
    bit cp_jup_ranch_allitemscollected;
    // offset: 0x1, bitSize: 0x1
    bit cp_jup_ranch_changedloadout;
    // offset: 0x2, bitSize: 0x1
    bit cp_jup_resort_allitemscollected;
    // offset: 0x3, bitSize: 0x1
    bit cp_jup_port_allitemscollected;
    // offset: 0x4, bitSize: 0x1
    bit cp_jup_dam_changedloadout;
    // offset: 0x5, bitSize: 0x1
    bit cp_jup_dam_allitemscollected;
    // offset: 0x6, bitSize: 0x1
    bit cp_jup_apt_allitemscollected;
    // offset: 0x7, bitSize: 0x1
    bit cp_jup_chemical_changedloadout;
    // offset: 0x8, bitSize: 0x1
    bit cp_jup_chemical_allitemscollected;
    // offset: 0x9, bitSize: 0x1
    bit cp_jup_resort_changedloadout;
    // offset: 0xa, bitSize: 0x1
    bit cp_jup_apt_changedloadout;
    // offset: 0xb, bitSize: 0x1
    bit cp_jup_port_changedloadout;
    // offset: 0xc, bitSize: 0x4
    pad __pad[4];
}

// bitSize: 0x20, members: 1
struct Features {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 highVisibilityMode;
}

// members: f
enum Missions {
    "none" = 0x0,
    "sp_jup_vip" = 0x1,
    "cp_jup_port" = 0x2,
    "cp_jup_chemical" = 0x3,
    "sp_jup_silo" = 0x4,
    "sp_jup_milbase" = 0x5,
    "sp_jup_hijack" = 0x6,
    "cp_jup_ranch" = 0x7,
    "sp_jup_flashback" = 0x8,
    "cp_jup_resort" = 0x9,
    "cp_jup_apt" = 0xa,
    "sp_jup_tundra" = 0xb,
    "cp_jup_dam" = 0xc,
    "sp_jup_gunship" = 0xd,
    "sp_jup_surge" = 0xe,
}

// members: 3
enum MissionState {
    "locked" = 0x0,
    "incomplete" = 0x1,
    "complete" = 0x2,
}

