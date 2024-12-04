#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\sp\anim;
#using scripts\sp\utility;

#namespace namespace_7a3aed3d9ea64352;

// Namespace namespace_7a3aed3d9ea64352 / namespace_fad40c80a9714961
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b12
// Size: 0x1e
function main() {
    anim_precache();
    player();
    humans();
    script_models();
}

// Namespace namespace_7a3aed3d9ea64352 / namespace_fad40c80a9714961
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b38
// Size: 0x44
function anim_precache() {
    precachemodel("body_c_jup_sp_enemy_kastovsoldier_03");
    precachemodel("body_c_jup_sp_enemy_kastovsoldier_02");
    precachemodel("body_c_jup_sp_enemy_kastovsoldier_01");
    precachemodel("parts_jup_holster_plastichigh");
    precachemodel("un_office_computer_monitor_03_lit");
    precachemodel("head_sc_m_ramirez_no_hair");
}

// Namespace namespace_7a3aed3d9ea64352 / namespace_fad40c80a9714961
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b84
// Size: 0x67
function player() {
    rig = "player_rig";
    level.scr_animtree[rig] = %player;
    level.scr_model[rig] = "vm_c_jup_sp_hero_laswell_bdu";
    level.scr_anim[rig]["keycard_interact"] = player%jup_milbase_vm_keycard_plr;
    level.scr_anim[rig]["hat_removal"] = player%gesture_remove_cap_player;
}

