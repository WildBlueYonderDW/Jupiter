#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_sira_ob_s2_rift_mission_cs;

// Namespace mp_jup_sira_ob_s2_rift_mission_cs / namespace_932cd7b76b4df76a
// Params 2
// Checksum 0x0, Offset: 0x94b
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_sira_ob_s2_rift_mission_cs" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_sira_ob_s2_rift_mission_cs" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_sira_ob_s2_rift_mission_cs" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_sira_ob_s2_rift_mission_cs / namespace_932cd7b76b4df76a
// Params 3
// Checksum 0x0, Offset: 0x9c0
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_sira_ob_s2_rift_mission_cs" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_sira_ob_s2_rift_mission_cs" );
}

// Namespace mp_jup_sira_ob_s2_rift_mission_cs / namespace_932cd7b76b4df76a
// Params 3
// Checksum 0x0, Offset: 0xa2f
// Size: 0x3390
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks";
    s.name = "obelisk_target";
    fe [[ f ]]( s, us, cf, ( -36068.4, -13218.2, 256 ), ( 0, 124.3, -0.01 ), "obeliskspawn", undefined, "targets" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33856, -23552, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks";
    s.name = "obelisk_mirror";
    fe [[ f ]]( s, us, cf, ( -24768, -27584, 10.83 ), ( 0.23, 180, 0.24 ), "obeliskspawn", undefined, "mirror" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "toc_rescue_lone_zombie_spawnpoint";
    fe [[ f ]]( s, us, cf, ( -40624.2, -23133.3, 543.75 ), ( 0, 20.41, 0 ), "toc_rescue_lone_zombie_spawnpoint", undefined, "toc_rescue_lone_zombie_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "script_struct_exfil";
    fe [[ f ]]( s, us, cf, ( -35951.4, -16841.9, 315.96 ), ( 0, 36.9, 0 ), "exfil_loc" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "orb_spawn";
    fe [[ f ]]( s, us, cf, ( -31100.9, -23608.1, 250.25 ), ( 13.56, 0, -0 ), "orb_spawn", undefined, "orb_spawn" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "escort_pre_carnival_encounter_location";
    fe [[ f ]]( s, us, cf, ( -35414, -24810.5, 273.92 ), ( 0, 0, 0 ), "escort_pre_carnival_encounter_location", undefined, "escort_pre_carnival_encounter_location" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "ambient_blocker_stronghold_in_progress";
    fe [[ f ]]( s, us, cf, ( -25370, -21022.5, 257.92 ), ( 0, 0, 0 ), "ambient_blocker_stronghold_in_progress", undefined, "ambient_blocker_stronghold_in_progress" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "escort_post_orb_encounter_location";
    fe [[ f ]]( s, us, cf, ( -29630, -22576.5, 273.92 ), ( 0, 0, 0 ), "escort_post_orb_encounter_location", undefined, "escort_post_orb_encounter_location" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "script_struct";
    fe [[ f ]]( s, us, cf, ( 18592, -55000, 1150 ), ( 0, 90, 0 ), "obeliskspawn", undefined, "ice" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "escort_post_mall_encounter_location";
    fe [[ f ]]( s, us, cf, ( -32396, -17942.5, 331.92 ), ( 0, 0, 0 ), "escort_post_mall_encounter_location", undefined, "escort_post_mall_encounter_location" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "stadium_pnd_location";
    fe [[ f ]]( s, us, cf, ( -35850.2, -16974.9, 316 ), ( 0, 217.12, -0 ), "stadium_pnd_location", undefined, "stadium_pnd_location" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.proplist = "mimicproplist:jup_mimic_prop_list_uavs";
    fe [[ f ]]( s, us, cf, ( -32180, -24938, 256 ), ( 0, 200, 0 ), undefined, undefined, "emp_mimic_spawn" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -34887.9, -15443.1, 267 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -35612, -16623, 260 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -34315.4, -18129.4, 368 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -34314.4, -18130.4, 368 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -36137, -19532, 256 ), ( 359.62, 0.01, -0.87 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -37616.8, -17531.4, 262.5 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -33544.2, -17419.7, 259.75 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "search_light";
    fe [[ f ]]( s, us, cf, ( -34746.5, -18567.8, 285.23 ), ( 0, 0, 0 ), "search_light", undefined, "search_light" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33856, -23648, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32864, -23296, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32800, -23296, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32160, -23264, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32192, -23296, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32288, -23040, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33216, -24384, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -31744, -24256, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -31488, -24960, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    fe [[ f ]]( s, us, cf, ( 18592, -54552, 1152 ), ( 0, 90, 0 ), "museum_gate" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -31680, -25024, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -31456, -24352, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -32736, -25920, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33408, -24448, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40640, -22944, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40640, -23008, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -41018, -23497.8, 539.75 ), ( 0, 41.59, 0 ), "toc_rescue_soldier_spawn_building_1" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Ambient_Blocker_Story_Mission";
    s.name = "ambient_blocker_story_mission";
    fe [[ f ]]( s, us, cf, ( -32404, -24428.5, 257.92 ), ( 0, 0, 0 ), "ambient_blocker_story_mission", undefined, "ambient_blocker_story_mission", undefined, undefined, undefined, undefined, 700 );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -40662.5, -23401.3, 538.75 ), ( 0, 20.41, 0 ), "toc_rescue_soldier_spawn_building_1" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "acv_spawn";
    fe [[ f ]]( s, us, cf, ( -40332, -23744.5, 246.5 ), ( 0, 18.29, 0 ), undefined, undefined, "acv_spawn" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks";
    s.name = "obelisk_mma";
    fe [[ f ]]( s, us, cf, ( -39476.8, -19224.9, 598.95 ), ( 0.71, 102.78, 11.79 ), "obeliskspawn", undefined, "gloves" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -40722.2, -23215.3, 537.75 ), ( 0, 20.41, 0 ), "toc_rescue_soldier_spawn_building_1" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -40152.9, -24054.9, 395.62 ), ( 0, 353.16, 0 ), "toc_rescue_soldier_spawn_building_2" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "boat_ambient_blocker";
    s.name = "boat_ambient_blocker";
    fe [[ f ]]( s, us, cf, ( -39476.8, -19224.9, 598.95 ), ( 11.37, 0.21, -3.23 ), "s_ambient_blocker", undefined, "boat_zombie_blocker", undefined, undefined, undefined, undefined, 500 );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks_Mirrors";
    s.name = "obelisk_mirror_fire";
    fe [[ f ]]( s, us, cf, ( -24800, -27584, 44 ), ( 0, 180, 0 ), "mirror_fire", undefined, "mirror_fire" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks_Mirrors";
    s.name = "obelisk_mirror_toxic";
    fe [[ f ]]( s, us, cf, ( -24736, -27584, 44 ), ( 0, 360, 0 ), "mirror_toxic", undefined, "mirror_toxic" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -40121.4, -24136, 395.62 ), ( 0, 353.16, 0 ), "toc_rescue_soldier_spawn_building_2" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -40185.6, -23976.2, 395.88 ), ( 0, 353.16, 0 ), "toc_rescue_soldier_spawn_building_2" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -41618.7, -24606.4, 272 ), ( 0, 333.33, 0 ), "toc_rescue_soldier_spawn_building_3" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -41516.2, -24583.4, 271.5 ), ( 0, 294.75, 0 ), "toc_rescue_soldier_spawn_building_3" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks_Mirrors";
    s.name = "obelisk_mirror_ice";
    fe [[ f ]]( s, us, cf, ( -24768, -27616, 44 ), ( 0, 270, 0 ), "mirror_ice", undefined, "mirror_ice" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Obelisks_Mirrors";
    s.name = "obelisk_mirror_electric";
    fe [[ f ]]( s, us, cf, ( -24768, -27552, 44 ), ( 0, 90, 0 ), "mirror_electric", undefined, "mirror_electric" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_spawn";
    fe [[ f ]]( s, us, cf, ( -41618.2, -24425.4, 270.5 ), ( 358.28, 30.97, -1.03 ), "toc_rescue_soldier_spawn_building_3" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_objective";
    fe [[ f ]]( s, us, cf, ( -40159.5, -24021.7, 396.14 ), ( 0, 0, 0 ), "toc_soldier_rescue_objective_building_2" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_objective";
    fe [[ f ]]( s, us, cf, ( -41544, -24495, 272 ), ( 0, 0, 0 ), "toc_soldier_rescue_objective_building_3" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "Soldier_Rescue";
    s.name = "script_struct_soldier_rescue_objective";
    fe [[ f ]]( s, us, cf, ( -40889.7, -23409.2, 541 ), ( 0, 0, 0 ), "toc_soldier_rescue_objective_building_1" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40192, -23744, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40224, -23680, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40544, -23840, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40544, -23456, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40384, -23392, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40480, -23328, 256 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40832, -24288, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40800, -24384, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40928, -24352, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_00";
    s.script_index = "0";
    fe [[ f ]]( s, us, cf, ( -25754, -21766.2, 578.25 ), ( 0, 0, 0 ), undefined, "cspf_0_auto11495222924825813730", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -41408, -23808, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -41248, -23840, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -41344, -23968, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40960, -23552, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40800, -23456, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40512, -22944, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40384, -24128, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_soldier_rescue";
    s.name = "ai_encounter_spawnpoint_soldier_rescue";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_toc_rescue_defend";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -40256, -24128, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "ravenov_spawn";
    fe [[ f ]]( s, us, cf, ( -41418.5, -19973.8, 305.5 ), ( 0, 0, 0 ), "ravenov_spawn", undefined, "ravenov_spawn" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.name = "fletcher_spawn";
    fe [[ f ]]( s, us, cf, ( -25800.6, -21377.4, 568 ), ( 0, 64.36, 0 ), "fletcher_spawn", undefined, "fletcher_spawn" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_01";
    s.script_index = "1";
    fe [[ f ]]( s, us, cf, ( -25565.3, -22023.9, 578.25 ), ( 0, 0, 0 ), "cspf_0_auto14404740485404743904", "cspf_0_auto5938903551334333564", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_02";
    s.script_index = "2";
    fe [[ f ]]( s, us, cf, ( -25587, -22287.2, 583.93 ), ( 0, 0, 0 ), "cspf_0_auto5938903551334333564", "cspf_0_auto7016062336486382033", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_03";
    s.script_index = "3";
    fe [[ f ]]( s, us, cf, ( -25140.8, -21849.2, 361.93 ), ( 0, 0, 0 ), "cspf_0_auto7016062336486382033", "cspf_0_auto7984140218136864680", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_04";
    s.script_index = "4";
    fe [[ f ]]( s, us, cf, ( -25584, -21126, 364 ), ( 0, 0, 0 ), "cspf_0_auto7984140218136864680", "cspf_0_auto5888375609709539816", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = ( 468, 256, 136 );
    s.var_74e936bbadd15418 = ( 378, 242, 32 );
    s.height = 128;
    s.length = "128";
    s.name = "noent_volume_trigger_box_soldier_rescue_begin";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -40826.5, -23402, 532 ), ( 0, 17.56, 0 ), "enc_toc_rescue_begin_defend_trigger" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.ai_faction = "any";
    s.groupid = "ai_encounter_spawnpoint_convoy_breakdown";
    s.name = "ai_encounter_spawnpoint_convoy_breakdown";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.spawn_filter = "custom";
    s.var_2b2ae43751de4aa7 = "enc_convoy_breakdown";
    s.wave_indexes = "-1";
    s.var_90a30a42ca3830f1 = "none";
    fe [[ f ]]( s, us, cf, ( -33888, -23520, 288 ), ( 0, 0, 0 ), undefined, undefined, "ai_encounter_spawnpoint" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_05";
    s.script_index = "5";
    fe [[ f ]]( s, us, cf, ( -28340, -20954, 362 ), ( 0, 0, 0 ), "cspf_0_auto5888375609709539816", "cspf_0_auto1435295231955876402", "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_mall_path";
    s.name = "fletcher_mall_escape_06";
    s.script_index = "6";
    fe [[ f ]]( s, us, cf, ( -29270.8, -20553.4, 268 ), ( 0, 0, 0 ), "cspf_0_auto1435295231955876402", undefined, "fletcher_mall_path" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_betrayal_goal";
    s.name = "fletcher_betrayal_goal_01";
    s.script_index = "1";
    fe [[ f ]]( s, us, cf, ( -35941.5, -17006.1, 325.94 ), ( 0, 0, 0 ), "fletcher_betrayal_goal", undefined, "fletcher_betrayal_goal" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_betrayal_goal";
    s.name = "fletcher_betrayal_goal_00";
    s.script_index = "0";
    fe [[ f ]]( s, us, cf, ( -36018.5, -17014.1, 325.94 ), ( 0, 0, 0 ), "fletcher_betrayal_goal", undefined, "fletcher_betrayal_goal" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_betrayal_goal";
    s.name = "fletcher_betrayal_goal_02";
    s.script_index = "2";
    fe [[ f ]]( s, us, cf, ( -35884.5, -16937.1, 325.94 ), ( 0, 0, 0 ), "fletcher_betrayal_goal", undefined, "fletcher_betrayal_goal" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "fletcher_betrayal_goal";
    s.name = "fletcher_betrayal_goal_03";
    s.script_index = "3";
    fe [[ f ]]( s, us, cf, ( -35927.5, -16881.1, 324.94 ), ( 0, 0, 0 ), "fletcher_betrayal_goal", undefined, "fletcher_betrayal_goal" );
    s = s();
    s.cs_flag = "mp_jup_sira_ob_s2_rift_mission_cs";
    s.groupid = "aether_gas_spawn";
    s.name = "aether_gas_spawn";
    s.script_index = "0";
    fe [[ f ]]( s, us, cf, ( -35708.5, -17147.1, 273.94 ), ( 0, 0, 0 ), "aether_gas_spawn", undefined, "aether_gas_spawn" );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_sira_ob_s2_rift_mission_cs / namespace_932cd7b76b4df76a
// Params 0
// Checksum 0x0, Offset: 0x3dc7
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_sira_ob_s2_rift_mission_cs / namespace_932cd7b76b4df76a
// Params 0
// Checksum 0x0, Offset: 0x3dd1
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_sira_ob_s2_rift_mission_cs" );
}

