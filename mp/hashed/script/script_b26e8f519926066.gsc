#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_g_ob_activities_warlord_cs;

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_st_g_ob_activities_warlord_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_st_g_ob_activities_warlord_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_st_g_ob_activities_warlord_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd2c
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_st_g_ob_activities_warlord_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_st_g_ob_activities_warlord_cs" );
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd9b
// Size: 0x4295
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group1";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_long";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10219.7, -24071.9, 5428 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_long";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10261.4, -23790.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "City_High_Rise_AI_Warlord";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13541, -24550.5, 5424 ), ( 0, 106, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9967.4, -23279.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group4";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_shield";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11632.4, -24774.6, 5235.75 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group4";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_shield";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11732.4, -24794.6, 5235.75 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group4";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_lmg";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11544.4, -25034.6, 5235.75 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 64;
    s.script_count = "4";
    fe [[ f ]]( s, us, cf, ( -11813, -24182, 5283.5 ), ( 0, 0, 0 ), undefined, undefined, "maestro_drone_ephemeral_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 108 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 70;
    s.script_count = "0";
    fe [[ f ]]( s, us, cf, ( -11234, -23129, 5281.5 ), ( 0, 0, 0 ), undefined, undefined, "maestro_drone_ephemeral_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 98 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "City_High_Rise_AI_Warlord_2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13341.1, -24499.3, 5232 ), ( 0, 286, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group4";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_lmg";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11680.4, -25166.6, 5235.75 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "script_struct";
    s.script_index = "2";
    fe [[ f ]]( s, us, cf, ( -9962, -23688, 5426.5 ), ( 0, 0, 0 ), "maestro_land_phase_2", undefined, "maestro_land_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group1";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9793.17, -23659.5, 5428 ), ( 0, 190.68, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group1";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10151.4, -23782.6, 5428 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_long";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10125.4, -23870.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group3";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11772.4, -22841.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Bodyguard";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13162.6, -24405.1, 5424 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Bodyguard";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_long";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13122.6, -24581.1, 5424 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "script_struct";
    s.script_index = "1";
    fe [[ f ]]( s, us, cf, ( -12130, -22930, 5236.5 ), ( 0, 0, 0 ), "maestro_land_phase_1", undefined, "maestro_land_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 70;
    s.script_count = "3";
    fe [[ f ]]( s, us, cf, ( -10251, -23734, 5296.5 ), ( 0, 0, 0 ), undefined, undefined, "maestro_drone_ephemeral_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 360 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_soldier_helireinforcements";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "2";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -12010.7, -23184.9, 5224 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 42;
    s.script_count = "0";
    fe [[ f ]]( s, us, cf, ( -9844, -24207, 5471.5 ), ( 0, 0, 0 ), undefined, undefined, "maestro_drone_ephemeral_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 72 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_soldier_helireinforcements";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9855.4, -24198.6, 5552 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -13465, -23680, 5677.5 ), ( 0, 75, 0 ), "start", "cspf_2_auto13500364326012785730", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11824.7, -22631.9, 5392 ), ( 0, 90, 0 ), "start", "cspf_2_auto10342929285085872965", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12140, -22872, 5352 ), ( 0, 90, 0 ), undefined, undefined, "maestro_lift_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 56;
    s.script_count = "3";
    fe [[ f ]]( s, us, cf, ( -10612, -23465, 5465.5 ), ( 0, 0, 0 ), undefined, undefined, "maestro_drone_ephemeral_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 96 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12412, -22895, 5352.02 ), ( 0, 90, 0 ), undefined, undefined, "maestro_lift_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -13369, -23040, 5677.5 ), ( 0, 75, 0 ), "cspf_2_auto13500364326012785730", "cspf_2_auto13024521730667063424", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -13240.7, -22279.9, 5741.5 ), ( 0, 60, 0 ), "cspf_2_auto13024521730667063424", "cspf_2_auto4860345496434908488", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -13177, -24448, 5613.5 ), ( 0, 105, 0 ), undefined, undefined, "maestro_lift_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12888.7, -21607.9, 5741.5 ), ( 0, 45, 0 ), "cspf_2_auto4860345496434908488", "cspf_2_auto5102285262304235416", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12312.7, -21247.9, 5789.5 ), ( 0, 15, 0 ), "cspf_2_auto5102285262304235416", "cspf_2_auto8933570999969262813", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11736.7, -21159.9, 5789.5 ), ( 0, 285, 0 ), "cspf_2_auto8933570999969262813", "cspf_2_auto13990944245470761856", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11608.7, -21671.9, 5693.5 ), ( 0, 270, 0 ), "cspf_2_auto13990944245470761856", "cspf_2_auto8603649262364588360", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11640.7, -22087.9, 5597.5 ), ( 0, 270, 0 ), "cspf_2_auto8603649262364588360", "cspf_2_auto1584376720978755067", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_soldier_helireinforcements";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "3";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9967.4, -24230.6, 5552 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_floodfill";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -12519.4, -24374.6, 5706 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11736.7, -22567.9, 5469.5 ), ( 0, 255, 0 ), "cspf_2_auto1584376720978755067", "cspf_2_auto14847514132848203491", "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11888.7, -23143.9, 5296 ), ( 0, 255, 0 ), "cspf_2_auto14847514132848203491", undefined, "maestro_path_one_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11853, -23109, 5352 ), ( 0, 90, 0 ), undefined, undefined, "maestro_lift_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( -11788, -24140, 7500 ), ( 0, 0, 0 ), undefined, undefined, "maestro_high_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_floodfill";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13791.4, -24142.6, 5602 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_floodfill";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13607.4, -25022.6, 5602 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11632.7, -22055.9, 5552 ), ( 0, 30, 0 ), "cspf_2_auto10342929285085872965", "cspf_2_auto12326923982796308490", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11016.7, -21831.9, 5680 ), ( 0, 360, 0 ), "cspf_2_auto12326923982796308490", "cspf_2_auto17322783298873474790", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10512.7, -22327.9, 5680 ), ( 0, 300, 0 ), "cspf_2_auto17322783298873474790", "cspf_2_auto11091986206002377472", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10224.7, -23159.9, 5680 ), ( 0, 285, 0 ), "cspf_2_auto11091986206002377472", "cspf_2_auto535045087771331951", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10128.7, -23575.9, 5664 ), ( 0, 270, 0 ), "cspf_2_auto535045087771331951", "cspf_2_auto18310243182202198944", "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10200.7, -24023.9, 5488 ), ( 0, 270, 0 ), "cspf_2_auto18310243182202198944", undefined, "maestro_path_two_point", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11048, -23856, 5448 ), ( 0, 190, 0 ), undefined, undefined, "no_drone_safety_zone", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 225 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10984, -24168, 5448 ), ( 0, 190, 0 ), undefined, undefined, "no_drone_safety_zone", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 225 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_floodfill";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -12035.4, -23190.6, 5224 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_Reinforcepoint";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.reinforcement_spawn = "1";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_floodfill";
    s.var_994503f84e8b10ee = "Maestro_heli_reinforce_path";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9684.4, -23564.6, 5418 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Spawnpoint";
    fe [[ f ]]( s, us, cf, ( -11176.2, -23848.4, 1782 ), ( 0, 279.98, 0 ), undefined, "cspf_2_auto5604496987914892849", "maestro_wheelson_spawn", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11607.9, -24120.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto4967416370410532284", "cspf_2_auto17878043037055193346", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11351.2, -24055.9, 1782 ), ( 0, 279.98, 0 ), "cspf_2_auto5604496987914892849", "cspf_2_auto4967416370410532284", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11017.2, -24252.9, 1782 ), ( 0, 279.98, 0 ), "cspf_2_auto16148478153167420808", "cspf_2_auto4929024068299155003", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -10928.7, -24124.4, 1782 ), ( 0, 279.98, 0 ), "cspf_2_auto4929024068299155003", "cspf_2_auto1848051607689724038", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11054.7, -23884.9, 1782 ), ( 0, 279.98, 0 ), "cspf_2_auto1848051607689724038", undefined, "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11776, -23744, 1784 ), ( 0, 189.98, 0 ), "cspf_2_auto17878043037055193346", "cspf_2_auto14443768429537908901", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Secondary";
    fe [[ f ]]( s, us, cf, ( -11116.7, -24057.4, 1782 ), ( 0, 279.98, 0 ), "cspf_2_auto4929024068299155003", undefined, "maestro_wheelson_path_secondary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -12031.9, -23744.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto14443768429537908901", "cspf_2_auto16182279001384940830", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -12095.9, -23968.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto16182279001384940830", "cspf_2_auto14228800255641388914", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Secondary";
    fe [[ f ]]( s, us, cf, ( -11936.1, -23580.8, 1780.5 ), ( 0, 279.98, 0 ), "cspf_2_auto14443768429537908901", undefined, "maestro_wheelson_path_secondary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -12287.9, -24256.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto14228800255641388914", "cspf_2_auto7771913660706214739", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11999.9, -24512.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto7771913660706214739", "cspf_2_auto16218377390381793217", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11743.9, -24608.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto16218377390381793217", "cspf_2_auto12957370690573226428", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Secondary";
    fe [[ f ]]( s, us, cf, ( -12372.7, -24306, 1780.5 ), ( 0, 279.98, 0 ), "cspf_2_auto7771913660706214739", undefined, "maestro_wheelson_path_secondary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11583.9, -24416.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto12957370690573226428", "cspf_2_auto17138411435030680986", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11599.9, -24168.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto17138411435030680986", "cspf_2_auto1169569144528458450", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Secondary";
    fe [[ f ]]( s, us, cf, ( -11680.5, -24860.9, 1780.5 ), ( 0, 279.98, 0 ), "cspf_2_auto12957370690573226428", undefined, "maestro_wheelson_path_secondary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Bodyguard";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13194.6, -24253.1, 5424 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group1";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10026.1, -23967.4, 5428 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group1";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_long";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9851.93, -23929.4, 5424 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10269.4, -24107.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_lmg";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9791.4, -23524.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -9733.4, -24043.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group2";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_lmg";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -10311.4, -23595.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group3";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -12272.4, -22808.6, 5232.47 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group3";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11806.4, -23052.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group3";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -12108.4, -23057.6, 5232 ), ( 0, 99.35, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Group3";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -11979.6, -23389.1, 5232 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Bodyguard";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_bodyguard";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13340.6, -24675.1, 5424 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.ai_faction = "any";
    s.name = "Maestro_AI_Bodyguard";
    s.var_e5decd57d2e1579 = "5000";
    s.preferred_spawnpoint = "0";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "warlord_short";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -13123.6, -24796.1, 5424 ), ( 0, 196, 0 ), undefined, undefined, "ai_encounter_spawnpoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Wheelson_Path_Main";
    fe [[ f ]]( s, us, cf, ( -11263.9, -24112.8, 1782 ), ( 0, 189.98, 0 ), "cspf_2_auto1169569144528458450", "cspf_2_auto16148478153167420808", "maestro_wheelson_path_primary", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 70;
    s.script_count = "3";
    fe [[ f ]]( s, us, cf, ( -11548, -25440, 1810.5 ), ( 0, 0, 0 ), "cspf_2_auto3671570839892483642", undefined, "maestro_drone_restocking_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 112 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 50;
    s.script_count = "2";
    fe [[ f ]]( s, us, cf, ( -11306.5, -23140.3, 1835.5 ), ( 0, 0, 0 ), "cspf_2_auto4912875983742252389", undefined, "maestro_drone_restocking_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 106 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 70;
    s.script_count = "3";
    fe [[ f ]]( s, us, cf, ( -12110.5, -22814.7, 1826 ), ( 0, 0, 0 ), "cspf_2_auto18054181996315617001", undefined, "maestro_drone_restocking_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 112 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 70;
    s.script_count = "2";
    fe [[ f ]]( s, us, cf, ( -10849.2, -25040.3, 1826 ), ( 0, 0, 0 ), "cspf_2_auto5094560214830777377", undefined, "maestro_drone_restocking_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 96 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.height = 80;
    s.script_count = "3";
    fe [[ f ]]( s, us, cf, ( -13191.1, -24465.9, 1833.5 ), ( 0, 0, 0 ), "cspf_2_auto3264686118597125245", undefined, "maestro_drone_restocking_chokepoint", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 140 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11848, -25886, 2159 ), ( 0, 270, 0 ), "cspf_2_auto9850182459824280947", "cspf_2_auto17871619360140228393", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12078, -25845, 2362 ), ( 0, 270, 0 ), undefined, "cspf_2_auto9850182459824280947", "maestro_drone_spawner", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11687.9, -25866.1, 2018 ), ( 0, 270, 0 ), "cspf_2_auto17871619360140228393", "cspf_2_auto14974646045370718947", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11458.6, -25823.1, 1928 ), ( 0, 270, 0 ), "cspf_2_auto14974646045370718947", "cspf_2_auto3671570839892483642", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10936, -25539, 2357 ), ( 0, 270, 0 ), undefined, "cspf_2_auto9685037182583160220", "maestro_drone_spawner", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10798.9, -25384.3, 2139.06 ), ( 0, 270, 0 ), "cspf_2_auto9685037182583160220", "cspf_2_auto9672633447788575744", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -10793.5, -25202.7, 1934 ), ( 0, 270, 0 ), "cspf_2_auto9672633447788575744", "cspf_2_auto5094560214830777377", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -14166, -24752, 2247 ), ( 0, 270, 0 ), undefined, "cspf_2_auto3662404181981859430", "maestro_drone_spawner", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -14048, -24678, 2059 ), ( 0, 270, 0 ), "cspf_2_auto3662404181981859430", "cspf_2_auto14910063357741082768", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -13049.4, -24439, 1881 ), ( 0, 270, 0 ), "cspf_2_auto14910063357741082768", "cspf_2_auto3264686118597125245", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11657, -22458, 2359 ), ( 0, 270, 0 ), undefined, "cspf_2_auto3841628968417755783", "maestro_drone_spawner", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11436.9, -22647.3, 2167.06 ), ( 0, 270, 0 ), "cspf_2_auto3841628968417755783", "cspf_2_auto16826764751677090015", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12615, -22249, 2161 ), ( 0, 270, 0 ), undefined, "cspf_2_auto10446266907061381390", "maestro_drone_spawner", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12448.9, -22218.3, 2072.06 ), ( 0, 270, 0 ), "cspf_2_auto10446266907061381390", "cspf_2_auto7548269089747411189", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -11337.5, -22823.5, 1986.3 ), ( 0, 270, 0 ), "cspf_2_auto16826764751677090015", "cspf_2_auto4912875983742252389", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    fe [[ f ]]( s, us, cf, ( -12254.2, -22299.4, 2026.97 ), ( 0, 270, 0 ), "cspf_2_auto7548269089747411189", "cspf_2_auto18054181996315617001", "maestro_drone_restock_path", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5038
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5042
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_st_g_ob_activities_warlord_cs" );
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5058
// Size: 0x69
function function_fd69cf02ba4d90a2()
{
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_WARLORD";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_warlord_maestro";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x50ca
// Size: 0x51
function function_82613e20fba2deb9( instancename, fe, us, cf )
{
    if ( !isdefined( cf ) )
    {
        cf = "mp_jup_st_g_ob_activities_warlord_cs";
    }
    
    switch ( instancename )
    {
        case #"hash_3c0c19dc46bcc510":
            function_aa32c4c3cf86ee87( fe, us, cf );
            break;
    }
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5123
// Size: 0x700
function function_aa32c4c3cf86ee87( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "center_struct";
    fe [[ f ]]( s, us, cf, ( -11697, -24151, 5647 ), ( 0, 0, 0 ), "WARLORD_MAESTRO", "cspf_3_auto15270882363439762350", "warlord_maestro", "link_warlord_maestro", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), 1900 );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "Fortress_Key";
    fe [[ f ]]( s, us, cf, ( -10991, -24055, 5424 ), ( 0, 0, 0 ), "warlord_key_spawner", undefined, "obloot_key_human_fortress_maestro", undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "sentry";
    fe [[ f ]]( s, us, cf, ( -10098.1, -24168.2, 5552 ), ( 0, 103.3, 0 ), "sentry", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "sentry";
    fe [[ f ]]( s, us, cf, ( -13483, -24771, 5596 ), ( 0, 29.2, 0 ), "sentry", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "sentry";
    fe [[ f ]]( s, us, cf, ( -12255.4, -23221.3, 5227.5 ), ( 0, 13.3, 0 ), "sentry", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "sentry";
    fe [[ f ]]( s, us, cf, ( -13584, -24318, 5594 ), ( 0, 355.1, 0 ), "sentry", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -10512.2, -24349.1, 5420 ), ( 0, 282, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "reward_rift";
    fe [[ f ]]( s, us, cf, ( -10078, -23786.5, 5424 ), ( 0, 0, 0 ), "s_warlord_maestro_reward", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -11289.2, -23472.8, 5416 ), ( 0, 233.12, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -10899.8, -24893.6, 5224 ), ( 0, 282, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -12224.7, -23359.6, 5224.75 ), ( 0, 12.04, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -12461, -23311.2, 5416 ), ( 0, 192.81, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -12319.9, -24071.9, 5444.3 ), ( 0, 192.81, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -13331.7, -23990.9, 5224 ), ( 0, 192.81, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_st_g_ob_activities_warlord_cs";
    s.name = "warlord_cache_maestro";
    fe [[ f ]]( s, us, cf, ( -12807.8, -24661.4, 5224 ), ( 0, 102, 0 ), "s_warlord_cache", undefined, undefined, undefined, "link_warlord_maestro", ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_jup_st_g_ob_activities_warlord_cs / namespace_bb6f88126dc368e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x582b
// Size: 0x36c
function function_6da2952367672ac0()
{
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_ob_activitydefinition_warlord_maestro";
    instancestruct.cf = "mp_jup_st_g_ob_activities_warlord_cs";
    instancestruct.scriptstructorigin = ( -11697, -24151, 5508 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ].locationorigin = [ ( -11697, -24151, 5509 ) ];
    instancestruct.var_5b156d1fa702b37f[ "ai_exclusion_radius" ].locationradius = [ 1900 ];
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ].locationorigin = [ ( -11697, -24151, 5507 ) ];
    instancestruct.var_5b156d1fa702b37f[ "join_radius" ].locationradius = [ 2500 ];
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ].locationorigin = [ ( -11697, -24151, 5508 ) ];
    instancestruct.var_5b156d1fa702b37f[ "participation_radius" ].locationradius = [ 2500 ];
    instancestruct.var_5b156d1fa702b37f[ "warlord_comms_range" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "warlord_comms_range" ].locationorigin = [ ( -11696, -24152, 1772.5 ) ];
    instancestruct.var_5b156d1fa702b37f[ "warlord_comms_range" ].locationradius = [ 800 ];
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_range" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_range" ].locationorigin = [ ( -11833.3, -24211.8, 1772.5 ) ];
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_range" ].locationradius = [ 3700 ];
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_nokey" ] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_nokey" ].locationorigin = [ ( -11253.8, -24077.7, 5416 ) ];
    instancestruct.var_5b156d1fa702b37f[ "handler_comms_nokey" ].locationradius = [ 250 ];
    instancestruct.locationorigin = [ ( -11697, -24151, 5508 ) ];
    instancestruct.locationoriginoffset = [ ( 0, 0, 0 ) ];
    instancestruct.var_45283ef87b6e04b6 = [ ( 0, 0, 0 ) ];
    instancestruct.locationradius = [ 1200 ];
    activityinstances[ "WARLORD_MAESTRO" ] = instancestruct;
    return activityinstances;
}