// Namespace namespace_7a3aed3d9ea64352 / namespace_fad40c80a9714961
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf3
// Size: 0x1133
function humans() {
    level.scr_animtree["prisoner01"] = %generic_human;
    level.scr_model["prisoner01"] = "body_c_jup_sp_enemy_kastovsoldier_03";
    level.scr_animtree["prisoner05"] = %generic_human;
    level.scr_model["prisoner05"] = "body_c_jup_sp_enemy_kastovsoldier_02";
    level.scr_animtree["prisoner09"] = %generic_human;
    level.scr_model["prisoner09"] = "body_c_jup_sp_enemy_kastovsoldier_01";
    level.scr_anim["prisoner01"]["deadciv_scene_idle_01"] = generic_human%cap_bnk_010_prisoners_idle_civ01;
    level.scr_anim["prisoner01"]["deadciv_scene_dead_01"] = generic_human%cap_bnk_010_prisoners_dead_civ01;
    level.scr_anim["prisoner01"]["deadciv_scene_run_death_short_01"] = generic_human%jup_che_run_pain_death_short_1;
    level.scr_anim["prisoner01"]["deadciv_scene_run_death_short_02"] = generic_human%jup_che_run_pain_death_short_2;
    level.scr_anim["prisoner01"]["deadciv_scene_run_death_short_03"] = generic_human%jup_che_run_pain_death_short_3;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_01"] = generic_human%jup_che_stand_pain_death_01;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_02"] = generic_human%jup_che_stand_pain_death_02;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_03"] = generic_human%jup_che_stand_pain_death_03;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_04"] = generic_human%jup_che_stand_pain_death_04;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_05"] = generic_human%jup_che_stand_pain_death_05;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_06"] = generic_human%jup_che_stand_pain_death_06;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_07"] = generic_human%jup_che_stand_pain_death_07;
    level.scr_anim["prisoner01"]["deadciv_scene_stand_death_short_08"] = generic_human%jup_che_stand_pain_death_08;
    level.scr_anim["prisoner01"]["civ_pnc_run_moving_death01"] = generic_human%civ_pnc_run_moving_death01;
    level.scr_anim["prisoner01"]["civ_pnc_run_moving_death02"] = generic_human%civ_pnc_run_moving_death02;
    level.scr_anim["prisoner01"]["zom_core_death_run_1"] = generic_human%zom_core_death_run_1;
    level.scr_anim["prisoner01"]["zom_core_death_run_5"] = generic_human%zom_core_death_run_5;
    level.scr_anim["prisoner01"]["deadciv_scene_run_death_long_02"] = generic_human%jup_che_run_pain_death_long_2;
    level.scr_anim["prisoner01"]["deadciv_scene_run_death_long_03"] = generic_human%jup_che_run_pain_death_long_3;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_in_1"] = generic_human%jup_che_door_panic_death_a_in_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_in_3"] = generic_human%jup_che_door_panic_death_a_in_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_loop_1"] = generic_human%jup_che_door_panic_death_a_loop_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_loop_3"] = generic_human%jup_che_door_panic_death_a_loop_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_out_1"] = generic_human%jup_che_door_panic_death_a_out_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_a_out_3"] = generic_human%jup_che_door_panic_death_a_out_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_in_1"] = generic_human%jup_che_door_panic_death_b_in_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_in_2"] = generic_human%jup_che_door_panic_death_b_in_02;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_in_3"] = generic_human%jup_che_door_panic_death_b_in_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_loop_1"] = generic_human%jup_che_door_panic_death_b_loop_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_loop_2"] = generic_human%jup_che_door_panic_death_b_loop_02;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_loop_3"] = generic_human%jup_che_door_panic_death_b_loop_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_out_1"] = generic_human%jup_che_door_panic_death_b_out_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_out_2"] = generic_human%jup_che_door_panic_death_b_out_02;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_door_panic_death_b_out_3"] = generic_human%jup_che_door_panic_death_b_out_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_react_canister_fall_death_01"] = generic_human%jup_che_react_canister_fall_death_01;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_react_canister_fall_death_02"] = generic_human%jup_che_react_canister_fall_death_02;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_react_canister_fall_death_03"] = generic_human%jup_che_react_canister_fall_death_03;
    level.scr_anim["prisoner01"]["deadciv_scene_jup_che_react_canister_fall_death_04"] = generic_human%jup_che_react_canister_fall_death_04;
    level.scr_anim["prisoner05"]["deadciv_scene_idle_05"] = generic_human%cap_bnk_010_prisoners_idle_civ05;
    level.scr_anim["prisoner05"]["deadciv_scene_dead_05"] = generic_human%cap_bnk_010_prisoners_dead_civ05;
    level.scr_anim["prisoner09"]["deadciv_scene_idle_09"] = generic_human%cap_bnk_010_prisoners_idle_civ09;
    level.scr_anim["prisoner09"]["deadciv_scene_dead_09"] = generic_human%cap_bnk_010_prisoners_dead_civ09;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_door_turn_knob_start"] = generic_human%jup_interaction_patrol_door_turn_knob_start;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_door_turn_knob_loop"] = generic_human%jup_interaction_patrol_door_turn_knob_loop;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_door_turn_knob_end"] = generic_human%jup_interaction_patrol_door_turn_knob_end;
    level.scr_anim["prisoner01"]["iw9_mp_veh_jltv_seat_0_idle"] = generic_human%iw9_mp_veh_jltv_seat_0_idle;
    level.scr_anim["prisoner01"]["iw9_veh_heli_medium_seat_0_idle_search01"] = generic_human%iw9_veh_heli_medium_seat_0_idle_search01;
    level.scr_anim["prisoner01"]["iw9_veh_heli_medium_seat_1_idle_search01"] = generic_human%iw9_veh_heli_medium_seat_1_idle_search01;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_tablet_inventory_loop_01"][0] = generic_human%jup_interaction_patrol_tablet_inventory_loop_01;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_tablet_inventory_loop_02"][0] = generic_human%jup_interaction_patrol_tablet_inventory_loop_02;
    level.scr_anim["prisoner01"]["jup_interaction_patrol_tablet_inventory_loop_03"][0] = generic_human%jup_interaction_patrol_tablet_inventory_loop_03;
    level.scr_face["soldier"]["dx_sp_flas_infs_pric_itsonthethirdfloorle"] = generic_human%dx_sp_flas_infs_pric_itsonthethirdfloorle_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_eta"] = generic_human%dx_sp_jmlb_icdm_offc_eta_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_isthesupplyshipmenta"] = generic_human%dx_sp_jmlb_icdm_offc_isthesupplyshipmenta_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_affirmative"] = generic_human%dx_sp_jmlb_icdm_ru01_affirmative_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_weshouldseethembysun"] = generic_human%dx_sp_jmlb_icdm_ru01_weshouldseethembysun_face;
    level.scr_face["soldier"]["dx_sp_jmlb_card_offc_statusupdateonthecom"] = generic_human%dx_sp_jmlb_card_offc_statusupdateonthecom_face;
    level.scr_face["soldier"]["dx_sp_jmlb_card_offc_whenwillitbereadyfor"] = generic_human%dx_sp_jmlb_card_offc_whenwillitbereadyfor_face;
    level.scr_face["soldier"]["dx_sp_jmlb_card_ru01_endofday"] = generic_human%dx_sp_jmlb_card_ru01_endofday_face;
    level.scr_face["soldier"]["dx_sp_jmlb_card_ru01_upgradesarecurrently"] = generic_human%dx_sp_jmlb_card_ru01_upgradesarecurrently_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_fillmeinsoldier"] = generic_human%dx_sp_jmlb_icdm_offc_fillmeinsoldier_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_goodkeeponschedule"] = generic_human%dx_sp_jmlb_icdm_offc_goodkeeponschedule_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_goodkeepthemomentumg"] = generic_human%dx_sp_jmlb_icdm_offc_goodkeepthemomentumg_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_iwantastatusupdate"] = generic_human%dx_sp_jmlb_icdm_offc_iwantastatusupdate_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_whatsthelatest"] = generic_human%dx_sp_jmlb_icdm_offc_whatsthelatest_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_offc_whenshouldiexpectit"] = generic_human%dx_sp_jmlb_icdm_offc_whenshouldiexpectit_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_betterbeimnotcarryin"] = generic_human%dx_sp_jmlb_icdm_rf01_betterbeimnotcarryin_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_gotmorehelosin"] = generic_human%dx_sp_jmlb_icdm_rf01_gotmorehelosin_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_howisthereportcoming"] = generic_human%dx_sp_jmlb_icdm_rf01_howisthereportcoming_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_thatsnotanexcusewhen"] = generic_human%dx_sp_jmlb_icdm_rf01_thatsnotanexcusewhen_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_thepaperworkneedstob"] = generic_human%dx_sp_jmlb_icdm_rf01_thepaperworkneedstob_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_whatstakingsolong"] = generic_human%dx_sp_jmlb_icdm_rf01_whatstakingsolong_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_wouldntcountonit"] = generic_human%dx_sp_jmlb_icdm_rf01_wouldntcountonit_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_yestheywerequietplea"] = generic_human%dx_sp_jmlb_icdm_rf01_yestheywerequietplea_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_yougoodonwater"] = generic_human%dx_sp_jmlb_icdm_rf01_yougoodonwater_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf01_youshouldgrabsomemor"] = generic_human%dx_sp_jmlb_icdm_rf01_youshouldgrabsomemor_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_hearanythingaboutthe"] = generic_human%dx_sp_jmlb_icdm_rf02_hearanythingaboutthe_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_howlongdoyouthinkthi"] = generic_human%dx_sp_jmlb_icdm_rf02_howlongdoyouthinkthi_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_imokay"] = generic_human%dx_sp_jmlb_icdm_rf02_imokay_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_ineedthemtoreviewthe"] = generic_human%dx_sp_jmlb_icdm_rf02_ineedthemtoreviewthe_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_inspectionscompletew"] = generic_human%dx_sp_jmlb_icdm_rf02_inspectionscompletew_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_niceandbcompany"] = generic_human%dx_sp_jmlb_icdm_rf02_niceandbcompany_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_runninglowtodaysmarc"] = generic_human%dx_sp_jmlb_icdm_rf02_runninglowtodaysmarc_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_thatllbetheday"] = generic_human%dx_sp_jmlb_icdm_rf02_thatllbetheday_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_thiscouldbeagreatopp"] = generic_human%dx_sp_jmlb_icdm_rf02_thiscouldbeagreatopp_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_trainingisbrutal"] = generic_human%dx_sp_jmlb_icdm_rf02_trainingisbrutal_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_whatdidtheythinkofth"] = generic_human%dx_sp_jmlb_icdm_rf02_whatdidtheythinkofth_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_yesicantmoveforwardw"] = generic_human%dx_sp_jmlb_icdm_rf02_yesicantmoveforwardw_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_rf02_yessir"] = generic_human%dx_sp_jmlb_icdm_rf02_yessir_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_1900atthelatest"] = generic_human%dx_sp_jmlb_icdm_ru01_1900atthelatest_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_agreed"] = generic_human%dx_sp_jmlb_icdm_ru01_agreed_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_allisquiet"] = generic_human%dx_sp_jmlb_icdm_ru01_allisquiet_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_alreadydone"] = generic_human%dx_sp_jmlb_icdm_ru01_alreadydone_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_andyoufinishedthepap"] = generic_human%dx_sp_jmlb_icdm_ru01_andyoufinishedthepap_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_anything"] = generic_human%dx_sp_jmlb_icdm_ru01_anything_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_arklovrunslikeclockw"] = generic_human%dx_sp_jmlb_icdm_ru01_arklovrunslikeclockw_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_bringitbymyofficeand"] = generic_human%dx_sp_jmlb_icdm_ru01_bringitbymyofficeand_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_everyoneisexceptiona"] = generic_human%dx_sp_jmlb_icdm_ru01_everyoneisexceptiona_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_everyonesheldupwitht"] = generic_human%dx_sp_jmlb_icdm_ru01_everyonesheldupwitht_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_feelliketheyvebeengo"] = generic_human%dx_sp_jmlb_icdm_ru01_feelliketheyvebeengo_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_finishingupsoon"] = generic_human%dx_sp_jmlb_icdm_ru01_finishingupsoon_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_gotanupdatedcompanys"] = generic_human%dx_sp_jmlb_icdm_ru01_gotanupdatedcompanys_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_guesswellcheckwithth"] = generic_human%dx_sp_jmlb_icdm_ru01_guesswellcheckwithth_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_howwedoingonscheduli"] = generic_human%dx_sp_jmlb_icdm_ru01_howwedoingonscheduli_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_isawjustyesterday"] = generic_human%dx_sp_jmlb_icdm_ru01_isawjustyesterday_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_notcurrentlybutberea"] = generic_human%dx_sp_jmlb_icdm_ru01_notcurrentlybutberea_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_notyetitsmeanttobeco"] = generic_human%dx_sp_jmlb_icdm_ru01_notyetitsmeanttobeco_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_stillworkingonit"] = generic_human%dx_sp_jmlb_icdm_ru01_stillworkingonit_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_thatsgoodtohear"] = generic_human%dx_sp_jmlb_icdm_ru01_thatsgoodtohear_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_tomorrowmorningatthe"] = generic_human%dx_sp_jmlb_icdm_ru01_tomorrowmorningatthe_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_wellcheckwithyouonth"] = generic_human%dx_sp_jmlb_icdm_ru01_wellcheckwithyouonth_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_wellfindoutsoon"] = generic_human%dx_sp_jmlb_icdm_ru01_wellfindoutsoon_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_wevebeeninconstantco"] = generic_human%dx_sp_jmlb_icdm_ru01_wevebeeninconstantco_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_yeahtheyrebusywithth"] = generic_human%dx_sp_jmlb_icdm_ru01_yeahtheyrebusywithth_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru01_yestheyaremeetingwit"] = generic_human%dx_sp_jmlb_icdm_ru01_yestheyaremeetingwit_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_0400tomorrow"] = generic_human%dx_sp_jmlb_icdm_ru02_0400tomorrow_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_copy"] = generic_human%dx_sp_jmlb_icdm_ru02_copy_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_coupleofhoursperhaps"] = generic_human%dx_sp_jmlb_icdm_ru02_coupleofhoursperhaps_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_doescommandneedassis"] = generic_human%dx_sp_jmlb_icdm_ru02_doescommandneedassis_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_everythingslockedin"] = generic_human%dx_sp_jmlb_icdm_ru02_everythingslockedin_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_hasthedelegationarri"] = generic_human%dx_sp_jmlb_icdm_ru02_hasthedelegationarri_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_havetomakeagoodimpre"] = generic_human%dx_sp_jmlb_icdm_ru02_havetomakeagoodimpre_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_hopefullywehearbackb"] = generic_human%dx_sp_jmlb_icdm_ru02_hopefullywehearbackb_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_itsmeanttobe"] = generic_human%dx_sp_jmlb_icdm_ru02_itsmeanttobe_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_iwouldexpectnothingl"] = generic_human%dx_sp_jmlb_icdm_ru02_iwouldexpectnothingl_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_justmomentsago"] = generic_human%dx_sp_jmlb_icdm_ru02_justmomentsago_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_lookforwardtoseeingt"] = generic_human%dx_sp_jmlb_icdm_ru02_lookforwardtoseeingt_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_negative"] = generic_human%dx_sp_jmlb_icdm_ru02_negative_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_ofcourse"] = generic_human%dx_sp_jmlb_icdm_ru02_ofcourse_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_oneneverknowswithour"] = generic_human%dx_sp_jmlb_icdm_ru02_oneneverknowswithour_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_seeanything"] = generic_human%dx_sp_jmlb_icdm_ru02_seeanything_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_shalliaskthemtomeetw"] = generic_human%dx_sp_jmlb_icdm_ru02_shalliaskthemtomeetw_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_thatmightbetoolate"] = generic_human%dx_sp_jmlb_icdm_ru02_thatmightbetoolate_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_thegeneralgreenlitou"] = generic_human%dx_sp_jmlb_icdm_ru02_thegeneralgreenlitou_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_tobeexpectedwehaveim"] = generic_human%dx_sp_jmlb_icdm_ru02_tobeexpectedwehaveim_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_understood"] = generic_human%dx_sp_jmlb_icdm_ru02_understood_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_weretheypresentedtoo"] = generic_human%dx_sp_jmlb_icdm_ru02_weretheypresentedtoo_face;
    level.scr_face["soldier"]["dx_sp_jmlb_icdm_ru02_willdo"] = generic_human%dx_sp_jmlb_icdm_ru02_willdo_face;
}

// Namespace namespace_7a3aed3d9ea64352 / namespace_fad40c80a9714961
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2e
// Size: 0x6b
function script_models() {
    heli = "heli_nik";
    level.scr_animtree[heli] = %script_model;
    level.scr_model[heli] = "veh9_mil_air_heli_blima";
    level.scr_anim[heli]["heli_exfil_land"][0] = script_model%jup_milbase_exfil_veh_in;
    level.scr_anim[heli]["heli_exfil_loop"][0] = script_model%jup_milbase_exfil_veh_loop;
}

