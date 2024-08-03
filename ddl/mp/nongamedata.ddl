// file ddl\mp\nongamedata.ddl

// bitSize: 0x6dd0, members: 2
struct root {
    // offset: 0x6dc8, bitSize: 0x8(0x1B)
    ValidationData validationData;
    // offset: 0x0, bitSize: 0x6dc8(0xdb9B)
    NonGameData nonGameData;
}

// bitSize: 0x8, members: 2
struct ValidationData {
    // offset: 0x0, bitSize: 0x5
    bit validationHint[5];
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x6dc8, members: 66
struct NonGameData {
    // offset: 0x0, bitSize: 0x80(0x10B)
    int32 consoleIDChunkLow[4];
    // offset: 0x80, bitSize: 0x20(0x4B)
    uint32 lastSeenSurveyVersion;
    // offset: 0xa0, bitSize: 0x50e0(0xa1cB)
    UnlockTable isNew;
    // offset: 0x5180, bitSize: 0xd0(0x1aB)
    SeasonalEventData seasonalEvent;
    // offset: 0x5250, bitSize: 0x30(0x6B)
    uint19 customization_background[2];
    // offset: 0x5280, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveWhispers;
    // offset: 0x5288, bitSize: 0x40(0x8B)
    uint64 toastNotificationUnpauseTimestamp;
    // offset: 0x52c8, bitSize: 0x20(0x4B)
    uint32 lastSeenChapterSteamOverlayOffToast;
    // offset: 0x52e8, bitSize: 0x80(0x10B)
    int32 consoleIDChunkHigh[4];
    // offset: 0x5368, bitSize: 0x20(0x4B)
    int32 lastPlayedCategoryID;
    // offset: 0x5388, bitSize: 0x8(0x1B)
    byte quickplayFilter;
    // offset: 0x5390, bitSize: 0x80(0x10B)
    int32 playerXuidLow[4];
    // offset: 0x5410, bitSize: 0x80(0x10B)
    int32 tournamentQuits[4];
    // offset: 0x5490, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveFriendRequests;
    // offset: 0x5498, bitSize: 0x200(0x40B)
    char lastPlayedPlayMenuRef[64];
    // offset: 0x5698, bitSize: 0xb8(0x17B)
    uint6 battlePassBreadCrumbs[23];
    // offset: 0x5750, bitSize: 0x8(0x1B)
    PartyPrivacySetting partyPrivacySettings;
    // offset: 0x5758, bitSize: 0x20(0x4B)
    int32 bigTournamentBanStart;
    // offset: 0x5778, bitSize: 0x20(0x4B)
    uint32 mpMotdChecksum;
    // offset: 0x5798, bitSize: 0x20(0x4B)
    int32 lastPlayedPlaylistID;
    // offset: 0x57b8, bitSize: 0x40(0x8B)
    uint64 influencerCodeTime;
    // offset: 0x57f8, bitSize: 0x20(0x4B)
    uint32 dailyChallengesLastSeenTime;
    // offset: 0x5818, bitSize: 0x20(0x4B)
    uint32 brMotdChecksum;
    // offset: 0x5838, bitSize: 0x20(0x4B)
    uint32 dailyChallengesPopupChecksum;
    // offset: 0x5858, bitSize: 0x258(0x4bB)
    SocialPartySettings socialPartySettings[5];
    // offset: 0x5ab0, bitSize: 0x20(0x4B)
    uint32 cpMotdChecksum;
    // offset: 0x5ad0, bitSize: 0x20(0x4B)
    int32 tokensEarnedSinceLastBattlePassUpsell;
    // offset: 0x5af0, bitSize: 0x80(0x10B)
    int32 connectionIDChunkHigh[4];
    // offset: 0x5b70, bitSize: 0x20(0x4B)
    uint32 spUninstallPromptLastSeenTimestamp;
    // offset: 0x5b90, bitSize: 0x20(0x4B)
    uint32 lastBattlePassMenuXp;
    // offset: 0x5bb0, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveChannelInvites;
    // offset: 0x5bb8, bitSize: 0x80(0x10B)
    int32 connectionIDChunkLow[4];
    // offset: 0x5c38, bitSize: 0x20(0x4B)
    uint32 lastRank;
    // offset: 0x5c58, bitSize: 0x20(0x4B)
    uint32 lastSeenSeasonSteamOverlayOffToast;
    // offset: 0x5c78, bitSize: 0x10(0x2B)
    DefaultPartySettings defaultPartySettings;
    // offset: 0x5c88, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveActivityInvites;
    // offset: 0x5c90, bitSize: 0x80(0x10B)
    int32 playerXuidHigh[4];
    // offset: 0x5d10, bitSize: 0x40(0x8B)
    int32 maxPrivatePartySize[2];
    // offset: 0x5d50, bitSize: 0x30(0x6B)
    uint19 customization_patch[2];
    // offset: 0x5d80, bitSize: 0x20(0x4B)
    int32 lastSeenActiveArmoryIndex;
    // offset: 0x5da0, bitSize: 0xa80(0x150B)
    DeviceConnectionHistory deviceConnectionHistory[3];
    // offset: 0x6820, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveGroupInvites;
    // offset: 0x6828, bitSize: 0x20(0x4B)
    short customization_playercard_frame[2];
    // offset: 0x6848, bitSize: 0x20(0x4B)
    short customization_playercard_title[2];
    // offset: 0x6868, bitSize: 0x80(0x10B)
    PlayerSortPreferences sortPreferences;
    // offset: 0x68e8, bitSize: 0x200(0x40B)
    char savedUsername[64];
    // offset: 0x6ae8, bitSize: 0x200(0x40B)
    char influencerCode[64];
    // offset: 0x6ce8, bitSize: 0x8(0x1B)
    byte lastBattlePassFreeTierSeen;
    // offset: 0x6cf0, bitSize: 0x20(0x4B)
    uint32 storeLastSeenTime;
    // offset: 0x6d10, bitSize: 0x8(0x1B)
    byte battlePassPurchasePendingSeason;
    // offset: 0x6d18, bitSize: 0x20(0x4B)
    int32 currentTournament;
    // offset: 0x6d38, bitSize: 0x60(0xcB)
    PlayerConnectionHistory playerConnectionHistory;
    // offset: 0x6d98, bitSize: 0x1
    bit toggleOfflineFriends;
    // offset: 0x6d99, bitSize: 0x1
    bit isBPOnboardingCleared;
    // offset: 0x6d9a, bitSize: 0x1
    bit cross_play_enabled;
    // offset: 0x6d9b, bitSize: 0x1
    bit isShowProsAndConsEnabled;
    // offset: 0x6d9c, bitSize: 0x1
    bit hasAnyTempBanActive;
    // offset: 0x6d9d, bitSize: 0x1
    bit executionValidationRequired;
    // offset: 0x6d9e, bitSize: 0x1
    bit mobileShaderDlogStarted;
    // offset: 0x6d9f, bitSize: 0x1
    bit muteOnJoinParty;
    // offset: 0x6da0, bitSize: 0x1
    bit party_autofill_lock;
    // offset: 0x6da1, bitSize: 0x1
    bit disableProximityVoice;
    // offset: 0x6da2, bitSize: 0x1
    bit wasProtuningPlayerDataConverted;
    // offset: 0x6da3, bitSize: 0x1
    bit didFixRoyalKnifeVariantIndexMixUp;
    // offset: 0x6da4, bitSize: 0x20(0x4B)
    bit postShipFlags[32];
    // offset: 0x6dc4, bitSize: 0x4
    pad __pad[4];
}

// bitSize: 0x50e0, members: 41
struct UnlockTable {
    // offset: 0x0, bitSize: 0x280(0x50B)
    int32 camo[20];
    // offset: 0x280, bitSize: 0x40(0x8B)
    int32 perk[2];
    // offset: 0x2c0, bitSize: 0x20(0x4B)
    int32 role[1];
    // offset: 0x2e0, bitSize: 0x20(0x4B)
    int32 temp[1];
    // offset: 0x300, bitSize: 0x20(0x4B)
    int32 intro[1];
    // offset: 0x320, bitSize: 0x40(0x8B)
    int32 super[2];
    // offset: 0x360, bitSize: 0x20(0x4B)
    int32 special_weapon[1];
    // offset: 0x380, bitSize: 0xa0(0x14B)
    int32 firstpartylicense[5];
    // offset: 0x420, bitSize: 0xa0(0x14B)
    int32 gun_screen[5];
    // offset: 0x4c0, bitSize: 0x80(0x10B)
    int32 executions[4];
    // offset: 0x540, bitSize: 0x680(0xd0B)
    int32 playercards[52];
    // offset: 0xbc0, bitSize: 0x20(0x4B)
    int32 munition[1];
    // offset: 0xf80, bitSize: 0x120(0x24B)
    int32 faction_progression[9];
    // offset: 0x10a0, bitSize: 0x20(0x4B)
    int32 currencypack[1];
    // offset: 0x10c0, bitSize: 0x20(0x4B)
    int32 mission[1];
    // offset: 0x10e0, bitSize: 0x60(0xcB)
    int32 equipment[3];
    // offset: 0x1140, bitSize: 0x60(0xcB)
    int32 reticle[3];
    // offset: 0x11a0, bitSize: 0x1c0(0x38B)
    int32 operator_quip[14];
    // offset: 0x1360, bitSize: 0x160(0x2cB)
    int32 operator_skin[11];
    // offset: 0x14c0, bitSize: 0x20(0x4B)
    int32 blackcell[1];
    // offset: 0x14e0, bitSize: 0x280(0x50B)
    int32 loadingscreen[20];
    // offset: 0x1760, bitSize: 0x60(0xcB)
    int32 vehicle_track[3];
    // offset: 0x17c0, bitSize: 0x20(0x4B)
    int32 parachute[1];
    // offset: 0x17e0, bitSize: 0x20(0x4B)
    int32 gestures[1];
    // offset: 0x1800, bitSize: 0x20(0x4B)
    int32 sp_reward[1];
    // offset: 0x1820, bitSize: 0x20(0x4B)
    int32 battlepass[1];
    // offset: 0x1840, bitSize: 0x100(0x20B)
    int32 vehicle_camo[8];
    // offset: 0x1940, bitSize: 0x20(0x4B)
    int32 vehicle_horn[1];
    // offset: 0x1960, bitSize: 0x20(0x4B)
    int32 special[1];
    // offset: 0x1980, bitSize: 0x20c0(0x418B)
    int32 attachment[262];
    // offset: 0x3a40, bitSize: 0x480(0x90B)
    int32 sticker[36];
    // offset: 0x3ec0, bitSize: 0xc0(0x18B)
    int32 accolades[6];
    // offset: 0x3f80, bitSize: 0x6e0(0xdcB)
    int32 emblems[55];
    // offset: 0x4660, bitSize: 0x20(0x4B)
    int32 calloutmarkerpingitem[1];
    // offset: 0x4680, bitSize: 0x20(0x4B)
    int32 feature[1];
    // offset: 0x46a0, bitSize: 0x400(0x80B)
    int32 weapon[32];
    // offset: 0x4aa0, bitSize: 0x40(0x8B)
    int32 killstreak[2];
    // offset: 0x4ae0, bitSize: 0x20(0x4B)
    int32 contrail[1];
    // offset: 0x4b00, bitSize: 0x40(0x8B)
    int32 operator[2];
    // offset: 0x4b40, bitSize: 0x5a0(0xb4B)
    int32 consumable[45];
    // offset: 0xbe0, bitSize: 0x3a0(0x74B)
    int32 weapon_charm[29];
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

// bitSize: 0xd0, members: 5
struct SeasonalEventData {
    // offset: 0x0, bitSize: 0x80(0x10B)
    char eventName[16];
    // offset: 0x80, bitSize: 0x8(0x1B)
    byte communityMilestonesUnlocksSeen;
    // offset: 0x88, bitSize: 0x40(0x8B)
    bit seasonalChallengesUnlocksSeen[64];
    // offset: 0xc8, bitSize: 0x1
    bit hasSeenOnboarding;
    // offset: 0xc9, bitSize: 0x7
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

