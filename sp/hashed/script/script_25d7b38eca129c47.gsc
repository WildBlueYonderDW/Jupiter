#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\anim;
#using scripts\sp\utility;

#namespace namespace_69b39d9c0dcbae56;

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de0
// Size: 0x1e
function main() {
    player();
    generic_human();
    scriptmodels();
    function_d24dabcbf95e138c();
}

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e06
// Size: 0x9c
function player() {
    var_de3cd0960c122123 = utility::function_ea3248e9abe4700a();
    level.scr_model[var_de3cd0960c122123] = "viewmodel_fullbody_sp_soap_nightwar";
    level.scr_anim["player_rig"]["rappel1_enter"] = player%twr_0100_rooftop_rappel_scene_plr;
    level.scr_anim["player_rig"]["rappel_exit_down"] = player%twr_global_rappel_td_exit01_plr;
    level.scr_anim["player_rig"]["rappel_exit_up"] = player%twr_global_rappel_tu_exit01_plr;
    addnotetrack_customfunction("player_rig", "dt_misc_coiled_rope,tag_accessory_left", &function_3a0d948c3bc05c29, "rappel1_enter");
}

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eaa
// Size: 0x1733
function generic_human() {
    level.scr_anim["guy"]["IW7_cp_minicrab_stand_melee_l"] = generic_human%iw7_cp_minicrab_stand_melee_l;
    level.scr_anim["guy"]["IW7_cp_minicrab_stand_melee_r"] = generic_human%iw7_cp_minicrab_stand_melee_r;
    level.scr_anim["guy"]["IW7_cp_sasquatch_stand_melee_01"] = generic_human%iw7_cp_sasquatch_stand_melee_01;
    level.scr_anim["guy"]["IW7_cp_sasquatch_stand_melee_02"] = generic_human%iw7_cp_sasquatch_stand_melee_02;
    level.scr_anim["guy"]["vip_0000_riot_temp_melee_loop_01"] = generic_human%vip_0000_riot_temp_melee_loop_01;
    level.scr_anim["guy"]["vip_0000_riot_temp_melee_loop_02"] = generic_human%vip_0000_riot_temp_melee_loop_02;
    level.scr_anim["guy"]["vip_0000_riot_temp_melee_loop_01_loop"][0] = generic_human%vip_0000_riot_temp_melee_loop_01;
    level.scr_anim["guy"]["emb_oc_020_doorkick_alq_idle"] = generic_human%emb_oc_020_doorkick_alq_idle;
    level.scr_anim["guy"]["ph_parade_un_cheering_04"] = generic_human%ph_parade_un_cheering_04;
    level.scr_anim["guy"]["ph_parade_un_cheering_06"] = generic_human%ph_parade_un_cheering_06;
    level.scr_anim["guy"]["ph_parade_un_cheering_07"] = generic_human%ph_parade_un_cheering_07;
    level.scr_anim["Makarov"]["slide_makarov"] = generic_human%vip_exfil_slide_01;
    level.scr_anim["ally1"]["slide_ivan"] = generic_human%vip_exfil_slide_02;
    level.scr_anim["guard"]["makarov_flashbang_idle"][0] = generic_human%emb_oc_020_doorkick_alq_idle;
    level.scr_anim["prisoner"]["makarov_flashbang_idle"][0] = generic_human%civ_cap_cower03_prone_exposed_idle@1;
    level.scr_anim["generic"]["civ_vip_interaction_baton_grapple_a_guard"][0] = generic_human%civ_vip_interaction_baton_grapple_a_guard@1;
    level.scr_anim["generic"]["civ_vip_interaction_baton_grapple_a_prisoner"][0] = generic_human%civ_vip_interaction_baton_grapple_a_prisoner@1;
    level.scr_anim["generic"]["civ_vip_interaction_baton_grapple_b_guard"][0] = generic_human%civ_vip_interaction_baton_grapple_b_guard@1;
    level.scr_anim["generic"]["civ_vip_interaction_baton_grapple_b_prisoner"][0] = generic_human%civ_vip_interaction_baton_grapple_b_prisoner@1;
    level.scr_anim["guy"]["civ_cap_cower03_prone_exposed_idle"][0] = generic_human%civ_cap_cower03_prone_exposed_idle@1;
    level.scr_anim["searchlights_officer"]["alarmed_signal"] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["patrol_idle"]["conversation01"]["intro"] = generic_human%sdr_stl_patrol_stand_conversation01_start;
    level.scr_anim["patrol_idle"]["conversation01"]["loop"] = generic_human%sdr_stl_patrol_stand_conversation01_idle;
    level.scr_anim["patrol_idle"]["conversation01"]["exit"] = generic_human%sdr_stl_patrol_stand_conversation01_end;
    level.scr_anim["patrol_idle"]["conversation01"]["react"] = 0;
    level.scr_anim["patrol_idle"]["conversation02"]["intro"] = generic_human%sdr_stl_patrol_stand_conversation02_start;
    level.scr_anim["patrol_idle"]["conversation02"]["loop"] = generic_human%sdr_stl_patrol_stand_conversation02_idle;
    level.scr_anim["patrol_idle"]["conversation02"]["exit"] = generic_human%sdr_stl_patrol_stand_conversation02_end;
    level.scr_anim["patrol_idle"]["conversation02"]["react"] = 0;
    level.scr_anim["patrol_idle"]["smoking_01"]["intro"] = generic_human%grd_stl_patrol_stand_smoking_start;
    level.scr_anim["patrol_idle"]["smoking_01"]["loop"] = generic_human%grd_stl_patrol_stand_smoking_idle;
    level.scr_anim["patrol_idle"]["smoking_01"]["exit"] = generic_human%grd_stl_patrol_stand_smoking_end;
    level.scr_anim["patrol_idle"]["smoking_01"]["react"] = 0;
    level.scr_anim["patrol_idle"]["device_medium"]["intro"] = generic_human%jup_interaction_patrol_device_medium_right_start;
    level.scr_anim["patrol_idle"]["device_medium"]["loop"] = generic_human%jup_interaction_patrol_device_medium_right_loop;
    level.scr_anim["patrol_idle"]["device_medium"]["exit"] = generic_human%jup_interaction_patrol_device_medium_right_end;
    level.scr_anim["patrol_idle"]["device_medium"]["react"] = 0;
    level.scr_anim["patrol_idle"]["device_laptop"]["intro"] = generic_human%jup_ranch_pmc_investigating_blackbox_start;
    level.scr_anim["patrol_idle"]["device_laptop"]["loop"] = generic_human%jup_ranch_pmc_investigating_blackbox_loop;
    level.scr_anim["patrol_idle"]["device_laptop"]["exit"] = generic_human%jup_ranch_pmc_investigating_blackbox_end;
    level.scr_anim["patrol_idle"]["device_laptop"]["react"] = 0;
    level.scr_anim["patrol_idle"]["wall_lean"]["intro"] = generic_human%sdr_stl_patrol_stand_wall_lean01_start;
    level.scr_anim["patrol_idle"]["wall_lean"]["loop"] = generic_human%sdr_stl_patrol_stand_wall_lean01_idle;
    level.scr_anim["patrol_idle"]["wall_lean"]["exit"] = generic_human%sdr_stl_patrol_stand_wall_lean01_end;
    level.scr_anim["patrol_idle"]["wall_lean"]["react"] = 0;
    level.scr_anim["patrol_idle"]["distance_look"]["intro"] = generic_human%grd_stl_patrol_stand_distance_look01_start;
    level.scr_anim["patrol_idle"]["distance_look"]["loop"] = generic_human%grd_stl_patrol_stand_distance_look01_idle;
    level.scr_anim["patrol_idle"]["distance_look"]["exit"] = generic_human%grd_stl_patrol_stand_distance_look01_end;
    level.scr_anim["patrol_idle"]["distance_look"]["react"] = 0;
    level.scr_anim["patrol_idle"]["rail_lean"]["intro"] = generic_human%sdr_stl_patrol_stand_rail_lean01_start;
    level.scr_anim["patrol_idle"]["rail_lean"]["loop"] = generic_human%sdr_stl_patrol_stand_rail_lean01_idle;
    level.scr_anim["patrol_idle"]["rail_lean"]["exit"] = generic_human%sdr_stl_patrol_stand_rail_lean01_end;
    level.scr_anim["patrol_idle"]["rail_lean"]["react"] = 0;
    level.scr_anim["patrol_idle"]["rail_look_over"]["intro"] = generic_human%sdr_stl_patrol_stand_rail_look_over01_start;
    level.scr_anim["patrol_idle"]["rail_look_over"]["loop"] = generic_human%sdr_stl_patrol_stand_rail_look_over01_idle;
    level.scr_anim["patrol_idle"]["rail_look_over"]["exit"] = generic_human%sdr_stl_patrol_stand_rail_look_over01_end;
    level.scr_anim["patrol_idle"]["rail_look_over"]["react"] = 0;
    level.scr_anim["patrol_idle"]["humming"]["intro"] = generic_human%sdr_stl_patrol_stand_humming01_start;
    level.scr_anim["patrol_idle"]["humming"]["loop"] = generic_human%sdr_stl_patrol_stand_humming01_idle;
    level.scr_anim["patrol_idle"]["humming"]["exit"] = generic_human%sdr_stl_patrol_stand_humming01_end;
    level.scr_anim["patrol_idle"]["humming"]["react"] = 0;
    level.scr_anim["patrol_idle"]["radio"]["intro"] = generic_human%sdr_stl_patrol_stand_radio01_start;
    level.scr_anim["patrol_idle"]["radio"]["loop"] = generic_human%sdr_stl_patrol_stand_radio01_idle;
    level.scr_anim["patrol_idle"]["radio"]["exit"] = generic_human%sdr_stl_patrol_stand_radio01_end;
    level.scr_anim["patrol_idle"]["radio"]["react"] = 0;
    level.scr_anim["patrol_idle"]["kneel"]["intro"] = generic_human%hm_grnd_grn_kneel_idle_01;
    level.scr_anim["patrol_idle"]["kneel"]["loop"] = generic_human%hm_grnd_grn_kneel_idle_01;
    level.scr_anim["patrol_idle"]["kneel"]["exit"] = generic_human%hm_grnd_grn_kneel_idle_01;
    level.scr_anim["patrol_idle"]["kneel"]["react"] = 0;
    level.scr_anim["patrol_idle"]["point_test"]["intro"] = generic_human%hm_grnd_org_gest_run_point_center;
    level.scr_anim["patrol_idle"]["point_test"]["loop"] = generic_human%hm_grnd_org_gest_run_point_center;
    level.scr_anim["patrol_idle"]["point_test"]["exit"] = generic_human%hm_grnd_org_gest_run_point_center;
    level.scr_anim["patrol_idle"]["point_test"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alert_to_threat"]["intro"] = generic_human%grd_stl_hunt_stand_distance_look_start;
    level.scr_anim["patrol_idle"]["alert_to_threat"]["loop"] = generic_human%grd_stl_hunt_stand_distance_look_idle01;
    level.scr_anim["patrol_idle"]["alert_to_threat"]["exit"] = generic_human%grd_stl_hunt_stand_distance_look_end;
    level.scr_anim["patrol_idle"]["alert_to_threat"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alert_to_threat_2"]["intro"] = generic_human%grd_stl_hunt_stand_distance_look_start;
    level.scr_anim["patrol_idle"]["alert_to_threat_2"]["loop"] = generic_human%grd_stl_hunt_stand_distance_look_idle03;
    level.scr_anim["patrol_idle"]["alert_to_threat_2"]["exit"] = generic_human%grd_stl_hunt_stand_distance_look_end;
    level.scr_anim["patrol_idle"]["alert_to_threat_2"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alert_to_threat_look_down"]["intro"] = generic_human%grd_stl_hunt_stand_look_into_water_start;
    level.scr_anim["patrol_idle"]["alert_to_threat_look_down"]["loop"] = generic_human%grd_stl_hunt_stand_look_into_water_idle01;
    level.scr_anim["patrol_idle"]["alert_to_threat_look_down"]["exit"] = generic_human%grd_stl_hunt_stand_look_into_water_end;
    level.scr_anim["patrol_idle"]["alert_to_threat_look_down"]["react"] = 0;
    level.scr_anim["patrol_idle"]["calm_down"]["intro"] = generic_human%london_police_wave_1;
    level.scr_anim["patrol_idle"]["calm_down"]["loop"] = generic_human%london_police_wave_1;
    level.scr_anim["patrol_idle"]["calm_down"]["exit"] = generic_human%london_police_wave_1;
    level.scr_anim["patrol_idle"]["calm_down"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alarmed_radio"]["intro"] = generic_human%est_cy_enemy_alarmed01;
    level.scr_anim["patrol_idle"]["alarmed_radio"]["loop"] = generic_human%est_cy_enemy_alarmed01;
    level.scr_anim["patrol_idle"]["alarmed_radio"]["exit"] = generic_human%est_cy_enemy_alarmed01;
    level.scr_anim["patrol_idle"]["alarmed_radio"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alarmed_talk"]["intro"] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["patrol_idle"]["alarmed_talk"]["loop"] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["patrol_idle"]["alarmed_talk"]["exit"] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["patrol_idle"]["alarmed_talk"]["react"] = 0;
    level.scr_anim["patrol_idle"]["alarmed_order"]["intro"] = generic_human%est_cy_enemy_alarmed03;
    level.scr_anim["patrol_idle"]["alarmed_order"]["loop"] = generic_human%est_cy_enemy_alarmed03;
    level.scr_anim["patrol_idle"]["alarmed_order"]["exit"] = generic_human%est_cy_enemy_alarmed03;
    level.scr_anim["patrol_idle"]["alarmed_order"]["react"] = 0;
    level.scr_anim["patrol_idle"]["binoc_search"]["intro"] = generic_human%t10_xtr_rooftop_fidget_searching_guard02;
    level.scr_anim["patrol_idle"]["binoc_search"]["loop"] = generic_human%t10_xtr_rooftop_fidget_searching_guard02;
    level.scr_anim["patrol_idle"]["binoc_search"]["exit"] = generic_human%t10_xtr_rooftop_fidget_searching_guard02;
    level.scr_anim["patrol_idle"]["binoc_search"]["react"] = 0;
    level.scr_anim["generic"]["nvg_on"] = generic_human%sdr_ges_nvg_lower;
    level.scr_anim["generic"]["nvg_off"] = generic_human%sdr_ges_nvg_raise;
    level.scr_anim["patrol_idle"]["scared_guard_cower"]["intro"] = generic_human%civ_cap_panic03_stand_exposed_to_cower04@1;
    level.scr_anim["patrol_idle"]["scared_guard_cower"]["loop"] = generic_human%civ_cap_cower04_prone_exposed_idle@1;
    level.scr_anim["patrol_idle"]["scared_guard_cower"]["exit"] = generic_human%civ_cap_cower04_prone_exposed_idle@1;
    level.scr_anim["patrol_idle"]["scared_guard_cower"]["react"] = 0;
    level.scr_anim["patrol_idle"]["scared_guard_kneel"]["intro"] = generic_human%civ_cap_group01_guy01_relax_exposed_stand_to_panic_8@1;
    level.scr_anim["patrol_idle"]["scared_guard_kneel"]["loop"] = generic_human%civ_cap_group01_guy01_stand_panic_idle_8@1;
    level.scr_anim["patrol_idle"]["scared_guard_kneel"]["exit"] = generic_human%civ_cap_group01_guy01_stand_panic_idle_8@1;
    level.scr_anim["patrol_idle"]["scared_guard_kneel"]["react"] = 0;
    level.scr_anim["patrol_idle"]["scared_guard_stand"]["intro"] = generic_human%civ_cap_curious01_stand_exposed_to_panic01@1;
    level.scr_anim["patrol_idle"]["scared_guard_stand"]["loop"] = generic_human%civ_cap_panic01_stand_exposed_idle@1;
    level.scr_anim["patrol_idle"]["scared_guard_stand"]["exit"] = generic_human%civ_cap_panic01_stand_exposed_idle@1;
    level.scr_anim["patrol_idle"]["scared_guard_stand"]["react"] = 0;
    level.scr_anim["guy"]["prisoner_truck_idle"][0] = generic_human%sh_pri_7_1_return_male_a_idle;
    level.scr_anim["guy"]["prisoner_kneel_idle"][0] = generic_human%estate_prisoner_tied_idle02;
    level.scr_anim["guy"]["grd_stl_patrol_stand_smoking_idle01"][0] = generic_human%grd_stl_patrol_stand_smoking_idle01;
    level.scr_anim["guy"]["grd_stl_patrol_stand_radio01_idle"][0] = generic_human%grd_stl_patrol_stand_radio01_idle;
    level.scr_anim["guy"]["sdr_hostage_holdup03_guard_idle"][0] = generic_human%sdr_hostage_holdup03_guard_idle;
    level.scr_anim["guy"]["sdr_hostage_holdup01_guard_idle"][0] = generic_human%sdr_hostage_holdup01_guard_idle;
    level.scr_anim["guy"]["hm_grnd_yel_patrol_repairwallunit_loop"][0] = generic_human%hm_grnd_yel_patrol_repairwallunit_loop;
    level.scr_anim["guy"]["reb_smtobj_look_high_loop_alt"][0] = generic_human%reb_smtobj_look_high_loop_alt;
    level.scr_anim["guy"]["emb_truck_010_attack_react_ally02"] = generic_human%emb_truck_010_attack_react_ally02;
    level.scr_anim["guy"]["est_cy_enemy_alarmed01"] = generic_human%est_cy_enemy_alarmed01;
    level.scr_anim["guy"]["est_cy_enemy_alarmed02"] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["guy"]["sdr_hostage_holdup01_guard_idle"][0] = generic_human%sdr_hostage_holdup01_guard_idle;
    level.scr_anim["guy"]["reb_stl_patrol_flash_idle_react_lg_up"] = generic_human%reb_stl_patrol_flash_idle_react_lg_up;
    level.scr_anim["guy"]["grd_stl_patrol_stand_radio01_idle"][0] = generic_human%grd_stl_patrol_stand_radio01_idle;
    level.scr_anim["guy"]["emb_truck_010_attack_react_ally01"] = generic_human%emb_truck_010_attack_react_ally01;
    level.scr_anim["guy"]["sdr_com_cover_right_crouch_to_exposed_stand01_6"] = generic_human%sdr_com_cover_right_crouch_to_exposed_stand01_6;
    level.scr_anim["guy"]["reb_stl_patrol_flash_idle_react_lg_8"] = generic_human%reb_stl_patrol_flash_idle_react_lg_8;
    level.scr_anim["guy"]["iw9_veh_bed_lowcrouch_reaction_friendlyfire_6"] = generic_human%iw9_veh_bed_lowcrouch_reaction_friendlyfire_6;
    level.scr_anim["guy"]["enemy_truck_idle"][0] = generic_human%reb_vh_techo_bed_guy1_idle_search01;
    level.scr_anim["guy"]["enemy_truck_idle"][0] = generic_human%reb_vh_techo_bed_guy1_idle_search02;
    level.scr_anim["guy"]["enemy_truck_idle"][0] = generic_human%reb_vh_techo_bed_guy1_idle_search03;
    level.scr_anim["ally1"]["ally_smoke_grenade_throw"] = generic_human%sdr_com_cover_right_crouch_hide_grenade_flash;
    level.scr_anim["ally2"]["ally_smoke_grenade_throw"] = generic_human%sdr_com_cover_right_crouch_hide_grenade_flash;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_01"] = generic_human%sdr_com_strafe_run_stumble_veerright01;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_02"] = generic_human%sdr_com_strafe_run_stumble_veerright02;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_03"] = generic_human%sdr_com_strafe_run_stumble_veerright03;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_04"] = generic_human%sdr_com_strafe_run_stumble_veerleft01;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_05"] = generic_human%sdr_com_strafe_run_stumble_veerleft02;
    level.scr_anim["guy"]["courtyard_prisoner_runner_stumble_06"] = generic_human%sdr_com_strafe_run_stumble_veerleft03;
    level.scr_anim["guy"]["courtyard_prisoner_weapon_grab"] = generic_human%prn_1100_2nd_cell_breach_male05;
    level.scr_anim["guy"]["shipcrib_moon_injured_drag03_guyb_idle_01"][0] = generic_human%shipcrib_moon_injured_drag03_guyb_idle_01;
    level.scr_anim["guy"]["twr_dead_civ_male_prone_02"][0] = generic_human%twr_dead_civ_male_prone_02;
    level.scr_anim["guy"]["bdr_2200_stash_migrants_dead_idle_guy01"][0] = generic_human%bdr_2200_stash_migrants_dead_idle_guy01;
    level.scr_anim["guy"]["shipcrib_moon_injured_drag01_guyc_idle_01"][0] = generic_human%shipcrib_moon_injured_drag01_guyc_idle_01;
    level.scr_anim["guy"]["courtyard_arrive_scene_protector_idle"][0] = generic_human%est_cy_enemy_alarmed02;
    level.scr_anim["guy"]["courtyard_arrive_scene_protector_death"] = generic_human%hm_grnd_red_exposed_death_shoulder_falls_2_ar;
    level.scr_anim["guy"]["courtyard_arrive_scene_medic"][0] = generic_human%nwr_0500_heli_rescue_intro_idle_medic;
    level.scr_anim["Makarov"]["exposed_enter"] = generic_human%jup_vip_mak_stand_exposed_enter;
    level.scr_anim["Makarov"]["exposed_exit"] = generic_human%jup_vip_mak_stand_exposed_exit;
    level.scr_anim["Makarov"]["exposed_combat"] = generic_human%jup_vip_mak_stand_exposed_to_combat;
    level.scr_anim["Makarov"]["exposed_idle"][0] = generic_human%jup_vip_mak_stand_exposed_idle;
    level.scr_anim["Makarov"]["exposed_idle1"] = generic_human%jup_vip_mak_stand_exposed_twitch_a;
    level.scr_anim["Makarov"]["exposed_idle2"] = generic_human%jup_vip_mak_stand_exposed_twitch_b;
    level.scr_anim["Makarov"]["exposed_idle3"] = generic_human%jup_vip_mak_stand_exposed_twitch_c;
    level.scr_anim["Makarov"]["exposed_idle4"] = generic_human%jup_vip_mak_stand_exposed_twitch_d;
    level.scr_anim["Makarov"]["exposed_idle5"] = generic_human%jup_vip_mak_stand_exposed_twitch_e;
    level.scr_anim["Makarov"]["exposed_idle6"] = generic_human%jup_vip_mak_stand_exposed_twitch_f;
    level.scr_anim["Makarov"]["exposed_idle7"] = generic_human%jup_vip_mak_stand_exposed_twitch_g;
    level.scr_anim["Makarov"]["exposed_idle8"] = generic_human%jup_vip_mak_stand_exposed_twitch_h;
    level.scr_anim["Makarov"]["exposed_idle9"] = generic_human%jup_vip_mak_stand_exposed_twitch_i;
    level.scr_anim["Makarov"]["exposed_idle10"] = generic_human%jup_vip_mak_stand_exposed_twitch_j;
    level.scr_anim["Makarov"]["exposed_idle11"] = generic_human%jup_vip_mak_stand_exposed_twitch_k;
    level.scr_anim["ally1"]["elevator_nag_1"] = generic_human%vip_1300_elevator_makarov_nag1_ivan_face;
    level.scr_anim["ally1"]["elevator_nag_2"] = generic_human%vip_1300_elevator_makarov_nag2_ivan_face;
    level.scr_anim["ally1"]["elevator_nag_3"] = generic_human%vip_1300_elevator_makarov_nag3_ivan_face;
    level.scr_anim["ally1"]["elevator_nag_4"] = generic_human%vip_1300_elevator_makarov_nag4_ivan_face;
    level.scr_animtree["pilot"] = %generic_human;
    level.scr_model["pilot"] = "fullbody_sp_ally_pilot_western_vm";
    level.scr_anim["pilot"]["reb_vh_palfa_driver_idle_search01"][0] = generic_human%reb_vh_palfa_driver_idle_search01;
}

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e5
// Size: 0x7b
function scriptmodels() {
    short_rope = "short_rope";
    level.scr_model[short_rope] = "medium_rappel_clip_rope";
    level.scr_animtree[short_rope] = %script_model;
    level.scr_anim[short_rope]["rappel1_enter"] = script_model%twr_0100_rooftop_rappel_scene_rope01;
    dangling_rope = "dangling_rope";
    level.scr_model[dangling_rope] = "misc_rapelling_rope_sim_fiber_short";
    level.scr_animtree[dangling_rope] = %script_model;
}

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3668
// Size: 0x1a
function function_3a0d948c3bc05c29(ent) {
    self.rope show();
}

// Namespace namespace_69b39d9c0dcbae56 / namespace_20bc39e1e8895429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x368a
// Size: 0x2d2
function function_d24dabcbf95e138c() {
    anime = "rappel1_enter";
    rig = "player_rappel_rig";
    level.scr_animtree[rig] = %player_rappel_rig;
    level.scr_model[rig] = "viewmodel_fullbody_sp_soap_nightwar";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_0100_rooftop_rappel_scene_plr;
    addnotetrack_customfunction(rig, "dt_misc_coiled_rope,tag_accessory_left", &function_3a0d948c3bc05c29, anime);
    level.scr_anim[rig]["root"] = player_rappel_rig%root;
    anime = "toeup_idle";
    level.scr_anim[rig][anime][0] = player_rappel_rig%twr_global_rappel_tu_idle01;
    level.scr_anim[rig][anime][1] = player_rappel_rig%twr_global_rappel_tu_idle02;
    level.scr_anim[rig][anime][2] = player_rappel_rig%twr_global_rappel_tu_idle03;
    anime = "toedown_idle";
    level.scr_anim[rig][anime][0] = player_rappel_rig%twr_global_rappel_td_idle01;
    level.scr_anim[rig][anime][1] = player_rappel_rig%twr_global_rappel_td_idle02;
    level.scr_anim[rig][anime][2] = player_rappel_rig%twr_global_rappel_td_idle03;
    anime = "rappel2_enter";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_0450_floor_a_rappel_scene_plr;
    anime = "toedown_turnleft";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_inplace_turn_l;
    anime = "toedown_turnright";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_inplace_turn_r;
    anime = "toeup_turnleft";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_inplace_turn_l;
    anime = "toeup_turnright";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_inplace_turn_r;
    anime = "toedown_jump";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_jump_inplace_takeoff;
    anime = "toedown_jump_inair";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_jump_inplace_air;
    anime = "toedown_jump_land";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_jump_inplace_land;
    anime = "toeup_jump";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_jump_inplace_takeoff;
    anime = "toeup_jump_inair";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_jump_inplace_air;
    anime = "toeup_jump_land";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_jump_inplace_land;
    anime = "breach_swing";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_tu_swing_exit01_plr;
    anime = "toedown_breach_jump_left";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_jump_takeoff_l;
    anime = "toedown_breach_jump_right";
    level.scr_anim[rig][anime] = player_rappel_rig%twr_global_rappel_td_jump_takeoff_r;
}

