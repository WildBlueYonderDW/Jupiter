// file ddl\mp\jupiter_nongamedata.ddl

// bitSize: 0x9600, members: 2
struct root {
    // offset: 0x95f8, bitSize: 0x8(0x1B)
    ValidationData validationData;
    // offset: 0x0, bitSize: 0x95f8(0x12bfB)
    NonGameData nonGameData;
}

// bitSize: 0x8, members: 2
struct ValidationData {
    // offset: 0x0, bitSize: 0x5
    bit validationHint[5];
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x95f8, members: 63
struct NonGameData {
    // offset: 0x0, bitSize: 0x80(0x10B)
    int32 consoleIDChunkLow[4];
    // offset: 0x80, bitSize: 0x20(0x4B)
    uint32 lastSeenSurveyVersion;
    // offset: 0xa0, bitSize: 0x70c0(0xe18B)
    UnlockTable isNew;
    // offset: 0x7160, bitSize: 0x20(0x4B)
    short customization_background[2];
    // offset: 0x7180, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveWhispers;
    // offset: 0x7188, bitSize: 0x40(0x8B)
    uint64 toastNotificationUnpauseTimestamp;
    // offset: 0x71c8, bitSize: 0xb80(0x170B)
    SeasonalEventData seasonalEvents[8];
    // offset: 0x7d48, bitSize: 0x80(0x10B)
    int32 consoleIDChunkHigh[4];
    // offset: 0x7dc8, bitSize: 0x20(0x4B)
    int32 lastPlayedCategoryID;
    // offset: 0x7de8, bitSize: 0x8(0x1B)
    byte quickplayFilter;
    // offset: 0x7df0, bitSize: 0x80(0x10B)
    int32 playerXuidLow[4];
    // offset: 0x7e70, bitSize: 0x80(0x10B)
    int32 tournamentQuits[4];
    // offset: 0x7ef0, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveFriendRequests;
    // offset: 0x7ef8, bitSize: 0xb8(0x17B)
    uint6 battlePassBreadCrumbs[23];
    // offset: 0x7fb0, bitSize: 0x8(0x1B)
    PartyPrivacySetting partyPrivacySettings;
    // offset: 0x7fb8, bitSize: 0x20(0x4B)
    int32 bigTournamentBanStart;
    // offset: 0x7fd8, bitSize: 0x20(0x4B)
    uint32 mpMotdChecksum;
    // offset: 0x7ff8, bitSize: 0x20(0x4B)
    int32 lastPlayedPlaylistID;
    // offset: 0x8018, bitSize: 0x40(0x8B)
    uint64 influencerCodeTime;
    // offset: 0x8058, bitSize: 0x20(0x4B)
    uint32 dailyChallengesLastSeenTime;
    // offset: 0x8078, bitSize: 0x20(0x4B)
    uint32 brMotdChecksum;
    // offset: 0x8098, bitSize: 0x20(0x4B)
    uint32 dailyChallengesPopupChecksum;
    // offset: 0x80b8, bitSize: 0x258(0x4bB)
    SocialPartySettings socialPartySettings[5];
    // offset: 0x8310, bitSize: 0x20(0x4B)
    uint32 cpMotdChecksum;
    // offset: 0x8330, bitSize: 0x20(0x4B)
    int32 tokensEarnedSinceLastBattlePassUpsell;
    // offset: 0x8350, bitSize: 0x80(0x10B)
    int32 connectionIDChunkHigh[4];
    // offset: 0x83d0, bitSize: 0x20(0x4B)
    uint32 spUninstallPromptLastSeenTimestamp;
    // offset: 0x83f0, bitSize: 0x20(0x4B)
    uint32 lastBattlePassMenuXp;
    // offset: 0x8410, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveChannelInvites;
    // offset: 0x8418, bitSize: 0x80(0x10B)
    int32 connectionIDChunkLow[4];
    // offset: 0x8498, bitSize: 0x20(0x4B)
    uint32 lastRank;
    // offset: 0x84b8, bitSize: 0x10(0x2B)
    DefaultPartySettings defaultPartySettings;
    // offset: 0x84c8, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveActivityInvites;
    // offset: 0x84d0, bitSize: 0x80(0x10B)
    int32 playerXuidHigh[4];
    // offset: 0x8550, bitSize: 0x40(0x8B)
    int32 maxPrivatePartySize[2];
    // offset: 0x8590, bitSize: 0x20(0x4B)
    short customization_patch[2];
    // offset: 0x85b0, bitSize: 0x20(0x4B)
    int32 lastSeenActiveArmoryIndex;
    // offset: 0x85d0, bitSize: 0xa80(0x150B)
    DeviceConnectionHistory deviceConnectionHistory[3];
    // offset: 0x9050, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveGroupInvites;
    // offset: 0x9058, bitSize: 0x20(0x4B)
    short customization_playercard_frame[2];
    // offset: 0x9078, bitSize: 0x20(0x4B)
    short customization_playercard_title[2];
    // offset: 0x9098, bitSize: 0x80(0x10B)
    PlayerSortPreferences sortPreferences;
    // offset: 0x9118, bitSize: 0x200(0x40B)
    char savedUsername[64];
    // offset: 0x9318, bitSize: 0x200(0x40B)
    char influencerCode[64];
    // offset: 0x9518, bitSize: 0x8(0x1B)
    byte lastBattlePassFreeTierSeen;
    // offset: 0x9520, bitSize: 0x20(0x4B)
    uint32 storeLastSeenTime;
    // offset: 0x9540, bitSize: 0x8(0x1B)
    byte battlePassPurchasePendingSeason;
    // offset: 0x9548, bitSize: 0x20(0x4B)
    int32 currentTournament;
    // offset: 0x9568, bitSize: 0x60(0xcB)
    PlayerConnectionHistory playerConnectionHistory;
    // offset: 0x95c8, bitSize: 0x1
    bit toggleOfflineFriends;
    // offset: 0x95c9, bitSize: 0x1
    bit alreadySeenSettingsMenu;
    // offset: 0x95ca, bitSize: 0x1
    bit isBPOnboardingCleared;
    // offset: 0x95cb, bitSize: 0x1
    bit wereOperatorExecutionsValidated;
    // offset: 0x95cc, bitSize: 0x1
    bit cross_play_enabled;
    // offset: 0x95cd, bitSize: 0x1
    bit isShowProsAndConsEnabled;
    // offset: 0x95ce, bitSize: 0x1
    bit hasAnyTempBanActive;
    // offset: 0x95cf, bitSize: 0x1
    bit mobileShaderDlogStarted;
    // offset: 0x95d0, bitSize: 0x1
    bit muteOnJoinParty;
    // offset: 0x95d1, bitSize: 0x1
    bit party_autofill_lock;
    // offset: 0x95d2, bitSize: 0x1
    bit disableProximityVoice;
    // offset: 0x95d3, bitSize: 0x1
    bit wasProtuningPlayerDataConverted;
    // offset: 0x95d4, bitSize: 0x20(0x4B)
    bit postShipFlags[32];
    // offset: 0x95f4, bitSize: 0x4
    pad __pad[4];
}

// bitSize: 0x70c0, members: 30
struct UnlockTable {
    // offset: 0x0, bitSize: 0x880(0x110B)
    int32 camo[68];
    // offset: 0x880, bitSize: 0xc0(0x18B)
    int32 perk[6];
    // offset: 0x940, bitSize: 0x20(0x4B)
    int32 temp[1];
    // offset: 0x960, bitSize: 0x40(0x8B)
    int32 super[2];
    // offset: 0x9a0, bitSize: 0xa0(0x14B)
    int32 firstpartylicense[5];
    // offset: 0xa40, bitSize: 0xa0(0x14B)
    int32 gun_screen[5];
    // offset: 0xae0, bitSize: 0xc0(0x18B)
    int32 executions[6];
    // offset: 0xba0, bitSize: 0xa40(0x148B)
    int32 playercards[82];
    // offset: 0x1a20, bitSize: 0x20(0x4B)
    int32 currencypack[1];
    // offset: 0x1a40, bitSize: 0x60(0xcB)
    int32 equipment[3];
    // offset: 0x1aa0, bitSize: 0x60(0xcB)
    int32 reticle[3];
    // offset: 0x1b00, bitSize: 0x280(0x50B)
    int32 operator_skin[20];
    // offset: 0x1d80, bitSize: 0x2a0(0x54B)
    int32 loadingscreen[21];
    // offset: 0x2020, bitSize: 0x60(0xcB)
    int32 vehicle_track[3];
    // offset: 0x2080, bitSize: 0x20(0x4B)
    int32 parachute[1];
    // offset: 0x20a0, bitSize: 0x20(0x4B)
    int32 battlepass[1];
    // offset: 0x20c0, bitSize: 0xe0(0x1cB)
    int32 vehicle_camo[7];
    // offset: 0x21a0, bitSize: 0x20(0x4B)
    int32 vehicle_horn[1];
    // offset: 0x21c0, bitSize: 0x20(0x4B)
    int32 special[1];
    // offset: 0x21e0, bitSize: 0x3320(0x664B)
    int32 attachment[409];
    // offset: 0x5500, bitSize: 0x4a0(0x94B)
    int32 sticker[37];
    // offset: 0x59a0, bitSize: 0x9c0(0x138B)
    int32 emblems[78];
    // offset: 0x6360, bitSize: 0x40(0x8B)
    int32 calloutmarkerpingitem[2];
    // offset: 0x63a0, bitSize: 0x40(0x8B)
    int32 feature[2];
    // offset: 0x63e0, bitSize: 0x640(0xc8B)
    int32 weapon[50];
    // offset: 0x6a20, bitSize: 0x40(0x8B)
    int32 killstreak[2];
    // offset: 0x6a60, bitSize: 0x20(0x4B)
    int32 contrail[1];
    // offset: 0x6a80, bitSize: 0x80(0x10B)
    int32 operator[4];
    // offset: 0x6b00, bitSize: 0x5c0(0xb8B)
    int32 consumable[46];
    // offset: 0x15e0, bitSize: 0x440(0x88B)
    int32 weapon_charm[34];
}

// bitSize: 0x380, members: 10
struct DeviceConnectionHistory {
    // offset: 0x0, bitSize: 0x10(0x2B)
    short suckedAsHost;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte deviceUseFrequency;
    // offset: 0x18, bitSize: 0x80(0x10B)
    byte bandwidthUp[16];
    // offset: 0x98, bitSize: 0x200(0x40B)
    char deviceDescriptor[64];
    // offset: 0x298, bitSize: 0x20(0x4B)
    int32 bandwidthTestCount;
    // offset: 0x2b8, bitSize: 0x80(0x10B)
    byte bandwidthDown[16];
    // offset: 0x338, bitSize: 0x20(0x4B)
    int32 device_id_low;
    // offset: 0x358, bitSize: 0x20(0x4B)
    int32 device_id_high;
    // offset: 0x378, bitSize: 0x1
    bit onWifi;
    // offset: 0x379, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x60, members: 3
struct PlayerConnectionHistory {
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 migrateableQuits;
    // offset: 0x40, bitSize: 0x20(0x4B)
    int32 nonMigrateableQuits;
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 gameCount;
}

// bitSize: 0x80, members: 7
struct PlayerSortPreferences {
    // offset: 0x0, bitSize: 0x10(0x2B)
    GesturesSortPreferences gesturesSortPreference;
    // offset: 0x10, bitSize: 0x18(0x3B)
    EmblemSortPreferences emblemSortPreference;
    // offset: 0x28, bitSize: 0x10(0x2B)
    StickersSortPreferences stickerSortPreference;
    // offset: 0x38, bitSize: 0x10(0x2B)
    CharmsSortPreferences charmsSortPreference;
    // offset: 0x60, bitSize: 0x10(0x2B)
    VehicleSortPreferences vehicleSortPreference;
    // offset: 0x70, bitSize: 0x10(0x2B)
    CallingCardSortPreferences callingcardSortPreference;
    // offset: 0x48, bitSize: 0x18(0x3B)
    AttachmentSortPreferences attachmentSortPreference;
}

// bitSize: 0x10, members: 2
struct CallingCardSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    RaritySortOptions raritySortPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    SeasonSortOptions seasonSortPreference;
}

// bitSize: 0x18, members: 4
struct EmblemSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    RaritySortOptions raritySortPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    SeasonSortOptions seasonSortPreference;
    // offset: 0x10, bitSize: 0x1
    OfficerProgressionSortOptions officerSortPreference;
    // offset: 0x11, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x10, members: 2
struct GesturesSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    RaritySortOptions raritySortPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    SeasonSortOptions seasonSortPreference;
}

