// file ddl\import\t9_profile_common.ddl

// bitSize: 0x4470, members: 80
struct root {
    // offset: 0x0, bitSize: 0x100(0x20B)
    char map[32];
    // offset: 0x100, bitSize: 0x800(0x100B)
    char motd[256];
    // offset: 0x900, bitSize: 0x8(0x1B)
    int8 default_emblem_index;
    // offset: 0x908, bitSize: 0x20(0x4B)
    uint32 party_maxplayers;
    // offset: 0x928, bitSize: 0x8(0x1B)
    uint8 lastLoadoutZMOnline;
    // offset: 0x930, bitSize: 0x90(0x12B)
    CharacterContext characterContext[2];
    // offset: 0x9c0, bitSize: 0xf20(0x1e4B)
    KeyBind keybinds[242];
    // offset: 0x18e0, bitSize: 0x20(0x4B)
    float safeAreaTweakable_vertical;
    // offset: 0x1900, bitSize: 0x10(0x2B)
    int11 default_background_index;
    // offset: 0x1910, bitSize: 0x8(0x1B)
    uint3 selectedCharacterMode;
    // offset: 0x1918, bitSize: 0xde0(0x1bcB)
    GameplaySettings gameplaySettings;
    // offset: 0x26f8, bitSize: 0x20(0x4B)
    uint32 com_first_time;
    // offset: 0x2718, bitSize: 0x8(0x1B)
    uint3 online_vs_bots_difficulty;
    // offset: 0x2720, bitSize: 0x1130(0x226B)
    SelectedCharacter characters[50];
    // offset: 0x3850, bitSize: 0x20(0x4B)
    uint32 cg_playerState;
    // offset: 0x3870, bitSize: 0x8(0x1B)
    uint4 freerunHighestTrack;
    // offset: 0x3878, bitSize: 0x40(0x8B)
    uint64 modified_timestamp;
    // offset: 0x38b8, bitSize: 0x8(0x1B)
    uint8 lastLoadoutMPOffline;
    // offset: 0x38c0, bitSize: 0x8(0x1B)
    uint8 lastLoadoutMPOnlineArena;
    // offset: 0x38c8, bitSize: 0x8(0x1B)
    uint5 season_movie_seen_mp;
    // offset: 0x38d0, bitSize: 0x8(0x1B)
    uint5 season_movie_seen_zm;
    // offset: 0x38d8, bitSize: 0x100(0x20B)
    char gametype_cp[32];
    // offset: 0x39d8, bitSize: 0x100(0x20B)
    char gametype_wz[32];
    // offset: 0x3ad8, bitSize: 0x100(0x20B)
    char gametype_zm[32];
    // offset: 0x3bd8, bitSize: 0x10(0x2B)
    uint11 playlist_solomatch;
    // offset: 0x3be8, bitSize: 0x8(0x1B)
    uint2 quick_launch_mode;
    // offset: 0x3bf0, bitSize: 0x8(0x1B)
    uint3 g_gameskill_offline_cpzm;
    // offset: 0x3bf8, bitSize: 0x20(0x4B)
    float safeAreaTweakable_horizontal;
    // offset: 0x3c18, bitSize: 0x20(0x4B)
    uint32 eliteRegistrationPopupTimesShown;
    // offset: 0x3c38, bitSize: 0x8(0x1B)
    uint5 lastLoadoutLeague;
    // offset: 0x3c40, bitSize: 0x8(0x1B)
    uint5 lastLoadoutOnline;
    // offset: 0x3c48, bitSize: 0x8(0x1B)
    uint3 g_gameskill_offline_cp;
    // offset: 0x3c50, bitSize: 0x10(0x2B)
    uint11 playlist_mp;
    // offset: 0x3c60, bitSize: 0x10(0x2B)
    uint11 playlist_wz;
    // offset: 0x3c70, bitSize: 0x10(0x2B)
    uint11 playlist_zm;
    // offset: 0x3c80, bitSize: 0x8(0x1B)
    uint4 character_class;
    // offset: 0x3c88, bitSize: 0x8(0x1B)
    uint5 lastLoadoutSystemlink;
    // offset: 0x3c90, bitSize: 0x100(0x20B)
    char gametype[32];
    // offset: 0x3d90, bitSize: 0x20(0x4B)
    uint32 takeCoverWarnings;
    // offset: 0x3db0, bitSize: 0x8(0x1B)
    uint8 lastLoadoutZMOffline;
    // offset: 0x3db8, bitSize: 0x100(0x20B)
    char scoreboardSortKey[32];
    // offset: 0x3eb8, bitSize: 0x8(0x1B)
    uint5 emblem;
    // offset: 0x3ec0, bitSize: 0x8(0x1B)
    uint7 emblem_grid_size;
    // offset: 0x3ec8, bitSize: 0x100(0x20B)
    char map_cp[32];
    // offset: 0x3fc8, bitSize: 0x100(0x20B)
    char map_wz[32];
    // offset: 0x40c8, bitSize: 0x100(0x20B)
    char map_zm[32];
    // offset: 0x41c8, bitSize: 0x8(0x1B)
    uint5 selectedCharacterIndex;
    // offset: 0x41d0, bitSize: 0x100(0x20B)
    char gametype_bots[32];
    // offset: 0x42d0, bitSize: 0x8(0x1B)
    uint3 g_gameskill;
    // offset: 0x42d8, bitSize: 0x60(0xcB)
    int32 padding[3];
    // offset: 0x4338, bitSize: 0x8(0x1B)
    uint3 intro_movie_seen_mp;
    // offset: 0x4340, bitSize: 0x8(0x1B)
    uint3 intro_movie_seen_zm;
    // offset: 0x4348, bitSize: 0x8(0x1B)
    uint2 identity_initialized;
    // offset: 0x4350, bitSize: 0x8(0x1B)
    int8 settings_version;
    // offset: 0x4358, bitSize: 0x8(0x1B)
    uint3 g_gameskill_online_cp;
    // offset: 0x4360, bitSize: 0x8(0x1B)
    uint8 lastLoadoutMPOnlineCustom;
    // offset: 0x4368, bitSize: 0x10(0x2B)
    uint11 playlist_arena;
    // offset: 0x4378, bitSize: 0x8(0x1B)
    uint8 lastLoadoutMPOnlinePublic;
    // offset: 0x4380, bitSize: 0x8(0x1B)
    uint7 paintshop_grid_size;
    // offset: 0x4388, bitSize: 0x8(0x1B)
    uint3 g_gameskill_online_cpzm;
    // offset: 0x4390, bitSize: 0x8(0x1B)
    uint8 lastLoadoutZMCustom;
    // offset: 0x4398, bitSize: 0x1
    bit com_first_time_mission_select;
    // offset: 0x4399, bitSize: 0x1
    bit music_player_initialized;
    // offset: 0x439a, bitSize: 0x1
    bit eula_third_time;
    // offset: 0x439b, bitSize: 0x1
    SuperFactions superFaction;
    // offset: 0x439c, bitSize: 0x1
    bit cg_spectateThirdPerson;
    // offset: 0x439d, bitSize: 0x1
    bit com_first_time_account_linked;
    // offset: 0x439e, bitSize: 0x1
    bit com_firsttime_freerun;
    // offset: 0x439f, bitSize: 0x1
    bit com_privategame_ranked_zm;
    // offset: 0x43a0, bitSize: 0x1
    bit offline_identity_initialized;
    // offset: 0x43a1, bitSize: 0x1
    bit eula_second_time;
    // offset: 0x43a2, bitSize: 0x1
    bit start_in_3d;
    // offset: 0x43a3, bitSize: 0x27
    bit playedCharacterIntro[39];
    // offset: 0x43ca, bitSize: 0x1
    bit FTUE_prestige_played;
    // offset: 0x43cb, bitSize: 0x1
    bit isSuperFactionInitialized;
    // offset: 0x43cc, bitSize: 0x1
    bit com_first_time_privategame_host_zm;
    // offset: 0x43cd, bitSize: 0x1
    bit commonInitialized;
    // offset: 0x43ce, bitSize: 0x98(0x13B)
    bit musicplayer_trackenable[152];
    // offset: 0x4466, bitSize: 0x4
    bit musicplayer_trackunlock[4];
    // offset: 0x446a, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x48, members: 4
struct CharacterContext {
    // offset: 0x0, bitSize: 0x20(0x4B)
    uint32 characterIndex;
    // offset: 0x20, bitSize: 0x20(0x4B)
    uint32 characterMode;
    // offset: 0x40, bitSize: 0x1
    bit isRandomCharacter;
    // offset: 0x41, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x58, members: 5
struct SelectedCharacter {
    // offset: 0x0, bitSize: 0x8(0x1B)
    uint6 outfitIndex;
    // offset: 0x8, bitSize: 0x40(0x8B)
    uint5 outfitItems[8];
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint6 warPaintOutfitIndex;
    // offset: 0x50, bitSize: 0x1
    bit locked;
    // offset: 0x51, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0xde0, members: 231
struct GameplaySettings {
    // offset: 0x0, bitSize: 0x20(0x4B)
    float fov;
    // offset: 0x20, bitSize: 0x8(0x1B)
    uint2 warzoneHideDistanceToCircle;
    // offset: 0x28, bitSize: 0x20(0x4B)
    float input_viewSensitivity;
    // offset: 0x48, bitSize: 0x8(0x1B)
    uint2 gpad_sticksConfig;
    // offset: 0x50, bitSize: 0x400(0x80B)
    char voice_output_device[128];
    // offset: 0x450, bitSize: 0x8(0x1B)
    uint2 warzoneHideAltimeter;
    // offset: 0x458, bitSize: 0x20(0x4B)
    float gpad_button_rstick_deflect_max;
    // offset: 0x478, bitSize: 0x8(0x1B)
    uint2 tap_to_slide_gpad;
    // offset: 0x480, bitSize: 0x20(0x4B)
    float snd_menu_cinematic;
    // offset: 0x4a0, bitSize: 0x20(0x4B)
    float location_rotation_sensitivity_kbm;
    // offset: 0x4c0, bitSize: 0x8(0x1B)
    uint2 prone_behavior;
    // offset: 0x4c8, bitSize: 0x8(0x1B)
    uint2 tap_to_slide_kbm;
    // offset: 0x4d0, bitSize: 0x20(0x4B)
    float snd_menu_teamchat_volume;
    // offset: 0x4f0, bitSize: 0x20(0x4B)
    float r_sceneBrightness;
    // offset: 0x510, bitSize: 0x20(0x4B)
    float mouse_ads_monitor_distance_coefficient;
    // offset: 0x530, bitSize: 0x20(0x4B)
    float gpad_right_stick_deadzone_max;
    // offset: 0x550, bitSize: 0x20(0x4B)
    float gpad_right_stick_deadzone_min;
    // offset: 0x570, bitSize: 0x8(0x1B)
    uint2 mantle_behaviour_ground_kbm;
    // offset: 0x578, bitSize: 0x8(0x1B)
    uint2 toggle_sprint_gpad;
    // offset: 0x580, bitSize: 0x8(0x1B)
    uint2 voice_favored_channel;
    // offset: 0x588, bitSize: 0x20(0x4B)
    float voice_output_volume;
    // offset: 0x5a8, bitSize: 0x8(0x1B)
    uint2 warzoneHideMinimizedQuickEquip;
    // offset: 0x5b0, bitSize: 0x8(0x1B)
    uint2 com_show_ping;
    // offset: 0x5b8, bitSize: 0x20(0x4B)
    float snd_menu_music;
    // offset: 0x5d8, bitSize: 0x20(0x4B)
    float snd_menu_voice;
    // offset: 0x5f8, bitSize: 0x20(0x4B)
    float speaker_left;
    // offset: 0x618, bitSize: 0x8(0x1B)
    uint2 team_indicator;
    // offset: 0x620, bitSize: 0x8(0x1B)
    uint2 warzoneHideCompass;
    // offset: 0x628, bitSize: 0x8(0x1B)
    uint2 warzoneHideConsole;
    // offset: 0x630, bitSize: 0x8(0x1B)
    uint2 warzoneHideWeaponEquipment;
    // offset: 0x638, bitSize: 0x20(0x4B)
    float location_selection_sensitivity_kbm;
    // offset: 0x658, bitSize: 0x20(0x4B)
    uint32 party_privacyStatus;
    // offset: 0x678, bitSize: 0x20(0x4B)
    float HUDBoundsTweakable_vertical;
    // offset: 0x698, bitSize: 0x10(0x2B)
    uint10 demo_autoDollyKeyframeInterval;
    // offset: 0x6a8, bitSize: 0x8(0x1B)
    uint7 subtitles_background_opacity;
    // offset: 0x6b0, bitSize: 0x8(0x1B)
    uint2 warzoneHideMinimap;
    // offset: 0x6b8, bitSize: 0x8(0x1B)
    uint2 invert_vertical_look_mouse;
    // offset: 0x6c0, bitSize: 0x20(0x4B)
    float mouse_sensitivity_ads_multiplier_high_zoom;
    // offset: 0x6e0, bitSize: 0x8(0x1B)
    uint2 ads_sensitivity_timing_kbm;
    // offset: 0x6e8, bitSize: 0x20(0x4B)
    float input_viewSensitivityADSScalarHighZoom;
    // offset: 0x708, bitSize: 0x8(0x1B)
    uint2 mantle_behaviour_air_kbm;
    // offset: 0x710, bitSize: 0x20(0x4B)
    float speaker_right_surround;
    // offset: 0x730, bitSize: 0x20(0x4B)
    float mouse_sensitivity_ads_multiplier;
    // offset: 0x750, bitSize: 0x8(0x1B)
    uint2 invert_vertical_look_gamepad;
    // offset: 0x758, bitSize: 0x8(0x1B)
    uint3 colorblindMode;
    // offset: 0x760, bitSize: 0x20(0x4B)
    float speaker_left_front;
    // offset: 0x780, bitSize: 0x8(0x1B)
    uint2 warzoneHideTeamList;
    // offset: 0x788, bitSize: 0x20(0x4B)
    float speaker_right_front;
    // offset: 0x7a8, bitSize: 0x40(0x8B)
    hash custom_colorblind_party_color_key;
    // offset: 0x7e8, bitSize: 0x20(0x4B)
    float orbis_menu_mouse_sensitivity_multiplier;
    // offset: 0x808, bitSize: 0x20(0x4B)
    float speaker_lfe;
    // offset: 0x828, bitSize: 0x20(0x4B)
    float speaker_center;
    // offset: 0x848, bitSize: 0x8(0x1B)
    uint2 warzoneHidePlayerHealth;
    // offset: 0x850, bitSize: 0x20(0x4B)
    float gpad_button_lstick_deflect_max;
    // offset: 0x870, bitSize: 0x8(0x1B)
    uint2 crouch_behavior;
    // offset: 0x878, bitSize: 0x8(0x1B)
    uint2 warzoneHideKillIdentity;
    // offset: 0x880, bitSize: 0x20(0x4B)
    float location_rotation_sensitivity_gpad;
    // offset: 0x8a0, bitSize: 0x20(0x4B)
    float speaker_left_surround;
    // offset: 0x8c0, bitSize: 0x40(0x8B)
    hash custom_colorblind_ally_color_key;
    // offset: 0x900, bitSize: 0x8(0x1B)
    uint2 warzoneHideInsertionCount;
    // offset: 0x908, bitSize: 0x8(0x1B)
    uint2 warzoneHideKills;
    // offset: 0x910, bitSize: 0x8(0x1B)
    uint3 textchat_filter;
    // offset: 0x918, bitSize: 0x20(0x4B)
    uint32 mouse_wheel_delay;
    // offset: 0x938, bitSize: 0x8(0x1B)
    uint2 input_autoAimInputGraphIw;
    // offset: 0x940, bitSize: 0x40(0x8B)
    hash custom_colorblind_you_color_key;
    // offset: 0x980, bitSize: 0x20(0x4B)
    float HUDBoundsTweakable_horizontal;
    // offset: 0x9a0, bitSize: 0x8(0x1B)
    uint2 warzoneHideActivePerks;
    // offset: 0x9a8, bitSize: 0x20(0x4B)
    float speaker_right_surround_back;
    // offset: 0x9c8, bitSize: 0x8(0x1B)
    uint2 toggle_sprint_kbm;
    // offset: 0x9d0, bitSize: 0x20(0x4B)
    float input_viewSensitivityHorizontal;
    // offset: 0x9f0, bitSize: 0x20(0x4B)
    float snd_scale_when_speaking;
    // offset: 0xa10, bitSize: 0x8(0x1B)
    uint2 warzoneHideSpectators;
    // offset: 0xa18, bitSize: 0x20(0x4B)
    float gpad_trigger_deadzone;
    // offset: 0xa38, bitSize: 0x8(0x1B)
    uint2 musicplayer_enable;
    // offset: 0xa40, bitSize: 0x20(0x4B)
    float voice_input_threshold;
    // offset: 0xa60, bitSize: 0x8(0x1B)
    uint2 motion_blur_mode;
    // offset: 0xa68, bitSize: 0x20(0x4B)
    uint32 snd_menu_hearing_impaired;
    // offset: 0xa88, bitSize: 0x20(0x4B)
    float mouse_acceleration;
    // offset: 0xaa8, bitSize: 0x20(0x4B)
    float gpad_hapticsIntensity;
    // offset: 0xac8, bitSize: 0x40(0x8B)
    hash custom_colorblind_enemy_color_key;
    // offset: 0xb08, bitSize: 0x8(0x1B)
    uint2 gpad_aim_assist_iw_algorithm;
    // offset: 0xb10, bitSize: 0x8(0x1B)
    uint2 warzoneHidePlayersAlive;
    // offset: 0xb18, bitSize: 0x20(0x4B)
    float snd_menu_sfx;
    // offset: 0xb38, bitSize: 0x8(0x1B)
    uint6 subtitles_size;
    // offset: 0xb40, bitSize: 0x20(0x4B)
    float voice_input_volume;
    // offset: 0xb60, bitSize: 0x8(0x1B)
    uint7 matchmakingDelay;
    // offset: 0xb68, bitSize: 0x20(0x4B)
    float mouse_sensitivity;
    // offset: 0xb88, bitSize: 0x20(0x4B)
    float snd_menu_master;
    // offset: 0xba8, bitSize: 0x20(0x4B)
    float mouse_sensitivity_vehicle;
    // offset: 0xbc8, bitSize: 0x20(0x4B)
    float input_viewSensitivityADSScalar;
    // offset: 0xbe8, bitSize: 0x8(0x1B)
    uint2 warzoneHideObituary;
    // offset: 0xbf0, bitSize: 0x8(0x1B)
    uint2 chase_cam_free_look_mode;
    // offset: 0xbf8, bitSize: 0x8(0x1B)
    uint2 interact_reload_behavior;
    // offset: 0xc00, bitSize: 0x10(0x2B)
    uint9 musicplayer_playlist;
    // offset: 0xc10, bitSize: 0x20(0x4B)
    float mouse_filtering;
    // offset: 0xc30, bitSize: 0x8(0x1B)
    uint2 gpad_swap_sticks_on_ads;
    // offset: 0xc38, bitSize: 0x20(0x4B)
    float mouse_sensitivity_vertical_multiplier;
    // offset: 0xc58, bitSize: 0x8(0x1B)
    uint3 snd_menu_presets;
    // offset: 0xc60, bitSize: 0x8(0x1B)
    uint5 gpad_buttonsConfig;
    // offset: 0xc68, bitSize: 0x8(0x1B)
    uint2 variable_zoom_shared_input;
    // offset: 0xc70, bitSize: 0x8(0x1B)
    uint2 zm_names_health_bars;
    // offset: 0xc78, bitSize: 0x20(0x4B)
    float gpad_left_stick_deadzone_max;
    // offset: 0xc98, bitSize: 0x20(0x4B)
    float gpad_left_stick_deadzone_min;
    // offset: 0xcb8, bitSize: 0x20(0x4B)
    float speaker_left_surround_back;
    // offset: 0xcd8, bitSize: 0x8(0x1B)
    uint2 snd_menu_speaker_setup;
    // offset: 0xce0, bitSize: 0x10(0x2B)
    uint13 vehicle_camera_recenter_delay;
    // offset: 0xcf0, bitSize: 0x20(0x4B)
    float input_viewSensitivityVertical;
    // offset: 0xd10, bitSize: 0x20(0x4B)
    uint32 demo_controllerConfig;
    // offset: 0xd30, bitSize: 0x8(0x1B)
    uint2 warzoneHideCleanups;
    // offset: 0xd38, bitSize: 0x8(0x1B)
    uint2 warzoneHideOnScreenButtons;
    // offset: 0xd40, bitSize: 0x20(0x4B)
    float speaker_right;
    // offset: 0xd60, bitSize: 0x8(0x1B)
    uint2 com_show_packet_loss;
    // offset: 0xd68, bitSize: 0x1
    bit display_ingame_alert_icons;
    // offset: 0xd69, bitSize: 0x1
    bit com_show_cpu_client_time;
    // offset: 0xd6a, bitSize: 0x1
    bit showConnectionMeter;
    // offset: 0xd6b, bitSize: 0x1
    bit armor_plate_behavior_kbm;
    // offset: 0xd6c, bitSize: 0x1
    bit snd_controller_sounds;
    // offset: 0xd6d, bitSize: 0x1
    bit healthbar_show_ally;
    // offset: 0xd6e, bitSize: 0x1
    bit parachute_auto_deploy_gpad;
    // offset: 0xd6f, bitSize: 0x1
    bit equipment_auto_hold_gpad;
    // offset: 0xd70, bitSize: 0x1
    bit auto_sprint_gpad;
    // offset: 0xd71, bitSize: 0x1
    bit com_show_system_clock;
    // offset: 0xd72, bitSize: 0x1
    bit musicplayer_shuffle;
    // offset: 0xd73, bitSize: 0x1
    bit decrease_zoom_shared_input;
    // offset: 0xd74, bitSize: 0x1
    bit auto_sprint_enabled;
    // offset: 0xd75, bitSize: 0x1
    bit display_crosshair;
    // offset: 0xd76, bitSize: 0x1
    bit minimapMode;
    // offset: 0xd77, bitSize: 0x1
    bit demo_autoDollyRecord;
    // offset: 0xd78, bitSize: 0x1
    bit warzoneReloadOnPress;
    // offset: 0xd79, bitSize: 0x1
    bit cg_blood;
    // offset: 0xd7a, bitSize: 0x1
    bit hitmarkers_sfx;
    // offset: 0xd7b, bitSize: 0x1
    bit splitscreenOrientation;
    // offset: 0xd7c, bitSize: 0x1
    bit auto_mount_ladder_enabled;
    // offset: 0xd7d, bitSize: 0x1
    bit toggle_steady_aim_kbm;
    // offset: 0xd7e, bitSize: 0x1
    bit input_device;
    // offset: 0xd7f, bitSize: 0x1
    bit sprint_cancel_reload_toggle_gpad;
    // offset: 0xd80, bitSize: 0x1
    bit cg_gibs;
    // offset: 0xd81, bitSize: 0x1
    bit com_show_vram;
    // offset: 0xd82, bitSize: 0x1
    bit tooltip_enable;
    // offset: 0xd83, bitSize: 0x1
    bit cursor_immediate_lock_inventory;
    // offset: 0xd84, bitSize: 0x1
    bit warzonePriorityPickups;
    // offset: 0xd85, bitSize: 0x1
    bit com_show_gpu_time;
    // offset: 0xd86, bitSize: 0x1
    bit healthbar_show_enemy;
    // offset: 0xd87, bitSize: 0x1
    bit hitmarkers_damage_type;
    // offset: 0xd88, bitSize: 0x1
    bit toggle_score_binding_kbm;
    // offset: 0xd89, bitSize: 0x1
    bit auto_sprint_kbm;
    // offset: 0xd8a, bitSize: 0x1
    bit disable_settings_clouding;
    // offset: 0xd8b, bitSize: 0x1
    bit chat_profanity_filter;
    // offset: 0xd8c, bitSize: 0x1
    bit warzoneCycleItems;
    // offset: 0xd8d, bitSize: 0x1
    bit rgb_disable;
    // offset: 0xd8e, bitSize: 0x1
    bit parachute_auto_deploy_kbm;
    // offset: 0xd8f, bitSize: 0x1
    bit transport_vehicle_alternate_control;
    // offset: 0xd90, bitSize: 0x1
    bit doa_text_hints;
    // offset: 0xd91, bitSize: 0x1
    bit toggle_ads_persistent_gpad;
    // offset: 0xd92, bitSize: 0x1
    bit relative_vehicle_hipfire_fov;
    // offset: 0xd93, bitSize: 0x1
    bit mantle_behaviour_air_gpad;
    // offset: 0xd94, bitSize: 0x1
    bit mute_voice;
    // offset: 0xd95, bitSize: 0x1
    bit cg_enableUGC;
    // offset: 0xd96, bitSize: 0x1
    bit incognitoSelf;
    // offset: 0xd97, bitSize: 0x1
    bit gpad_haptics;
    // offset: 0xd98, bitSize: 0x1
    bit doa_persistent_round;
    // offset: 0xd99, bitSize: 0x1
    bit demo_recordWithAutoPlay;
    // offset: 0xd9a, bitSize: 0x1
    bit attack_vehicle_alternate_control_kbm;
    // offset: 0xd9b, bitSize: 0x1
    bit cursor_immediate_lock_map;
    // offset: 0xd9c, bitSize: 0x1
    bit hitmarkers_sfx_enable;
    // offset: 0xd9d, bitSize: 0x1
    bit mute_voice_input;
    // offset: 0xd9e, bitSize: 0x1
    bit com_show_fps;
    // offset: 0xd9f, bitSize: 0x1
    bit relative_ads_fov;
    // offset: 0xda0, bitSize: 0x1
    bit input_autoAim;
    // offset: 0xda1, bitSize: 0x1
    bit cg_mature;
    // offset: 0xda2, bitSize: 0x1
    bit textchat_enable;
    // offset: 0xda3, bitSize: 0x1
    bit mantle_behaviour_ground_gpad;
    // offset: 0xda4, bitSize: 0x1
    bit com_show_gpu_temperature;
    // offset: 0xda5, bitSize: 0x1
    bit show_friends_notifications;
    // offset: 0xda6, bitSize: 0x1
    bit toggle_map_binding;
    // offset: 0xda7, bitSize: 0x1
    bit equipment_auto_hold_kbm;
    // offset: 0xda8, bitSize: 0x1
    bit show_compass;
    // offset: 0xda9, bitSize: 0x1
    bit toggle_ads_persistent_kbm;
    // offset: 0xdaa, bitSize: 0x1
    bit show_input_method;
    // offset: 0xdab, bitSize: 0x1
    bit windows_key_disable;
    // offset: 0xdac, bitSize: 0x1
    bit crossplay_enable;
    // offset: 0xdad, bitSize: 0x1
    bit mouse_smoothing;
    // offset: 0xdae, bitSize: 0x1
    bit auto_forward_sequence_enabled;
    // offset: 0xdaf, bitSize: 0x1
    bit colorblind_assist;
    // offset: 0xdb0, bitSize: 0x1
    bit hitmarkers_enable;
    // offset: 0xdb1, bitSize: 0x1
    bit toggle_ads_kbm;
    // offset: 0xdb2, bitSize: 0x1
    bit toggle_score_binding_gamepad;
    // offset: 0xdb3, bitSize: 0x1
    bit attack_vehicle_alternate_control_gpad;
    // offset: 0xdb4, bitSize: 0x1
    bit ping_double_tap_danger;
    // offset: 0xdb5, bitSize: 0x1
    bit warzoneInstantPickups;
    // offset: 0xdb6, bitSize: 0x1
    bit input_targetAssist;
    // offset: 0xdb7, bitSize: 0x1
    bit cg_subtitles;
    // offset: 0xdb8, bitSize: 0x1
    bit show_party_notifications;
    // offset: 0xdb9, bitSize: 0x1
    bit com_show_cpu_render_time;
    // offset: 0xdba, bitSize: 0x1
    bit doa_text_bubbles;
    // offset: 0xdbb, bitSize: 0x1
    bit incognitoOthers;
    // offset: 0xdbc, bitSize: 0x1
    bit snd_multiplayer_character_voice;
    // offset: 0xdbd, bitSize: 0x1
    bit rtx_console_feature_any;
    // offset: 0xdbe, bitSize: 0x1
    bit toggle_ads_gpad;
    // offset: 0xdbf, bitSize: 0x1
    bit show_advanced_options;
    // offset: 0xdc0, bitSize: 0x1
    bit doa_floating_damage;
    // offset: 0xdc1, bitSize: 0x1
    bit increase_zoom_shared_input;
    // offset: 0xdc2, bitSize: 0x1
    bit mute_voice_output;
    // offset: 0xdc3, bitSize: 0x1
    bit armor_plate_behavior_gpad;
    // offset: 0xdc4, bitSize: 0x1
    bit textchat_show_channel;
    // offset: 0xdc5, bitSize: 0x1
    bit toggle_inventory_binding;
    // offset: 0xdc6, bitSize: 0x1
    bit weapon_cycle_disable_wrap;
    // offset: 0xdc7, bitSize: 0x1
    bit out_of_ammo_auto_weapon_change;
    // offset: 0xdc8, bitSize: 0x1
    bit doa_crab_tutorial;
    // offset: 0xdc9, bitSize: 0x1
    bit toggle_walk;
    // offset: 0xdca, bitSize: 0x1
    bit textchat_show_timestamps;
    // offset: 0xdcb, bitSize: 0x1
    bit com_show_gpu_clock;
    // offset: 0xdcc, bitSize: 0x1
    bit helicopter_uses_chase_cam;
    // offset: 0xdcd, bitSize: 0x1
    bit interact_requires_hold;
    // offset: 0xdce, bitSize: 0x1
    bit mouse_ads_use_monitor_distance;
    // offset: 0xdcf, bitSize: 0x1
    bit sprint_cancel_reload_toggle_kbm;
    // offset: 0xdd0, bitSize: 0x1
    bit demo_toggleGameHud;
    // offset: 0xdd1, bitSize: 0x1
    bit english_vo;
    // offset: 0xdd2, bitSize: 0x1
    bit flipped_control_config;
    // offset: 0xdd3, bitSize: 0x1
    bit snd_mute_master_volume;
    // offset: 0xdd4, bitSize: 0x1
    bit snd_scale_when_speaking_enabled;
    // offset: 0xdd5, bitSize: 0x1
    bit gpad_rumble;
    // offset: 0xdd6, bitSize: 0x1
    bit launch_settings;
    // offset: 0xdd7, bitSize: 0x1
    bit snd_voicechat_open_mic;
    // offset: 0xdd8, bitSize: 0x1
    bit show_real_names;
    // offset: 0xdd9, bitSize: 0x1
    bit zm_cartoonMode;
    // offset: 0xdda, bitSize: 0x1
    bit zm_damage_numbers;
    // offset: 0xddb, bitSize: 0x1
    bit mute_all_but_party;
    // offset: 0xddc, bitSize: 0x1
    bit cg_drawCrosshair3D;
    // offset: 0xddd, bitSize: 0x1
    bit toggle_steady_aim_gpad;
    // offset: 0xdde, bitSize: 0x2
    pad __pad[2];
}

// bitSize: 0x10, members: 1
struct KeyBind {
    // offset: 0x0, bitSize: 0x10(0x2B)
    uint8 keys[2];
}

// members: 2
enum SuperFactions {
    "superfaction_nato" = 0x0,
    "superfaction_warsaw_pact" = 0x1,
}

