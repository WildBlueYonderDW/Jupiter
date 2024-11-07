// file ddl\mp\jupiter_nongamedata.ddl

// bitSize: 0xd230, members: 2
struct root {
    // offset: 0xd228, bitSize: 0x8(0x1B)
    ValidationData validationData;
    // offset: 0x0, bitSize: 0xd228(0x1a45B)
    NonGameData nonGameData;
}

// bitSize: 0x8, members: 2
struct ValidationData {
    // offset: 0x0, bitSize: 0x5
    bit validationHint[5];
    // offset: 0x5, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0xd228, members: 71
struct NonGameData {
    // offset: 0x0, bitSize: 0x80(0x10B)
    int32 consoleIDChunkLow[4];
    // offset: 0x80, bitSize: 0x20(0x4B)
    uint32 lastSeenSurveyVersion;
    // offset: 0xa0, bitSize: 0x280(0x50B)
    int32 wishlistedSkuIDsOnSaleNotificationDisplayed[20];
    // offset: 0x320, bitSize: 0x9bc0(0x1378B)
    UnlockTable isNew;
    // offset: 0x9ee0, bitSize: 0x40(0x8B)
    uint32 customization_background[2];
    // offset: 0x9f20, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveWhispers;
    // offset: 0x9f28, bitSize: 0x40(0x8B)
    uint64 toastNotificationUnpauseTimestamp;
    // offset: 0x9f68, bitSize: 0x20(0x4B)
    uint32 lastSeenChapterSteamOverlayOffToast;
    // offset: 0x9f88, bitSize: 0xe80(0x1d0B)
    SeasonalEventData seasonalEvents[8];
    // offset: 0xae08, bitSize: 0x80(0x10B)
    int32 consoleIDChunkHigh[4];
    // offset: 0xae88, bitSize: 0x20(0x4B)
    int32 lastPlayedCategoryID;
    // offset: 0xaea8, bitSize: 0x8(0x1B)
    byte quickplayFilter;
    // offset: 0xaeb0, bitSize: 0x80(0x10B)
    int32 playerXuidLow[4];
    // offset: 0xaf30, bitSize: 0x280(0x50B)
    TrackedChallenge trackedChallenge[10];
    // offset: 0xb1b0, bitSize: 0x80(0x10B)
    int32 tournamentQuits[4];
    // offset: 0xb230, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveFriendRequests;
    // offset: 0xb238, bitSize: 0x200(0x40B)
    char lastPlayedPlayMenuRef[64];
    // offset: 0xb438, bitSize: 0xb8(0x17B)
    uint6 battlePassBreadCrumbs[23];
    // offset: 0xb4f0, bitSize: 0x8(0x1B)
    PartyPrivacySetting partyPrivacySettings;
    // offset: 0xb4f8, bitSize: 0x20(0x4B)
    int32 bigTournamentBanStart;
    // offset: 0xb518, bitSize: 0x20(0x4B)
    uint32 mpMotdChecksum;
    // offset: 0xb538, bitSize: 0x20(0x4B)
    int32 lastPlayedPlaylistID;
    // offset: 0xb558, bitSize: 0x40(0x8B)
    uint64 influencerCodeTime;
    // offset: 0xb598, bitSize: 0x20(0x4B)
    uint32 dailyChallengesLastSeenTime;
    // offset: 0xb5b8, bitSize: 0x20(0x4B)
    uint32 brMotdChecksum;
    // offset: 0xb5d8, bitSize: 0x20(0x4B)
    uint32 dailyChallengesPopupChecksum;
    // offset: 0xb5f8, bitSize: 0x258(0x4bB)
    SocialPartySettings socialPartySettings[5];
    // offset: 0xb850, bitSize: 0x20(0x4B)
    uint32 cpMotdChecksum;
    // offset: 0xb870, bitSize: 0x20(0x4B)
    int32 tokensEarnedSinceLastBattlePassUpsell;
    // offset: 0xb890, bitSize: 0x80(0x10B)
    int32 connectionIDChunkHigh[4];
    // offset: 0xb910, bitSize: 0x20(0x4B)
    uint32 spUninstallPromptLastSeenTimestamp;
    // offset: 0xb930, bitSize: 0x20(0x4B)
    uint32 lastBattlePassMenuXp;
    // offset: 0xb950, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveChannelInvites;
    // offset: 0xb958, bitSize: 0x80(0x10B)
    int32 connectionIDChunkLow[4];
    // offset: 0xb9d8, bitSize: 0x20(0x4B)
    uint32 lastRank;
    // offset: 0xb9f8, bitSize: 0x20(0x4B)
    uint32 lastSeenSeasonSteamOverlayOffToast;
    // offset: 0xba18, bitSize: 0x10(0x2B)
    DefaultPartySettings defaultPartySettings;
    // offset: 0xba28, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveActivityInvites;
    // offset: 0xba30, bitSize: 0x80(0x10B)
    int32 playerXuidHigh[4];
    // offset: 0xbab0, bitSize: 0x20(0x4B)
    int32 duplicateAttachmentValidationVersion;
    // offset: 0xbad0, bitSize: 0x40(0x8B)
    int32 maxPrivatePartySize[2];
    // offset: 0xbb10, bitSize: 0x650(0xcaB)
    TelescopeData telescopeData;
    // offset: 0xc160, bitSize: 0x40(0x8B)
    uint32 customization_patch[2];
    // offset: 0xc1a0, bitSize: 0x20(0x4B)
    int32 lastSeenActiveArmoryIndex;
    // offset: 0xc1c0, bitSize: 0xa80(0x150B)
    DeviceConnectionHistory deviceConnectionHistory[3];
    // offset: 0xcc40, bitSize: 0x8(0x1B)
    SocialPrivacySetting receiveGroupInvites;
    // offset: 0xcc48, bitSize: 0x40(0x8B)
    uint32 customization_playercard_frame[2];
    // offset: 0xcc88, bitSize: 0x40(0x8B)
    uint32 customization_playercard_title[2];
    // offset: 0xccc8, bitSize: 0x80(0x10B)
    PlayerSortPreferences sortPreferences;
    // offset: 0xcd48, bitSize: 0x200(0x40B)
    char savedUsername[64];
    // offset: 0xcf48, bitSize: 0x200(0x40B)
    char influencerCode[64];
    // offset: 0xd148, bitSize: 0x8(0x1B)
    byte lastBattlePassFreeTierSeen;
    // offset: 0xd150, bitSize: 0x20(0x4B)
    uint32 storeLastSeenTime;
    // offset: 0xd170, bitSize: 0x8(0x1B)
    byte battlePassPurchasePendingSeason;
    // offset: 0xd178, bitSize: 0x20(0x4B)
    int32 currentTournament;
    // offset: 0xd198, bitSize: 0x60(0xcB)
    PlayerConnectionHistory playerConnectionHistory;
    // offset: 0xd1f8, bitSize: 0x1
    bit toggleOfflineFriends;
    // offset: 0xd1f9, bitSize: 0x1
    bit alreadySeenSettingsMenu;
    // offset: 0xd1fa, bitSize: 0x1
    bit isBPOnboardingCleared;
    // offset: 0xd1fb, bitSize: 0x1
    bit wereOperatorExecutionsValidated;
    // offset: 0xd1fc, bitSize: 0x1
    bit cross_play_enabled;
    // offset: 0xd1fd, bitSize: 0x1
    bit isShowProsAndConsEnabled;
    // offset: 0xd1fe, bitSize: 0x1
    bit hasAnyTempBanActive;
    // offset: 0xd1ff, bitSize: 0x1
    bit mobileShaderDlogStarted;
    // offset: 0xd200, bitSize: 0x1
    bit wereWeaponEquippedAttachmentCategoriesValidated;
    // offset: 0xd201, bitSize: 0x1
    bit muteOnJoinParty;
    // offset: 0xd202, bitSize: 0x1
    bit party_autofill_lock;
    // offset: 0xd203, bitSize: 0x1
    bit disableProximityVoice;
    // offset: 0xd204, bitSize: 0x1
    bit wasProtuningPlayerDataConverted;
    // offset: 0xd205, bitSize: 0x20(0x4B)
    bit postShipFlags[32];
    // offset: 0xd225, bitSize: 0x3
    pad __pad[3];
}

// bitSize: 0x9bc0, members: 33
struct UnlockTable {
    // offset: 0x0, bitSize: 0xb60(0x16cB)
    int32 camo[91];
    // offset: 0xb60, bitSize: 0xc0(0x18B)
    int32 perk[6];
    // offset: 0xc20, bitSize: 0x20(0x4B)
    int32 temp[1];
    // offset: 0xc40, bitSize: 0x60(0xcB)
    int32 super[3];
    // offset: 0xca0, bitSize: 0xa0(0x14B)
    int32 firstpartylicense[5];
    // offset: 0xd40, bitSize: 0xa0(0x14B)
    int32 gun_screen[5];
    // offset: 0xde0, bitSize: 0x100(0x20B)
    int32 executions[8];
    // offset: 0xee0, bitSize: 0xce0(0x19cB)
    int32 playercards[103];
    // offset: 0x2100, bitSize: 0x20(0x4B)
    int32 currencypack[1];
    // offset: 0x2120, bitSize: 0x20(0x4B)
    int32 mission[1];
    // offset: 0x2140, bitSize: 0x80(0x10B)
    int32 equipment[4];
    // offset: 0x21c0, bitSize: 0x60(0xcB)
    int32 reticle[3];
    // offset: 0x2220, bitSize: 0x3e0(0x7cB)
    int32 operator_skin[31];
    // offset: 0x2600, bitSize: 0x300(0x60B)
    int32 loadingscreen[24];
    // offset: 0x2900, bitSize: 0x60(0xcB)
    int32 vehicle_track[3];
    // offset: 0x2960, bitSize: 0x20(0x4B)
    int32 parachute[1];
    // offset: 0x2980, bitSize: 0x20(0x4B)
    int32 battlepass[1];
    // offset: 0x29a0, bitSize: 0x120(0x24B)
    int32 vehicle_camo[9];
    // offset: 0x2ac0, bitSize: 0x20(0x4B)
    int32 vehicle_horn[1];
    // offset: 0x2ae0, bitSize: 0x20(0x4B)
    int32 special[1];
    // offset: 0x2b00, bitSize: 0x4c20(0x984B)
    int32 attachment[609];
    // offset: 0x7720, bitSize: 0x740(0xe8B)
    int32 sticker[58];
    // offset: 0x7e60, bitSize: 0xc40(0x188B)
    int32 emblems[98];
    // offset: 0x8aa0, bitSize: 0x40(0x8B)
    int32 calloutmarkerpingitem[2];
    // offset: 0x8ae0, bitSize: 0x40(0x8B)
    int32 feature[2];
    // offset: 0x8b20, bitSize: 0x20(0x4B)
    int32 genericblueprint[1];
    // offset: 0x8b40, bitSize: 0x900(0x120B)
    int32 weapon[72];
    // offset: 0x9440, bitSize: 0x20(0x4B)
    int32 instanceloot[1];
    // offset: 0x9460, bitSize: 0x40(0x8B)
    int32 killstreak[2];
    // offset: 0x94a0, bitSize: 0x20(0x4B)
    int32 contrail[1];
    // offset: 0x94c0, bitSize: 0xa0(0x14B)
    int32 operator[5];
    // offset: 0x9560, bitSize: 0x660(0xccB)
    int32 consumable[51];
    // offset: 0x1bc0, bitSize: 0x540(0xa8B)
    int32 weapon_charm[42];
}

// bitSize: 0x650, members: 5
struct TelescopeData {
    // offset: 0x0, bitSize: 0x600(0xc0B)
    FTUEVideo ftueVideo[64];
    // offset: 0x610, bitSize: 0x10(0x2B)
    short winbackEnterVersion;
    // offset: 0x620, bitSize: 0x20(0x4B)
    int32 winbackLastEnterTimestamp;
    // offset: 0x640, bitSize: 0x10(0x2B)
    short ftueVideoWatchedVersion;
    // offset: 0x600, bitSize: 0x10(0x2B)
    short onboardingMissionVersion;
}

// bitSize: 0x18, members: 4
struct FTUEVideo {
    // offset: 0x0, bitSize: 0x10(0x2B)
    short version;
    // offset: 0x10, bitSize: 0x1
    bit isComplete;
    // offset: 0x11, bitSize: 0x1
    bit isViewed;
    // offset: 0x12, bitSize: 0x6
    pad __pad[6];
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

// bitSize: 0x1d0, members: 7
struct SeasonalEventData {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char eventName[32];
    // offset: 0x100, bitSize: 0x20(0x4B)
    int32 preMatchChallengeProgress;
    // offset: 0x120, bitSize: 0x8(0x1B)
    byte communityMilestonesUnlocksSeen;
    // offset: 0x128, bitSize: 0x20(0x4B)
    int32 lastXP;
    // offset: 0x148, bitSize: 0x80(0x10B)
    bit seasonalChallengesUnlocksSeen[128];
    // offset: 0x1c8, bitSize: 0x1
    bit hasSeenOnboarding;
    // offset: 0x1c9, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x40, members: 2
struct TrackedChallenge {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 achievementID;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 aeKindID;
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

