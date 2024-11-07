// file ddl_283992850d9c2834

// bitSize: 0x121b8, members: 42
struct root {
    // offset: 0x0, bitSize: 0x0(0x0B)
    Life lives[285];
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 pack_a_punch_used;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 shot_icemonster;
    // offset: 0x40, bitSize: 0x20(0x4B)
    int32 suicide_bomber_sequence_activated;
    // offset: 0x60, bitSize: 0x20(0x4B)
    int32 balloons_popped;
    // offset: 0x80, bitSize: 0x20(0x4B)
    int32 neil_head;
    // offset: 0xa0, bitSize: 0x20(0x4B)
    int32 challenge_activated;
    // offset: 0xc0, bitSize: 0x20(0x4B)
    int32 activate_enter_ghostskulls_game;
    // offset: 0xe0, bitSize: 0x8(0x1B)
    EndGameCondition gameOverCondition;
    // offset: 0xe8, bitSize: 0x20(0x4B)
    int32 neil_battery;
    // offset: 0x108, bitSize: 0xc80(0x190B)
    Weapon weapons[100];
    // offset: 0xd88, bitSize: 0x20(0x4B)
    int32 totalTimeElapsed;
    // offset: 0xda8, bitSize: 0x20(0x4B)
    int32 grey_sequence_activated;
    // offset: 0xdc8, bitSize: 0x20(0x4B)
    int32 neil_floppy;
    // offset: 0xde8, bitSize: 0x20(0x4B)
    int32 souvenir_coin_used;
    // offset: 0xe08, bitSize: 0x20(0x4B)
    int32 beating_arcade_games;
    // offset: 0xe28, bitSize: 0xc8(0x19B)
    Challenge challengesCompleted[25];
    // offset: 0xef0, bitSize: 0x20(0x4B)
    int32 escapeTimeRemaining;
    // offset: 0xf10, bitSize: 0x20(0x4B)
    int32 lost_and_found;
    // offset: 0xf30, bitSize: 0x20(0x4B)
    int32 frequency_device_collected;
    // offset: 0xf50, bitSize: 0x8(0x1B)
    byte playerCountMaxConcurrent;
    // offset: 0xf58, bitSize: 0x20(0x4B)
    int32 turning_on_the_power;
    // offset: 0xf78, bitSize: 0x20(0x4B)
    int32 item_purchase_with_tickets;
    // offset: 0xf98, bitSize: 0x20(0x4B)
    int32 perk_machine_used;
    // offset: 0xfb8, bitSize: 0xd40(0x1a8B)
    CommonMatchData commonMatchData;
    // offset: 0x1cf8, bitSize: 0x20(0x4B)
    int32 ghost_spelled;
    // offset: 0x1d18, bitSize: 0x20(0x4B)
    int32 speaker_defence_sequence_ends;
    // offset: 0x1d38, bitSize: 0x20(0x4B)
    int32 wave_complete;
    // offset: 0x1d58, bitSize: 0x20(0x4B)
    int32 player_exits_ghostskulls_games;
    // offset: 0x1d78, bitSize: 0x20(0x4B)
    int32 magic_box_used;
    // offset: 0x1d98, bitSize: 0x20(0x4B)
    int32 perk_returned;
    // offset: 0x1db8, bitSize: 0x20(0x4B)
    int32 ufo_destroyed;
    // offset: 0x1dd8, bitSize: 0x20(0x4B)
    int32 brute_hits_cabinet;
    // offset: 0x1df8, bitSize: 0x20(0x4B)
    int32 challenge_completed;
    // offset: 0x1e18, bitSize: 0x20(0x4B)
    int32 souvenir_coin_dropped;
    // offset: 0x1e38, bitSize: 0x20(0x4B)
    int32 tone_sequence_activated;
    // offset: 0x1e58, bitSize: 0x20(0x4B)
    int32 challenge_failed;
    // offset: 0x1e78, bitSize: 0x102c0(0x2058B)
    Player players[30];
    // offset: 0x12138, bitSize: 0x20(0x4B)
    int32 interaction_status;
    // offset: 0x12158, bitSize: 0x20(0x4B)
    int32 portal_used;
    // offset: 0x12198, bitSize: 0x20(0x4B)
    int32 frequency_device_crafted_dj;
    // offset: 0x12178, bitSize: 0x20(0x4B)
    int32 item_replaced;
}