// bitSize: 0x10, members: 2
struct CharmsSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    RaritySortOptions raritySortPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    SeasonSortOptions seasonSortPreference;
}

// bitSize: 0x10, members: 2
struct StickersSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    RaritySortOptions raritySortPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    SeasonSortOptions seasonSortPreference;
}

// bitSize: 0x18, members: 4
struct AttachmentSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    AttachmentStatsPreferences attachmentStatsPreference;
    // offset: 0x8, bitSize: 0x8(0x1B)
    UnlockPreferences unlockPreference;
    // offset: 0x10, bitSize: 0x1
    bit aftermarketParts;
    // offset: 0x11, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x8, members: 8
struct AttachmentStatsPreferences {
    // offset: 0x0, bitSize: 0x1
    bit handling;
    // offset: 0x1, bitSize: 0x1
    bit range;
    // offset: 0x2, bitSize: 0x1
    bit accuracy;
    // offset: 0x3, bitSize: 0x1
    bit damage;
    // offset: 0x4, bitSize: 0x1
    bit recoil;
    // offset: 0x5, bitSize: 0x1
    bit mobility;
    // offset: 0x6, bitSize: 0x1
    bit fire_rate;
    // offset: 0x7, bitSize: 0x1
    pad __pad[1];
}

// bitSize: 0x8, members: 3
struct UnlockPreferences {
    // offset: 0x0, bitSize: 0x1
    bit locked;
    // offset: 0x1, bitSize: 0x1
    bit unlocked;
    // offset: 0x2, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x10, members: 2
struct VehicleSortPreferences {
    // offset: 0x0, bitSize: 0x8(0x1B)
    CamoActiveFilter camoActiveFilter;
    // offset: 0x8, bitSize: 0x8(0x1B)
    TrackActiveFilter trackActiveFilter;
}

// bitSize: 0x78, members: 6
struct SocialPartySettings {
    // offset: 0x0, bitSize: 0x20(0x4B)
    uint32 color;
    // offset: 0x20, bitSize: 0x40(0x8B)
    uint64 partyId;
    // offset: 0x60, bitSize: 0x8(0x1B)
    NotificationSettings notificationSettings;
    // offset: 0x68, bitSize: 0x8(0x1B)
    FeedFilterSettings feedFilters;
    // offset: 0x70, bitSize: 0x1
    bit useDefault;
    // offset: 0x71, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x8, members: 8
struct NotificationSettings {
    // offset: 0x0, bitSize: 0x1
    bit broadcastChannelInvite;
    // offset: 0x1, bitSize: 0x1
    bit broadcastClanInvite;
    // offset: 0x2, bitSize: 0x1
    bit broadcastGroupInvite;
    // offset: 0x3, bitSize: 0x1
    bit voiceShareStarted;
    // offset: 0x4, bitSize: 0x1
    bit newMember;
    // offset: 0x5, bitSize: 0x1
    bit broadcastPartyInvite;
    // offset: 0x6, bitSize: 0x1
    bit newTextChatMessages;
    // offset: 0x7, bitSize: 0x1
    pad __pad[1];
}

// bitSize: 0x8, members: 6
struct FeedFilterSettings {
    // offset: 0x0, bitSize: 0x1
    bit broadcastChannelInvite;
    // offset: 0x1, bitSize: 0x1
    bit memberTextMessages;
    // offset: 0x2, bitSize: 0x1
    bit broadcastClanInvite;
    // offset: 0x3, bitSize: 0x1
    bit broadcastGroupInvite;
    // offset: 0x4, bitSize: 0x1
    bit broadcastPartyInvite;
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x10, members: 2
struct DefaultPartySettings {
    // offset: 0x8, bitSize: 0x8(0x1B)
    FeedFilterSettings feedFilters;
    // offset: 0x0, bitSize: 0x8(0x1B)
    NotificationSettings notificationSettings;
}

// bitSize: 0x170, members: 6
struct SeasonalEventData {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char eventName[32];
    // offset: 0x100, bitSize: 0x20(0x4B)
    int32 preMatchChallengeProgress;
    // offset: 0x120, bitSize: 0x8(0x1B)
    byte communityMilestonesUnlocksSeen;
    // offset: 0x128, bitSize: 0x40(0x8B)
    bit seasonalChallengesUnlocksSeen[64];
    // offset: 0x168, bitSize: 0x1
    bit hasSeenOnboarding;
    // offset: 0x169, bitSize: 0x7
    pad __pad[7];
}

// members: 4
enum PartyPrivacySetting {
    "public" = 0x0,
    "joinable_by_friends" = 0x1,
    "invite_only" = 0x2,
    "closed" = 0x3,
}

// members: 4
enum SocialPrivacySetting {
    "everyone" = 0x0,
    "socially_connected" = 0x1,
    "friends_only" = 0x2,
    "no_one" = 0x3,
}

// members: 3
enum RaritySortOptions {
    "rarity_high_first" = 0x0,
    "rarity_low_first" = 0x1,
    "rarity_none" = 0x2,
}

// members: 3
enum SeasonSortOptions {
    "season_recent_first" = 0x0,
    "season_old_first" = 0x1,
    "season_none" = 0x2,
}

// members: 2
enum OfficerProgressionSortOptions {
    "officer_none" = 0x0,
    "officer_first" = 0x1,
}

// members: 5
enum CamoActiveFilter {
    "all" = 0x0,
    "favorites" = 0x1,
    "collected" = 0x2,
    "fromBattlePass" = 0x3,
    "fromStoreBundle" = 0x4,
}

// members: 4
enum TrackActiveFilter {
    "all" = 0x0,
    "favorites" = 0x1,
    "unlocked" = 0x2,
    "fromBattlePass" = 0x3,
}

