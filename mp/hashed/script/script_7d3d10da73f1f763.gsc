#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_fort_ob_s1_rift_mission_cs;

// Namespace mp_jup_fort_ob_s1_rift_mission_cs / namespace_865fadac6587933f
// Params 2
// Checksum 0x0, Offset: 0x225
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_fort_ob_s1_rift_mission_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_fort_ob_s1_rift_mission_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_fort_ob_s1_rift_mission_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_fort_ob_s1_rift_mission_cs / namespace_865fadac6587933f
// Params 3
// Checksum 0x0, Offset: 0x29a
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_fort_ob_s1_rift_mission_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_fort_ob_s1_rift_mission_cs" );
}

// Namespace mp_jup_fort_ob_s1_rift_mission_cs / namespace_865fadac6587933f
// Params 3
// Checksum 0x0, Offset: 0x309
// Size: 0x1b5a
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 23864, -51037, 583 ), ( 0, 330, 0 ), "obeliskspawn", undefined, "toxic" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 10245, -51863, 643 ), ( 0, 45, 0 ), "obeliskspawn", undefined, "electric" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 18591, -51429, 870 ), ( 0, 90, 0 ), "obeliskspawn", undefined, "fire" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_exfil";
    fe [[ f ]]( s, us, cf, ( 17920, -59108, 138 ), ( 0, 0, 0 ), "exfil_loc" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 18592, -55000, 1150 ), ( 0, 90, 0 ), "obeliskspawn", undefined, "ice" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18586.4, -50970.6, 872.37 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18000, -51536, 880 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 19181.4, -51494.2, 880.91 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18910.8, -51027.3, 864.38 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18173.4, -51098.7, 867.49 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18203.8, -51852.9, 966.44 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18589, -52055.3, 957.65 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.location_spawnpoint = "0";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18966.3, -51831.1, 956.71 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_deathworm_volume";
    fe [[ f ]]( s, us, cf, ( 16472.4, -58579.9, 135.98 ), ( 0, 0, 0 ), "cspf_0_auto13824403394456785311", undefined, "deathworm_arena", undefined, undefined, undefined, undefined, 550 );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23496, -51272, 720 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23832, -50712, 720 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 24176, -50904, 720 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23840, -51464, 720 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 24080, -51376, 584 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 24208, -51152, 584 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23672, -50648, 584 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23448, -51072, 584 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 23616, -51488, 584 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10933, -51519, 659 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10696, -52096, 712 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10069, -52606, 712 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 9547, -52230, 712 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 9608, -51648, 712 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 10715, -51209, 648 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18731, -54451, 1152 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18451, -54451, 1152 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18378, -55722, 1152 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18812, -55728, 1152 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18192, -54856, 1280 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18192, -55368, 1280 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 18988, -55388, 1280 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 19000, -54896, 1280 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.ai_faction = "any";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "obelisk";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( 9880, -51144, 656 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_deathworm_volume";
    fe [[ f ]]( s, us, cf, ( 17617, -58890, 130 ), ( 0, 0, 0 ), undefined, "cspf_0_auto13824403394456785311", "deathworm_arena", undefined, undefined, undefined, undefined, 600 );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_deathworm_volume";
    fe [[ f ]]( s, us, cf, ( 15345, -58294.3, 143.55 ), ( 0, 0, 0 ), undefined, undefined, "deathworm_arena", undefined, undefined, undefined, undefined, 600 );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_deathworm_volume";
    fe [[ f ]]( s, us, cf, ( 18784.6, -58955.9, 136.71 ), ( 0, 0, 0 ), undefined, undefined, "deathworm_arena", undefined, undefined, undefined, undefined, 550 );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 18592, -54552, 1152 ), ( 0, 90, 0 ), "museum_gate" );
    s = s();
    s.cs_flag = "mp_jup_fort_ob_s1_rift_mission_cs";
    s.name = "script_struct_reward_rift";
    fe [[ f ]]( s, us, cf, ( 18021.7, -58368.4, 171.07 ), ( 0, 0, 0 ), "reward_rift" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_fort_ob_s1_rift_mission_cs / namespace_865fadac6587933f
// Params 0
// Checksum 0x0, Offset: 0x1e6b
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_fort_ob_s1_rift_mission_cs / namespace_865fadac6587933f
// Params 0
// Checksum 0x0, Offset: 0x1e75
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_fort_ob_s1_rift_mission_cs" );
}