// bitSize: 0xd40, members: 36
struct CommonMatchData {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x100(0x20B)
    char mapB[32];
    // offset: 0x200, bitSize: 0x8(0x1B)
    byte player_count;
    // offset: 0x208, bitSize: 0x208(0x41B)
    char dmlRegion[65];
    // offset: 0x410, bitSize: 0x10(0x2B)
    uint16 weapon_map_watermark;
    // offset: 0x420, bitSize: 0x40(0x8B)
    uint64 match_id;
    // offset: 0x460, bitSize: 0x18(0x3B)
    char dmlCountryCode[3];
    // offset: 0x478, bitSize: 0x20(0x4B)
    uint32 dataCenterId;
    // offset: 0x498, bitSize: 0x88(0x11B)
    char dw_lobby_id[17];
    // offset: 0x520, bitSize: 0x8(0x1B)
    byte player_count_end;
    // offset: 0x528, bitSize: 0x20(0x4B)
    int32 serverTimeCount;
    // offset: 0x548, bitSize: 0x20(0x4B)
    int32 serverTimeTotal;
    // offset: 0x568, bitSize: 0x48(0x9B)
    char dmlTimezone[9];
    // offset: 0x5b0, bitSize: 0x20(0x4B)
    uint32 patchManifestVersion;
    // offset: 0x5d0, bitSize: 0x20(0x4B)
    int32 serverTimeTotalExceed;
    // offset: 0x5f0, bitSize: 0x20(0x4B)
    float dmlLatitude;
    // offset: 0x610, bitSize: 0x20(0x4B)
    uint32 protocolVersion;
    // offset: 0x630, bitSize: 0x408(0x81B)
    char dmlCity[129];
    // offset: 0xa38, bitSize: 0x80(0x10B)
    char build_version[16];
    // offset: 0xab8, bitSize: 0x40(0x8B)
    uint64 boot_guid;
    // offset: 0xaf8, bitSize: 0x100(0x20B)
    char gametype[32];
    // offset: 0xbf8, bitSize: 0x20(0x4B)
    int32 matchMakingSettingsVersion;
    // offset: 0xc18, bitSize: 0x20(0x4B)
    uint32 utc_end_time_s;
    // offset: 0xc38, bitSize: 0x20(0x4B)
    uint32 utc_start_time_s;
    // offset: 0xc58, bitSize: 0x8(0x1B)
    byte player_count_start;
    // offset: 0xc60, bitSize: 0x20(0x4B)
    uint32 dmlASN;
    // offset: 0xc80, bitSize: 0x20(0x4B)
    uint32 titleID;
    // offset: 0xca0, bitSize: 0x20(0x4B)
    int32 build_number;
    // offset: 0xcc0, bitSize: 0x10(0x2B)
    uint16 srcDDLVersion;
    // offset: 0xcd0, bitSize: 0x20(0x4B)
    int32 serverTimeExceedCount;
    // offset: 0xcf0, bitSize: 0x8(0x1B)
    byte player_count_left;
    // offset: 0xcf8, bitSize: 0x20(0x4B)
    int32 serverTimeMax;
    // offset: 0xd18, bitSize: 0x20(0x4B)
    float dmlLongitude;
    // offset: 0xd38, bitSize: 0x1
    bit is_ranked_match;
    // offset: 0xd39, bitSize: 0x1
    bit is_private_match;
    // offset: 0xd3a, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x8, members: 3
struct Challenge {
    // offset: 0x0, bitSize: 0x1
    bit success;
    // offset: 0x1, bitSize: 0x1
    ChallengeName challengeId;
    // offset: 0x2, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x0, members: 0
struct Life {
}

// bitSize: 0x8a0, members: 48
struct Player {
    // offset: 0x0, bitSize: 0x10(0x2B)
    uint16 hits;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte rank;
    // offset: 0x18, bitSize: 0x20(0x4B)
    int32 exiting_afterlife_arcade;
    // offset: 0x38, bitSize: 0xc8(0x19B)
    byte timesDowned[25];
    // offset: 0x100, bitSize: 0x20(0x4B)
    int32 death;
    // offset: 0x120, bitSize: 0x10(0x2B)
    uint16 downs;
    // offset: 0x130, bitSize: 0x10(0x2B)
    uint16 kills;
    // offset: 0x140, bitSize: 0x10(0x2B)
    uint16 shots;
    // offset: 0x150, bitSize: 0x20(0x4B)
    int32 atm_used;
    // offset: 0x170, bitSize: 0x20(0x4B)
    int32 currency_earned;
    // offset: 0x190, bitSize: 0xc8(0x19B)
    byte timesBledOut[25];
    // offset: 0x258, bitSize: 0x20(0x4B)
    int32 zombie_death;
    // offset: 0x278, bitSize: 0x20(0x4B)
    int32 revived_another_player;
    // offset: 0x298, bitSize: 0xd0(0x1aB)
    char disconnectReason[26];
    // offset: 0x368, bitSize: 0x20(0x4B)
    int32 cashSpentOnAbility;
    // offset: 0x388, bitSize: 0x20(0x4B)
    int32 crafted_item_placed;
    // offset: 0x3a8, bitSize: 0x10(0x2B)
    uint16 revives;
    // offset: 0x3b8, bitSize: 0x8(0x1B)
    byte waveEnd;
    // offset: 0x3c0, bitSize: 0x20(0x4B)
    int32 xp_earned;
    // offset: 0x3e0, bitSize: 0x20(0x4B)
    int32 xpEarned;
    // offset: 0x400, bitSize: 0x20(0x4B)
    int32 isSplitscreen;
    // offset: 0x420, bitSize: 0x8(0x1B)
    byte waveStart;
    // offset: 0x428, bitSize: 0xc8(0x19B)
    byte timesRevived[25];
    // offset: 0x4f0, bitSize: 0x20(0x4B)
    int32 cashSpentOnTrap;
    // offset: 0x510, bitSize: 0x20(0x4B)
    int32 purchasing_for_a_team_door;
    // offset: 0x530, bitSize: 0x20(0x4B)
    int32 faf_card_refill;
    // offset: 0x550, bitSize: 0x20(0x4B)
    int32 moneyEarned;
    // offset: 0x570, bitSize: 0x10(0x2B)
    short validationInfractions;
    // offset: 0x580, bitSize: 0x20(0x4B)
    int32 finalScore;
    // offset: 0x5a0, bitSize: 0x20(0x4B)
    int32 finished_mini_game;
    // offset: 0x5c0, bitSize: 0x20(0x4B)
    int32 purchasing_weapon;
    // offset: 0x5e0, bitSize: 0x170(0x2eB)
    char gamertag[46];
    // offset: 0x750, bitSize: 0x20(0x4B)
    int32 dropped_to_last_stand;
    // offset: 0x770, bitSize: 0x20(0x4B)
    int32 entering_afterlife_arcade;
    // offset: 0x790, bitSize: 0x8(0x1B)
    byte prestige;
    // offset: 0x798, bitSize: 0x20(0x4B)
    int32 cashSpentOnWeapon;
    // offset: 0x7b8, bitSize: 0x20(0x4B)
    int32 opening_the_doors;
    // offset: 0x7d8, bitSize: 0x20(0x4B)
    int32 totalGameplayTime;
    // offset: 0x7f8, bitSize: 0x20(0x4B)
    int32 faf_card_used;
    // offset: 0x818, bitSize: 0x20(0x4B)
    int32 pillage_event;
    // offset: 0x838, bitSize: 0x20(0x4B)
    int32 gamesPlayed;
    // offset: 0x858, bitSize: 0x20(0x4B)
    int32 shots_on_target;
    // offset: 0x878, bitSize: 0x10(0x2B)
    uint16 doorsOpened;
    // offset: 0x888, bitSize: 0x10(0x2B)
    uint16 headShots;
    // offset: 0x898, bitSize: 0x1
    bit JIP;
    // offset: 0x899, bitSize: 0x1
    bit quit;
    // offset: 0x89a, bitSize: 0x1
    bit joinInProgress;
    // offset: 0x89b, bitSize: 0x5
    pad __pad[5];
}

// bitSize: 0x20, members: 1
struct Weapon {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 death;
}

// members: 2
enum ChallengeName {
    "spend_10k" = 0x0,
    "spend_20k" = 0x1,
}

// members: 7
enum EndGameCondition {
    "all_escape" = 0x0,
    "drill_destroyed" = 0x1,
    "died" = 0x2,
    "some_escape" = 0x3,
    "fail_escape" = 0x4,
    "host_quit" = 0x5,
    "gas_fail" = 0x6,
}

