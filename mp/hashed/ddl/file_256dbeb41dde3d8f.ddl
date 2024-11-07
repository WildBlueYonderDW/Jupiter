// file ddl_256dbeb41dde3d8f

// bitSize: 0x278, members: 2
struct root {
    // offset: 0x0, bitSize: 0x1f0(0x3eB)
    ColorCustomizationFullscreenPreset colorCustomizationPalette;
    // offset: 0x1f0, bitSize: 0x88(0x11B)
    CodCasterTeamColorPreset codCasterTeamColorPreset;
}

// bitSize: 0x1f0, members: 27
struct ColorCustomizationFullscreenPreset {
    // offset: 0x0, bitSize: 0x8(0x1B)
    byte Palette;
    // offset: 0x8, bitSize: 0x20(0x4B)
    int32 AdvancedNeutralColor;
    // offset: 0x28, bitSize: 0x8(0x1B)
    byte enemy_color_selection_widget;
    // offset: 0x30, bitSize: 0x8(0x1B)
    byte neutral_color_selection_widget;
    // offset: 0x38, bitSize: 0x20(0x4B)
    int32 AdvancedContestedColor;
    // offset: 0x58, bitSize: 0x8(0x1B)
    byte party_color_selection_widget;
    // offset: 0x60, bitSize: 0x8(0x1B)
    byte contested_color_selection_widget;
    // offset: 0x68, bitSize: 0x20(0x4B)
    int32 AdvancedPartyColor;
    // offset: 0x88, bitSize: 0x20(0x4B)
    int32 AdvancedTeamColor;
    // offset: 0xa8, bitSize: 0x8(0x1B)
    byte team_color_selection_widget;
    // offset: 0xb0, bitSize: 0x20(0x4B)
    int32 AdvancedEnemyColor;
    // offset: 0xd0, bitSize: 0x8(0x1B)
    byte squad_6_color_selection_widget;
    // offset: 0xd8, bitSize: 0x8(0x1B)
    byte squad_5_color_selection_widget;
    // offset: 0xe0, bitSize: 0x8(0x1B)
    byte squad_4_color_selection_widget;
    // offset: 0xe8, bitSize: 0x8(0x1B)
    byte squad_3_color_selection_widget;
    // offset: 0xf0, bitSize: 0x8(0x1B)
    byte squad_2_color_selection_widget;
    // offset: 0xf8, bitSize: 0x20(0x4B)
    int32 AdvancedYouColor;
    // offset: 0x118, bitSize: 0x8(0x1B)
    byte squad_1_color_selection_widget;
    // offset: 0x120, bitSize: 0x8(0x1B)
    byte you_color_selection_widget;
    // offset: 0x128, bitSize: 0x20(0x4B)
    int32 AdvancedSquad1Color;
    // offset: 0x148, bitSize: 0x20(0x4B)
    int32 AdvancedSquad2Color;
    // offset: 0x168, bitSize: 0x20(0x4B)
    int32 AdvancedSquad3Color;
    // offset: 0x188, bitSize: 0x20(0x4B)
    int32 AdvancedSquad4Color;
    // offset: 0x1a8, bitSize: 0x20(0x4B)
    int32 AdvancedSquad5Color;
    // offset: 0x1c8, bitSize: 0x20(0x4B)
    int32 AdvancedSquad6Color;
    // offset: 0x1e8, bitSize: 0x1
    bit initialized;
    // offset: 0x1e9, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0x88, members: 9
struct CodCasterTeamColorPreset {
    // offset: 0x0, bitSize: 0x20(0x4B)
    int32 AdvancedSecondaryColor;
    // offset: 0x20, bitSize: 0x20(0x4B)
    int32 AdvancedPrimaryColor;
    // offset: 0x40, bitSize: 0x8(0x1B)
    byte Palette;
    // offset: 0x48, bitSize: 0x8(0x1B)
    byte codcaster_option_team_setting_secondary_color;
    // offset: 0x50, bitSize: 0x20(0x4B)
    int32 AdvancedSubstituteColor;
    // offset: 0x70, bitSize: 0x8(0x1B)
    byte codcaster_option_team_setting_substitute_color;
    // offset: 0x78, bitSize: 0x8(0x1B)
    byte codcaster_option_team_setting_primary_color;
    // offset: 0x80, bitSize: 0x1
    bit initialized;
    // offset: 0x81, bitSize: 0x7
    pad __pad[7];
}

