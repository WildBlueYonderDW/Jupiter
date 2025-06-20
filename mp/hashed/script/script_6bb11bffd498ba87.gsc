#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_sira_ob_activities_warlord_chemist_cs;

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 2
// Checksum 0x0, Offset: 0x83b
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_sira_ob_activities_warlord_chemist_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_sira_ob_activities_warlord_chemist_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_sira_ob_activities_warlord_chemist_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 3
// Checksum 0x0, Offset: 0x8b0
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_sira_ob_activities_warlord_chemist_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_sira_ob_activities_warlord_chemist_cs" );
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 3
// Checksum 0x0, Offset: 0x91f
// Size: 0x3f5f
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34276.4, -18024.1, 258 ), ( 0, 139.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34111.5, -17751.3, 255.92 ), ( 0, 119.1, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "military";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34849.1, -16515.8, 262.96 ), ( 0, 273, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33507, -17301.9, 255.94 ), ( 0, 180.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35343.6, -16083, 264 ), ( 0, 285.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37039.5, -17454, 262.96 ), ( 0, 333.1, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37346.3, -19078.2, 264 ), ( 0, 313.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36094.3, -17720.9, 262.96 ), ( 0, 295.5, 0 ), undefined, "cspf_2_auto8418762077893461955", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37549.9, -19124.7, 256.87 ), ( 0, 314.8, 0 ), undefined, "cspf_2_auto1944836890455353670", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35327.7, -14981.8, 264 ), ( 0, 133.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36460.6, -17772.9, 262.96 ), ( 0, 39.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34544.9, -15201.4, 288 ), ( 0, 258.9, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33516.3, -16011.3, 264 ), ( 0, 213, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33786.3, -16888.9, 262.96 ), ( 0, 228.4, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35096.1, -16962.6, 262.96 ), ( 0, 158.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37413.8, -17141.2, 392 ), ( 0, 335.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.location_spawnpoint = "0";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34301.3, -16196.8, 262.96 ), ( 0, 193.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33669, -17364.1, 258 ), ( 0, 207.4, 0 ), undefined, "cspf_2_auto8314007172621634857", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35724.9, -17178.8, 262.96 ), ( 0, 314.3, 0 ), undefined, "cspf_2_auto15780641924881301798", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33134.7, -16213.6, 257.01 ), ( 0, 65.7, 0 ), undefined, "cspf_2_auto17611507409362785884", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36434, -17357, 262.96 ), ( 0, 216.6, 0 ), undefined, "cspf_2_auto6041456708883259619", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36572.9, -15834.6, 608 ), ( 0, 306.1, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33930.9, -16763.2, 262.96 ), ( 0, 257.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34995.2, -18445.3, 255.94 ), ( 0, 157, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35892.8, -19154.4, 255.94 ), ( 0, 128.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36314.4, -19157, 256.86 ), ( 0, 93.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36582.9, -18859.1, 262.95 ), ( 0, 35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34584.2, -16125.9, 262.96 ), ( 0, 226.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34776.9, -15896.8, 262.96 ), ( 0, 233.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37218.7, -17988, 262.96 ), ( 0, 31.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_01";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37559.8, -16593.7, 608 ), ( 0, 311.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_01";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -38186.1, -17366.8, 264 ), ( 0, 118.6, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.var_8e71cc2e3851e67c = "killhouse_guard_03_int_wall_lean";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_balconyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36740.9, -15975.8, 608 ), ( 0, 316.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.var_8e71cc2e3851e67c = "killhouse_guard_04_int_rail_lean";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_balconyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35594.3, -15535.8, 392 ), ( 0, 321.5, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_balconyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34819.2, -16949.6, 262.96 ), ( 0, 138.3, 0 ), undefined, "cspf_2_auto2379167189659714371", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.var_8e71cc2e3851e67c = "killhouse_guard_02_int_smoke";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_balconyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33875.4, -15434.9, 480 ), ( 0, 208.4, 0 ), undefined, "cspf_2_auto3652731121401209409", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37176.3, -17561.5, 262.95 ), ( 0, 318.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "military";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34134.8, -16973.5, 262.96 ), ( 0, 177.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "military";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36016.1, -18595, 262.36 ), ( 0, 76.9, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "military";
    s.groupid = "Warlord";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36890.2, -17798.2, 262.96 ), ( 0, 345, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_01";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37617.9, -19200.2, 258.69 ), ( 0, 216.7, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33114, -16513, 456 ), ( 0, 218.7, 0 ), undefined, "cspf_2_auto3779209077201557924", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35660.1, -19010, 255.94 ), ( 0, 59.2, 0 ), undefined, "cspf_2_auto8096984327823617982", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36738.7, -17841.4, 262.96 ), ( 0, 238.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37965.2, -18967.2, 266.38 ), ( 0, 129.8, 0 ), undefined, "cspf_2_auto14586889024177996658", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.reinforcement_spawn = "0";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35121.9, -14733.4, 264 ), ( 0, 119.8, 0 ), undefined, "cspf_2_auto1471828520131245660", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36462.9, -19538.8, 264 ), ( 0, 127.2, 0 ), undefined, "cspf_2_auto17106863082708933128", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34333.3, -15998.7, 262.96 ), ( 0, 242.4, 0 ), undefined, "cspf_2_auto12829456714702053705", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36220.8, -15804.6, 536 ), ( 0, 319.7, 0 ), undefined, "cspf_2_auto11013425574977640417", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34097.9, -17183.5, 262.69 ), ( 0, 181.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_02";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36403.9, -15957.6, 264 ), ( 0, 38.5, 0 ), undefined, "cspf_2_auto15064796404039391205", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_east";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34634.4, -14996.7, 264 ), ( 0, 43.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37337.4, -16810.4, 392 ), ( 0, 310.1, 0 ), undefined, "cspf_2_auto9396303587418406424", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.var_8e71cc2e3851e67c = "guard_int_31";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35439.6, -18388.7, 262.02 ), ( 0, 348, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -37491.3, -18804.4, 264 ), ( 0, 325.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_bot_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34657.3, -17226.5, 262.96 ), ( 0, 295.85, 0 ), undefined, "cspf_2_auto6693722628238909917", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_left";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35864.3, -17557, 262.96 ), ( 0, 28.3, 0 ), undefined, "cspf_2_auto9117513603063255542", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34596.9, -16185.1, 262.96 ), ( 0, 212.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.var_8e71cc2e3851e67c = "guard_int_28";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_quad_top_right";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_grenadier";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34840.1, -16141.1, 262.96 ), ( 0, 199.5, 0 ), undefined, "cspf_2_auto13043882213506254272", "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_west";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_guard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36714.9, -19999.1, 480 ), ( 0, 56.3, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_02";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -34473.3, -14956.4, 264 ), ( 0, 44.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_01";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -35780.6, -15273.9, 608 ), ( 0, 309.8, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.ai_faction = "any";
    s.groupid = "Exterior";
    s.name = "Warlord";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "warlord_chemist_stealth_stands_north";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_chemist_exterior_sniper_roof_01";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -36369.5, -16273.9, 392 ), ( 0, 310.5, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 0
// Checksum 0x0, Offset: 0x4886
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 0
// Checksum 0x0, Offset: 0x4890
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_sira_ob_activities_warlord_chemist_cs" );
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 0
// Checksum 0x0, Offset: 0x48a6
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_WARLORD";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_warlord_chemist_rift";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 4
// Checksum 0x0, Offset: 0x4918
// Size: 0x51
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_a9cfe587b70be69e":
            function_dbe05338ed30a31( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 3
// Checksum 0x0, Offset: 0x4971
// Size: 0x5a4
function function_dbe05338ed30a31( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 2889, 1930, 393.5 );
    s.var_74e936bbadd15418 = ( 2867, 1837, 32 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -35646.4, -17233.5, 262.96 ), ( 0, 37.56, 0 ), "warlord_trigger", "WARLORD_CHEMIST", "chemist_vision_trigger", undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.name = "center_struct";
    fe [[ f ]]( s, us, cf, ( -35646.4, -17233.5, 240 ), ( 0, 0, 0 ), "WARLORD_CHEMIST", undefined, "warlord_chemist", "link_warlord_chemist", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 100 );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.name = "Fortress_Key";
    fe [[ f ]]( s, us, cf, ( -35784.4, -17025.6, 309.96 ), ( 0, 0, 0 ), "warlord_key_spawner", undefined, "obloot_key_human_fortress_chemist", undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -35719.7, -16468.9, 262.96 ), ( 0, 308.1, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -34783.1, -15755.1, 262.96 ), ( 0, 305, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -33637.9, -17131.9, 260.72 ), ( 0.06, 49.69, 4.55 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -34550.8, -16207.1, 262.96 ), ( 0, 42.7, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -35761.8, -19050, 255.94 ), ( 0, 302.1, -0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -36452.6, -16639.4, 262.96 ), ( 0, 224.9, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.groupid = "warlord_caches";
    fe [[ f ]]( s, us, cf, ( -37274.4, -17575.9, 262.81 ), ( 360, 230, 0.3 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    s.name = "reward_rift";
    fe [[ f ]]( s, us, cf, ( -35771.4, -17066.7, 262.96 ), ( 0, 0, 0 ), "s_warlord_chemist_reward", undefined, undefined, undefined, "link_warlord_chemist", ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_sira_ob_activities_warlord_chemist_cs / namespace_d2caf415204fa491
// Params 0
// Checksum 0x0, Offset: 0x4f1d
// Size: 0x1f8
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_warlord_chemist_rift";
    instancestruct.cf = "mp_jup_sira_ob_activities_warlord_chemist_cs";
    instancestruct.scriptstructorigin = ( -35456.4, -17482.5, 262.96 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ].locationorigin = [ ( -35646.4, -17233.5, 233.96 ) ];
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ].locationradius = [ 4000 ];
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ].locationorigin = [ ( -35646.4, -17233.5, 250 ) ];
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ].locationradius = [ 2000 ];
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ].locationorigin = [ ( -35646.4, -17233.5, 258 ) ];
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ].locationradius = [ 1500 ];
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances[ "WARLORD_CHEMIST" ] = instancestruct;
    return activityinstances;
}

