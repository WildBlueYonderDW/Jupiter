// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\dvars.gsc;
#using script_4d0e5ae730a29489;
#using script_2c17aa19d1e937b2;
#using scripts\mp\flags.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\player.gsc;
#using script_2bc0b0102f9b7751;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using script_4a2ee8c6e0ebf192;
#using script_7406801b4c228018;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using script_7b8639f512d4cfe4;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_4b5b395ea0ea0fb;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using script_412f60226ac8bd5b;
#using script_3fddda92c991755e;
#using script_66200b7bf3fe7a49;
#using script_1cb7d67b71a3b4a0;
#using scripts\mp\mp_agent.gsc;
#using script_47fc06d4bb326007;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using script_762b218ddc37e9b;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_62384cde1a08c286;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hud_message.gsc;

#namespace namespace_306af48cb0769c3e;

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc5
// Size: 0x4ec
function function_16d881992389f811() {
    function_9c1b71b6f81d3121();
    level.var_e718773786ad42e8 = [];
    level.var_58b44a84d306019c = [];
    level.var_58b44a84d306019c[1] = "zone";
    level.var_58b44a84d306019c[2] = "bomb";
    level.var_58b44a84d306019c[3] = "hostage";
    level.var_58b44a84d306019c[4] = "destroy";
    level.var_58b44a84d306019c[5] = "destroyPlant";
    level.var_58b44a84d306019c[6] = "escort";
    level.var_58b44a84d306019c[7] = "aiBoss";
    level.var_58b44a84d306019c[8] = "aiBossZone";
    level.var_58b44a84d306019c[9] = "hack";
    level.var_58b44a84d306019c[11] = "escortWheelson";
    level.var_58b44a84d306019c[12] = "captureFlag";
    level.var_58b44a84d306019c[10] = "hackBomb";
    function_ffc7820b3cd963b3(1, &function_a6cf61bad14de666);
    function_ffc7820b3cd963b3(2, &init_bomb_objective);
    function_ffc7820b3cd963b3(3, &function_841f344a6ab9d6f9);
    function_ffc7820b3cd963b3(4, &function_3cdc401d9689c176);
    function_ffc7820b3cd963b3(5, &function_7bcfd3c0f707dfd0);
    function_ffc7820b3cd963b3(6, &function_d1346b4018cc1509);
    function_ffc7820b3cd963b3(7, &function_1f435a041b5ad1d2);
    function_ffc7820b3cd963b3(8, &function_3b22215c63a7e4e5);
    function_ffc7820b3cd963b3(9, &function_2d7f27839316e035);
    function_ffc7820b3cd963b3(11, &function_c00d3986d67e0f5e);
    function_ffc7820b3cd963b3(12, &function_b707f54f7de4fd15);
    function_ffc7820b3cd963b3(10, &function_cb215e355cb593c6);
    function_ed01ebaaf7e97967(1, &function_eee86cff5328a5f2);
    function_ed01ebaaf7e97967(2, &function_2e079de28a14edf4);
    function_ed01ebaaf7e97967(3, &function_ecbcf255884135c5);
    function_ed01ebaaf7e97967(4, &function_30887e570cb220ca);
    function_ed01ebaaf7e97967(5, &function_fe6c238f87f0d34);
    function_ed01ebaaf7e97967(6, &function_3b680608aad5e785);
    function_ed01ebaaf7e97967(7, &function_f9fc871c251cd35e);
    function_ed01ebaaf7e97967(8, &function_fa3e625bbc963a01);
    function_ed01ebaaf7e97967(9, &function_8ed8bdf501691dc9);
    function_ed01ebaaf7e97967(11, &function_df478f29c9a89d5a);
    function_ed01ebaaf7e97967(12, &function_4f20ec3b4b62da91);
    function_ed01ebaaf7e97967(10, &function_45828a6389a8309a);
    function_65668288d02bbcba(1, &end_zone_objective);
    function_65668288d02bbcba(2, &function_b1e48e6ea7e1a047);
    function_65668288d02bbcba(3, &function_274763e755af09dc);
    function_65668288d02bbcba(4, &function_fc4467c9f0610bb9);
    function_65668288d02bbcba(5, &function_20ac728c10edaff1);
    function_65668288d02bbcba(6, &function_e94ef69d91354ea0);
    function_65668288d02bbcba(7, &function_673741f361e9dcf3);
    function_65668288d02bbcba(8, &function_bd6d6ca7a1eaafd0);
    function_65668288d02bbcba(9, &function_2816c555d1a0bde);
    function_65668288d02bbcba(11, &function_96d01b17312762c7);
    function_65668288d02bbcba(12, &function_df7bc18f8882600e);
    function_65668288d02bbcba(10, &function_3e616a6187e9d6ff);
    function_eb9bcbf70f099dea(1, &function_1de7ce0d073824b5);
    function_eb9bcbf70f099dea(2, &function_b067e01602805443);
    function_eb9bcbf70f099dea(3, &function_efbf76fb0a1ae4d2);
    function_eb9bcbf70f099dea(4, &function_2cbdea506661cfc5);
    function_eb9bcbf70f099dea(5, &function_9673371186f2b1c3);
    function_eb9bcbf70f099dea(6, &function_15e2fb8e5bf9b01e);
    function_eb9bcbf70f099dea(7, &function_d52c2ed64193ecf9);
    function_eb9bcbf70f099dea(8, &function_1de7ce0d073824b5);
    function_eb9bcbf70f099dea(9, &function_af3f1639fddce6e6);
    function_eb9bcbf70f099dea(11, &function_a9895b70c0316593);
    function_eb9bcbf70f099dea(12, &function_b010a1f5f8885a06);
    function_eb9bcbf70f099dea(10, &function_505b442c33eb2055);
    function_145c8a3b2e26106b(1, &function_9080aa9578d94aca);
    function_145c8a3b2e26106b(2, &function_75354d8de2adc2a);
    function_145c8a3b2e26106b(5, &function_edcbb313f774a31a);
    function_145c8a3b2e26106b(6, &function_375f5ed9ca0d5437);
    function_145c8a3b2e26106b(9, &function_585d9ea0d3567c2f);
    function_145c8a3b2e26106b(10, &function_59da849245283fc8);
    function_145c8a3b2e26106b(11, &function_23eb8b768403db5e);
    function_145c8a3b2e26106b(12, &function_c59f8281fad3515b);
    if (isdefined(level.var_f24db6a5246641cb)) {
        [[ level.var_f24db6a5246641cb ]]();
    }
    foreach (i, objective in level.var_f136ed04f6b294a7) {
        zone = level.zones["zone_" + i + 1];
        zone.objective = objective;
        [[ level.var_c840756153dfdc80[objective.objectivetype] ]](zone);
        namespace_4b0406965e556711::gameflaginit(zone.name + "_objective_start", 0);
        namespace_4b0406965e556711::gameflaginit(zone.name + "_objective_end", 0);
    }
    level thread function_4b399156131ac605();
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42b8
// Size: 0x9f9
function function_9c1b71b6f81d3121() {
    game["dialog"]["obj1_nag_def_launchfacility"] = "dx_mp_mwm1_mode_spet_ondg";
    game["dialog"]["obj1_nag_atk_launchfacility"] = "dx_mp_mwm1_mode_t141_onat";
    game["dialog"]["obj1_atk_win_launchfacility"] = "dx_mp_mwm1_mode_t141_owak";
    game["dialog"]["obj1_def_lost_launchfacility"] = "dx_mp_mwm1_mode_spet_owin";
    game["dialog"]["obj1_atk_lost_launchfacility"] = "dx_mp_mwm1_mode_t141_ofai";
    game["dialog"]["obj1_def_win_launchfacility"] = "dx_mp_mwm1_mode_spet_ofae";
    game["dialog"]["obj1_securing_a_atk"] = "dx_mp_mwm1_mode_t141_ostk";
    game["dialog"]["obj1_captured_a_atk"] = "dx_mp_mwm1_mode_t141_octk";
    game["dialog"]["obj1_losing_a_def"] = "dx_mp_mwm1_mode_spet_olad";
    game["dialog"]["obj1_lost_a_def"] = "dx_mp_mwm1_mode_spet_olde";
    game["dialog"]["obj1_securing_b_atk"] = "dx_mp_mwm1_mode_t141_osbk";
    game["dialog"]["obj1_captured_b_atk"] = "dx_mp_mwm1_mode_t141_ocbk";
    game["dialog"]["obj1_losing_b_def"] = "dx_mp_mwm1_mode_spet_olbd";
    game["dialog"]["obj1_lost_b_def"] = "dx_mp_mwm1_mode_spet_olbf";
    game["dialog"]["obj1_missile_launch_atk"] = "dx_mp_mwm1_mode_t141_omla";
    game["dialog"]["obj1_atk_overtime_launchfacility"] = "dx_mp_mwm1_mode_t141_ooao";
    game["dialog"]["obj1_def_overtime_launchfacility"] = "dx_mp_mwm1_mode_spet_oode";
    game["dialog"]["obj2_atk_start_launchfacility"] = "dx_mp_mwm1_mode_t141_obeg";
    game["dialog"]["obj2_def_start_launchfacility"] = "dx_mp_mwm1_mode_spet_obgi";
    game["dialog"]["obj2_nag_atk_launchfacility"] = "dx_mp_mwm1_mode_t141_ontk";
    game["dialog"]["obj2_nag_def_launchfacility"] = "dx_mp_mwm1_mode_spet_ondf";
    game["dialog"]["obj2_atk_win_launchfacility"] = "dx_mp_mwm1_mode_t141_owtk";
    game["dialog"]["obj2_def_lost_launchfacility"] = "dx_mp_mwm1_mode_spet_owdf";
    game["dialog"]["obj2_atk_lost_launchfacility"] = "dx_mp_mwm1_mode_t141_oftk";
    game["dialog"]["obj2_def_win_launchfacility"] = "dx_mp_mwm1_mode_spet_ofdf";
    game["dialog"]["obj2_atk_tank_contested_launchfacility"] = "dx_mp_mwm1_mode_t141_otck";
    game["dialog"]["obj2_def_tank_contested_launchfacility"] = "dx_mp_mwm1_mode_spet_otcd";
    game["dialog"]["obj2_atk_tank_damaged_launchfacility"] = "dx_mp_mwm1_mode_t141_otdk";
    game["dialog"]["obj2_def_tank_damaged_launchfacility"] = "dx_mp_mwm1_mode_spet_otdf";
    game["dialog"]["obj2_atk_tank_repaired_launchfacility"] = "dx_mp_mwm1_mode_t141_otra";
    game["dialog"]["obj2_def_tank_repaired_launchfacility"] = "dx_mp_mwm1_mode_spet_otrd";
    game["dialog"]["obj2_atk_overtime_launchfacility"] = "dx_mp_mwm1_mode_t141_ootk";
    game["dialog"]["obj2_def_overtime_launchfacility"] = "dx_mp_mwm1_mode_spet_oodf";
    game["dialog"]["obj3_atk_start_launchfacility"] = "dx_mp_mwm1_mode_t141_obtk";
    game["dialog"]["obj3_def_start_launchfacility"] = "dx_mp_mwm1_mode_spet_obdf";
    game["dialog"]["obj3_nag_atk_launchfacility"] = "dx_mp_mwm1_mode_t141_onak";
    game["dialog"]["obj3_nag_def_launchfacility"] = "dx_mp_mwm1_mode_spet_onde";
    game["dialog"]["obj3_atk_upload_start_launchfacility"] = "dx_mp_mwm1_mode_t141_oipk";
    game["dialog"]["obj3_def_upload_start_launchfacility"] = "dx_mp_mwm1_mode_spet_oipd";
    game["dialog"]["obj3_atk_upload_complete_launchfacility"] = "dx_mp_mwm1_mode_t141_ohpk";
    game["dialog"]["obj3_def_upload_complete_launchfacility"] = "dx_mp_mwm1_mode_spet_ohpd";
    game["dialog"]["obj3_atk_win_launchfacility"] = "dx_mp_mwm1_mode_t141_owat";
    game["dialog"]["obj3_def_lost_launchfacility"] = "dx_mp_mwm1_mode_spet_owde";
    game["dialog"]["obj3_atk_lost_launchfacility"] = "dx_mp_mwm1_mode_t141_ofat";
    game["dialog"]["obj3_def_win_launchfacility"] = "dx_mp_mwm1_mode_spet_ofad";
    game["dialog"]["obj3_missile_launch_atk"] = "dx_mp_mwm1_mode_t141_omlk";
    game["dialog"]["obj3_atk_overtime_launchfacility"] = "dx_mp_mwm1_mode_t141_over";
    game["dialog"]["obj3_def_overtime_launchfacility"] = "dx_mp_mwm1_mode_spet_oota";
    game["dialog"]["obj1_nag_atk_skydiving"] = "dx_mp_skyd_game_seal_onat";
    game["dialog"]["obj1_nag_def_skydiving"] = "dx_mp_skyd_game_spet_ondg";
    game["dialog"]["obj1_atk_activation_start_skydiving"] = "dx_mp_skyd_game_seal_o1aa";
    game["dialog"]["obj1_def_activation_start_skydiving"] = "dx_mp_skyd_game_spet_o1ad";
    game["dialog"]["obj1_atk_activation_restored_skydiving"] = "dx_mp_skyd_game_seal_o1ra";
    game["dialog"]["obj1_def_activation_restored_skydiving"] = "dx_mp_skyd_game_spet_o1rd";
    game["dialog"]["obj1_atk_first_complete_skydiving"] = "dx_mp_skyd_game_seal_o1fa";
    game["dialog"]["obj1_def_first_complete_skydiving"] = "dx_mp_skyd_game_spet_o1fd";
    game["dialog"]["obj1_atk_second_complete_skydiving"] = "dx_mp_skyd_game_seal_o1st";
    game["dialog"]["obj1_def_second_complete_skydiving"] = "dx_mp_skyd_game_spet_o1sf";
    game["dialog"]["obj1_atk_bomb_planted_skydiving"] = "dx_mp_skyd_game_seal_o1pt";
    game["dialog"]["obj1_def_bomb_planted_skydiving"] = "dx_mp_skyd_game_spet_o1pd";
    game["dialog"]["obj1_atk_bomb_defused_skydiving"] = "dx_mp_skyd_game_seal_o1da";
    game["dialog"]["obj1_def_bomb_defused_skydiving"] = "dx_mp_skyd_game_spet_o1bd";
    game["dialog"]["obj1_atk_win_skydiving"] = "dx_mp_skyd_game_seal_owak";
    game["dialog"]["obj1_def_lost_skydiving"] = "dx_mp_skyd_game_spet_owin";
    game["dialog"]["obj1_atk_lost_skydiving"] = "dx_mp_skyd_game_seal_ofai";
    game["dialog"]["obj1_def_win_skydiving"] = "dx_mp_skyd_game_spet_ofae";
    game["dialog"]["obj1_atk_overtime_skydiving"] = "dx_mp_skyd_game_seal_ooao";
    game["dialog"]["obj1_def_overtime_skydiving"] = "dx_mp_skyd_game_spet_oode";
    game["dialog"]["obj2_atk_start_skydiving"] = "dx_mp_skyd_game_seal_obeg";
    game["dialog"]["obj2_def_start_skydiving"] = "dx_mp_skyd_game_spet_obgi";
    game["dialog"]["obj2_nag_atk_skydiving"] = "dx_mp_skyd_game_seal_ontk";
    game["dialog"]["obj2_nag_def_skydiving"] = "dx_mp_skyd_game_spet_ondf";
    game["dialog"]["obj2_atk_wheelson_contested_skydiving"] = "dx_mp_skyd_game_seal_o2ca";
    game["dialog"]["obj2_def_wheelson_contested_skydiving"] = "dx_mp_skyd_game_spet_o2cd";
    game["dialog"]["obj2_atk_wheelson_blocked_skydiving"] = "dx_mp_skyd_game_seal_o2wb";
    game["dialog"]["obj2_def_wheelson_blocked_skydiving"] = "dx_mp_skyd_game_spet_o2bd";
    game["dialog"]["obj2_atk_server1_hacking_skydiving"] = "dx_mp_skyd_game_seal_o1sa";
    game["dialog"]["obj2_def_server1_hacking_skydiving"] = "dx_mp_skyd_game_spet_o1sd";
    game["dialog"]["obj2_atk_server1_hacked_skydiving"] = "dx_mp_skyd_game_seal_o1ht";
    game["dialog"]["obj2_def_server1_hacked_skydiving"] = "dx_mp_skyd_game_spet_o1hd";
    game["dialog"]["obj2_atk_server2_hacking_skydiving"] = "dx_mp_skyd_game_seal_o2sa";
    game["dialog"]["obj2_def_server2_hacking_skydiving"] = "dx_mp_skyd_game_spet_o2sd";
    game["dialog"]["obj2_atk_gas_spreading_skydiving"] = "dx_mp_skyd_game_seal_o2gt";
    game["dialog"]["obj2_def_gas_spreading_skydiving"] = "dx_mp_skyd_game_spet_o2gd";
    game["dialog"]["obj2_atk_zombie_spawned_skydiving"] = "dx_mp_skyd_game_seal_o2za";
    game["dialog"]["obj2_atk_gas_spreading_fast_skydiving"] = "dx_mp_skyd_game_seal_o2ga";
    game["dialog"]["obj2_atk_win_skydiving"] = "dx_mp_skyd_game_seal_owtk";
    game["dialog"]["obj2_def_lost_skydiving"] = "dx_mp_skyd_game_spet_owdf";
    game["dialog"]["obj2_atk_lost_skydiving"] = "dx_mp_skyd_game_seal_oftk";
    game["dialog"]["obj2_def_win_skydiving"] = "dx_mp_skyd_game_spet_ofdf";
    game["dialog"]["obj2_atk_overtime_skydiving"] = "dx_mp_skyd_game_seal_ootk";
    game["dialog"]["obj2_def_overtime_skydiving"] = "dx_mp_skyd_game_spet_oodf";
    game["dialog"]["obj3_atk_start_skydiving"] = "dx_mp_skyd_game_seal_obtk";
    game["dialog"]["obj3_def_start_skydiving"] = "dx_mp_skyd_game_spet_obdf";
    game["dialog"]["obj3_nag_atk_skydiving"] = "dx_mp_skyd_game_seal_onak";
    game["dialog"]["obj3_nag_def_skydiving"] = "dx_mp_skyd_game_spet_onde";
    game["dialog"]["obj3_atk_pick_up_skydiving"] = "dx_mp_skyd_game_seal_o3pa";
    game["dialog"]["obj3_def_pick_up_skydiving"] = "dx_mp_skyd_game_spet_o3pd";
    game["dialog"]["obj3_atk_item_drop_skydiving"] = "dx_mp_skyd_game_seal_o3ia";
    game["dialog"]["obj3_def_item_drop_skydiving"] = "dx_mp_skyd_game_spet_o3id";
    game["dialog"]["obj3_atk_pds_installed_skydiving"] = "dx_mp_skyd_game_seal_o3la";
    game["dialog"]["obj3_def_pds_installed_skydiving"] = "dx_mp_skyd_game_spet_o3ld";
    game["dialog"]["obj3_atk_hold_ground_skydiving"] = "dx_mp_skyd_game_seal_o3hg";
    game["dialog"]["obj3_def_hold_ground_skydiving"] = "dx_mp_skyd_game_spet_o3hd";
    game["dialog"]["obj3_atk_zombie_swarm_skydiving"] = "dx_mp_skyd_game_seal_o3za";
    game["dialog"]["obj3_def_zombie_swarm_skydiving"] = "dx_mp_skyd_game_spet_o3zd";
    game["dialog"]["obj3_atk_win_skydiving"] = "dx_mp_skyd_game_seal_owat";
    game["dialog"]["obj3_def_lost_skydiving"] = "dx_mp_skyd_game_spet_owde";
    game["dialog"]["obj3_atk_lost_skydiving"] = "dx_mp_skyd_game_seal_ofat";
    game["dialog"]["obj3_def_win_skydiving"] = "dx_mp_skyd_game_spet_ofad";
    game["dialog"]["obj3_atk_overtime_skydiving"] = "dx_mp_skyd_game_seal_over";
    game["dialog"]["obj3_def_overtime_skydiving"] = "dx_mp_skyd_game_spet_oota";
    function_e4285658260d1bfa(1, &function_44819d78b997c07e);
    function_e4285658260d1bfa(2, &function_8d2572177b9f2ca8);
    function_e4285658260d1bfa(5, &function_bbecb13e462544f7);
    function_e4285658260d1bfa(3, &function_736687f240844467);
    function_e4285658260d1bfa(6, &function_2aa22d9aa822ab01);
    function_e4285658260d1bfa(9, &function_67d7919e13e0ac64);
    function_e4285658260d1bfa(10, &function_2b07c5a3c08bba8e);
    function_e4285658260d1bfa(11, &function_e50e4c55aec1de36);
    function_e4285658260d1bfa(12, &function_8227a04fff6a005d);
    function_86e5700d7971e414(1, "attackers_lost_zone");
    function_86e5700d7971e414(2, "attackers_lost_bomb_objective");
    function_86e5700d7971e414(5, "attackers_lost_sam_site");
    function_86e5700d7971e414(3, "attackers_lost_hostages");
    function_86e5700d7971e414(6, "attackers_lost_tank_objective");
    function_86e5700d7971e414(9, "obj3_atk_lost_launchfacility");
    function_86e5700d7971e414(10, "obj1_atk_lost_skydiving");
    function_86e5700d7971e414(11, "obj2_atk_lost_skydiving");
    function_86e5700d7971e414(12, "obj3_atk_lost_skydiving");
    function_5580ef2fc74eb79c(9, "obj3_def_win_launchfacility");
    function_5580ef2fc74eb79c(10, "obj1_def_win_skydiving");
    function_5580ef2fc74eb79c(11, "obj2_def_win_skydiving");
    function_5580ef2fc74eb79c(12, "obj3_def_win_skydiving");
    function_8ee1bbc9a60b0b00(2, "attackers_bomb_start", "defenders_bomb_start");
    function_8ee1bbc9a60b0b00(5, "attackers_sam_start", "defenders_sam_start");
    function_8ee1bbc9a60b0b00(6, "attackers_tank_escort_start", "defenders_tank_escort_start");
    function_8ee1bbc9a60b0b00(9, "obj3_atk_start_launchfacility", "obj3_def_start_launchfacility");
    function_8ee1bbc9a60b0b00(11, "obj2_atk_start_skydiving", "obj2_def_start_skydiving");
    function_8ee1bbc9a60b0b00(12, "obj3_atk_start_skydiving", "obj3_def_start_skydiving");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb8
// Size: 0x54
function function_44819d78b997c07e(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "nag_defend_objective", &function_b908e49a52805716, 20, 8);
    function_1e87a912abc079e4(zone, "attackers", "nag_take_objective", &function_c6d032c5630b1779, 20, 8);
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d13
// Size: 0x82
function function_8d2572177b9f2ca8(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "nag_protect_bombs", undefined, 20, 8);
    function_1e87a912abc079e4(zone, "attackers", "nag_defuse_bombs", &function_7a35c8c10abd7cfb, 20, 8);
    function_1e87a912abc079e4(zone, "defenders", "alert_enemy_defusing_bombs", "began_defusing_bomb", 2);
    function_1e87a912abc079e4(zone, "attackers", "alert_team_defusing_bombs", "began_defusing_bomb", 2);
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9c
// Size: 0xb0
function function_bbecb13e462544f7(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "nag_defend_sam_site", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "attackers", "nag_plant_c4", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "defenders", "alert_enemy_planted_c4", "planted_bomb_on_sam_site", 2);
    function_1e87a912abc079e4(zone, "attackers", "alert_team_planted_c4", "planted_bomb_on_sam_site", 2);
    function_1e87a912abc079e4(zone, "defenders", "alert_team_defused_c4", "defused_bomb_on_sam_site", 2);
    function_1e87a912abc079e4(zone, "attackers", "alert_team_defused_c4", "defused_bomb_on_sam_site", 2);
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e53
// Size: 0x4c
function function_736687f240844467(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "nag_defend_hostages", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "attackers", "nag_rescue_hostages", undefined, 14, 8);
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea6
// Size: 0x4c
function function_2aa22d9aa822ab01(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "nag_defenders_defend_tank", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "attackers", "nag_attackers_escort_tank", undefined, 14, 8);
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef9
// Size: 0xed
function function_67d7919e13e0ac64(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "defenders", "obj3_nag_def_launchfacility", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "attackers", "obj3_nag_atk_launchfacility", undefined, 14, 8);
    function_1e87a912abc079e4(zone, "attackers", "obj3_missile_launch_atk", "zone_3_missile_launched");
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_overtime_launchfacility", "obj_type_9_overtime_mp_jup_launchfacility");
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_overtime_launchfacility", "obj_type_9_overtime_mp_jup_launchfacility");
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_upload_start_launchfacility", "hack_zone_upload_start");
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_upload_start_launchfacility", "hack_zone_upload_start");
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_upload_complete_launchfacility", "hack_zone_upload_complete");
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_upload_complete_launchfacility", "hack_zone_upload_complete");
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fed
// Size: 0x198
function function_2b07c5a3c08bba8e(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "attackers", "obj1_nag_atk_skydiving", &function_b57b0ea75269b610, 60, undefined, 18);
    function_1e87a912abc079e4(zone, "defenders", "obj1_nag_def_skydiving", &function_b57b0ea75269b610, 60, undefined, 18);
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_activation_start_skydiving", "hack_zone_upload_start");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_activation_start_skydiving", "hack_zone_upload_start");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_activation_restored_skydiving", "hack_recovered");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_activation_restored_skydiving", "hack_recovered");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_first_complete_skydiving", "hack_zone_upload_complete");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_first_complete_skydiving", "hack_zone_upload_complete");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_second_complete_skydiving", "hack_zone_upload_full_complete");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_second_complete_skydiving", "hack_zone_upload_full_complete");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_bomb_planted_skydiving", "hack_bomb_planted");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_bomb_planted_skydiving", "hack_bomb_planted");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_bomb_defused_skydiving", "hack_bomb_defused");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_bomb_defused_skydiving", "hack_bomb_defused");
    function_1e87a912abc079e4(zone, "attackers", "obj1_atk_overtime_skydiving", "obj_type_10_overtime_mp_jup_skydiving");
    function_1e87a912abc079e4(zone, "defenders", "obj1_def_overtime_skydiving", "obj_type_10_overtime_mp_jup_skydiving");
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x518c
// Size: 0x1e9
function function_e50e4c55aec1de36(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "attackers", "obj2_nag_atk_skydiving", &function_cea536bf68cd4d66, 50, 3, 30);
    function_1e87a912abc079e4(zone, "defenders", "obj2_nag_def_skydiving", &function_942d0ced45796880, 50, 3, 30);
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_wheelson_contested_skydiving", &function_4dea6838299eb754, 20);
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_wheelson_contested_skydiving", &function_4dea6838299eb754, 20);
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_wheelson_blocked_skydiving", &function_91314f19e66f7674, 30);
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_wheelson_blocked_skydiving", &function_91314f19e66f7674, 30);
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_server1_hacking_skydiving", "wheelson_reach_hack_point");
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_server1_hacking_skydiving", "wheelson_reach_hack_point");
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_server1_hacked_skydiving", "point_1_hacked");
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_server1_hacked_skydiving", "point_1_hacked");
    if (istrue(level.var_f94bc8597f932998)) {
        function_1e87a912abc079e4(zone, "attackers", "obj2_atk_zombie_spawned_skydiving", "point_1_hacked", undefined, 5);
    }
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_server2_hacking_skydiving", "wheelson_reach_hack_point_final");
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_server2_hacking_skydiving", "wheelson_reach_hack_point_final");
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_gas_spreading_skydiving", "point_1_hacked", undefined, 13);
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_gas_spreading_skydiving", "point_1_hacked", undefined, 13);
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_gas_spreading_fast_skydiving", "wheelson_reach_hack_point_final", undefined, 7);
    function_1e87a912abc079e4(zone, "attackers", "obj2_atk_overtime_skydiving", "obj_type_11_overtime_mp_jup_skydiving");
    function_1e87a912abc079e4(zone, "defenders", "obj2_def_overtime_skydiving", "obj_type_11_overtime_mp_jup_skydiving");
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537c
// Size: 0x18b
function function_8227a04fff6a005d(zone) {
    level.var_6c0eaa5a95164771 = undefined;
    function_1e87a912abc079e4(zone, "attackers", "obj3_nag_atk_skydiving", &function_88cb5e18754f7caf, 60, undefined, 30);
    function_1e87a912abc079e4(zone, "defenders", "obj3_nag_def_skydiving", &function_88cb5e18754f7caf, 60, undefined, 30);
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_pick_up_skydiving", "filter_picked_up", 10);
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_pick_up_skydiving", "filter_picked_up", 10);
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_item_drop_skydiving", "filter_drop", 10);
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_item_drop_skydiving", "filter_drop", 10);
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_pds_installed_skydiving", "captureflag_device_deployed");
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_pds_installed_skydiving", "captureflag_device_deployed");
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_hold_ground_skydiving", "captureflag_device_deployed", undefined, 5);
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_hold_ground_skydiving", "captureflag_device_deployed", undefined, 5);
    if (istrue(level.var_f94bc8597f932998)) {
        function_1e87a912abc079e4(zone, "attackers", "obj3_atk_zombie_swarm_skydiving", "captureflag_device_deployed", undefined, 12);
    }
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_zombie_swarm_skydiving", "captureflag_device_deployed", undefined, 12);
    function_1e87a912abc079e4(zone, "attackers", "obj3_atk_overtime_skydiving", "obj_type_12_overtime_mp_jup_skydiving");
    function_1e87a912abc079e4(zone, "defenders", "obj3_def_overtime_skydiving", "obj_type_12_overtime_mp_jup_skydiving");
    function_266f0d24f28fc974(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550e
// Size: 0x77
function function_7a35c8c10abd7cfb(zone) {
    foreach (player in level.players) {
        if (isreallyalive(player) && istrue(player.isplanting)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558d
// Size: 0x7e
function function_b908e49a52805716(zone) {
    foreach (capture_zone in zone.var_ee13e110c0910a51) {
        if (isdefined(capture_zone.claimplayer) && !istrue(capture_zone.stalemate)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5613
// Size: 0x78
function function_c6d032c5630b1779(zone) {
    foreach (capture_zone in zone.var_ee13e110c0910a51) {
        if (capture_zone.touchlist[game["attackers"]].size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5693
// Size: 0xb6
function function_4b399156131ac605() {
    while (!isdefined(level.var_f55e20c194c117f4)) {
        waitframe();
    }
    while (1) {
        foreach (turret in level.var_f55e20c194c117f4) {
            if (!isdefined(turret)) {
                continue;
            }
            ent = function_fb532e39e9edebf5(turret);
            /#
                print3d(turret.origin, ent.var_f236a45969f96bb4, (1, 1, 1), 1, 1, 1);
            #/
        }
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5750
// Size: 0x14e
function function_458432ef4351024c(player) {
    if (player namespace_19b4203b51d56488::function_781844c0c05b5ac7()) {
        player = player.owner;
    }
    player dlog_recordplayerevent("dlog_event_wm_player_objective_start", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"objective_start_time", 3:gettime() / 1000, 4:"map_name", 5:level.script, 6:"player_team", 7:player.team, 8:"player_x", 9:player.origin[0], 10:"player_y", 11:player.origin[1], 12:"player_z", 13:player.origin[2], 14:"objective_type", 15:"" + level.zone.objectivetype, 16:"objective_key", 17:self.objectivekey, 18:"objective_id", 19:level.zone.name, 20:"round", 21:"" + game["roundsPlayed"]]);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a5
// Size: 0x190
function function_bc781bec44dec115(player, success) {
    if (player namespace_19b4203b51d56488::function_781844c0c05b5ac7()) {
        player = player.owner;
    }
    state = "success";
    if (!success) {
        state = ter_op(isalive(player), "cancel", "dead");
    }
    player dlog_recordplayerevent("dlog_event_wm_player_objective_end", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"objective_end_time", 3:gettime() / 1000, 4:"map_name", 5:level.script, 6:"player_team", 7:player.team, 8:"player_x", 9:player.origin[0], 10:"player_y", 11:player.origin[1], 12:"player_z", 13:player.origin[2], 14:"objective_type", 15:"" + level.zone.objectivetype, 16:"objective_key", 17:self.objectivekey, 18:"objective_id", 19:level.zone.name, 20:"player_end_state", 21:state, 22:"round", 23:"" + game["roundsPlayed"]]);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3c
// Size: 0x1a4
function function_333f4c66e6305891(objectivetype, objectivekey, objectiveid, targetname, params) {
    if (!isdefined(level.var_f136ed04f6b294a7)) {
        level.var_f136ed04f6b294a7 = [];
    }
    if (istrue(level.var_f5c4d2c739170293)) {
        return;
    }
    if (getdvarint(@"hash_677b0279e04cc234", -1) > 0) {
        var_d93cc72872799b37 = getdvarint(@"hash_677b0279e04cc234", -1);
        objectivetype = var_d93cc72872799b37;
        objectivekey = [0:"_a", 1:"_b", 2:"_c", 3:"_d", 4:"_e", 5:"_f", 6:"_g", 7:"_h", 8:"_i"];
        targetname = function_58f22e4d0d5e523a(objectivetype);
        ents = array_combine(getentarray(targetname, "targetname"), getstructarray(targetname, "targetname"), getvehiclenodearray(targetname, "targetname"));
        objectivekey = array_slice(objectivekey, 0, ents.size);
        objectiveid = "zone_1";
        level.var_f5c4d2c739170293 = 1;
    }
    var_b8abadd2c4d56fd8 = spawnstruct();
    var_b8abadd2c4d56fd8.objectivetype = objectivetype;
    var_b8abadd2c4d56fd8.objectivekey = objectivekey;
    var_b8abadd2c4d56fd8.objectiveid = objectiveid;
    var_b8abadd2c4d56fd8.targetname = targetname;
    var_b8abadd2c4d56fd8.params = function_53c4c53197386572(params, []);
    level.var_f136ed04f6b294a7[level.var_f136ed04f6b294a7.size] = var_b8abadd2c4d56fd8;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5be7
// Size: 0x133
function function_a6cc7589a41d621e(objectivetype, objectivekey, objectiveid, targetname, params, var_c20a0a238ed62e03) {
    if (!isdefined(level.var_f136ed04f6b294a7)) {
        return;
    }
    var_b8abadd2c4d56fd8 = spawnstruct();
    var_b8abadd2c4d56fd8.objectivetype = objectivetype;
    var_b8abadd2c4d56fd8.objectivekey = objectivekey;
    var_b8abadd2c4d56fd8.objectiveid = objectiveid;
    var_b8abadd2c4d56fd8.targetname = targetname;
    var_b8abadd2c4d56fd8.params = function_53c4c53197386572(params, []);
    /#
        if (istrue(var_c20a0a238ed62e03)) {
            level.var_f136ed04f6b294a7 = [];
            level.var_f136ed04f6b294a7[level.var_f136ed04f6b294a7.size] = var_b8abadd2c4d56fd8;
            return;
        }
    #/
    foreach (i, objective in level.var_f136ed04f6b294a7) {
        if (objective.objectivetype == objectivetype) {
            level.var_f136ed04f6b294a7[i] = var_b8abadd2c4d56fd8;
            return;
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d21
// Size: 0xde
function function_58f22e4d0d5e523a(objectivetype) {
    switch (objectivetype) {
    case 1:
        return "jup_dam_wb_capture_zone_a";
    case 2:
        return "bombzone";
    case 9:
        return "hack_point";
    case 3:
        return "hostage_trigger";
    case 4:
        return "mp_jup_dam_aa_turret_spawn";
    case 5:
        return "samsite_loc";
    case 6:
        return "wm_escort_tank_path";
    case 7:
        return "wm_boss_spawn";
    case 8:
        if (namespace_36f464722d326bbe::getmapname() == "mp_jup_airstrip") {
            return "wm_airstrip_capture_zone";
            goto LOC_0000005e;
        }
        return "wm_objective_ai_zone";
    default:
    LOC_0000005e:
        break;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e06
// Size: 0x38
function function_145c8a3b2e26106b(objectivetype, func) {
    if (!isdefined(level.var_336690fd209abaee)) {
        level.var_336690fd209abaee = [];
    }
    level.var_336690fd209abaee[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e45
// Size: 0x51
function function_4b6345bd08cabf83() {
    if (!isdefined(level.var_336690fd209abaee)) {
        return;
    }
    var_786b5c66fb3f03db = level.var_336690fd209abaee[level.zone.objectivetype];
    if (isdefined(var_786b5c66fb3f03db)) {
        level thread function_f7b85d2223351788(var_786b5c66fb3f03db, level.zone);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9d
// Size: 0x49
function function_f7b85d2223351788(func, zone) {
    level endon(zone.name + "_objective_end");
    while (1) {
        result = [[ func ]](zone);
        level.canprocessot = result;
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eed
// Size: 0x38
function function_eb9bcbf70f099dea(objectivetype, func) {
    if (!isdefined(level.var_e357e71e1a77a8e)) {
        level.var_e357e71e1a77a8e = [];
    }
    level.var_e357e71e1a77a8e[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2c
// Size: 0x38
function function_ffc7820b3cd963b3(objectivetype, func) {
    if (!isdefined(level.var_c840756153dfdc80)) {
        level.var_c840756153dfdc80 = [];
    }
    level.var_c840756153dfdc80[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6b
// Size: 0x38
function function_ed01ebaaf7e97967(objectivetype, func) {
    if (!isdefined(level.var_b0c3857a6da91b6c)) {
        level.var_b0c3857a6da91b6c = [];
    }
    level.var_b0c3857a6da91b6c[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5faa
// Size: 0x38
function function_65668288d02bbcba(objectivetype, func) {
    if (!isdefined(level.var_d23ba6208081aa8f)) {
        level.var_d23ba6208081aa8f = [];
    }
    level.var_d23ba6208081aa8f[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fe9
// Size: 0x38
function function_e4285658260d1bfa(objectivetype, func) {
    if (!isdefined(level.var_829a632ddd0e4e79)) {
        level.var_829a632ddd0e4e79 = [];
    }
    level.var_829a632ddd0e4e79[objectivetype] = func;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6028
// Size: 0x62
function function_86e5700d7971e414(objectivetype, var_2a833783dc74eb74) {
    if (!isdefined(level.var_6e6d113bb7c9e6a2)) {
        level.var_6e6d113bb7c9e6a2 = [];
    }
    if (!isdefined(level.var_6e6d113bb7c9e6a2["attackers"])) {
        level.var_6e6d113bb7c9e6a2["attackers"] = [];
    }
    level.var_6e6d113bb7c9e6a2["attackers"][objectivetype] = var_2a833783dc74eb74;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6091
// Size: 0x62
function function_5580ef2fc74eb79c(objectivetype, var_2a833783dc74eb74) {
    if (!isdefined(level.var_6e6d113bb7c9e6a2)) {
        level.var_6e6d113bb7c9e6a2 = [];
    }
    if (!isdefined(level.var_6e6d113bb7c9e6a2["defenders"])) {
        level.var_6e6d113bb7c9e6a2["defenders"] = [];
    }
    level.var_6e6d113bb7c9e6a2["defenders"][objectivetype] = var_2a833783dc74eb74;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60fa
// Size: 0x72
function function_8ee1bbc9a60b0b00(objectivetype, var_e504da863a6e3dcc, var_850279df06d6ac74) {
    if (!isdefined(level.var_81e886c170a93ace)) {
        level.var_81e886c170a93ace = [];
    }
    level.var_81e886c170a93ace[objectivetype] = spawnstruct();
    level.var_81e886c170a93ace[objectivetype].var_fb47cb5f48697390 = var_e504da863a6e3dcc;
    level.var_81e886c170a93ace[objectivetype].var_5a35080d7482e894 = var_850279df06d6ac74;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6173
// Size: 0xc0
function function_c4835bfede02aee0(objectivetype) {
    if (isdefined(level.var_6e6d113bb7c9e6a2["attackers"]) && isdefined(level.var_6e6d113bb7c9e6a2["attackers"][objectivetype])) {
        level.var_a4e3f457e2914d4a = 1;
        delaythread(2, &leaderdialog, level.var_6e6d113bb7c9e6a2["attackers"][objectivetype], game["attackers"]);
    }
    if (isdefined(level.var_6e6d113bb7c9e6a2["defenders"]) && isdefined(level.var_6e6d113bb7c9e6a2["defenders"][objectivetype])) {
        level.var_a4e3f457e2914d4a = 1;
        delaythread(2, &leaderdialog, level.var_6e6d113bb7c9e6a2["defenders"][objectivetype], game["defenders"]);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x623a
// Size: 0xa2
function function_1de7ce0d073824b5(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hq_enemy");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_hq_enemy");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_hq_enemy");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_hq_enemy");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested" + label, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_hq_enemy");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e3
// Size: 0x84
function function_b067e01602805443(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_bomb");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb_defuse");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_planting" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_bomb");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_planting" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x636e
// Size: 0xbc
function function_af3f1639fddce6e6(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hack");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_hack" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_UPLOAD_CAPS", "icon_waypoint_hack");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_hacking" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_STOP_CAPS", "icon_waypoint_hacking");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_UPLOADING_CAPS", "icon_waypoint_hacking");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_enter_silo_f", 0, "friendly", "MP_JUP_LAUNCHFACILITY/PLANT_IED", "icon_waypoint_ied_plant");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_enter_silo_e", 0, "enemy", "MP_JUP_LAUNCHFACILITY/PLANT_IED", "icon_waypoint_ied_plant");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6431
// Size: 0x4a
function function_efbf76fb0a1ae4d2(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_RESCUE_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hostage_captive", 0);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6482
// Size: 0x4a
function function_2cbdea506661cfc5(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_HVT_CAPS", "hud_icon_vehicle_samsite", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "hud_icon_vehicle_samsite", 0);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d3
// Size: 0x86
function function_9673371186f2b1c3(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANT_CAPS", "hud_icon_vehicle_samsite", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "hud_icon_vehicle_samsite", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_bomb");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6560
// Size: 0xc2
function function_15e2fb8e5bf9b01e(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_HALT_CAPS", "icon_waypoint_dom" + label, 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom" + label, 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle", 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_escort_tank", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle_blocked", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_tank_blocked", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle_repair", 0, "friendly", "MP_INGAME_ONLY/OBJ_TANK_REPAIRING", "icon_waypoint_tank_repair", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle_damaged", 0, "friendly", "MP_INGAME_ONLY/OBJ_TANK_DAMAGED", "icon_waypoint_tank_damaged", 0);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6629
// Size: 0x168
function function_a9895b70c0316593(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle", 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_wheelson", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_vehicle_blocked", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_wheelson_blocked", 0);
    if (isdefined(level.objectives[label]) && istrue(level.objectives[label].var_7848db50cd8c444f)) {
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_HALT_CAPS", "icon_waypoint_wheelson_hack");
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_HACK_CAPS", "icon_waypoint_wheelson_hack");
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_HALTING_CAPS", "icon_waypoint_wheelson_hack");
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_HACKING_CAPS", "icon_waypoint_wheelson_hack");
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested" + label, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_wheelson_hack");
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_wheelson_hack");
    } else {
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_HALT_CAPS", "icon_waypoint_dom" + label, 0);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom" + label, 0);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6798
// Size: 0x48
function function_d52c2ed64193ecf9(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_jugg");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_jugg");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e7
// Size: 0x17a
function function_b010a1f5f8885a06(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKE_FILTER_CAPS", "icon_waypoint_filter", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_filter", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_kill_flag" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_filter", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_PDS" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_rescue_extract", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_install_PDS" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_INSTALL_FILTER_CAPS", "icon_waypoint_rescue_extract", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_rescue_extract");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_rescue_extract");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_rescue_extract");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_rescue_extract");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested" + label, 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_rescue_extract");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_rescue_extract");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6968
// Size: 0x11a
function function_505b442c33eb2055(label) {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hack");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_hack" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_ACTIVATE_CAPS", "icon_waypoint_hack");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_hacking" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_STOP_CAPS", "icon_waypoint_hacking");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defuse" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_ACTIVATING_CAPS", "icon_waypoint_hacking");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defuse" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb_defuse");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_plant" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANT_CAPS", "icon_waypoint_bomb");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_defend" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_bomb");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_lock" + label, 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked");
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_bomb_lock" + label, 0, "friendly", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a89
// Size: 0x2c
function function_3b22215c63a7e4e5(zone) {
    objective = zone.objective;
    function_a6cf61bad14de666(zone, 1);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6abc
// Size: 0xee
function function_fa3e625bbc963a01(zone) {
    function_eee86cff5328a5f2(zone);
    objective = level.objectives[zone.objectives[0]];
    if (istrue(objective.var_31cc33cddb1dfba2)) {
        objective namespace_19b4203b51d56488::allowuse("none");
    }
    if (isdefined(objective.var_8951d1df86ab951f)) {
        foreach (obj in objective.var_8951d1df86ab951f) {
            obj namespace_19b4203b51d56488::setvisibleteam("any");
        }
        objective namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_locked");
    }
    objective namespace_19b4203b51d56488::enableobject();
    objective namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    objective namespace_19b4203b51d56488::allowuse("enemy");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bb1
// Size: 0xc
function function_bd6d6ca7a1eaafd0(objective) {
    
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bc4
// Size: 0x59f
function function_a6cf61bad14de666(zone, var_63c9b3894609e300) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    targetname = objective.targetname;
    function_37487e9ef3996964(objective);
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 30, 0, 120);
    if (isdefined(zone.objective.params) && isdefined(zone.objective.params["flagCaptureTime"])) {
        level.flagcapturetime = zone.objective.params["flagCaptureTime"];
    }
    level.zonecapturetime = level.flagcapturetime;
    if (getdvarint(@"hash_845b2cf80a6d0d0c", 0)) {
        level.flagcapturetime = 5;
        level.zonecapturetime = level.flagcapturetime;
    }
    if (isarray(targetname)) {
        triggers = [];
        foreach (name in targetname) {
            triggers[triggers.size] = getent(name, "targetname");
        }
    } else {
        triggers = getentarray(targetname, "targetname");
    }
    if (!isdefined(triggers)) {
        return;
    }
    zone.var_ee13e110c0910a51 = [];
    foreach (i, trigger in triggers) {
        objectivekey = var_dec7f03ee8e5150[i];
        trigger.objectivekey = objectivekey;
        trigger.script_label = objectivekey;
        capture_zone = namespace_8276d48525f0f398::setupobjective(trigger);
        capture_zone.iconname = objectivekey;
        level.objectives[objectivekey] = capture_zone;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        capture_zone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", zone.objidnum, game["defenders"]);
        capture_zone namespace_19b4203b51d56488::setvisibleteam("none");
        if (!isdefined(level.var_261c48ef4ff3d77a)) {
            level.var_261c48ef4ff3d77a = [];
        }
        level.var_261c48ef4ff3d77a[level.var_261c48ef4ff3d77a.size] = capture_zone;
        zone.var_ee13e110c0910a51[zone.var_ee13e110c0910a51.size] = capture_zone;
    }
    if (istrue(var_63c9b3894609e300)) {
        structs = getstructarray("wm_boss_spawn", "targetname");
        foreach (capture_zone in zone.var_ee13e110c0910a51) {
            capture_zone namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_locked" + var_dec7f03ee8e5150[0]);
            capture_zone.var_31cc33cddb1dfba2 = 1;
            capture_zone.var_8951d1df86ab951f = [];
        }
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_locked" + var_dec7f03ee8e5150[0], 0, "neutral", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked", 0);
        namespace_bfef6903bca5845d::function_2b36368b8b1b2b30(1);
        var_dec7f03ee8e5150 = [0:"_h", 1:"_i"];
        foreach (i, struct in structs) {
            namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend" + var_dec7f03ee8e5150[i], 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_jugg");
            namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture" + var_dec7f03ee8e5150[i], 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_jugg");
            marker = function_a62aee0aefa751b3(struct, objective, var_dec7f03ee8e5150[i]);
            foreach (capture_zone in zone.var_ee13e110c0910a51) {
                capture_zone.var_8951d1df86ab951f[capture_zone.var_8951d1df86ab951f.size] = marker;
            }
        }
        while (!istrue(level.objectives["_h"].complete) || !istrue(level.objectives["_i"].complete)) {
            waitframe();
        }
        foreach (capture_zone in zone.var_ee13e110c0910a51) {
            capture_zone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture");
            capture_zone namespace_19b4203b51d56488::allowuse("any");
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716a
// Size: 0x17c
function function_eee86cff5328a5f2(zone, var_63c9b3894609e300) {
    function_21ee5fc831ef88cc(zone);
    level.ontimelimitgraceperiod = getdvarint(@"hash_32868f1020ec5bcb", 9);
    foreach (capture_zone in zone.var_ee13e110c0910a51) {
        capture_zone namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
        capture_zone namespace_8276d48525f0f398::activatezone(undefined, 1);
        capture_zone.onuse = &function_7d30ae61c44bd1a0;
        capture_zone.onbeginuse = &function_ceb1bb733cf25d55;
        capture_zone.onenduse = &function_9e4725f0fafd0f29;
        capture_zone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        capture_zone.ignorestomp = !istrue(function_29227adb79acc568("zoneReversible", 0));
        capture_zone.useratemultiplier = 1;
        capture_zone.var_823c5a7bf6a0e64a = level.flagReinforcement;
        capture_zone.var_6c9cdfc1bc07df96 = 1;
        capture_zone thread namespace_8276d48525f0f398::updatechevrons(game["defenders"]);
        capture_zone namespace_19b4203b51d56488::enableobject();
        capture_zone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        capture_zone namespace_19b4203b51d56488::allowuse("enemy");
        capture_zone.var_b2dfb3f0778c829a = "MP_INGAME_ONLY/OBJ_CAPTURING_CAPS";
        level thread function_bd98c9e85905e50d(capture_zone);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72ed
// Size: 0xe0
function function_bd98c9e85905e50d(capture_zone) {
    level endon("end_zone_objective");
    while (1) {
        wait(5);
        if (istrue(capture_zone.stalemate)) {
            continue;
        }
        foreach (struct in capture_zone.touchlist[game["attackers"]]) {
            if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(struct.player)) {
                struct.player.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_ab380575e645f59");
            } else {
                struct.player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_8b25c2c59b73eb46");
            }
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73d4
// Size: 0x21f
function end_zone_objective(zone) {
    level notify("end_zone_objective");
    level.ontimelimitgraceperiod = 5;
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
        if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(player)) {
            player.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_1e81f3e4398c19dd");
        } else {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_c2a81e1bb7ec57c2");
        }
    }
    chevrons = getentitylessscriptablearray("scriptable_hardpoint_chevron", "classname");
    foreach (var_eae85273686f4f4 in chevrons) {
        if (is_equal(var_eae85273686f4f4.script_noteworthy, zone.targetname)) {
            for (i = 0; i < 1; i++) {
                var_eae85273686f4f4 setscriptablepartstate("chevron_" + i, "off");
            }
        }
    }
    objective = zone.objective;
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    } else {
        delaythread(2, &leaderdialog, "defenders_lost_zone", game["defenders"]);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75fa
// Size: 0x48
function function_8752b093985bf8e7(time, var_a6dc02042a8e2395, dialog, team) {
    level.var_a4e3f457e2914d4a = 1;
    wait(time);
    leaderdialog(dialog, game[team]);
    wait(var_a6dc02042a8e2395);
    level.var_a4e3f457e2914d4a = 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7649
// Size: 0x3a2
function function_3cdc401d9689c176(zone) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    targetname = objective.targetname;
    function_37487e9ef3996964(objective);
    structs = getstructarray(targetname, "targetname");
    while (!isdefined(level.var_b23156d776b1d85)) {
        waitframe();
    }
    while (!isdefined(level.players) || level.players.size == 0) {
        waitframe();
    }
    level.var_7f636ee164a47ef7 = [];
    foreach (i, struct in structs) {
        objectivekey = var_dec7f03ee8e5150[i];
        if (!isdefined(objectivekey)) {
            objectivekey = "_a";
        }
        turret = spawnturret("misc_turret", struct.origin, level.var_7d48025ea3734fa2["missile_turret"].weaponinfo);
        turret.turrettype = "missile_turret";
        turret namespace_6420d3dce7f35553::function_70c8684c2c29bf59("placed");
        turret maketurretinoperable();
        turret setleftarc(180);
        turret setrightarc(180);
        turret setbottomarc(50);
        turret settoparc(120);
        turret setconvergencetime(0.2, "pitch");
        turret setconvergencetime(0.2, "yaw");
        turret setconvergenceheightpercent(0.65);
        turret setdefaultdroppitch(-89);
        turret setdefaultdroppitch(0);
        turret setautorotationdelay(0.2);
        turret.colmodel = spawn("script_model", turret.origin);
        turret.colmodel.team = turret.team;
        turret.colmodel.owner = turret.owner;
        turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
        turret.colmodel dontinterpolate();
        turret.var_15dbb416e5f7f6b4 = [0:1, 1:2, 2:3, 3:4, 4:5, 5:6, 6:7, 7:8];
        turret setturretmodechangewait(1);
        turret setmode("sentryManual");
        turret.health = 2000;
        turret.maxhealth = 2000;
        level thread function_389ebc5025c28934(turret);
        level thread function_14aa40ae092fe7b1(turret);
        marker = struct function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_HVT_CAPS", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "hud_icon_vehicle_samsite");
        level.objectives[objectivekey] = marker;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        turret.marker = marker;
        level.var_7f636ee164a47ef7[level.var_7f636ee164a47ef7.size] = turret;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79f2
// Size: 0x14
function function_30887e570cb220ca(zone) {
    function_21ee5fc831ef88cc(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a0d
// Size: 0xc
function function_fc4467c9f0610bb9(zone) {
    
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a20
// Size: 0x385
function function_d1346b4018cc1509(zone) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    targetname = objective.targetname;
    function_37487e9ef3996964(objective);
    nodes = getvehiclenodearray(targetname, "targetname");
    nodes = array_add(nodes, getvehiclenode("wm_stop_2", "script_noteworthy"));
    foreach (i, node in nodes) {
        objectivekey = var_dec7f03ee8e5150[i];
        if (!isdefined(objectivekey)) {
            continue;
        }
        if (is_equal(node.script_noteworthy, "wm_stop_2")) {
            level.var_dc80dfc6726866ce = spawnstruct();
            level.var_dc80dfc6726866ce.node = node;
            level.var_dc80dfc6726866ce.objectivekey = objectivekey;
            level.var_dc80dfc6726866ce.marker = node function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_HALT_CAPS", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom" + objectivekey, game["attackers"]);
            level.objectives[objectivekey] = level.var_dc80dfc6726866ce.marker;
            level.objectives[objectivekey].objectivetype = objective.objectivetype;
        } else {
            spawndata = spawnstruct();
            spawndata.cantimeout = 0;
            spawndata.spawnmethod = "place_at_position_unsafe";
            spawndata.origin = node.origin;
            spawndata.angles = node.angles;
            spawndata.team = game["attackers"];
            spawndata.node = node;
            spawndata.objectivekey = objectivekey;
            vehicleRef = "light_tank";
            if (isdefined(objective.params["vehicleRef"])) {
                vehicleRef = objective.params["vehicleRef"];
            }
            if (getmapname() != "mp_jup_airstrip") {
                spawndata.spawnmethod = "airdrop_at_position_unsafe";
            }
            if (spawndata.spawnmethod == "airdrop_at_position_unsafe") {
                spawndata.vehicleRef = vehicleRef;
                level.var_1a8f6efd504faa14 = spawndata;
            } else {
                vehicle = namespace_1f188a13f7e79610::vehicle_spawn(vehicleRef, spawndata);
                level.var_e718773786ad42e8[level.var_e718773786ad42e8.size] = vehicle;
            }
            marker = spawndata function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_HALT_CAPS", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom" + objectivekey, game["attackers"]);
            level.objectives[objectivekey] = marker;
            level.objectives[objectivekey].objectivetype = objective.objectivetype;
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dac
// Size: 0x24d
function function_3b680608aad5e785(zone) {
    level.ontimelimitgraceperiod = getdvarint(@"hash_675c1f2b3e4bf7f9", 14);
    if (isdefined(level.var_1a8f6efd504faa14)) {
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn(level.var_1a8f6efd504faa14.vehicleRef, level.var_1a8f6efd504faa14);
        level.var_e718773786ad42e8[level.var_e718773786ad42e8.size] = vehicle;
    }
    function_21ee5fc831ef88cc(zone);
    objective = zone.objective;
    if (isdefined(level.var_9d7cf21bb90f2cc5)) {
        node = level.var_dc80dfc6726866ce.node;
        spawndata = spawnstruct();
        spawndata.cantimeout = 0;
        spawndata.spawnmethod = "place_at_position_unsafe";
        spawndata.origin = node.origin;
        spawndata.angles = node.angles;
        spawndata.team = game["defenders"];
        endnode = getvehiclenode("wm_stop_3", "script_noteworthy");
        level thread function_4a6cef3b190c8082(objective, level.var_9d7cf21bb90f2cc5, level.var_dc80dfc6726866ce.objectivekey, spawndata, level.var_dc80dfc6726866ce.node, level.var_dc80dfc6726866ce.marker, endnode);
    }
    foreach (vehicle in level.var_e718773786ad42e8) {
        level thread function_4a6cef3b190c8082(level.zone.objective, vehicle, vehicle.spawndata.objectivekey, vehicle.spawndata, vehicle.spawndata.node, level.objectives[vehicle.spawndata.objectivekey]);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8000
// Size: 0x19a
function function_e94ef69d91354ea0(zone) {
    foreach (player in level.players) {
        player.var_974cca039ded252e = undefined;
        player function_160f522b63c32d76(0);
    }
    level.ontimelimitgraceperiod = 5;
    objective = zone.objective;
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    }
    wm_tank_barrier_entrance = getentarray("wm_tank_barrier_entrance", "script_noteworthy");
    foreach (ent in wm_tank_barrier_entrance) {
        ent hide();
    }
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_18c44b230263da2c");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81a1
// Size: 0x4c8
function function_4a6cef3b190c8082(objective, vehicle, objectivekey, spawndata, node, marker, endnode) {
    vehicle.marker = marker;
    if (11 != objective.objectivetype) {
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vehicle);
    }
    setdvar(@"hash_fb517a5a3d736fa0", 1);
    if (isdefined(objective.params["tankNearbyRange"])) {
        vehicle.tankNearbyRange = objective.params["tankNearbyRange"];
    }
    if (istrue(objective.params["canStopByDefenders"])) {
        vehicle.canStopByDefenders = 1;
    }
    if (istrue(objective.params["canDamageAndRepair"])) {
        vehicle.var_6e56d5270a6151d5 = 1;
        vehicle.var_5fb0e90d5b2a8aae = 0;
    } else {
        vehicle.godmode = 1;
    }
    vehicle.defaultspeed = function_4e2267f2ebff079f("vehicleSpeed", 4);
    vehicle.var_98e373d243c1936f = 1;
    vehicle vehicleshowonminimap(0);
    vehicle.objectivekey = objectivekey;
    vehicle.useP2P = istrue(objective.params["useP2P"]);
    if (!isdefined(endnode)) {
        pathnodes = [];
        nextnode = node;
        while (isdefined(nextnode)) {
            pathnodes[pathnodes.size] = nextnode;
            if (isdefined(nextnode.target)) {
                nextnode = getvehiclenode(nextnode.target, "targetname");
            } else {
                nextnode = undefined;
            }
        }
        endnode = pathnodes[pathnodes.size - 1];
        vehicle.pathnodes = pathnodes;
        if (!istrue(vehicle.useP2P)) {
            vehicle attachpath(vehicle.pathnodes[0]);
            vehicle startpath();
        } else {
            vehicle function_d2e41c7603ba7697("p2p");
            vehicle thread function_c1bc249b0499979e();
        }
        vehicle.var_3f3a023549c63a8c = 0;
        vehicle.progress = 0;
        totaldistance = 0;
        vehicle.pathnodes[0].var_1d7ebd1bcc23a4e1 = 0;
        for (i = 0; i < vehicle.pathnodes.size - 1; i++) {
            currentnode = vehicle.pathnodes[i];
            nextnode = vehicle.pathnodes[i + 1];
            totaldistance = totaldistance + distance2d(currentnode.origin, nextnode.origin);
            nextnode.var_1d7ebd1bcc23a4e1 = totaldistance;
        }
        foreach (pathnode in vehicle.pathnodes) {
            pathnode.progress = pathnode.var_1d7ebd1bcc23a4e1 / totaldistance;
        }
    }
    if (isdefined(level.var_4538f9d8dc0b9007)) {
        vehicle.checkpoints = [[ level.var_4538f9d8dc0b9007 ]](vehicle);
    }
    level notify("escort_path_set", vehicle);
    if (istrue(level.var_3e6380e9591e50a5)) {
        vehicle thread function_305ffac5102f1b2b(endnode, "friendly", 6);
        vehicle thread function_305ffac5102f1b2b(endnode, "enemy", 6);
    }
    if (isdefined(objective.params["vehicleRef"])) {
        var_d151600957e715a = objective.params["vehicleRef.vehObjZOffset"];
    }
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(marker.objidnum, vehicle);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(marker.objidnum, function_53c4c53197386572(var_d151600957e715a, 180));
    if (istrue(objective.params["progressByActualDistance"])) {
        if (11 != objective.objectivetype) {
            level thread function_f2a1c180dc67b7f8(vehicle, marker.objidnum);
        } else {
            level thread function_b63c307e88f55d86(vehicle, marker.objidnum);
        }
    } else {
        level thread function_98b9f09341fd9ba8(vehicle, marker.objidnum, endnode);
    }
    var_e21fdc330521a449 = 0;
    if (11 == objective.objectivetype) {
        vehicle setcandamage(0);
        var_e21fdc330521a449 = 1;
    }
    vehicle thread function_eb31d2457d09576(var_e21fdc330521a449);
    level thread function_7d5057db2f8ddb6f(vehicle, marker.objidnum);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8670
// Size: 0x36a
function function_eb31d2457d09576(var_e21fdc330521a449) {
    level endon("game_ended");
    self endon("death");
    thread function_367f87c96dccaf2();
    tank = self;
    var_40d4ab48b1615807 = tank getentitynumber();
    if (istrue(var_e21fdc330521a449)) {
        var_21412c22fd1045d7 = 50;
        var_dcb6304be0fe7b52 = 70;
        var_24d1ae7b69b2b3f3 = 80;
    } else {
        var_21412c22fd1045d7 = 150;
        var_dcb6304be0fe7b52 = 240;
        var_24d1ae7b69b2b3f3 = 160;
    }
    var_fa8d5f684b034b30 = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_vehicle"]);
    var_b65b7aeab526e1ac = (var_21412c22fd1045d7, var_21412c22fd1045d7, var_24d1ae7b69b2b3f3);
    var_f8d57c6bc526da29 = (var_dcb6304be0fe7b52, var_dcb6304be0fe7b52, var_24d1ae7b69b2b3f3);
    var_646389193279e8ec = [0:tank];
    while (1) {
        if (istrue(var_e21fdc330521a449)) {
            var_863c619037f3ac74 = tank.origin;
        } else {
            var_863c619037f3ac74 = tank.origin + rotatevector((30, 0, -30), tank.angles);
        }
        var_80745cf3e2877df5 = var_863c619037f3ac74 - var_b65b7aeab526e1ac;
        var_809746f3e2ad954b = var_863c619037f3ac74 + var_b65b7aeab526e1ac;
        /#
            level thread draw_line_for_time(var_80745cf3e2877df5, var_809746f3e2ad954b, 1, 0, 0, 2);
            level thread draw_circle(var_863c619037f3ac74, var_21412c22fd1045d7, (1, 0, 0), 1, 0, 2);
        #/
        var_3c4b19abbdf0937c = var_863c619037f3ac74 - var_f8d57c6bc526da29;
        var_2e1990d919dc0eb2 = var_863c619037f3ac74 + var_f8d57c6bc526da29;
        /#
            level thread draw_line_for_time(var_3c4b19abbdf0937c, var_2e1990d919dc0eb2, 1, 0, 0, 2);
            level thread draw_circle(var_863c619037f3ac74, var_dcb6304be0fe7b52, (1, 0, 0), 1, 0, 2);
        #/
        var_3a3a8605cd6d3dfc = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, var_fa8d5f684b034b30, var_646389193279e8ec);
        var_e4c6a394b5df337 = physics_aabbbroadphasequery(var_3c4b19abbdf0937c, var_2e1990d919dc0eb2, var_fa8d5f684b034b30, var_646389193279e8ec);
        foreach (ent in var_e4c6a394b5df337) {
            if (isdefined(ent.cratetype) && ent.cratetype == "loadout_drop" && !istrue(ent.var_efc400ad31ca42c7)) {
                ent.var_efc400ad31ca42c7 = 1;
                ent thread namespace_6c578d6ef48f10ef::destroycrate(0);
            }
        }
        foreach (ent in var_3a3a8605cd6d3dfc) {
            if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_tac_cover" && !istrue(ent.var_efc400ad31ca42c7)) {
                ent.var_efc400ad31ca42c7 = 1;
                ent thread namespace_e76aa51cbf8812ee::tac_cover_destroy(undefined, 0);
            }
            if (isdefined(ent.vehiclename) && ent.vehiclename == "radar_drone_recon" && !istrue(ent.var_efc400ad31ca42c7)) {
                ent.var_efc400ad31ca42c7 = 1;
                ent thread namespace_bba8bc8532aa4913::function_6edfda4764129e3(1);
            }
        }
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89e1
// Size: 0xb2
function function_367f87c96dccaf2() {
    level endon("game_ended");
    self endon("death");
    var_536b3e9dad0768fb = self.origin;
    var_8fb02da86884df3f = 0;
    while (1) {
        wait(0.25);
        if (distancesquared(self.origin, var_536b3e9dad0768fb) < 16 && istrue(self.var_92051c7cb27cb3bb)) {
            var_8fb02da86884df3f++;
        } else if (distancesquared(self.origin, var_536b3e9dad0768fb) > 16) {
            var_8fb02da86884df3f = 0;
        }
        if (var_8fb02da86884df3f >= 2) {
            self startpath(self.pathnodes[self.var_6bb0ab1fe092bd5d - 1]);
            var_8fb02da86884df3f = 0;
        }
        var_536b3e9dad0768fb = self.origin;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9a
// Size: 0x10c
function function_305ffac5102f1b2b(node, var_673b3cdbd1f53958, var_bab98e6efff82b79) {
    level endon("game_ended");
    var_31b8262b5f39d22e = 20;
    position = node.origin + (0, 0, var_31b8262b5f39d22e);
    waypointid = requestobjectiveid();
    objective_add(waypointid, "active", position, "icon_waypoint_rescue_extract", "icon_regular");
    objective_setplayintro(waypointid, 1);
    objective_setbackground(waypointid, var_bab98e6efff82b79);
    objective_setfadedisabled(waypointid, 0);
    objective_setshowoncompass(waypointid, 1);
    objective_setshowdistance(waypointid, 1);
    objective_setownerteam(waypointid, game["attackers"]);
    if (var_673b3cdbd1f53958 == "friendly") {
        objective_setfriendlylabel(waypointid, "MP_INGAME_ONLY/OBJ_TANK_GOAL_CAPS");
        objective_mask_showtoplayerteam(waypointid, self);
    } else {
        objective_setenemylabel(waypointid, "MP_INGAME_ONLY/OBJ_TANK_GOAL_CAPS");
        objective_mask_showtoenemyteam(waypointid, self);
    }
    gameflagwait(level.zone.name + "_objective_end");
    returnobjectiveid(waypointid);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bad
// Size: 0x111
function function_1f435a041b5ad1d2(zone) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    targetname = objective.targetname;
    function_37487e9ef3996964(objective);
    structs = getstructarray(targetname, "targetname");
    foreach (i, struct in structs) {
        objectivekey = var_dec7f03ee8e5150[i];
        function_a62aee0aefa751b3(struct, objective, objectivekey);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc5
// Size: 0x14
function function_f9fc871c251cd35e(zone) {
    function_21ee5fc831ef88cc(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ce0
// Size: 0xc
function function_673741f361e9dcf3(zone) {
    
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf3
// Size: 0x36f
function function_7bcfd3c0f707dfd0(zone) {
    objective = zone.objective;
    level.var_3f4534fb14cca909 = &function_a13d6040c09f7f03;
    level.var_2179c46fc54fd9ce = "offhand_2h_c4_prop_mp";
    namespace_82f05772526a4798::function_c25a40ae517ef340();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_left", &namespace_82f05772526a4798::function_e8e4bb2f83e5055a);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_right", &namespace_82f05772526a4798::function_e8e4bb2f83e5055a);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_left_defuse", &function_cbd3979676d57efe);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_right_defuse", &function_cbd3979676d57efe);
    level.var_f55e20c194c117f4 = [];
    zone.turrets = [];
    foreach (struct in getstructarray("samsite_loc", "targetname")) {
        turret = function_4af811e7fdb1c621(struct);
        turret.var_692fc766d262881a setcandamage(0);
        turret.var_692fc666d26285e7 setcandamage(0);
        turret.var_692fc566d26283b4 setcandamage(0);
        level.var_f55e20c194c117f4[level.var_f55e20c194c117f4.size] = turret;
        turret setscriptablepartstate("usable_left", "usable");
        turret setscriptablepartstate("usable_front", "usable");
        turret setscriptablepartstate("usable_right", "usable");
        turret setscriptablepartstate("usable_left_defuse", "usable");
        turret setscriptablepartstate("usable_front_defuse", "usable");
        turret setscriptablepartstate("usable_right_defuse", "usable");
        turret setscriptablepartstate("usable_front", "unusable");
        turret function_e70d07a164d078c2("plant");
        zone.turrets[zone.turrets.size] = turret;
    }
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    function_37487e9ef3996964(objective);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_260a303b50ba69cc);
    foreach (i, var_fac1dd2a5472bece in level.var_f55e20c194c117f4) {
        objectivekey = var_dec7f03ee8e5150[i];
        marker = var_fac1dd2a5472bece function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_PLANT_CAPS", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "hud_icon_vehicle_samsite", undefined, (0, 0, 300));
        level.objectives[objectivekey] = marker;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        level.objectives[objectivekey].turret = var_fac1dd2a5472bece;
        level.objectives[objectivekey].turret.objectivekey = objectivekey;
        level.objectives[objectivekey] thread function_ce07c8b7bf47de7b();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9069
// Size: 0x69
function function_fe6c238f87f0d34(zone) {
    foreach (var_fac1dd2a5472bece in level.var_f55e20c194c117f4) {
        var_fac1dd2a5472bece function_6ce08fcf00f18e1();
    }
    function_21ee5fc831ef88cc(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90d9
// Size: 0x8e
function function_20ac728c10edaff1(zone) {
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f971655f11159a88");
    }
    delaythread(2, &leaderdialog, "defenders_lost_sam_site", game["defenders"]);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x916e
// Size: 0xac9
function function_841f344a6ab9d6f9(zone) {
    objective = zone.objective;
    var_6085a8df9c0e33eb = getentarray(objective.targetname, "targetname");
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    var_3800a132040816d1 = 0;
    level.var_c8b917bf9d0b1d1 = var_6085a8df9c0e33eb.size;
    level.var_91f947790df03886 = getdvarint(@"hash_7798be18e3f3ad91", 0);
    level.var_e181fdcc8e4e5173 = getdvarint(@"hash_71c04cb18cad67cd", 0);
    level.var_f224e09983ef4b2a = getdvarint(@"hash_20103d7a5a56aac8", 20);
    level.iconrecover = "rescue_recover";
    level.iconescort = "rescue_escort";
    level.var_e8891f63e5a412c2 = "rescue_escort_return";
    level.iconextract = "rescue_taking_extract";
    level.icondefendextract = "rescue_defend_extract";
    level.iconcaptureextract = "rescue_capture_extract";
    level.showenemycarrier = 0;
    level.var_385bb8fdab525e2b = 1;
    namespace_6d8fa3f81f071973::initanims();
    namespace_6d8fa3f81f071973::function_b924ba876ae5b152();
    function_37487e9ef3996964(objective);
    level.var_f57a27b32e66a765 = [];
    foreach (i, trigger in var_6085a8df9c0e33eb) {
        if (var_3800a132040816d1 >= level.var_c8b917bf9d0b1d1) {
            break;
        }
        objectivekey = var_dec7f03ee8e5150[i];
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0] setmodel("body_civ_me_male_1_1");
        visuals[0] setasgametypeobjective();
        hostage = namespace_19b4203b51d56488::createcarryobject(game["defenders"], trigger, visuals, (0, 0, 16), undefined, 1);
        hostage.iconname = objectivekey;
        hostage.objectivekey = objectivekey;
        level.objectives[objectivekey] = hostage;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        head = spawn("script_model", visuals[0].origin);
        head setmodel("head_hostage_hood_01");
        head linkto(visuals[0], "j_neck", (-9, 1, 0), (0, 0, 0));
        hostage.head = head;
        hostage.body = visuals[0];
        hostage.body solid();
        hostage.head solid();
        tracestart = visuals[0].origin + (0, 0, 32);
        traceend = visuals[0].origin + (0, 0, -100);
        contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 1, 1, 1);
        ignoreents = [0:visuals[0], 1:trigger];
        trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
        if (trace["fraction"] < 1) {
            visuals[0].origin = trace["position"] + (0, 0, 2);
        }
        hostage.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
        hostage namespace_19b4203b51d56488::requestid(1, 1);
        hostage namespace_19b4203b51d56488::allowuse("enemy");
        hostage.cancontestclaim = 0;
        hostage.stalemate = 0;
        hostage.wasstalemate = 1;
        hostage.var_c5c106d22c19bc92 = 0;
        hostage.usetime = 0;
        hostage.userate = 1;
        hostage.id = "care_package";
        hostage.exclusiveuse = 0;
        hostage.skiptouching = 1;
        hostage.skipminimapids = 1;
        hostage.curorigin = hostage.body.origin;
        hostage.offset3d = (0, 0, 30);
        hostage.trigger sethintstring("MP/HOLD_TO_ESCORT_HOSTAGE");
        hostage.trigger setusepriority(-1 - 1 - 1 - 1);
        hostage namespace_19b4203b51d56488::setusetime(0);
        hostage namespace_19b4203b51d56488::setwaitweaponchangeonuse(0);
        hostage.allowweapons = 1;
        hostage.onpickup = &namespace_6d8fa3f81f071973::function_dc87fdd9e74e945e;
        hostage.ondrop = &function_13db2131b3f0851f;
        hostage.onreset = &namespace_6d8fa3f81f071973::function_3cac51c950d63e5d;
        hostage.pickupchecks = [0:&namespace_6d8fa3f81f071973::function_6201c84e805ab787, 1:&namespace_6d8fa3f81f071973::function_a4beda038141b8f8, 2:&namespace_6d8fa3f81f071973::function_fda15d11f6baf729, 3:&namespace_6d8fa3f81f071973::function_5c8cf2eee42128c8, 4:&namespace_6d8fa3f81f071973::function_ed073d24cd8ed3c5];
        hostage.onpickupfailed = &namespace_6d8fa3f81f071973::function_23456bcbf6dd329f;
        hostage.var_4bcc694316c44d94 = &namespace_6d8fa3f81f071973::function_5c749561016bc2b2;
        hostage.carryobjectasset = "hostage_rescue";
        if (getdvarint(@"hash_c44109000ed1922d") != 0) {
            hostage namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0], 1:hostage.head], undefined, undefined, 32, 180, undefined, 1);
        }
        hostage.objidpingfriendly = 0;
        hostage.objidpingenemy = 0;
        hostage.objpingdelay = 0.05;
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        hostage.var_81121fb99d0a00b = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", hostage.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        hostage namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, game["defenders"]);
        hostage.objidpingfriendly = 0;
        hostage.objidpingenemy = 0;
        hostage.objpingdelay = 0.05;
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        hostage.var_bd657a84755765de = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", hostage.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        hostage namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, game["attackers"]);
        hostage thread namespace_6d8fa3f81f071973::function_a5b7c34a5c2d56d2();
        if (!isdefined(level.hostages)) {
            level.hostages = [];
        }
        level.hostages[hostage.objidnum] = hostage;
        hostage namespace_19b4203b51d56488::setvisibleteam("none");
        hostage namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture");
        if (level.var_91f947790df03886) {
            namespace_6d8fa3f81f071973::function_7d3dbbb99ee466e0(trigger, hostage);
        }
        var_3800a132040816d1++;
    }
    var_591f07fc947562c9 = getstructarray("wm_hostage_vehicle_spawn_loc", "targetname");
    vehicles = [];
    foreach (struct in var_591f07fc947562c9) {
        spawndata = spawnstruct();
        spawndata.origin = struct.origin;
        spawndata.angles = struct.angles;
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv", spawndata);
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vehicle);
        vehicle vehicleshowonminimap(0);
        vehicle setcandamage(0);
        vehicles[vehicles.size] = vehicle;
        level.var_e718773786ad42e8[level.var_e718773786ad42e8.size] = vehicle;
        var_1916d950ec8ab2c = vehicle function_bbcd7058816ef794("", "MP_INGAME_ONLY/OBJ_BLOCK_EXFIL_CAPS", "MP_INGAME_ONLY/OBJ_DROPOFF_CAPS", "icon_waypoint_dom_a");
        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_1916d950ec8ab2c.objidnum, game["attackers"]);
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(var_1916d950ec8ab2c.objidnum);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(var_1916d950ec8ab2c.objidnum, vehicles[0]);
        level.var_c8bf3a4374d235bf = var_1916d950ec8ab2c;
    }
    level.var_9d7cf21bb90f2cc5 = vehicles[0];
    var_72c468051c88f62f = getstructarray("wm_hostage_dropoff_loc", "targetname");
    var_2776aeb45e3f60f0 = [];
    foreach (struct in var_72c468051c88f62f) {
        forward = vectornormalize(anglestoforward(vehicles[0].angles));
        hostage = spawn("script_model", struct.origin - (0, 0, 3) + 16 * forward);
        hostage setmodel("body_civ_me_male_1_1");
        hostage.angles = struct.angles;
        hostage linkto(vehicles[0]);
        head = spawn("script_model", visuals[0].origin);
        head setmodel("head_hostage_hood_01");
        head linkto(hostage, "j_neck", (-9, 1, 0), (0, 0, 0));
        hostage.head = head;
        var_2776aeb45e3f60f0 = array_add(var_2776aeb45e3f60f0, hostage);
        hostage scriptmodelplayanimdeltamotion("cap_civ_prty_anxious_seat02");
        hostage.head hide();
        hostage hide();
    }
    wm_hostage_dropoff_trigger = getent("wm_hostage_dropoff_trigger", "targetname");
    wm_hostage_dropoff_trigger enablelinkto();
    wm_hostage_dropoff_trigger linkto(vehicles[0]);
    wm_hostage_dropoff_trigger sethintstring("MP_INGAME_ONLY/WM_HOSTAGE_DROPOFF");
    wm_hostage_dropoff_trigger thread function_3f70bb8b39738c34(var_2776aeb45e3f60f0, vehicles, var_1916d950ec8ab2c);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3e
// Size: 0x14
function function_ecbcf255884135c5(zone) {
    function_21ee5fc831ef88cc(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c59
// Size: 0x50
function function_274763e755af09dc(zone) {
    wm_hostage_dropoff_trigger = getent("wm_hostage_dropoff_trigger", "targetname");
    wm_hostage_dropoff_trigger delete();
    if (isdefined(level.var_9d7cf21bb90f2cc5)) {
        level.var_9d7cf21bb90f2cc5 thread vehicle_move_forward_until("wm_stop_2");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cb0
// Size: 0x30f
function init_bomb_objective(zone) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    triggers = getentarray(objective.targetname, "targetname");
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    function_37487e9ef3996964(objective);
    level.var_be550dbbd45701ee = [];
    objective.bombzones = [];
    foreach (i, trigger in triggers) {
        objectivekey = var_dec7f03ee8e5150[i];
        trigger.objectivekey = var_dec7f03ee8e5150[i];
        bombzone = namespace_fa795886dfc5f58a::setupobjective(trigger, 1, 1);
        bombzone namespace_19b4203b51d56488::requestid(1, 1);
        bombzone.objectivekey = objectivekey;
        bombzone.onbeginuse = &onbeginuse;
        bombzone.onenduse = &onenduse;
        bombzone.onuse = &onuseplantobject;
        bombzone.iconname = objectivekey;
        bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", bombzone.objidnum, game["defenders"]);
        bombzone namespace_19b4203b51d56488::setvisibleteam("any");
        bombzone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        bombzone namespace_19b4203b51d56488::allowuse("enemy");
        bombzone namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_DEFUSE_EXPLOSIVES");
        bombzone namespace_5a22b6f3a56f7e9b::objective_show_team_progress(bombzone.objidnum, game["attackers"]);
        bombzone namespace_5a22b6f3a56f7e9b::objective_show_team_progress(bombzone.objidnum, game["defenders"]);
        bombzone namespace_19b4203b51d56488::disableobject();
        bombzone namespace_19b4203b51d56488::allowuse("none");
        level.objectives[objectivekey] = bombzone;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        level.var_be550dbbd45701ee[level.var_be550dbbd45701ee.size] = bombzone;
        zone.bombzones[objective.bombzones.size] = bombzone;
    }
    var_f90823454418f4c7 = getentarray("catwalk_bomb_lights", "targetname");
    foreach (light in var_f90823454418f4c7) {
        light thread blink_light(0.5, 0.3, 0, 1, 0.75, 1);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fc6
// Size: 0x8e
function function_2e079de28a14edf4(zone) {
    function_21ee5fc831ef88cc(zone);
    foreach (var_8cad8d8db24b50c9 in zone.objectives) {
        bombzone = level.objectives[var_8cad8d8db24b50c9];
        bombzone namespace_19b4203b51d56488::enableobject();
        bombzone namespace_19b4203b51d56488::allowuse("enemy");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05b
// Size: 0x8e
function function_b1e48e6ea7e1a047(zone) {
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_57e238c776c8e030");
    }
    delaythread(2, &leaderdialog, "defenders_lost_bomb_objective", game["defenders"]);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f0
// Size: 0x1b3
function function_2d7f27839316e035(zone) {
    namespace_dad3c7903f3cd2f7::function_e27a6d1eec1c355e();
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    triggers = getentarray(objective.targetname, "targetname");
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    function_37487e9ef3996964(objective);
    zone.var_54a90fd3dd9a59b3 = [];
    foreach (i, trigger in triggers) {
        objectivekey = var_dec7f03ee8e5150[i];
        trigger.objectivekey = var_dec7f03ee8e5150[i];
        usingVisualHintString = objective.params["usingVisualHintString"];
        var_ed31f55739afcaf2 = namespace_dad3c7903f3cd2f7::setupobjective(trigger, i, 1, 1, usingVisualHintString);
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setvisibleteam("none");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::allowuse("none");
        level.objectives[objectivekey] = var_ed31f55739afcaf2;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        zone.var_54a90fd3dd9a59b3[zone.var_54a90fd3dd9a59b3.size] = var_ed31f55739afcaf2;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2aa
// Size: 0xc6
function function_8ed8bdf501691dc9(zone) {
    level.ontimelimitgraceperiod = getdvarint(@"hash_312c816d24ef8e64", 9);
    foreach (var_8cad8d8db24b50c9 in zone.objectives) {
        var_ed31f55739afcaf2 = level.objectives[var_8cad8d8db24b50c9];
        var_ed31f55739afcaf2.onbeginuse = &function_1b196fb976284ed1;
        var_ed31f55739afcaf2.onenduse = &function_e47da7dc98a3d8cc;
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setvisibleteam("any");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::allowuse("enemy");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa377
// Size: 0x159
function function_2816c555d1a0bde(zone) {
    level notify("end_hack_zone_objective");
    objective = zone.objective;
    level.ontimelimitgraceperiod = 5;
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    }
    foreach (var_8cad8d8db24b50c9 in zone.objectives) {
        var_ed31f55739afcaf2 = level.objectives[var_8cad8d8db24b50c9];
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setvisibleteam("none");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::allowuse("none");
    }
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_6540fe71b5eda3fb");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4d7
// Size: 0x71e
function function_b707f54f7de4fd15(zone) {
    level.flagmodel = "jup_military_pdsf";
    level.carryflag = "prop_jup_military_pdsf";
    var_652ea2e4abf8ce75 = getscriptablearray("flag_base", "targetname");
    level.flagbase = var_652ea2e4abf8ce75[0];
    level.var_544a602bcb83bd67 = [];
    if (isdefined(level.flagbase)) {
        var_a3eef61e74c63696 = level.flagbase gettagorigin("tag_turret01");
        var_b7e599a8c8b5dd4c = level.flagbase gettagangles("tag_turret01");
        level.var_544a602bcb83bd67[level.var_544a602bcb83bd67.size] = spawnscriptable("jup_skydiving_military_pdsf", var_a3eef61e74c63696, var_b7e599a8c8b5dd4c);
        var_a6a5d1c6330010ef = level.flagbase gettagorigin("tag_turret02");
        var_c6ac5393bb14da91 = level.flagbase gettagangles("tag_turret02");
        level.var_544a602bcb83bd67[level.var_544a602bcb83bd67.size] = spawnscriptable("jup_skydiving_military_pdsf", var_a6a5d1c6330010ef, var_c6ac5393bb14da91);
        level.flagbase function_3677f2be30fdd581("model", "red");
    }
    namespace_16a6643951556450::updategametypedvars();
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    var_740926ee0ae470a4 = objective.targetname;
    function_37487e9ef3996964(objective);
    objectivekey = var_dec7f03ee8e5150[0];
    var_7dbe47f889cfa80 = [];
    if (isarray(var_740926ee0ae470a4)) {
        foreach (targetname in var_740926ee0ae470a4) {
            if (issubstr(targetname, "flag_begin")) {
                var_652237a71a9d9bf3 = getent(targetname, "targetname");
                var_7dbe47f889cfa80 = array_add(var_7dbe47f889cfa80, var_652237a71a9d9bf3);
                /#
                    assertex(var_7dbe47f889cfa80.size != 0, "Can't find entity with target name: " + targetname);
                #/
            } else if (issubstr(targetname, "flag_end")) {
                flagzone = getent(targetname, "targetname");
                /#
                    assertex(isdefined(flagzone), "Can't find entity with target name: " + targetname);
                #/
            } else if (issubstr(targetname, "capture_zone")) {
                var_15e339103fa91bff = getent(targetname, "targetname");
                /#
                    assertex(isdefined(var_15e339103fa91bff), "Can't find entity with target name: " + targetname);
                #/
            } else {
                /#
                    assertmsg("Invalid target name: " + targetname);
                #/
            }
        }
    } else if (issubstr(var_740926ee0ae470a4, "flag_begin")) {
        var_7dbe47f889cfa80 = getentarray(var_740926ee0ae470a4, "targetname");
        /#
            assertex(var_7dbe47f889cfa80.size != 0, "Can't find entity with target name: " + var_740926ee0ae470a4);
        #/
    } else if (issubstr(var_740926ee0ae470a4, "flag_end")) {
        flagzone = getent(var_740926ee0ae470a4, "targetname");
        /#
            assertex(flagzone != 0, "Can't find entity with target name: " + var_740926ee0ae470a4);
        #/
    } else if (issubstr(targetname, "capture_zone")) {
        var_15e339103fa91bff = getent(targetname, "targetname");
        /#
            assertex(isdefined(var_15e339103fa91bff), "Can't find entity with target name: " + targetname);
        #/
    } else {
        /#
            assertmsg("Invalid target name: " + var_740926ee0ae470a4);
        #/
    }
    var_9dd14579a14c6b95 = array_add(var_7dbe47f889cfa80, flagzone);
    var_9dd14579a14c6b95 = array_add(var_9dd14579a14c6b95, var_15e339103fa91bff);
    foreach (i, trigger in var_9dd14579a14c6b95) {
        trigger.objectivekey = var_dec7f03ee8e5150[i];
        trigger.script_label = var_dec7f03ee8e5150[i];
    }
    zone.var_3fcea735d5eda634 = namespace_16a6643951556450::function_a892b65a4cfef993(var_7dbe47f889cfa80);
    zone.flagzone = namespace_16a6643951556450::createflagzone(flagzone);
    zone.var_dcecc1ffe9d55d6e = getstructarray("flag_checkpoint", "targetname");
    index = 0;
    foreach (CaptureFlag in zone.var_3fcea735d5eda634) {
        objectivekey = var_dec7f03ee8e5150[index];
        level.objectives[objectivekey] = CaptureFlag;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        index++;
    }
    objectivekey = var_dec7f03ee8e5150[index];
    level.objectives[objectivekey] = zone.flagzone;
    level.objectives[objectivekey].objectivetype = objective.objectivetype;
    index++;
    level.var_f44f122a81824290 = function_ef4d323f56385843("captureFlagZoneTime", 60);
    level.zonecapturetime = level.var_f44f122a81824290;
    objectivekey = var_dec7f03ee8e5150[index];
    var_15e339103fa91bff.objectivekey = objectivekey;
    var_15e339103fa91bff.script_label = objectivekey;
    var_f414affbb2644d5a = namespace_8276d48525f0f398::setupobjective(var_15e339103fa91bff);
    var_f414affbb2644d5a namespace_8276d48525f0f398::activatezone(undefined, 1);
    var_f414affbb2644d5a.iconname = objectivekey;
    var_f414affbb2644d5a namespace_19b4203b51d56488::setusetime(level.zonecapturetime);
    var_f414affbb2644d5a.onuse = &function_ba09d65c3d7386ea;
    var_f414affbb2644d5a.onbeginuse = &function_ceb1bb733cf25d55;
    var_f414affbb2644d5a.onuseupdate = &function_653bab3ddec214a3;
    var_f414affbb2644d5a.onenduse = &function_9e4725f0fafd0f29;
    var_f414affbb2644d5a.ignorestomp = !istrue(function_29227adb79acc568("zoneReversible", 0));
    var_f414affbb2644d5a.useratemultiplier = 1;
    var_f414affbb2644d5a.var_823c5a7bf6a0e64a = level.flagReinforcement;
    var_f414affbb2644d5a.var_6c9cdfc1bc07df96 = 1;
    var_f414affbb2644d5a namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", var_f414affbb2644d5a.objidnum, game["attackers"]);
    var_f414affbb2644d5a namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(var_f414affbb2644d5a.objidnum, "done");
    var_f414affbb2644d5a.var_b2dfb3f0778c829a = "MP_INGAME_ONLY/OBJ_CAPTURING_CAPS";
    zone.var_d731642d971f0c49 = var_f414affbb2644d5a;
    level.objectives[objectivekey] = var_f414affbb2644d5a;
    level.objectives[objectivekey].objectivetype = objective.objectivetype;
    zone.var_a41fe785a977666f = 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabfc
// Size: 0x29
function function_ba09d65c3d7386ea(player) {
    level.defendersRespawnDelay = function_ef4d323f56385843("defendersRespawnDelay", 0);
    function_7d30ae61c44bd1a0(player);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac2c
// Size: 0x396
function function_653bab3ddec214a3(team, progress, change, var_4b22e50e504339fe) {
    namespace_8276d48525f0f398::zone_onuseupdate(team, progress, change, var_4b22e50e504339fe);
    if (progress >= 0 && level.flagbase.nextstate == "charging_1") {
        level.flagbase function_3677f2be30fdd581("model", "charging_1");
        level.flagbase function_3677f2be30fdd581("beam", "on");
        level.flagbase.nextstate = "charged_1";
    } else if (progress >= 0.2 && level.flagbase.nextstate == "charged_1") {
        level.flagbase function_3677f2be30fdd581("model", "charged_1");
        waitframe();
        level.flagbase function_3677f2be30fdd581("model", "charging_2");
        level.flagbase.nextstate = "charging_2";
    } else if (progress >= 0.2 && level.flagbase.nextstate == "charging_2") {
        level.flagbase function_3677f2be30fdd581("model", "charged_1");
        waitframe();
        level.flagbase function_3677f2be30fdd581("model", "charging_2");
        level.flagbase.nextstate = "charging_3";
    } else if (progress >= 0.4 && level.flagbase.nextstate == "charging_3") {
        level.flagbase function_3677f2be30fdd581("model", "charged_2");
        waitframe();
        level.flagbase function_3677f2be30fdd581("model", "charging_3");
        level.flagbase.nextstate = "charging_4";
    } else if (progress >= 0.6 && level.flagbase.nextstate == "charging_4") {
        level.flagbase function_3677f2be30fdd581("model", "charged_3");
        waitframe();
        level.flagbase function_3677f2be30fdd581("model", "charging_4");
        level.flagbase.nextstate = "charging_5";
    } else if (progress >= 0.8 && level.flagbase.nextstate == "charging_5") {
        level.flagbase function_3677f2be30fdd581("model", "charged_4");
        waitframe();
        level.flagbase function_3677f2be30fdd581("model", "charging_5");
        level.flagbase.nextstate = "deploy";
    } else if (progress >= 0.95 && level.flagbase.nextstate == "deploy") {
        level notify("zone_3_almost_done");
        level.flagbase.nextstate = "full_charged";
    } else if (progress >= 1 && level.flagbase.nextstate == "full_charged") {
        level.flagbase function_3677f2be30fdd581("model", "charged_5");
        level.flagbase.nextstate = undefined;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc9
// Size: 0xc8
function function_4f20ec3b4b62da91(zone) {
    level.ontimelimitgraceperiod = getdvarint(@"hash_e3f9b33c071fcce8", 10);
    level.objectivescaler = 1;
    namespace_16a6643951556450::function_fef84731c75ce2c5();
    flagzone = level.zone.flagzone;
    flagzone namespace_19b4203b51d56488::setvisibleteam("any");
    flagzone namespace_19b4203b51d56488::allowuse("enemy");
    namespace_16a6643951556450::function_e8c48ecc4a22fcd1();
    objective_state(flagzone.objidnum, "current");
    level.zonecapturetime = level.var_f44f122a81824290;
    zone.var_edf6ad250b4f68b5 = "capture_flag";
    function_a2ef0341d328f8e1(flagzone.objectivekey);
    namespace_4d0d143cd3171cd5::function_798f8bdeee7f862f();
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb098
// Size: 0xdc
function function_df7bc18f8882600e(zone) {
    level.ontimelimitgraceperiod = 5;
    level.objectivescaler = undefined;
    objective = zone.objective;
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    }
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_c2a81e1bb7ec57c2");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb17b
// Size: 0x3b8
function function_cb215e355cb593c6(zone) {
    namespace_dad3c7903f3cd2f7::function_e27a6d1eec1c355e();
    objective = zone.objective;
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    function_37487e9ef3996964(objective);
    zone.var_54a90fd3dd9a59b3 = [];
    triggers = getentarray(objective.params["hackObjective"]["targetname"], "targetname");
    var_a1c0824fc81f4bf9 = 0;
    foreach (i, trigger in triggers) {
        objectivekey = var_dec7f03ee8e5150[i];
        trigger.objectivekey = var_dec7f03ee8e5150[i];
        usingVisualHintString = objective.params["usingVisualHintString"];
        var_ed31f55739afcaf2 = namespace_dad3c7903f3cd2f7::setupobjective(trigger, i, 1, 1, usingVisualHintString);
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setvisibleteam("none");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::allowuse("none");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setusehinttext("MP_JUP_WM/HOLD_TO_START_ACTIVATION");
        var_ed31f55739afcaf2.var_9e987a57f0db587a = &function_3437d0c8eca62f1c;
        var_ed31f55739afcaf2.var_c2b12d87bb80faff = &function_cc4020b25a7774e9;
        var_ed31f55739afcaf2.var_bde11092e7372a01 = &function_b56f77a071745943;
        level.objectives[objectivekey] = var_ed31f55739afcaf2;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        zone.var_54a90fd3dd9a59b3[zone.var_54a90fd3dd9a59b3.size] = var_ed31f55739afcaf2;
        var_a1c0824fc81f4bf9 = i;
    }
    var_a1c0824fc81f4bf9 = var_a1c0824fc81f4bf9 + 1;
    zone.bombzones = [];
    triggers = getentarray(objective.params["bombObjective"]["targetname"], "targetname");
    foreach (i, trigger in triggers) {
        objectivekey = var_dec7f03ee8e5150[i + var_a1c0824fc81f4bf9];
        trigger.objectivekey = var_dec7f03ee8e5150[i + var_a1c0824fc81f4bf9];
        bombzone = namespace_2405c528d738b81a::setupobjective(trigger);
        bombzone namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES_2");
        bombzone namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("plantTime", 3));
        bombzone.onbeginuse = &bombzone_onbeginuse;
        bombzone.onenduse = &bombzone_onenduse;
        bombzone.var_29496385a7b64f4c = &function_52578476088dfe8;
        bombzone.var_229b5586c139bcbf = &function_31c6d5968282b472;
        bombzone.var_80eb66118fa863c1 = &onbombexploded;
        bombzone namespace_19b4203b51d56488::setvisibleteam("any");
        bombzone namespace_19b4203b51d56488::allowuse("none");
        bombzone.useweapon = makeweapon("briefcase_bomb_mp");
        bombzone.var_520fad4faa064280 = function_ef4d323f56385843("bombTimer", 15);
        bombzone.var_5d8933c950c9a154 = "planting";
        bombzone.model = getent(trigger.target, "targetname");
        level.objectives[objectivekey] = bombzone;
        level.objectives[objectivekey].objectivetype = objective.objectivetype;
        zone.bombzones[zone.bombzones.size] = bombzone;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb53a
// Size: 0x2a
function function_3437d0c8eca62f1c(zone, player) {
    namespace_dad3c7903f3cd2f7::function_3437d0c8eca62f1c(zone, player);
    zone namespace_19b4203b51d56488::setusehinttext("MP_JUP_WM/HOLD_TO_STOP_ACTIVATION");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56b
// Size: 0x2a
function function_cc4020b25a7774e9(zone, player) {
    namespace_dad3c7903f3cd2f7::function_cc4020b25a7774e9(zone, player);
    zone namespace_19b4203b51d56488::setusehinttext("MP_JUP_WM/HOLD_TO_START_ACTIVATION");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59c
// Size: 0x13
function function_b56f77a071745943() {
    function_8bce9c7e1a380040(self.objectivekey);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5b6
// Size: 0x77
function bombzone_onbeginuse(player) {
    player val::set("hackBomb", "offhand_weapons", 0);
    player val::set("hackBomb", "equipment_primary", 0);
    player val::set("hackBomb", "equipment_secondary", 0);
    player val::set("hackBomb", "allow_movement", 0);
    namespace_2405c528d738b81a::function_fa7eadcccfd9f8af(player);
    player thread namespace_fa795886dfc5f58a::setbombplantingomnvar("_a");
    player lerpfovscalefactor(0, 0);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb634
// Size: 0x3d
function bombzone_onenduse(team, player, result) {
    player val::function_c9d0b43701bdba00("hackBomb");
    namespace_2405c528d738b81a::function_8872296c098fd3(team, player, result);
    player lerpfovscalefactor(1, 0);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb678
// Size: 0xa1
function function_52578476088dfe8(player) {
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_bomb_defend", "waypoint_bomb_defuse");
    namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_DEFUSE_EXPLOSIVES_2");
    namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("defuseTime", 3));
    self.var_5d8933c950c9a154 = "defusing";
    self.trigger playsoundtoteam("jup_wm_bombsite_start_ally", player.team);
    self.trigger playsoundtoteam("jup_wm_bombsite_start_enemy", getotherteam(player.team)[0]);
    thread function_758991cbe4837f5c();
    level notify("hack_bomb_planted");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb720
// Size: 0x99
function function_31c6d5968282b472(player) {
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_bomb_defend", "waypoint_bomb_plant");
    namespace_19b4203b51d56488::setusehinttext("MP/HOLD_TO_PLANT_EXPLOSIVES_2");
    namespace_19b4203b51d56488::setusetime(function_ef4d323f56385843("plantTime", 3));
    self.var_5d8933c950c9a154 = "planting";
    self.trigger playsoundtoteam("jup_wm_bombsite_recovered_ally", player.team);
    self.trigger playsoundtoteam("jup_wm_bombsite_recovered_enemy", getotherteam(player.team)[0]);
    level notify("hack_bomb_defused");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7c0
// Size: 0x22
function onbombexploded() {
    self.model delete();
    function_8bce9c7e1a380040(self.objectivekey);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7e9
// Size: 0x11e
function function_758991cbe4837f5c() {
    level endon("game_ended");
    self endon("contest_recovered");
    self endon("obj_contest_zone_robbed");
    if (!isdefined(self.var_256648199aa47753)) {
        waitframe();
    }
    if (level.mapname == "mp_jup_skydiving") {
        thread function_392116cb868e4771();
    }
    while (1) {
        if (self.var_256648199aa47753 < 0.5) {
            playsoundatpos(self.trigger.origin + (0, 0, 15), "jup_wm_bombsite_beep");
        } else if (self.var_256648199aa47753 > 0.5 && self.var_256648199aa47753 < 0.95) {
            playsoundatpos(self.trigger.origin + (0, 0, 15), "jup_wm_bombsite_beep_half");
        } else if (self.var_256648199aa47753 > 0.95) {
            playsoundatpos(self.trigger.origin + (0, 0, 15), "jup_wm_bombsite_beep_final");
        }
        wait(1);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb90e
// Size: 0xb1
function function_392116cb868e4771() {
    level endon("game_ended");
    self endon("contest_recovered");
    level endon("obj_contest_zone_robbed");
    var_e6bb11a78e566a1a = 0;
    while (var_e6bb11a78e566a1a < 2) {
        playsoundatpos((-12084, -24703, 5680), "jup_wm_bombsite_alarm_fl");
        playsoundatpos((-12275, -23812, 5680), "jup_wm_bombsite_alarm_fr");
        playsoundatpos((-11552, -23659, 5680), "jup_wm_bombsite_alarm_rl");
        playsoundatpos((-11363, -24544, 5680), "jup_wm_bombsite_alarm_rr");
        if (istrue(level.objectives["_c"].complete)) {
            var_e6bb11a78e566a1a++;
        }
        wait(2);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9c6
// Size: 0x143
function function_45828a6389a8309a(zone) {
    level.ontimelimitgraceperiod = getdvarint(@"hash_e1f583ece5f18aad", 6);
    foreach (var_ed31f55739afcaf2 in zone.var_54a90fd3dd9a59b3) {
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::setvisibleteam("any");
        var_ed31f55739afcaf2 namespace_19b4203b51d56488::allowuse("enemy");
        function_a2ef0341d328f8e1(var_ed31f55739afcaf2.objectivekey);
    }
    zone.var_edf6ad250b4f68b5 = "hack";
    foreach (bombzone in zone.bombzones) {
        bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_bomb_lock");
        bombzone namespace_19b4203b51d56488::function_6bfd547f584e5161(1);
        bombzone namespace_19b4203b51d56488::function_3e4a31be47aee8f3(1);
        namespace_5a22b6f3a56f7e9b::update_objective_setneutrallabel(bombzone.objidnum, "MP_INGAME_ONLY/OBJ_LOCKED_CAPS");
    }
    level thread function_ffe3e3561b343b7d(zone);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb10
// Size: 0xe5
function function_ffe3e3561b343b7d(zone) {
    level endon("game_ended");
    level waittill("hack_zone_upload_full_complete");
    zone.var_edf6ad250b4f68b5 = "bomb";
    level.defendersRespawnDelay = getdvarint(@"hash_62c1247c7372b507", 4);
    foreach (bombzone in zone.bombzones) {
        bombzone namespace_19b4203b51d56488::function_6bfd547f584e5161(0);
        bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_bomb_defend", "waypoint_bomb_plant");
        bombzone namespace_19b4203b51d56488::setvisibleteam("any");
        bombzone namespace_19b4203b51d56488::allowuse("enemy");
        bombzone namespace_19b4203b51d56488::function_c882c384f0e771a1(1);
        function_a2ef0341d328f8e1(bombzone.objectivekey);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbfc
// Size: 0x15f
function function_3e616a6187e9d6ff(zone) {
    level.ontimelimitgraceperiod = 5;
    objective = zone.objective;
    level.defendersRespawnDelay = function_ef4d323f56385843("defendersRespawnDelay", 0);
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    }
    foreach (var_8cad8d8db24b50c9 in zone.objectives) {
        zone = level.objectives[var_8cad8d8db24b50c9];
        zone namespace_19b4203b51d56488::setvisibleteam("none");
        zone namespace_19b4203b51d56488::allowuse("none");
    }
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_57e238c776c8e030");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd62
// Size: 0xa0
function function_77dccebe95510a4f() {
    var_9bd85c448cb2a006 = level.zone.var_54a90fd3dd9a59b3.size;
    foreach (var_ed31f55739afcaf2 in level.zone.var_54a90fd3dd9a59b3) {
        if (istrue(level.objectives[var_ed31f55739afcaf2.objectivekey].complete)) {
            var_9bd85c448cb2a006--;
        }
    }
    return var_9bd85c448cb2a006;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe0a
// Size: 0x16
function function_d277ca7e1acc3003() {
    return level.zone.var_edf6ad250b4f68b5;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe28
// Size: 0x79
function function_a62aee0aefa751b3(struct, objective, objectivekey) {
    marker = struct function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_KILL_CAPS", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_jugg");
    level.objectives[objectivekey] = marker;
    level.objectives[objectivekey].objectivetype = objective.objectivetype;
    level thread function_684d385924b600cb(struct, marker, objectivekey);
    return marker;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea9
// Size: 0x174
function function_684d385924b600cb(spawndata, marker, objectivekey) {
    while (!isdefined(level.agentarray) || level.agentarray.size == 0) {
        waitframe();
    }
    if (!isnavmeshloaded()) {
        return;
    }
    agent = namespace_34f6a6adabfc542d::spawnnewagentaitype("actor_jup_exgm_enemy_warlord_test_jugg", spawndata.origin, spawndata.angles, game["defenders"]);
    agent namespace_1f8384d33bfd1e13::function_1cbb19fc0caeab00();
    player_max_health = getmatchrulesdata("commonOption", "maxHealth");
    multiplier = 150;
    var_8e779b9bedae79b = int(player_max_health * multiplier);
    agent namespace_34f6a6adabfc542d::set_agent_health(var_8e779b9bedae79b);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(marker.objidnum, agent);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(marker.objidnum, 110);
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 1);
    agent.agentdamagefeedback = 1;
    agent thread function_ae789c283dba54c2(marker, spawndata);
    if (isdefined(spawndata.target)) {
        volume = function_f159c10d5cf8f0b4(spawndata.target, "targetname")[0];
        agent setgoalvolumeauto(volume);
    }
    agent waittill("death");
    level.objectives[objectivekey].complete = 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc024
// Size: 0xf0
function function_ae789c283dba54c2(marker, spawndata) {
    self endon("death");
    agent = self;
    while (1) {
        agent function_9215ce6fc83759b9(550);
        agent setgoalpos(spawndata.origin);
        foreach (player in level.players) {
            health = agent.health / agent.maxhealth;
            if (health < 0) {
                health = 0;
            }
            namespace_5a22b6f3a56f7e9b::objective_show_progress(marker.objidnum, 1);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(marker.objidnum, health);
        }
        wait(0.25);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc11b
// Size: 0x87
function function_f181e89f2aa5615f() {
    while (!isdefined(level.var_a0b2c978ca57ffc5)) {
        waitframe();
    }
    while (!isdefined(level.var_a0b2c978ca57ffc5["light_tank"])) {
        waitframe();
    }
    level.var_a0b2c978ca57ffc5["light_tank"].interact.var_9d0537be150542b3 = [0:"gunner"];
    level.var_a0b2c978ca57ffc5["light_tank"].interact.seatswitcharray = [0:"gunner"];
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1a9
// Size: 0x108
function function_a4493e9abd56251f() {
    level endon("game_ended");
    self endon("entitydeleted");
    self endon("reached_goal");
    while (1) {
        wait(5);
        if (self vehicle_getspeed() <= 0 || istrue(self.contested)) {
            continue;
        }
        attackers = namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "alivePlayers");
        var_95f2a51e7b487eb2 = function_64bb0e20a20f59b7(attackers, self.origin, self.tankNearbyRange);
        foreach (player in var_95f2a51e7b487eb2) {
            if (is_equal(level.zone.objectivetype, 11)) {
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_81a9c1c924b14bba");
            } else {
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_8bc1d18dcd87c8a3");
            }
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2b8
// Size: 0x25
function function_86bddcb4c5e824e9() {
    /#
        self endon("dx_mp_mwm1_mode_t141_ostk");
        while (1) {
            box(self.origin);
            waitframe();
        }
    #/
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e4
// Size: 0x7aa
function function_7d5057db2f8ddb6f(tank, objidnum) {
    tank endon("entitydeleted");
    tank endon("reached_goal");
    tank vehicle_turnengineon();
    tank thread function_2fd30b01784b1b6b();
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (isdefined(tank.var_77374a4ca1381d75) && !istrue(tank.var_77374a4ca1381d75["wm_stop_2"])) {
        waitframe();
    }
    if (!isdefined(tank.tankNearbyRange)) {
        tank.tankNearbyRange = 500;
    }
    tank thread function_a4493e9abd56251f();
    var_b4ea3dc614d8b362 = function_29227adb79acc568("tankReversible", 1);
    setspeed = tank.defaultspeed;
    tank.var_7150b8620d62148 = [];
    tank.var_9776a7ea13c434a2 = [];
    foreach (player in level.players) {
        player.var_3a9ae1fe9210a5b7 = 0;
    }
    while (1) {
        shouldmove = 0;
        var_90b5cdd621c70d23 = tank.tankNearbyRange;
        tank.var_90460c78c57c1e5e = 0;
        tank.var_92051c7cb27cb3bb = 0;
        attackers = namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "alivePlayers");
        var_95f2a51e7b487eb2 = function_64bb0e20a20f59b7(attackers, tank.origin, var_90b5cdd621c70d23);
        if (var_95f2a51e7b487eb2.size > 0) {
            shouldmove = 1;
        }
        defenders = namespace_54d20dd0dd79277f::getteamdata(game["defenders"], "alivePlayers");
        var_6d7e1ac89a5fdf92 = function_64bb0e20a20f59b7(defenders, tank.origin, var_90b5cdd621c70d23);
        tank.var_95f2a51e7b487eb2 = var_95f2a51e7b487eb2;
        tank.var_6d7e1ac89a5fdf92 = var_6d7e1ac89a5fdf92;
        var_7ee807952147a650 = istrue(tank.var_5fb0e90d5b2a8aae) || istrue(tank.var_6decdc73003db8d0) || istrue(tank.var_65ab8f532ca7195);
        foreach (player in level.players) {
            if (!isdefined(player.var_3a9ae1fe9210a5b7)) {
                player.var_3a9ae1fe9210a5b7 = 0;
            }
            var_763caca9e047aed4 = player.var_3a9ae1fe9210a5b7;
            if (game["attackers"] == player.team) {
                player.var_3a9ae1fe9210a5b7 = array_contains(var_95f2a51e7b487eb2, player);
            } else {
                player.var_3a9ae1fe9210a5b7 = array_contains(var_6d7e1ac89a5fdf92, player);
            }
            if (var_763caca9e047aed4 != player.var_3a9ae1fe9210a5b7) {
                if (istrue(var_763caca9e047aed4)) {
                    tank function_bc781bec44dec115(player, 1);
                } else {
                    tank function_458432ef4351024c(player);
                }
            }
        }
        tank.contested = 0;
        if (istrue(tank.canStopByDefenders)) {
            if (shouldmove && var_6d7e1ac89a5fdf92.size > 0) {
                tank.contested = 1;
                shouldmove = 0;
            }
            if (var_b4ea3dc614d8b362) {
                var_3a1fd22f4a3152d8 = 0;
                if (isdefined(tank.var_3f3a023549c63a8c) && isdefined(tank.checkpoints) && isdefined(tank.checkpoints[tank.var_3f3a023549c63a8c - 1])) {
                    var_3a1fd22f4a3152d8 = tank.checkpoints[tank.var_3f3a023549c63a8c - 1].progress;
                }
                if (!var_7ee807952147a650 && !isdefined(tank.var_1d34d30f32ce259c)) {
                    if (tank.progress - var_3a1fd22f4a3152d8 > 0.004 && var_6d7e1ac89a5fdf92.size > 0 && var_95f2a51e7b487eb2.size == 0) {
                        shouldmove = 1;
                        if (!istrue(tank.var_bc123f28659c31e8)) {
                            tank.var_bc123f28659c31e8 = 1;
                            setspeed = tank.defaultspeed / 2;
                            if (isdefined(level.zone.objective) && isdefined(level.zone.objective.params["wheelsonRetreatSpeed"])) {
                                setspeed = level.zone.objective.params["wheelsonRetreatSpeed"];
                            }
                            tank.veh_pathdir = "reverse";
                            tank.veh_transmission = "reverse";
                            tank notify("reverse_changed");
                        }
                    } else if (var_6d7e1ac89a5fdf92.size == 0 && var_95f2a51e7b487eb2.size > 0) {
                        if (istrue(tank.var_bc123f28659c31e8)) {
                            tank.var_bc123f28659c31e8 = 0;
                            setspeed = tank.defaultspeed;
                            tank.veh_pathdir = "forward";
                            tank.veh_transmission = "forward";
                            tank notify("reverse_changed");
                        }
                    }
                }
            }
        }
        foreach (player in level.players) {
            player function_3cd19573df126b43(objidnum, tank);
        }
        tank.var_5b67ad6d3409a341 = 0;
        if (isdefined(tank.var_7150b8620d62148)) {
            foreach (index, var_41c51acda53dbe63 in tank.var_7150b8620d62148) {
                if (istrue(var_41c51acda53dbe63)) {
                    tank.var_5b67ad6d3409a341 = 1;
                    if (tank.var_9776a7ea13c434a2[index] == "forward" && !istrue(tank.var_bc123f28659c31e8)) {
                        shouldmove = 0;
                        break;
                    } else if (tank.var_9776a7ea13c434a2[index] == "backward" && istrue(tank.var_bc123f28659c31e8)) {
                        shouldmove = 0;
                        break;
                    }
                }
            }
        }
        function_56a6df7bc15c1d56(tank, objidnum);
        if (var_7ee807952147a650) {
            tank.var_92051c7cb27cb3bb = 0;
            currentspeed = tank function_796a1097d8a12f6a();
            if (currentspeed != 0) {
                currentspeed = currentspeed - 0.9;
                tank.var_90460c78c57c1e5e = 1;
                if (currentspeed < 0) {
                    currentspeed = 0;
                    tank.var_90460c78c57c1e5e = 0;
                }
                tank function_221a50fb1dadfc46(currentspeed);
                tank notify("tank_stop");
            }
        } else if (isdefined(tank.var_1d34d30f32ce259c)) {
            tank.var_92051c7cb27cb3bb = 0;
            tank function_221a50fb1dadfc46(tank.var_1d34d30f32ce259c);
            tank.var_90460c78c57c1e5e = 1;
        } else if (!shouldmove) {
            tank.var_92051c7cb27cb3bb = 0;
            tank function_221a50fb1dadfc46(0);
            tank.var_90460c78c57c1e5e = 0;
            tank notify("tank_stop");
        } else {
            tank.var_92051c7cb27cb3bb = 1;
            tank function_221a50fb1dadfc46(setspeed);
            tank.var_90460c78c57c1e5e = 1;
            tank notify("tank_moving");
        }
        wait(0.25);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca95
// Size: 0x117
function function_3cd19573df126b43(objidnum, tank) {
    state = 0;
    text = undefined;
    if (istrue(self.var_3a9ae1fe9210a5b7)) {
        if (istrue(tank.var_5b67ad6d3409a341)) {
            state = 4;
            if (level.mapname == "mp_jup_skydiving") {
                text = "MP_INGAME_ONLY/OBJ_BLOCKED_BAFFLE";
            } else {
                text = "MP_INGAME_ONLY/OBJ_BLOCKED_HEDGEHOG_CAPS";
            }
        } else if (istrue(tank.var_65ab8f532ca7195)) {
            state = 4;
            text = "MP_INGAME_ONLY/OBJ_HALT_CAPS";
        } else if (tank.contested) {
            state = 3;
            text = "MP_INGAME_ONLY/OBJ_CONTESTING_CAPS";
        } else if (self.team == game["attackers"]) {
            state = 1;
            text = "MP_INGAME_ONLY/OBJ_ESCORTING_CAPS";
        } else {
            state = 2;
            text = "MP_INGAME_ONLY/OBJ_FORCING_BACK_CAPS";
        }
    }
    if (!isdefined(self.var_974cca039ded252e) || self.var_974cca039ded252e != state) {
        thread function_e9ecbc39979febfd(objidnum, state, text, !istrue(tank.var_65ab8f532ca7195));
        self.var_974cca039ded252e = state;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbb3
// Size: 0x80
function function_e9ecbc39979febfd(objidnum, var_974cca039ded252e, text, var_d2f33cb2882e714d) {
    if (isdefined(self.var_974cca039ded252e) && self.var_974cca039ded252e != 0) {
        objective_unpin_player(objidnum, self);
        function_8b71eb96e1636edc("", self);
        waitframe();
    }
    if (var_d2f33cb2882e714d) {
        if (var_974cca039ded252e != 0) {
            objective_pin_player(objidnum, self);
        }
        if (istrue(self.var_3a9ae1fe9210a5b7)) {
            function_160f522b63c32d76(1, text);
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc3a
// Size: 0xac
function function_221a50fb1dadfc46(speed) {
    if (speed < 0) {
        speed = 0;
    }
    if (speed == 0) {
        setomnvar("ui_wm_escort_dir", 0);
    } else {
        setomnvar("ui_wm_escort_dir", ter_op(self.veh_pathdir == "forward", 1, -1));
    }
    if (self.useP2P) {
        if (speed == 0) {
            self function_a7fac0397762d7a6("p2p", "pause", 1);
        } else {
            self function_a7fac0397762d7a6("p2p", "resume", 1);
        }
        self function_a7fac0397762d7a6("p2p", "manualSpeed", mph_to_ips(speed));
    } else {
        self vehicle_setspeed(speed);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcced
// Size: 0x30
function function_796a1097d8a12f6a() {
    if (self.useP2P) {
        return ips_to_mph(self function_210ad508dfc813a2("p2p", "manualSpeed"));
    } else {
        return self vehicle_getspeed();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd24
// Size: 0x182
function function_c1bc249b0499979e() {
    level endon("game_ended");
    self endon("entitydeleted");
    if (!isdefined(self.pathnodes) || self.pathnodes.size == 0) {
        return;
    }
    self function_a7fac0397762d7a6("p2p", "brakeAtGoal", 0);
    self function_a7fac0397762d7a6("p2p", "goalThreshold", 10);
    var_512ffbffc675f2fc = 0;
    targetnode = self.pathnodes[var_512ffbffc675f2fc];
    self.var_6bb0ab1fe092bd5d = 0;
    while (isdefined(targetnode)) {
        self function_a7fac0397762d7a6("p2p", "goalPoint", targetnode.origin);
        self function_a7fac0397762d7a6("p2p", "goalAngles", targetnode.angles);
        msg = waittill_any_return_3("near_goal", "path_blocked", "reverse_changed");
        if (msg == "path_blocked") {
            continue;
        } else if (msg == "reverse_changed") {
            if (istrue(self.var_bc123f28659c31e8)) {
                self function_a7fac0397762d7a6("p2p", "checkStuck", 0);
                self function_a7fac0397762d7a6("p2p", "reverseForBehindGoal", 1);
            } else {
                self function_a7fac0397762d7a6("p2p", "checkStuck", 1);
                self function_a7fac0397762d7a6("p2p", "reverseForBehindGoal", 0);
            }
        }
        if (istrue(self.var_bc123f28659c31e8)) {
            var_512ffbffc675f2fc--;
        } else {
            var_512ffbffc675f2fc++;
        }
        targetnode = self.pathnodes[var_512ffbffc675f2fc];
        self.var_6bb0ab1fe092bd5d = var_512ffbffc675f2fc;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcead
// Size: 0x2ca
function function_2fd30b01784b1b6b() {
    self endon("entitydeleted");
    self endon("reached_goal");
    if (self.vehicletype == "veh_jup_mil_lnd_tank_cougar_mg_physics") {
        var_5be28c4da990b127 = spawn("script_model", self.origin);
        var_5be28c4da990b127 linkto(self, "tag_origin", (-80, 0, 45), (0, 0, 0));
        while (1) {
            if (self vehicle_getspeed() > 0) {
                foreach (player in level.players) {
                    if (isdefined(player)) {
                        player clearsoundsubmix("jup_mode_wm_tank_engine", 0.2);
                    }
                }
                var_5be28c4da990b127 stopsounds();
                var_5be28c4da990b127 playsoundonmovingent("veh_jup_mil_lnd_cougar_tank_wm_start");
                self waittill("tank_stop");
            } else {
                foreach (player in level.players) {
                    if (isdefined(player)) {
                        player setsoundsubmix("jup_mode_wm_tank_engine", 0.2, 1);
                    }
                }
                var_5be28c4da990b127 stopsounds();
                var_5be28c4da990b127 playsoundonmovingent("veh_jup_mil_lnd_cougar_tank_wm_stop");
                self waittill("tank_moving");
            }
            waitframe();
        }
    } else if (self.vehicletype == "veh_pac_sentry_amphibious_mp_skydiving") {
        self.var_5be28c4da990b127 = spawn("script_model", self.origin);
        self.var_5be28c4da990b127 linkto(self, "tag_origin", (0, 0, 15), (0, 0, 0));
        while (1) {
            if (istrue(self.var_65ab8f532ca7195)) {
                self.var_5be28c4da990b127 stoploopsound("veh_jup_kls_wheelson_engine_lp");
                self.var_5be28c4da990b127 playsoundonmovingent("veh_jup_kls_wheelson_engine_stop");
                self waittill("tank_moving");
            }
            if (self vehicle_getspeed() > 0) {
                if (istrue(self.var_bc123f28659c31e8)) {
                    self.var_5be28c4da990b127 playloopsound("veh_jup_kls_wheelson_engine_reverse_lp");
                    thread function_28518f0349b4e5cb();
                    waittill_any_2("reverse_changed", "tank_stop");
                } else {
                    self.var_5be28c4da990b127 playsoundonmovingent("veh_jup_kls_wheelson_engine_start");
                    wait(0.5);
                    self.var_5be28c4da990b127 playloopsound("veh_jup_kls_wheelson_engine_lp");
                    self waittill("tank_stop");
                }
            } else {
                self.var_5be28c4da990b127 stoploopsound();
                self.var_5be28c4da990b127 playsoundonmovingent("veh_jup_kls_wheelson_engine_stop");
                self waittill("tank_moving");
            }
            waitframe();
        }
    } else {
        return;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd17e
// Size: 0x44
function function_28518f0349b4e5cb() {
    self endon("entitydeleted");
    self endon("reached_goal");
    self endon("tank_stop");
    while (self.veh_pathdir == "reverse") {
        self.var_5be28c4da990b127 playsoundonmovingent("veh_jup_kls_wheelson_engine_reverse_beep");
        wait(1);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c9
// Size: 0x15f
function function_56a6df7bc15c1d56(tank, objidnum) {
    namespace_5a22b6f3a56f7e9b::update_objective_sethot(objidnum, istrue(tank.contested || tank.var_5b67ad6d3409a341));
    if (istrue(tank.var_5b67ad6d3409a341)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objidnum, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
        namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objidnum, "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS");
    } else if (istrue(tank.contested)) {
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objidnum, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS");
        namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objidnum, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS");
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objidnum, "MP_INGAME_ONLY/OBJ_ESCORT_CAPS");
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objidnum, "MP_INGAME_ONLY/OBJ_HALT_CAPS");
    }
    if (istrue(tank.var_5b67ad6d3409a341)) {
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, namespace_19b4203b51d56488::getwaypointshader("waypoint_escort_vehicle_blocked"));
    } else if (istrue(tank.var_5fb0e90d5b2a8aae)) {
        if (isdefined(tank.var_69793c5f705822c3)) {
            namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, namespace_19b4203b51d56488::getwaypointshader("waypoint_escort_vehicle_repair"));
            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objidnum, "MP_INGAME_ONLY/OBJ_TANK_REPAIRING");
            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objidnum, "MP_INGAME_ONLY/OBJ_TANK_REPAIRING");
        } else {
            namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, namespace_19b4203b51d56488::getwaypointshader("waypoint_escort_vehicle_damaged"));
            namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(objidnum, "MP_INGAME_ONLY/OBJ_TANK_DAMAGED");
            namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(objidnum, "MP_INGAME_ONLY/OBJ_TANK_DAMAGED");
        }
    } else {
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, namespace_19b4203b51d56488::getwaypointshader("waypoint_escort_vehicle"));
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32f
// Size: 0x109
function function_98b9f09341fd9ba8(vehicle, objidnum, pathend) {
    progress = 1;
    totaldistance = distance2d(vehicle.spawndata.node.origin, pathend.origin);
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objidnum, game["defenders"]);
    while (distance2d(vehicle.origin, pathend.origin) > 64) {
        currenttime = gettime();
        if (!isdefined(vehicle.origin)) {
            return;
        }
        progress = 1 - distance(vehicle.origin, pathend.origin) / totaldistance;
        if (progress < 0) {
            progress = 0;
        }
        namespace_5a22b6f3a56f7e9b::objective_set_progress(objidnum, progress);
        vehicle.progress = progress;
        waitframe();
    }
    function_d507ea0668f3666c(vehicle);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd43f
// Size: 0x450
function function_f2a1c180dc67b7f8(vehicle, objidnum) {
    level endon("game_ended");
    /#
        assert(vehicle.pathnodes.size > 0);
    #/
    endnode = vehicle.pathnodes[vehicle.pathnodes.size - 1];
    totaldistance = endnode.var_1d7ebd1bcc23a4e1;
    vehicle.var_56df20c41f5b3159 = 1 / totaldistance;
    /#
        level thread function_d36257ceb2380e24(vehicle, vehicle.pathnodes);
    #/
    if (isdefined(vehicle.spawndata.spawnmethod) && vehicle.spawndata.spawnmethod == "airdrop_at_position_unsafe") {
        vehicle waittill("landed");
    }
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objidnum, game["defenders"]);
    var_b8d9c602e284684e = 900;
    while (vehicle.progress != 1) {
        waitframe();
        if (!vehicle.useP2P) {
            if (!isdefined(vehicle.var_6bb0ab1fe092bd5d)) {
                vehicle.var_6bb0ab1fe092bd5d = 1;
            }
            var_b2f8f3051e3018b1 = distance2dsquared(vehicle.pathnodes[vehicle.var_6bb0ab1fe092bd5d].origin, vehicle.origin);
            var_1f7233a1b7010fe4 = distance2dsquared(vehicle.pathnodes[vehicle.var_6bb0ab1fe092bd5d - 1].origin, vehicle.origin);
            if (vehicle.var_6bb0ab1fe092bd5d + 1 < vehicle.pathnodes.size && var_b2f8f3051e3018b1 < var_b8d9c602e284684e && !istrue(vehicle.var_bc123f28659c31e8)) {
                vehicle.var_6bb0ab1fe092bd5d++;
            } else if (vehicle.var_6bb0ab1fe092bd5d > 0 && var_1f7233a1b7010fe4 < var_b8d9c602e284684e && istrue(vehicle.var_bc123f28659c31e8)) {
                vehicle.var_6bb0ab1fe092bd5d--;
            }
            /#
                print3d(vehicle.origin + (0, 0, 200), var_b2f8f3051e3018b1, (1, 0, 0));
            #/
        }
        var_92bc69459236be07 = vehicle.var_6bb0ab1fe092bd5d - 1;
        var_d6645075dadc550a = vehicle.pathnodes[var_92bc69459236be07];
        if (!isdefined(var_d6645075dadc550a)) {
            continue;
        }
        var_1bf11bea5ff1631e = distance2d(vehicle.origin, var_d6645075dadc550a.origin);
        progress = (var_d6645075dadc550a.var_1d7ebd1bcc23a4e1 + var_1bf11bea5ff1631e) / totaldistance;
        if (progress > 1) {
            progress = 1;
        } else if (vehicle.var_6bb0ab1fe092bd5d >= vehicle.pathnodes.size - 1) {
            var_b0162d29bef25c14 = distancesquared(vehicle.pathnodes[vehicle.pathnodes.size - 1].origin, vehicle.origin) < var_b8d9c602e284684e;
            if (var_b0162d29bef25c14) {
                progress = 1;
            }
        }
        vehicle.progress = progress;
        if (isdefined(vehicle.checkpoints) && isdefined(vehicle.checkpoints[vehicle.var_3f3a023549c63a8c])) {
            if (vehicle.progress >= vehicle.checkpoints[vehicle.var_3f3a023549c63a8c].progress) {
                vehicle.var_3f3a023549c63a8c++;
            }
        }
        namespace_5a22b6f3a56f7e9b::objective_set_progress(objidnum, progress);
        /#
            print3d(vehicle.origin + (0, 0, 72), "dx_mp_mwm1_mode_spet_olde" + int(var_1bf11bea5ff1631e) + "dx_mp_mwm1_mode_spet_olbf" + var_d6645075dadc550a.var_1d7ebd1bcc23a4e1 + "dx_mp_mwm1_mode_t141_ontk" + distance2d(vehicle.origin, vehicle.pathnodes[var_92bc69459236be07 + 1].origin));
        #/
    }
    function_d507ea0668f3666c(vehicle);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd896
// Size: 0x7f
function function_d507ea0668f3666c(vehicle) {
    if (!istrue(vehicle.var_a7719deb5db7d637)) {
        level.objectives[vehicle.objectivekey].complete = 1;
        level.objectives[vehicle.objectivekey] namespace_19b4203b51d56488::setvisibleteam("none");
        vehicle notify("reached_goal");
        vehicle vehicle_setspeed(0, 0, 1);
        vehicle.var_a7719deb5db7d637 = 1;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd91c
// Size: 0xc5
function function_d36257ceb2380e24(vehicle, pathnodes) {
    /#
        level endon("dx_mp_mwm1_mode_t141_oftk");
        vehicle endon("obj2_def_tank_damaged_launchfacility");
        while (1) {
            for (i = 0; i < pathnodes.size; i++) {
                print3d(pathnodes[i].origin + (0, 0, 50), "dx_mp_mwm1_mode_t141_onak" + i + "dx_mp_mwm1_mode_spet_oipd" + pathnodes[i].var_1d7ebd1bcc23a4e1);
                print3d(pathnodes[i].origin + (0, 0, 36), "obj3_atk_upload_complete_launchfacility" + int(pathnodes[i].progress * 100) + "dx_mp_mwm1_mode_spet_ohpd");
            }
            waitframe();
        }
    #/
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9e8
// Size: 0x2a6
function function_a13d6040c09f7f03(c4, samsite, player) {
    if (!istrue(c4.var_7b0e1793e94cafb4)) {
        samsite function_e70d07a164d078c2("plant");
        return 0;
    }
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_d9283d3795ee1ca0");
    level notify("planted_bomb_on_sam_site");
    samsite endon("samsite_cancel_bomb_countdown");
    currenttime = gettime();
    totaltime = 15000;
    var_f28399727742eb23 = int(currenttime + totaltime);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    objidnum = level.objectives[samsite.entity.objectivekey].objidnum;
    level.objectives[samsite.entity.objectivekey] namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defuse", "waypoint_defend", objidnum);
    level childthread function_3121d0837c912266(objidnum, var_f28399727742eb23, totaltime);
    samsite function_e70d07a164d078c2("defuse");
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 1500) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("breach_warning_beep_05")) {
                    c4 playsound("breach_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 < 500) {
                if (soundexists("breach_warning_beep_04")) {
                    c4 playsound("breach_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 < 1500) {
                if (soundexists("breach_warning_beep_03")) {
                    c4 playsound("breach_warning_beep_03");
                }
            } else if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 < 3500) {
            if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.5);
        } else {
            if (soundexists("breach_warning_beep_01")) {
                c4 playsound("breach_warning_beep_01");
            }
            wait(1);
        }
        if (var_c301d652d9a73075 < 0) {
            break;
        }
    }
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(game["attackers"], "players")) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_9b82ab032940a3d6");
    }
    samsite notify("samsite_bomb_detonated");
    samsite.entity thread namespace_f70554b797fd58c2::function_6c86d07047fae506(player, "samsite_base_mp");
    return 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc96
// Size: 0x188
function function_e70d07a164d078c2(state) {
    turret = self;
    ent = function_fb532e39e9edebf5(turret);
    ent.var_f236a45969f96bb4 = state;
    if (state == "plant") {
        turret setscriptablepartstate("usable_left", "usable");
        turret setscriptablepartstate("usable_front", "usable");
        turret setscriptablepartstate("usable_right", "usable");
        turret setscriptablepartstate("usable_left_defuse", "unusable");
        turret setscriptablepartstate("usable_front_defuse", "unusable");
        turret setscriptablepartstate("usable_right_defuse", "unusable");
    } else {
        turret setscriptablepartstate("usable_left", "unusable");
        turret setscriptablepartstate("usable_front", "unusable");
        turret setscriptablepartstate("usable_right", "unusable");
        turret setscriptablepartstate("usable_left_defuse", "usable");
        turret setscriptablepartstate("usable_front_defuse", "usable");
        turret setscriptablepartstate("usable_right_defuse", "usable");
    }
    turret setscriptablepartstate("usable_front", "unusable");
    turret setscriptablepartstate("usable_front_defuse", "unusable");
    foreach (player in level.players) {
        turret function_ee3f9522a825f738(player);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde25
// Size: 0xde
function function_ee3f9522a825f738(player) {
    turret = self;
    ent = function_fb532e39e9edebf5(turret);
    state = ent.var_f236a45969f96bb4;
    if (is_equal(player.pers["team"], game["attackers"])) {
        if (state == "plant") {
            turret function_2e03390bf1d8959d(player, 1);
            turret function_4f1745dec2e39ab4(player, 0);
        }
        if (state == "defuse") {
            turret function_2e03390bf1d8959d(player, 0);
            turret function_4f1745dec2e39ab4(player, 0);
        }
    } else {
        if (state == "plant") {
            turret function_2e03390bf1d8959d(player, 0);
            turret function_4f1745dec2e39ab4(player, 0);
        }
        if (state == "defuse") {
            turret function_2e03390bf1d8959d(player, 0);
            turret function_4f1745dec2e39ab4(player, 1);
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf0a
// Size: 0x36
function function_fb532e39e9edebf5(turret) {
    if (is_equal(turret.classname, "misc_turret")) {
        return turret;
    } else {
        return turret.entity;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf47
// Size: 0x65
function function_2e03390bf1d8959d(player, bool) {
    if (!isdefined(bool)) {
        bool = 1;
    }
    turret = self;
    if (bool) {
        turret enablescriptablepartplayeruse("usable_left", player);
        turret enablescriptablepartplayeruse("usable_right", player);
    } else {
        turret disablescriptablepartplayeruse("usable_left", player);
        turret disablescriptablepartplayeruse("usable_right", player);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfb3
// Size: 0x5b
function function_4f1745dec2e39ab4(player, bool) {
    turret = self;
    if (bool) {
        turret enablescriptablepartplayeruse("usable_left_defuse", player);
        turret enablescriptablepartplayeruse("usable_right_defuse", player);
    } else {
        turret disablescriptablepartplayeruse("usable_left_defuse", player);
        turret disablescriptablepartplayeruse("usable_right_defuse", player);
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe015
// Size: 0xd4
function function_cbd3979676d57efe(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_fbc15faadfadee5d");
    objidnum = level.objectives[instance.entity.objectivekey].objidnum;
    objective_set_progress(objidnum, 1);
    level.objectives[instance.entity.objectivekey] namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", objidnum);
    instance notify("samsite_cancel_bomb_countdown");
    instance function_e70d07a164d078c2("plant");
    level notify("defused_bomb_on_sam_site");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0f0
// Size: 0x92
function function_3121d0837c912266(objidnum, var_f28399727742eb23, totaltime) {
    progress = 1;
    while (progress > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        progress = max(0, var_c301d652d9a73075 / totaltime);
        objective_set_progress(objidnum, progress);
        objective_set_progress_team(objidnum, game["attackers"]);
        objective_show_team_progress(objidnum, game["defenders"]);
        objective_show_team_progress(objidnum, game["attackers"]);
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe189
// Size: 0x8b
function function_4af811e7fdb1c621(struct) {
    turret = namespace_f70554b797fd58c2::function_fefa23bed4e70fb2(struct, "military_samsite_01_rig_skeleton_war_mode_mp");
    function_f7c5fc38fdc4df8c(turret);
    turret.target_entity = spawn("script_model", turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 1000);
    turret settargetentity(turret.target_entity);
    turret thread function_3683331ec49168ba();
    return turret;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21c
// Size: 0xc1
function function_3683331ec49168ba() {
    self endon("stop_dmgmonitor");
    self setcandamage(1);
    self setcanradiusdamage(1);
    self.var_880a990d25b43aaa = 0;
    self.var_59a09303493e759d = 750;
    attacker = undefined;
    self.health = 9999999;
    while (1) {
        objweapon = dflags = partname = tagname = modelname = meansofdeath = damagelocation = direction_vec = attacker = amount = self waittill("damage");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2e4
// Size: 0x32
function function_ce07c8b7bf47de7b() {
    while (1) {
        self.turret waittill("samsite_dead");
        namespace_19b4203b51d56488::setvisibleteam("none");
        self.complete = 1;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe31d
// Size: 0x93
function function_260a303b50ba69cc() {
    player = self;
    foreach (turret in level.var_f55e20c194c117f4) {
        if (!isdefined(turret)) {
            continue;
        }
        turret function_ee3f9522a825f738(player);
        if (is_equal(level.zone.objectivetype, 5)) {
            turret function_6ce08fcf00f18e1();
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b7
// Size: 0x5d
function function_6ce08fcf00f18e1() {
    turret = self;
    turret hudoutlineenable("outline_depth_red");
    turret.var_692fc766d262881a hudoutlineenable("outline_depth_red");
    turret.var_692fc666d26285e7 hudoutlineenable("outline_depth_red");
    turret.var_692fc566d26283b4 hudoutlineenable("outline_depth_red");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe41b
// Size: 0x12e
function function_bbcd7058816ef794(objectivekey, var_5c0541626c1426b7, var_8ec9d491901566eb, objectiveicon, var_dc2051b484d59991, offset) {
    struct = self;
    if (!isdefined(offset)) {
        offset = (0, 0, 84);
    }
    team = game["defenders"];
    if (isdefined(var_dc2051b484d59991)) {
        team = var_dc2051b484d59991;
    }
    marker = namespace_19b4203b51d56488::createobjidobject(struct.origin, team, offset, undefined, "all", 0);
    marker.iconname = objectivekey;
    marker.objectivekey = objectivekey;
    marker namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", marker.objidnum, team);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, objectiveicon);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, team);
    namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(marker.objidnum, var_5c0541626c1426b7);
    namespace_5a22b6f3a56f7e9b::update_objective_setfriendlylabel(marker.objidnum, var_8ec9d491901566eb);
    objective_playermask_hidefromall(marker.objidnum);
    return marker;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe551
// Size: 0x52
function function_389ebc5025c28934(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    level endon("game_ended");
    turret thread [[ getsharedfunc("damage", "monitorDamage") ]](turret.maxhealth, "hitequip", &function_242ded3cfe2e5d3b, &function_6886c78f9664c089, 1);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5aa
// Size: 0x116
function function_14aa40ae092fe7b1(turret) {
    turret endon("carried");
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = turret waittill("kill_turret");
    level.objectives[turret.marker.objectivekey].complete = 1;
    turret function_70c8684c2c29bf59("destroyed");
    turret setturretowner(undefined);
    turret playsound("mp_equip_destroyed");
    if (isdefined(turret.useownerobj)) {
        turret.useownerobj delete();
    }
    if (isdefined(turret.useotherobj)) {
        turret.useotherobj delete();
    }
    if (isdefined(turret.colmodel)) {
        turret.colmodel delete();
    }
    if (isdefined(turret.marker)) {
        objective_playermask_hidefromall(turret.marker.objidnum);
    }
    wait(0.2);
    turret delete();
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6c7
// Size: 0x7b
function function_70c8684c2c29bf59(type) {
    turretmodel = undefined;
    if (type == "placed") {
        turretmodel = level.var_7d48025ea3734fa2[self.turrettype].modelbaseground;
    } else {
        turretmodel = level.var_7d48025ea3734fa2[self.turrettype].modeldestroyedground;
    }
    /#
        assertex(isdefined(turretmodel), "For some reason turretModel is not defined, this should never happen");
    #/
    self setmodel(turretmodel);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe749
// Size: 0x442
function function_3f70bb8b39738c34(var_2776aeb45e3f60f0, vehicles, var_1916d950ec8ab2c) {
    wm_escort_hostage_path = getvehiclenode("wm_escort_hostage_path", "targetname");
    foreach (vehicle in vehicles) {
        vehicle attachpath(wm_escort_hostage_path);
        vehicle startpath();
    }
    foreach (vehicle in vehicles) {
        vehicle vehicle_setspeed(0);
    }
    while (!gameflagexists("infil_will_run")) {
        waitframe();
    }
    if (gameflag("infil_will_run")) {
        gameflagwait("infil_started");
    } else {
        while (!istrue(level.prematchstarted)) {
            waitframe();
        }
    }
    foreach (vehicle in vehicles) {
        vehicle thread vehicle_move_forward_until("wm_stop_1");
    }
    while (1) {
        player = self waittill("trigger");
        if (!istrue(player.var_5b3c77e2eafab370)) {
            continue;
        }
        var_3fa2e3f150593f0c = [];
        level.objectives[player.carryobject.objectivekey].complete = 1;
        player.carryobject function_1e6e529917057bf2(player);
        player.carryobject namespace_19b4203b51d56488::setvisibleteam("none");
        player.carryobject namespace_19b4203b51d56488::setvisibleteam("none", self.var_81121fb99d0a00b);
        player.carryobject namespace_19b4203b51d56488::setvisibleteam("none", self.var_bd657a84755765de);
        if (isdefined(player)) {
            foreach (hostage in level.hostages) {
                if (!isdefined(hostage.carrier)) {
                    hostage.trigger enableplayeruse(player);
                }
            }
        }
        if (isdefined(player.carryobject.trackedobject)) {
            if (isdefined(player.carryobject.trackedobject.pingobjidnum)) {
                namespace_5a22b6f3a56f7e9b::returnobjectiveid(player.carryobject.trackedobject.pingobjidnum);
                player.carryobject.trackedobject.pingobjidnum = undefined;
            }
            player.carryobject.trackedobject namespace_19b4203b51d56488::deletetrackedobject();
            player.carryobject.trackedobject = undefined;
        }
        player.carryobject namespace_19b4203b51d56488::deletetrackedobject();
        player.carryobject = undefined;
        player.var_5b3c77e2eafab370 = undefined;
        foreach (hostage in var_2776aeb45e3f60f0) {
            if (!istrue(hostage.saved)) {
                var_3fa2e3f150593f0c[var_3fa2e3f150593f0c.size] = hostage;
            }
        }
        var_288410680c3048c2 = getclosest(player.origin, var_3fa2e3f150593f0c);
        var_288410680c3048c2 show();
        var_288410680c3048c2.head show();
        var_288410680c3048c2.saved = 1;
        var_288410680c3048c2 scriptmodelplayanimdeltamotion("cap_civ_prty_anxious_seat02");
        if (var_3fa2e3f150593f0c.size == 1) {
            break;
        }
    }
    var_1916d950ec8ab2c namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(var_1916d950ec8ab2c.objidnum);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb92
// Size: 0x8e
function function_1e6e529917057bf2(player) {
    self notify("prompt_cleanup");
    player notify("remove_rig");
    self notify("remove_rig");
    self notify("hostage_pickup");
    self notify("manual_drop_cleanup");
    player val::function_c9d0b43701bdba00("carry");
    if (isdefined(player.var_7ebbb0dc14346eaa)) {
        player takeweapon(player.var_7ebbb0dc14346eaa);
        player.var_7ebbb0dc14346eaa = undefined;
    }
    if (isdefined(player.switchweapon)) {
        player.switchweapon = undefined;
    }
    player resetcarryobject();
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec27
// Size: 0xa2
function vehicle_move_forward_until(name) {
    vehicle = self;
    vehicle notify("vehicle_move_forward_until");
    vehicle endon("vehicle_move_forward_until");
    if (!isdefined(vehicle.var_77374a4ca1381d75)) {
        vehicle.var_77374a4ca1381d75 = [];
    }
    endnode = getvehiclenode(name, "script_noteworthy");
    vehicle vehicle_setspeed(7.5);
    while (distance2d(vehicle.origin, endnode.origin) > 64) {
        waitframe();
    }
    vehicle vehicle_setspeed(0);
    vehicle.var_77374a4ca1381d75[name] = 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecd0
// Size: 0x40
function function_13db2131b3f0851f(player, var_20034b7333f48b8c, var_c3018adeacdd826) {
    namespace_6d8fa3f81f071973::function_13db2131b3f0851f(player, var_20034b7333f48b8c, var_c3018adeacdd826);
    namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    namespace_19b4203b51d56488::setvisibleteam("enemy");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed17
// Size: 0x78
function function_37487e9ef3996964(objective) {
    var_dec7f03ee8e5150 = objective.objectivekey;
    var_3d54a062cd1668a2 = objective.objectiveid;
    zone = level.zones[var_3d54a062cd1668a2];
    if (!isdefined(zone)) {
        return;
    }
    zone.objectives = var_dec7f03ee8e5150;
    zone.objectivetype = objective.objectivetype;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed96
// Size: 0x4b
function function_ceb1bb733cf25d55(player) {
    namespace_8276d48525f0f398::zone_onusebegin(player);
    level notify("wm_zone_begin_capture", self);
    function_458432ef4351024c(player);
    if (isdefined(level.flagbase)) {
        level.flagbase.nextstate = "charging_1";
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xede8
// Size: 0x2f
function function_9e4725f0fafd0f29(team, player, success) {
    namespace_8276d48525f0f398::zone_onuseend(team, player, success);
    function_bc781bec44dec115(player, success);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee1e
// Size: 0x1c4
function function_7d30ae61c44bd1a0(player) {
    zone = self;
    function_434d2efc22402e59(zone.objectivekey);
    zone namespace_8276d48525f0f398::deactivatezone();
    zone thread namespace_8276d48525f0f398::updatechevrons("off");
    zone namespace_19b4203b51d56488::disableobject();
    level notify("wm_zone_captured", zone);
    if (isdefined(level.zone.var_ee13e110c0910a51) && isdefined(level.var_eab5ff58683de92a)) {
        complete = 0;
        foreach (capture_zone in level.zone.var_ee13e110c0910a51) {
            if (istrue(capture_zone.complete)) {
                complete++;
            }
        }
        if (complete < level.zone.var_ee13e110c0910a51.size) {
            [[ level.var_eab5ff58683de92a ]](player);
        }
    }
    if (level.zone.objectives.size > function_b8bd193977a27782()) {
        if (level.mapname == "mp_jup_skydiving") {
            if (level.zone.objectives.size > function_b8bd193977a27782() + 1) {
                thread namespace_68747ec28caa9f9e::printandsoundoneveryone(game["attackers"], game["defenders"], undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost");
            }
        } else {
            namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_f1b94bd47af6d947");
            thread namespace_68747ec28caa9f9e::printandsoundoneveryone(game["attackers"], game["defenders"], undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost");
        }
    } else {
        return;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefe9
// Size: 0x83
function function_b8bd193977a27782() {
    score = 0;
    foreach (var_8cad8d8db24b50c9 in level.zone.objectives) {
        if (istrue(level.objectives[var_8cad8d8db24b50c9].complete)) {
            score++;
        }
    }
    return score;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf074
// Size: 0x1c
function function_1b196fb976284ed1(player) {
    namespace_dad3c7903f3cd2f7::function_c4537fbaab36b51e(player);
    function_458432ef4351024c(player);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf097
// Size: 0x2f
function function_e47da7dc98a3d8cc(team, player, result) {
    namespace_dad3c7903f3cd2f7::function_647ca2a49f347576(team, player, result);
    function_bc781bec44dec115(player, result);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf0cd
// Size: 0x34
function function_ef39f46e9b9dcb50(player) {
    level.objectives[self.objectivekey].complete = 1;
    namespace_98b55913d2326ac8::removeobjective(self);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf108
// Size: 0x2c
function onbeginuse(player) {
    level notify("began_defusing_bomb", player);
    namespace_fa795886dfc5f58a::bombzone_onbeginuse(player);
    player namespace_5a22b6f3a56f7e9b::function_160f522b63c32d76(2, "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf13b
// Size: 0x46
function onuseplantobject(player) {
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::allowuse("none");
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_ec8a2dc2f4e07935");
    function_434d2efc22402e59(self.objectivekey);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf188
// Size: 0x24
function function_434d2efc22402e59(objectivekey) {
    level.objectives[objectivekey].complete = 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1b3
// Size: 0xee
function function_a2ef0341d328f8e1(objectivekey) {
    dlog_recordevent("dlog_event_wm_server_sub_objective_start", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"map_name", 3:level.script, 4:"objective_type", 5:"" + level.zone.objectivetype, 6:"objective_id", 7:level.zone.name, 8:"sub_objective_time", 9:gettime() / 1000, 10:"sub_objective_key", 11:objectivekey, 12:"round", 13:"" + game["roundsPlayed"] + 1]);
    if (!isdefined(level.var_a2e61b8ea443febf)) {
        level.var_a2e61b8ea443febf = [];
    }
    level.var_a2e61b8ea443febf[objectivekey] = 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2a8
// Size: 0x111
function function_8bce9c7e1a380040(objectivekey, var_adf056ee1b14854e) {
    status = "Completed";
    if (isdefined(var_adf056ee1b14854e)) {
        status = var_adf056ee1b14854e;
    }
    if (istrue(level.var_a2e61b8ea443febf[objectivekey])) {
        dlog_recordevent("dlog_event_wm_server_sub_objective_end", [0:"match_guid", 1:function_94c7ae7049488358(), 2:"map_name", 3:level.script, 4:"objective_type", 5:"" + level.zone.objectivetype, 6:"objective_id", 7:level.zone.name, 8:"sub_objective_time", 9:gettime() / 1000, 10:"sub_objective_key", 11:objectivekey, 12:"round", 13:"" + game["roundsPlayed"] + 1, 14:"status", 15:status]);
        level.var_a2e61b8ea443febf[objectivekey] = undefined;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3c0
// Size: 0x9f
function onenduse(team, player, result) {
    player thread namespace_fa795886dfc5f58a::allowedwhileplanting(1);
    player.bombplantweapon = undefined;
    player.isplanting = 0;
    foreach (player in level.players) {
        if (isbot(player)) {
            player notify("finished_use");
        }
    }
    if (result) {
        namespace_dbbbcd68be00451d::function_ace0b0228cd34c4b();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf466
// Size: 0x72
function function_21ee5fc831ef88cc(zone) {
    foreach (var_8cad8d8db24b50c9 in zone.objectives) {
        level.objectives[var_8cad8d8db24b50c9] namespace_19b4203b51d56488::setvisibleteam("any");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf4df
// Size: 0x3
function function_f28aa00649396c67() {
    
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4e9
// Size: 0x99
function function_1e87a912abc079e4(zone, team, dialog, condition, cooldown, var_28f2010af77c3d08, var_7d97c362740d612a) {
    struct = spawnstruct();
    struct.dialog = dialog;
    struct.cooldown = cooldown;
    struct.condition = condition;
    struct.var_28f2010af77c3d08 = var_28f2010af77c3d08;
    struct.var_7d97c362740d612a = var_7d97c362740d612a;
    function_7de515850cb39482(zone, team, struct);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf589
// Size: 0xc3
function function_7de515850cb39482(zone, team, struct) {
    if (!isdefined(struct.var_28f2010af77c3d08)) {
        struct.var_28f2010af77c3d08 = 0;
    }
    objectivetype = zone.objectivetype;
    if (!isdefined(level.var_6c0eaa5a95164771)) {
        level.var_6c0eaa5a95164771 = [];
    }
    if (!isdefined(level.var_6c0eaa5a95164771[objectivetype])) {
        level.var_6c0eaa5a95164771[objectivetype] = [];
    }
    if (!isdefined(level.var_6c0eaa5a95164771[objectivetype][team])) {
        level.var_6c0eaa5a95164771[objectivetype][team] = [];
    }
    level.var_6c0eaa5a95164771[objectivetype][team] = array_add(level.var_6c0eaa5a95164771[objectivetype][team], struct);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf653
// Size: 0xf9
function function_266f0d24f28fc974(zone, objectivetype) {
    foreach (var_2afe36a43d508ce1 in level.var_6c0eaa5a95164771) {
        foreach (team, var_14533a3d442c56ff in var_2afe36a43d508ce1) {
            foreach (callback in var_14533a3d442c56ff) {
                level thread function_55922f60531de59(zone, callback, team);
            }
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf753
// Size: 0x193
function function_55922f60531de59(zone, callback, team) {
    level endon("game_ended");
    level endon("start_game_ended");
    var_2a833783dc74eb74 = callback.dialog;
    cooldown = callback.cooldown;
    condition = callback.condition;
    var_28f2010af77c3d08 = callback.var_28f2010af77c3d08;
    var_7d97c362740d612a = callback.var_7d97c362740d612a;
    var_b12de2603a1fa4d9 = callback.var_b12de2603a1fa4d9;
    group = callback.group;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (isdefined(var_7d97c362740d612a) && var_7d97c362740d612a > 0) {
        wait(var_7d97c362740d612a);
    }
    while (1) {
        if (isdefined(condition)) {
            if (isstring(condition)) {
                object = level waittill(condition);
                if (isdefined(object) && isdefined(var_b12de2603a1fa4d9) && object != var_b12de2603a1fa4d9) {
                    continue;
                }
            }
            if (isfunction(condition)) {
                result = [[ condition ]](zone);
                if (!result) {
                    wait(1);
                    continue;
                }
            }
        }
        while (istrue(level.var_a4e3f457e2914d4a)) {
            waitframe();
        }
        if (isdefined(var_28f2010af77c3d08) && var_28f2010af77c3d08 > 0) {
            wait(var_28f2010af77c3d08);
        }
        if (!is_equal(level.zone, zone)) {
            return;
        }
        leaderdialog(var_2a833783dc74eb74, game[team], group);
        if (isdefined(cooldown) && cooldown > 0) {
            wait(cooldown);
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf8ed
// Size: 0x3a
function function_620b653076493779(zone) {
    if (is_equal(zone.objectivetype, 6)) {
        return istrue(level.var_e718773786ad42e8[0].contested);
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf92f
// Size: 0x51
function function_4dea6838299eb754(zone) {
    if (!isdefined(level.var_e718773786ad42e8[0])) {
        level waittill("wheelson_spawn");
    }
    if (is_equal(zone.objectivetype, 11)) {
        return istrue(level.var_e718773786ad42e8[0].contested);
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf988
// Size: 0x51
function function_91314f19e66f7674(zone) {
    if (!isdefined(level.var_e718773786ad42e8[0])) {
        level waittill("wheelson_spawn");
    }
    if (is_equal(zone.objectivetype, 11)) {
        return istrue(level.var_e718773786ad42e8[0].var_5b67ad6d3409a341);
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e1
// Size: 0x92
function function_cea536bf68cd4d66(zone) {
    if (!isdefined(level.var_e718773786ad42e8[0])) {
        level waittill("wheelson_spawn");
    }
    if (isdefined(level.var_e718773786ad42e8[0].var_95f2a51e7b487eb2)) {
        if (is_equal(zone.objectivetype, 11) && is_equal(level.var_e718773786ad42e8[0].var_95f2a51e7b487eb2.size, 0) && !istrue(level.var_e718773786ad42e8[0].var_65ab8f532ca7195)) {
            return 1;
        }
        return 0;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa7a
// Size: 0x92
function function_942d0ced45796880(zone) {
    if (!isdefined(level.var_e718773786ad42e8[0])) {
        level waittill("wheelson_spawn");
    }
    if (isdefined(level.var_e718773786ad42e8[0].var_95f2a51e7b487eb2)) {
        if (is_equal(zone.objectivetype, 11) && !is_equal(level.var_e718773786ad42e8[0].var_95f2a51e7b487eb2.size, 0) && !istrue(level.var_e718773786ad42e8[0].var_65ab8f532ca7195)) {
            return 1;
        }
        return 0;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb13
// Size: 0x99
function function_b57b0ea75269b610(zone) {
    if (is_equal(zone.var_edf6ad250b4f68b5, "hack")) {
        foreach (var_ed31f55739afcaf2 in zone.var_54a90fd3dd9a59b3) {
            if (istrue(var_ed31f55739afcaf2.ishacking) || istrue(var_ed31f55739afcaf2.var_9832d5270deb1889)) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbb4
// Size: 0x29
function function_88cb5e18754f7caf(zone) {
    if (is_equal(zone.var_edf6ad250b4f68b5, "capture_flag")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbe5
// Size: 0x96
function function_fb82e12375af065f() {
    var_9bd85c448cb2a006 = level.zone.objectives.size;
    foreach (var_8cad8d8db24b50c9 in level.zone.objectives) {
        if (istrue(level.objectives[var_8cad8d8db24b50c9].complete)) {
            var_9bd85c448cb2a006--;
        }
    }
    return var_9bd85c448cb2a006;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc83
// Size: 0x5f6
function function_c00d3986d67e0f5e(zone) {
    objective = zone.objective;
    if (!isarray(objective.objectivekey)) {
        objective.objectivekey = [0:objective.objectivekey];
    }
    objectiveid = objective.objectiveid;
    var_dec7f03ee8e5150 = objective.objectivekey;
    targetname = objective.targetname[0];
    function_37487e9ef3996964(objective);
    node = getvehiclenode(targetname, "targetname");
    objectivekey = var_dec7f03ee8e5150[0];
    var_cca418b856d14592 = array_slice(objective.targetname, 1);
    var_fd721cc1269c6971 = array_slice(var_dec7f03ee8e5150, 1);
    /#
        assertex(var_cca418b856d14592.size > 0, "Missing targetname for the capture zones");
    #/
    /#
        assertex(var_fd721cc1269c6971.size > 0, "Missing objectiveKey for the capture zones");
    #/
    if (!isdefined(objectivekey)) {
        return;
    }
    spawndata = spawnstruct();
    spawndata.origin = node.origin + (0, 0, -2000);
    spawndata.angles = node.angles;
    spawndata.spawntype = "veh_pac_sentry_amphibious_mp_skydiving";
    spawndata.ownerteam = game["attackers"];
    spawndata.team = game["attackers"];
    spawndata.modelname = "veh9_mil_lnd_whotel_v2_skydiving_com";
    spawndata.vehicletype = "veh_pac_sentry_amphibious_mp_skydiving";
    spawndata.targetname = "remote_tank";
    spawndata.cancapture = 0;
    spawndata.cancaptureimmediately = 0;
    spawndata.activateimmediately = 1;
    spawndata.objectivekey = objectivekey;
    spawndata.node = node;
    spawndata.var_558e3ab4e0b5ddbc = node.origin;
    objective.spawndata = spawndata;
    marker = spawndata function_bbcd7058816ef794(objectivekey, "MP_INGAME_ONLY/OBJ_HALT_CAPS", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_dom" + objectivekey, game["attackers"]);
    level.objectives[objectivekey] = marker;
    zone.var_4473aa927a80a0ee = marker;
    level.objectives[objectivekey].objectivetype = objective.objectivetype;
    level.var_dabf5c79ed95aead = getdvarfloat(@"hash_6cc435c9e8e9abd6", 30);
    level.var_b90b3382b655303f = function_ef4d323f56385843("escortCaptureTime", 30);
    level.zonecapturetime = level.var_b90b3382b655303f;
    level.var_56adfa324022c19b = "state_1";
    var_28bc3fa69bbcd119 = spawnstruct();
    var_8b61e1ed30d128c2 = spawnstruct();
    var_8b61e1ed30d128c2.objectivetype = objective.objectivetype;
    var_8b61e1ed30d128c2.objectivekey = var_fd721cc1269c6971;
    var_8b61e1ed30d128c2.objectiveid = "zone_2";
    var_8b61e1ed30d128c2.targetname = var_cca418b856d14592;
    var_8b61e1ed30d128c2.params = [];
    var_28bc3fa69bbcd119.objective = var_8b61e1ed30d128c2;
    var_28bc3fa69bbcd119.objectives = var_fd721cc1269c6971;
    triggers = [];
    foreach (name in var_8b61e1ed30d128c2.targetname) {
        triggers[triggers.size] = getent(name, "targetname");
    }
    var_28bc3fa69bbcd119.var_ee13e110c0910a51 = [];
    foreach (i, trigger in triggers) {
        var_a06d775e754bb451 = var_8b61e1ed30d128c2.objectivekey[i];
        trigger.objectivekey = var_a06d775e754bb451;
        trigger.script_label = var_a06d775e754bb451;
        var_15e339103fa91bff = namespace_8276d48525f0f398::setupobjective(trigger, undefined, 0, 0);
        var_15e339103fa91bff.iconname = var_a06d775e754bb451;
        var_15e339103fa91bff namespace_8276d48525f0f398::activatezone(undefined, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_position(var_15e339103fa91bff.objidnum, var_15e339103fa91bff.visuals[0].origin + (0, 0, 160));
        var_15e339103fa91bff.onuse = &function_7d30ae61c44bd1a0;
        var_15e339103fa91bff.onbeginuse = &function_ceb1bb733cf25d55;
        var_15e339103fa91bff.onenduse = &function_9e4725f0fafd0f29;
        var_15e339103fa91bff.onuseupdate = &function_de7525871e8ec1a;
        var_15e339103fa91bff.ignorestomp = 1;
        var_15e339103fa91bff.useratemultiplier = 1;
        var_15e339103fa91bff.var_823c5a7bf6a0e64a = level.flagReinforcement;
        var_15e339103fa91bff.var_6c9cdfc1bc07df96 = 1;
        var_15e339103fa91bff.var_7848db50cd8c444f = 1;
        objective_state(var_15e339103fa91bff.objidnum, "done");
        var_28bc3fa69bbcd119.var_ee13e110c0910a51[var_28bc3fa69bbcd119.var_ee13e110c0910a51.size] = var_15e339103fa91bff;
        level.objectives[var_a06d775e754bb451] = var_15e339103fa91bff;
        level.objectives[var_a06d775e754bb451].objectivetype = var_8b61e1ed30d128c2.objectivetype;
        namespace_4b0406965e556711::gameflaginit("point_" + i + 1 + "_hacked", 0);
    }
    zone.var_3abf844425ac7c00 = var_28bc3fa69bbcd119;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10280
// Size: 0x3cf
function function_df478f29c9a89d5a(zone) {
    level.ontimelimitgraceperiod = getdvarint(@"hash_dcc6194b439ea409", 10);
    var_1604f1383b5b8325 = getent("wheelson_airdrop", "script_noteworthy");
    var_cda7b9efaf87b2a7 = zone.objective.params["airdrop_offset"];
    if (!isdefined(var_cda7b9efaf87b2a7)) {
        var_cda7b9efaf87b2a7 = (0, 0, 0);
    }
    destination = var_1604f1383b5b8325.origin + var_cda7b9efaf87b2a7;
    zone.var_edf6ad250b4f68b5 = "wheelson_escort";
    function_a2ef0341d328f8e1(zone.objective.spawndata.objectivekey);
    function_a1f09cc4dd4b4d47();
    var_1ad367f504aadb35 = function_aedd979a529e3af2(var_1604f1383b5b8325, destination);
    spawndata = level.zone.objective.spawndata;
    vehicle = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata);
    level.var_e718773786ad42e8[level.var_e718773786ad42e8.size] = vehicle;
    vehicle.team = game["attackers"];
    vehicle.teamfriendlyto = game["attackers"];
    vehicle.vehiclename = "pac_sentry";
    vehicle setvehicleteam(game["attackers"]);
    vehicle notsolid();
    vehicle hide();
    function_4a6cef3b190c8082(level.zone.objective, vehicle, vehicle.spawndata.objectivekey, vehicle.spawndata, vehicle.spawndata.node, level.objectives[vehicle.spawndata.objectivekey]);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.objectives["_d"].objidnum);
    foreach (crate in var_1ad367f504aadb35.crates) {
        crate.skipminimapicon = 1;
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(level.objectives["_d"].objidnum, crate);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(level.objectives["_d"].objidnum, 100);
    }
    if (isdefined(level.zone.var_3abf844425ac7c00)) {
        foreach (i, var_15e339103fa91bff in level.zone.var_3abf844425ac7c00.var_ee13e110c0910a51) {
            var_15e339103fa91bff namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture", var_15e339103fa91bff.objidnum, game["defenders"]);
            var_15e339103fa91bff namespace_19b4203b51d56488::setownerteam(game["defenders"]);
            var_15e339103fa91bff namespace_19b4203b51d56488::setvisibleteam("any");
            setomnvar("ui_wm_escort_checkpoint_objid_" + i, var_15e339103fa91bff.objidnum);
        }
    }
    vehicle.var_6decdc73003db8d0 = 1;
    var_4d900fc7b52f5778 = getdvarint(@"hash_79df9d9b391becf6", 1);
    if (var_4d900fc7b52f5778) {
        level namespace_555f6ee22fb8fd82::function_51311df691f23540();
    } else {
        level namespace_555f6ee22fb8fd82::function_d1a514fda655e409();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10656
// Size: 0xcb
function function_839e95bec92424a7() {
    level endon("game_ended");
    self endon("death");
    level waittill("wheelson_spawn");
    var_536b3e9dad0768fb = self.origin;
    var_8fb02da86884df3f = 0;
    while (1) {
        wait(0.25);
        if (distancesquared(self.origin, var_536b3e9dad0768fb) < 16 && istrue(self.var_90460c78c57c1e5e) && !istrue(self.var_3d669fde41c54012)) {
            var_8fb02da86884df3f++;
        } else if (distancesquared(self.origin, var_536b3e9dad0768fb) > 16) {
            var_8fb02da86884df3f = 0;
        }
        if (var_8fb02da86884df3f >= 2) {
            self.origin = self.origin + (0, 0, 10);
            var_8fb02da86884df3f = 0;
        }
        var_536b3e9dad0768fb = self.origin;
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10728
// Size: 0x148
function function_96d01b17312762c7(zone) {
    level.ontimelimitgraceperiod = 5;
    level.defendersRespawnDelay = function_ef4d323f56385843("defendersRespawnDelay", 0);
    foreach (player in level.players) {
        player.var_974cca039ded252e = undefined;
        player function_160f522b63c32d76(0);
    }
    objective = zone.objective;
    if (isdefined(objective.params["leaderDialogAttackers"])) {
        var_880ddc1f0768a83e = objective.params["leaderDialogAttackers"];
        delaythread(2, &leaderdialog, var_880ddc1f0768a83e, game["attackers"]);
    }
    if (isdefined(objective.params["leaderDialogDefenders"])) {
        var_65a2c862509ccb82 = objective.params["leaderDialogDefenders"];
        delaythread(2, &leaderdialog, var_65a2c862509ccb82, game["defenders"]);
    }
    namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_18c44b230263da2c");
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10877
// Size: 0xe6
function function_60f4fb33f7ba40cc(var_15e339103fa91bff) {
    level endon("game_ended");
    level endon("wm_zone_captured");
    while (1) {
        wait(5);
        if (istrue(var_15e339103fa91bff.stalemate)) {
            continue;
        }
        foreach (struct in var_15e339103fa91bff.touchlist[game["attackers"]]) {
            if (namespace_19b4203b51d56488::function_21f4c6f630b17fc4(struct.player)) {
                struct.player.owner thread namespace_48a08c5037514e04::doScoreEvent(#"hash_395340c089630375");
            } else {
                struct.player namespace_48a08c5037514e04::doScoreEvent(#"hash_395340c089630375");
            }
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10964
// Size: 0x440
function function_7318c4542deb6762(var_3abf844425ac7c00) {
    level endon("game_ended");
    self endon("entitydeleted");
    var_abbff9933224f0a = 0;
    var_da319380d6306e21 = 1;
    var_54a2094b1eb32362 = 1600;
    var_82c9ad7216c2d50c = 1600;
    foreach (var_15e339103fa91bff in var_3abf844425ac7c00.var_ee13e110c0910a51) {
        level.zone.var_ef87618c979077d1 = undefined;
        self.var_bd58ba3741947988 = var_15e339103fa91bff;
        /#
            var_15e339103fa91bff.trigger thread function_86bddcb4c5e824e9();
        #/
        var_93f25dd7906beb3c = getstruct(var_15e339103fa91bff.trigger.target, "targetname");
        var_abbff9933224f0a++;
        if (var_abbff9933224f0a == 1) {
            function_cc40376968f08b19(var_93f25dd7906beb3c, var_54a2094b1eb32362);
            namespace_4b0406965e556711::gameflagset("wheelson_reach_hack_point");
        } else if (var_abbff9933224f0a == 2) {
            function_cc40376968f08b19(var_93f25dd7906beb3c, var_54a2094b1eb32362);
            namespace_4b0406965e556711::gameflagset("wheelson_reach_hack_point_final");
            level.defendersRespawnDelay = getdvarint(@"hash_589f1cea04614fd5", 1);
        } else {
            function_cc40376968f08b19(var_93f25dd7906beb3c, var_54a2094b1eb32362);
        }
        level.zone.var_edf6ad250b4f68b5 = "wheelson_capture";
        level.zone.var_ef87618c979077d1 = var_15e339103fa91bff;
        function_a2ef0341d328f8e1(var_15e339103fa91bff.objectivekey);
        level.zonecapturetime = level.var_b90b3382b655303f;
        var_15e339103fa91bff namespace_19b4203b51d56488::setusetime(level.zonecapturetime);
        var_15e339103fa91bff namespace_19b4203b51d56488::enableobject();
        var_15e339103fa91bff namespace_19b4203b51d56488::allowuse("enemy");
        var_15e339103fa91bff thread namespace_8276d48525f0f398::updatechevrons(game["defenders"]);
        level thread function_60f4fb33f7ba40cc(var_15e339103fa91bff);
        objective_state(var_15e339103fa91bff.objidnum, "current");
        objective_state(level.zone.var_4473aa927a80a0ee.objidnum, "done");
        self setscriptablepartstate("wm_hack", "hacking_on_" + var_da319380d6306e21);
        var_15e339103fa91bff.var_b2dfb3f0778c829a = "MP/HACKING_EXPLOSIVE";
        var_15e339103fa91bff.var_7ced5e7c68deab40 = var_abbff9933224f0a;
        self.var_65ab8f532ca7195 = 1;
        self playsoundtoteam("jup_wm_hack_init_ally", self.team);
        self playsoundtoteam("jup_wm_hack_init_enemy", namespace_cd0b2d039510b38d::getotherteam(self.team)[0]);
        level.objectivescaler = 1;
        level waittill("wm_zone_captured");
        function_8bce9c7e1a380040(var_15e339103fa91bff.objectivekey);
        if (var_abbff9933224f0a == 1) {
            namespace_44abc05161e2e2cb::notifyteam("jup_wm_data_server_hacked_attacker", "jup_wm_data_server_hacked_defender", self.team);
        }
        level.objectivescaler = undefined;
        level.zone.var_edf6ad250b4f68b5 = "wheelson_escort";
        function_a2ef0341d328f8e1(level.zone.objective.spawndata.objectivekey);
        objective_state(level.zone.var_4473aa927a80a0ee.objidnum, "current");
        level.zone.var_4473aa927a80a0ee namespace_19b4203b51d56488::setvisibleteam("any");
        self setscriptablepartstate("wm_hack", "hacking_off");
        var_da319380d6306e21 = var_da319380d6306e21 + 1;
        self notify("point_" + var_abbff9933224f0a + "_hacked");
        level notify("point_" + var_abbff9933224f0a + "_hacked");
        self.var_65ab8f532ca7195 = 0;
        namespace_4b0406965e556711::gameflagset("point_" + var_abbff9933224f0a + "_hacked");
        if (!istrue(level.mapname == "mp_jup_skydiving")) {
            self playsoundtoteam("jup_wm_hack_complete_ally", self.team);
            self playsoundtoteam("jup_wm_hack_complete_enemy", namespace_cd0b2d039510b38d::getotherteam(self.team)[0]);
        }
        namespace_48a08c5037514e04::function_2a66e9acc30896c(game["attackers"], #"hash_a648a48b3a761036");
    }
    self.var_43af500ed85b7ace = 1;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10dab
// Size: 0x3e
function function_cc40376968f08b19(trigger, var_8336f113929858a6) {
    while (1) {
        if (distancesquared(self.origin, trigger.origin) <= var_8336f113929858a6) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10df0
// Size: 0x1f9
function function_de7525871e8ec1a(team, progress, change, var_4b22e50e504339fe) {
    namespace_8276d48525f0f398::zone_onuseupdate(team, progress, change, var_4b22e50e504339fe);
    if (!isdefined(level.var_e718773786ad42e8) || level.var_e718773786ad42e8.size < 1) {
        return;
    }
    if (progress >= 0 && level.var_56adfa324022c19b == "state_1") {
        level notify("wheelson_capture_state_1");
        level.var_56adfa324022c19b = "state_2";
    }
    if (progress >= 0.2 && level.var_56adfa324022c19b == "state_2") {
        level notify("wheelson_capture_state_2");
        level.var_56adfa324022c19b = "state_3";
    }
    if (progress >= 0.3 && !istrue(self.var_d8dcda1440f415d)) {
        level.var_e718773786ad42e8[0] notify("point_" + self.var_7ced5e7c68deab40 + "_30_percent");
        self.var_d8dcda1440f415d = 1;
    }
    if (progress >= 0.4 && level.var_56adfa324022c19b == "state_3") {
        level notify("wheelson_capture_state_3");
        level.var_56adfa324022c19b = "state_4";
    }
    if (progress >= 0.8 && !istrue(self.var_5de02459fe78d171)) {
        level.var_e718773786ad42e8[0] notify("point_" + self.var_7ced5e7c68deab40 + "_80_percent");
        self.var_5de02459fe78d171 = 1;
    }
    if (progress >= 0.6 && level.var_56adfa324022c19b == "state_4") {
        level notify("wheelson_capture_state_4");
        level.var_56adfa324022c19b = "state_5";
    }
    if (progress >= 0.8 && level.var_56adfa324022c19b == "state_5") {
        level notify("wheelson_capture_state_5");
        level.var_56adfa324022c19b = "state_6";
    }
    if (progress >= 0.8 && level.var_56adfa324022c19b == "state_6") {
        level notify("wheelson_capture_state_6");
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ff0
// Size: 0x49e
function function_b63c307e88f55d86(vehicle, objidnum) {
    level endon("game_ended");
    /#
        assert(vehicle.pathnodes.size > 0);
    #/
    endnode = vehicle.pathnodes[vehicle.pathnodes.size - 1];
    totaldistance = endnode.var_1d7ebd1bcc23a4e1;
    vehicle.var_56df20c41f5b3159 = 1 / totaldistance;
    /#
        level thread function_d36257ceb2380e24(vehicle, vehicle.pathnodes);
    #/
    if (isdefined(vehicle.spawndata.spawnmethod) && vehicle.spawndata.spawnmethod == "airdrop_at_position_unsafe") {
        vehicle waittill("landed");
    }
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(objidnum, game["defenders"]);
    var_b8d9c602e284684e = 900;
    while (vehicle.progress != 1) {
        waitframe();
        if (!vehicle.useP2P) {
            if (!isdefined(vehicle.var_6bb0ab1fe092bd5d)) {
                vehicle.var_6bb0ab1fe092bd5d = 1;
            }
            var_b2f8f3051e3018b1 = distance2dsquared(vehicle.pathnodes[vehicle.var_6bb0ab1fe092bd5d].origin, vehicle.origin);
            if (vehicle.var_6bb0ab1fe092bd5d > 0) {
                var_1f7233a1b7010fe4 = distance2dsquared(vehicle.pathnodes[vehicle.var_6bb0ab1fe092bd5d - 1].origin, vehicle.origin);
            } else {
                var_1f7233a1b7010fe4 = 0;
            }
            if (vehicle.var_6bb0ab1fe092bd5d + 1 < vehicle.pathnodes.size && var_b2f8f3051e3018b1 < var_b8d9c602e284684e && !istrue(vehicle.var_bc123f28659c31e8)) {
                vehicle.var_6bb0ab1fe092bd5d++;
            } else if (vehicle.var_6bb0ab1fe092bd5d > 0 && var_1f7233a1b7010fe4 < var_b8d9c602e284684e && istrue(vehicle.var_bc123f28659c31e8)) {
                vehicle.var_6bb0ab1fe092bd5d--;
            }
            /#
                print3d(vehicle.origin + (0, 0, 200), var_b2f8f3051e3018b1, (1, 0, 0));
            #/
        }
        var_92bc69459236be07 = vehicle.var_6bb0ab1fe092bd5d - 1;
        var_d6645075dadc550a = vehicle.pathnodes[var_92bc69459236be07];
        if (!isdefined(var_d6645075dadc550a)) {
            continue;
        }
        var_1bf11bea5ff1631e = distance2d(vehicle.origin, var_d6645075dadc550a.origin);
        progress = (var_d6645075dadc550a.var_1d7ebd1bcc23a4e1 + var_1bf11bea5ff1631e) / totaldistance;
        if (progress > 1) {
            progress = 1;
        } else if (vehicle.var_6bb0ab1fe092bd5d >= vehicle.pathnodes.size - 1) {
            var_b0162d29bef25c14 = distancesquared(vehicle.pathnodes[vehicle.pathnodes.size - 1].origin, vehicle.origin) < var_b8d9c602e284684e;
            if (var_b0162d29bef25c14) {
                progress = 1;
            }
        }
        if (istrue(vehicle.var_43af500ed85b7ace)) {
            progress = 1;
        } else if (1 == progress) {
            progress = 0.99;
        }
        vehicle.progress = progress;
        if (isdefined(vehicle.checkpoints) && isdefined(vehicle.checkpoints[vehicle.var_3f3a023549c63a8c])) {
            if (vehicle.progress >= vehicle.checkpoints[vehicle.var_3f3a023549c63a8c].progress) {
                vehicle.var_3f3a023549c63a8c++;
                level notify("escort_vehicle_checkpoint_" + vehicle.var_3f3a023549c63a8c);
            }
        }
        namespace_5a22b6f3a56f7e9b::objective_set_progress(objidnum, progress);
        /#
            print3d(vehicle.origin + (0, 0, 72), "dx_mp_mwm1_mode_spet_olde" + int(var_1bf11bea5ff1631e) + "dx_mp_mwm1_mode_spet_olbf" + var_d6645075dadc550a.var_1d7ebd1bcc23a4e1 + "dx_mp_mwm1_mode_t141_ontk" + distance2d(vehicle.origin, vehicle.pathnodes[var_92bc69459236be07 + 1].origin));
        #/
    }
    function_d507ea0668f3666c(vehicle);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11495
// Size: 0x1f9
function function_61f03fb6556f5c7f(zone) {
    level endon("game_ended");
    level endon(zone.name + "_objective_end");
    namespace_4b0406965e556711::gameflagwait("zone_2" + "_objective_start");
    var_430192532a7cb360 = getentarray("wheelson_route", "targetname");
    foreach (var_b6d7979ed726df53 in var_430192532a7cb360) {
        var_b6d7979ed726df53 hide();
    }
    vehicle = level waittill("wheelson_spawn");
    foreach (var_b6d7979ed726df53 in var_430192532a7cb360) {
        var_b6d7979ed726df53 show();
        var_b6d7979ed726df53 notsolid();
    }
    while (1) {
        foreach (var_b6d7979ed726df53 in var_430192532a7cb360) {
            if (isdefined(vehicle.progress) && isdefined(var_b6d7979ed726df53.script_noteworthy) && vehicle.progress > 0 && float(var_b6d7979ed726df53.script_noteworthy) < vehicle.progress) {
                var_b6d7979ed726df53 hide();
            } else if (isdefined(vehicle.progress) && isdefined(var_b6d7979ed726df53.script_noteworthy) && vehicle.progress > 0 && float(var_b6d7979ed726df53.script_noteworthy) > vehicle.progress) {
                var_b6d7979ed726df53 show();
            }
        }
        waitframe();
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11695
// Size: 0x132
function function_a1f09cc4dd4b4d47() {
    levelData = namespace_6c578d6ef48f10ef::getleveldata("wheelson_drop");
    levelData.capturestring = "MP/BR_CRATE_LOADOUT";
    levelData.basemodel = "military_carepackage_03_wheelson_fxanim";
    levelData.supportsownercapture = 0;
    levelData.headicon = undefined;
    levelData.minimapicon = undefined;
    levelData.usepriority = -1;
    levelData.usefov = 360;
    levelData.timeout = 1000;
    levelData.friendlyuseonly = 1;
    levelData.var_c75f6dfe8df28b58 = 1;
    levelData.ownerusetime = 0.5;
    levelData.otherusetime = 0.5;
    levelData.activatecallback = &function_e7ed2e5d8bd37b25;
    levelData.capturecallback = &function_97bf2e4752f68b38;
    levelData.destroyoncapture = 1;
    levelData.onecaptureperplayer = 1;
    levelData.isteamonlycrate = 1;
    levelData.supportsreroll = 0;
    levelData.capturestring = "MP/GENERIC_LOOT_CRATE_CAPTURE";
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117ce
// Size: 0x38
function function_e7ed2e5d8bd37b25(isfirstactivation) {
    if (istrue(isfirstactivation)) {
        if (issharedfuncdefined("airdrop", "registerCrateForCleanup")) {
            [[ getsharedfunc("airdrop", "registerCrateForCleanup") ]](self);
        }
    }
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1180d
// Size: 0x16d
function function_97bf2e4752f68b38(player) {
    spawndata = level.zone.objective.spawndata;
    vehicle = level.var_e718773786ad42e8[0];
    vehicle.var_29a4616e42091783 = 1;
    var_d151600957e715a = level.zone.objective.params["vehicleRef.vehObjZOffset"];
    objective = level.zone.objective;
    if (isdefined(level.zone.var_3abf844425ac7c00)) {
        vehicle thread function_7318c4542deb6762(level.zone.var_3abf844425ac7c00);
    }
    vehicle.origin = spawndata.var_558e3ab4e0b5ddbc;
    vehicle solid();
    vehicle show();
    vehicle.var_6decdc73003db8d0 = 1;
    wait(1);
    vehicle.var_6decdc73003db8d0 = 0;
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(level.objectives["_d"].objidnum, vehicle);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(level.objectives["_d"].objidnum, function_53c4c53197386572(var_d151600957e715a, 180));
    level notify("wheelson_spawn", vehicle);
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11981
// Size: 0x8f
function function_aedd979a529e3af2(var_1604f1383b5b8325, destination) {
    level endon("game_ended");
    level endon(level.zone.name + "_objective_end");
    level.cratedropdata.heliheight = destination[2];
    var_1ad367f504aadb35 = namespace_6c578d6ef48f10ef::dropcratefromscriptedheli(undefined, game["attackers"], "wheelson_drop", var_1604f1383b5b8325.origin, var_1604f1383b5b8325.angles, destination, namespace_6c578d6ef48f10ef::getleveldata("wheelson_drop"));
    return var_1ad367f504aadb35;
}

// Namespace namespace_306af48cb0769c3e/namespace_87e7f6fcf1544253
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a18
// Size: 0x9f
function function_64bb0e20a20f59b7(players, var_224e3e985c76a43f, var_90b5cdd621c70d23) {
    nearbyplayers = sortbydistancecullbyradius(players, var_224e3e985c76a43f, var_90b5cdd621c70d23);
    if (isdefined(level.var_7b3187b12cba9559)) {
        foreach (player in players) {
            if (player istouching(level.var_7b3187b12cba9559)) {
                nearbyplayers = function_da1cac199ebc3dbe(nearbyplayers, player);
            }
        }
    }
    return nearbyplayers;
}

