#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5af9038262d22c96;
#using script_55e418c5cc946593;
#using scripts\mp\passives.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\perks\weaponpassives.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\dialog.gsc;
#using script_ec0f9ad939b29e0;

#namespace perks;

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1a
// Size: 0x277b
function init() {
    level thread rechargeequipmentthink_init();
    level thread supersprintkillrefresh_init();
    level thread sixthsense_think();
    level thread function_8d63cc03c22e972();
    level thread function_a01c9e1d5b2abc3a();
    level.scriptperks = [];
    level.codeperks = [];
    level.perksetfuncs = [];
    level.perkunsetfuncs = [];
    level.extraperkmap = [];
    level.menurigperks = [];
    level.var_3c58bd77bb86658c = [];
    game["dialog"]["specialty_restock"] = "iw9_perk_prks_uktl_pers";
    game["dialog"]["specialty_hardline"] = "iw9_perk_prks_uktl_pehl";
    game["dialog"]["specialty_tactical_recon"] = "iw9_perk_prks_uktl_pesp";
    game["dialog"]["specialty_focus"] = "iw9_perk_prks_uktl_pefc";
    game["dialog"]["specialty_covert_ops"] = "iw9_perk_prks_uktl_pecb";
    game["dialog"]["specialty_warhead"] = "iw9_perk_prks_uktl_pefh";
    game["dialog"]["specialty_quick_fix"] = "iw9_perk_prks_uktl_peqf";
    game["dialog"]["specialty_surveillance"] = "iw9_perk_prks_uktl_peha";
    game["dialog"]["specialty_guerrilla"] = "iw9_perk_prks_uktl_pegh";
    game["dialog"]["specialty_overwatch"] = "iw9_perk_prks_uktl_pebe";
    game["dialog"]["specialty_survivor"] = "iw9_perk_prks_uktl_pesv";
    game["dialog"]["specialty_overcharge_field_upgrade"] = "iw9_perk_prks_uktl_peoc";
    level.var_606eb45e074ff204 = scripts\mp\utility\perk::function_97cbc67b162a70f4();
    level.var_f3a9bf9e4404820f = getdvarint(@"hash_832ae76c26eb6b56", 0);
    if (level.var_606eb45e074ff204 && namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        namespace_708f627020de59d3::function_9fd92851e68a5662();
        if (namespace_708f627020de59d3::function_56f3d322e17b9974()) {
            namespace_708f627020de59d3::function_ca7e33035f7f102f();
        }
    } else if (level.var_606eb45e074ff204) {
        bonuscost = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 29));
        ultcost = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 30));
        if (!isdefined(bonuscost) || bonuscost <= 0) {
            bonuscost = 1050;
        }
        if (!isdefined(bonuscost) || ultcost <= 0) {
            ultcost = 3150;
        }
        level.var_f36dcecdebe6160b = getdvarint(@"hash_6870be7663e6c99f", 100);
        level.var_5a3318627fb4465d = getdvarint(@"hash_207e7eeef2a5c8c", bonuscost);
        level.var_5cdaa841f503d45a = getdvarint(@"hash_5617874cb4b808d5", ultcost);
        level.var_f3d4343da6d28c4c = getdvarint(@"hash_f0b8c004a14db0a2", 0);
        level.var_f3d4353da6d28e7f = getdvarint(@"hash_f0b8c104a14db2d5", 0);
        level.var_9c166c328fe115b7 = getdvarint(@"hash_9c0e13893954da30");
        level.var_24b471ce5e06ff1e = getdvarint(@"hash_8f6f2f16eb3e92ff");
        level.var_d0ae54c9481320fa = getdvarint(@"hash_443a10022bcedd62", 0);
        level.var_3f893c812b909915 = getdvarint(@"hash_1a0f0b7b29a6543b", 1);
        level.var_4ad21852735184e9 = getdvarint(@"hash_92b3c30d024aa224", 0);
        level.var_63d440b3041ca2a7 = getdvarint(@"hash_75676a5cbb837aee", 0);
        thread function_ccdbd1f6da822d2c();
    }
    level.var_aebbd8276f721d86 = getdvarfloat(@"hash_bb66c3a69c1f7a8f", 1.5);
    level.var_100503f6600f157e = getdvarint(@"hash_f8af3c2d327b9c23", 50);
    level.var_a7b25d0a3d5b8f1e = getdvarfloat(@"hash_5ec956fb006e323b", 1000);
    level.var_fbf305c1816a8c8a = getdvarfloat(@"hash_8a028a50e729f737", 1500);
    level.var_c0fe6cb6face684e = getdvarfloat(@"hash_a94acd8cd69c8ec1", 1.5);
    level.var_1408c77a4f773854 = getdvarfloat(@"hash_2a137455a7c25493", 1.3);
    if (istrue(level.var_d0ae54c9481320fa)) {
        level thread function_667ec8f124fe1ab3();
    }
    function_301144e1b628a10c();
    registerscriptperk("specialty_infantry_vest", undefined, undefined, ["specialty_supersprint_enhanced"]);
    registerscriptperk("specialty_grenadier_vest", undefined, undefined, ["specialty_recharge_equipment"]);
    registerscriptperk("specialty_overkill_vest", undefined, undefined, ["specialty_quickswap", "specialty_munitions_2", "specialty_sprintreload"]);
    registerscriptperk("specialty_tac_vest", undefined, undefined, ["specialty_engineer", "specialty_markequipment", "specialty_faster_field_upgrade", "specialty_improved_field_upgrades"]);
    registerscriptperk("specialty_gunner_vest", undefined, undefined, ["specialty_munitions_2", "specialty_extraammo", "specialty_fastreload"]);
    registerscriptperk("specialty_cct_vest", undefined, undefined, ["specialty_acousticSensor", "specialty_intel_jacker", "specialty_high_gain_antenna"]);
    registerscriptperk("specialty_scout_vest", &function_46a8a30fa0be5b5c, &function_3dddddc711e8ab99, ["specialty_silentkill", "specialty_gpsjammer"]);
    registerscriptperk("specialty_marksman_vest", undefined, undefined, ["specialty_viewkickoverride"]);
    registerscriptperk("specialty_ninja_vest", undefined, undefined, ["specialty_quieter", "specialty_no_battle_chatter", "specialty_recharge_equipment", "specialty_extra_deadly", "specialty_dauntless"]);
    registerscriptperk("specialty_tac_mask", &settacmask, &unsettacmask);
    registerscriptperk("specialty_blacklight_flashlight", undefined, undefined, ["specialty_tracker"]);
    registerscriptperk("specialty_bone_conduction", &function_9ab9afce9ddf23d3, &function_f4981401b60aff4e);
    registerscriptperk("specialty_lr_detector", &function_eed479acba7fe853, &function_98c1ad957058c942);
    registerscriptperk("specialty_eod_vest", undefined, undefined, ["specialty_blastshield", "specialty_shrapnel_resist"]);
    registerscriptperk("specialty_ghost_camo", undefined, undefined, ["specialty_ghost", "specialty_heartbreaker"]);
    registerscriptperk("specialty_fast_reload", undefined, undefined, ["specialty_fastreload"]);
    registerscriptperk("specialty_dex_gloves", undefined, undefined, ["specialty_fastoffhand", "specialty_pitcher", "specialty_throwback"]);
    registerscriptperk("specialty_tac_gloves", undefined, undefined, ["specialty_jump_aim_scale"]);
    registerscriptperk("specialty_silicon_gloves", undefined, undefined, ["specialty_sprintreload"]);
    registerscriptperk("specialty_marksman_gloves", undefined, undefined, ["specialty_viewkickoverride"]);
    registerscriptperk("specialty_canvas_sneakers", undefined, undefined, ["specialty_quieter", "specialty_no_battle_chatter"]);
    registerscriptperk("specialty_ultra_light_boots", undefined, undefined, ["specialty_lightweight", "specialty_maritime_boots"]);
    registerscriptperk("specialty_tac_pads", undefined, undefined, ["specialty_fastcrouchmovement", "specialty_longslide", "specialty_fasttransition", "specialty_sliding_ads"]);
    registerscriptperk("specialty_running_sneakers", undefined, undefined, ["specialty_supersprint_enhanced"]);
    registerscriptperk("specialty_treadless_boots", undefined, undefined, ["specialty_mantle_scale", "specialty_fastladderclimb", "specialty_fall_damage_scale"]);
    registerscriptperk("specialty_stalker_boots", undefined, undefined, ["specialty_strafe_speed"]);
    registerscriptperk("specialty_dauntless_boots", undefined, undefined, ["specialty_dauntless"]);
    registerscriptperk("specialty_super_strength", undefined, undefined);
    registerscriptperk("specialty_durability", &setdurability, &unsetdurability);
    registerscriptperk("specialty_super_speed_script", &function_a85e18c43231438d, &function_b9186877a86e12f0);
    registerscriptperk("specialty_acoustic_sensor", undefined, undefined, ["specialty_acousticSensor"]);
    registerscriptperk("specialty_high_gain_antenna", &function_f20745ab641c4bb7, &function_6df29935c2b4318c, ["specialty_expanded_minimap"]);
    registerscriptperk("specialty_signal_jammer", &function_83091d5e2028334f, &function_1e8369c15351446a, ["specialty_delaymine"]);
    registerscriptperk("specialty_intel_jacker", undefined, undefined, ["specialty_scavenger"]);
    registerscriptperk("specialty_radio_intercept", undefined, undefined);
    registerscriptperk("specialty_shielded_electronics", undefined, undefined, ["specialty_shock_immunity", "specialty_emp_immunity"]);
    registerscriptperk("specialty_thermal_insulation", undefined, undefined, ["specialty_coldblooded"]);
    registerscriptperk("specialty_extra_plate", &function_76e4f570efdfa175, &function_9a193d97b9a9b860);
    registerscriptperk("specialty_armor_regen", &function_7051260539f7f5cf, &function_d98540c03eb44f92);
    registerscriptperk("specialty_monomer_plate", undefined, undefined, ["specialty_blastshield", "specialty_shrapnel_resist"]);
    registerscriptperk("specialty_thermal_camo", undefined, undefined, ["specialty_ghost"]);
    registerscriptperk("specialty_elasomer_pads", &function_cc2cf1db71343d8f, &function_5ab8f9c4d813c44a);
    registerscriptperk("specialty_flame_res_insulation", undefined, undefined, ["specialty_coldblooded"]);
    registerscriptperk("specialty_shielded_carrier", undefined, undefined, ["specialty_heartbreaker"]);
    registerscriptperk("specialty_suspension_pads", undefined, undefined, ["specialty_viewkickoverride"]);
    registerscriptperk("specialty_shock_immunity", undefined, undefined);
    registerscriptperk("specialty_fast_armor", undefined, undefined);
    registerscriptperk("specialty_lightweight_vest", undefined, undefined, ["specialty_lightweight", "specialty_maritime_boots"]);
    registerscriptperk("specialty_impact_res_gloves", undefined, undefined, ["specialty_fastermelee", "specialty_extendedmelee"]);
    registerscriptperk("specialty_maritime_boots", &function_e906d1c066af953a, &function_488e69b3f2811165, ["specialty_quietswim"]);
    registerscriptperk("specialty_nods", &function_53e56fe3fd9ad3e1, &function_d23fd2ceae84da28);
    registerscriptperk("specialty_taccom_system", &function_64a27781e3f26162, &unsettaccom);
    registerscriptperk("specialty_assault_gloves", undefined, undefined, ["specialty_fastsprintrecovery"]);
    registerscriptperk("specialty_regen_on_kill", undefined, undefined);
    registerscriptperk("specialty_dauntless", undefined, undefined);
    registerscriptperk("specialty_compression_carrier", undefined, undefined, ["specialty_elasomer_pads", "specialty_regen_on_kill"]);
    registerscriptperk("specialty_rhino_rig", undefined, undefined, ["specialty_extraammo", "specialty_scavenger_equipment", "specialty_scavenger"]);
    registerscriptperk("specialty_aegis_vest", undefined, undefined, ["specialty_coldblooded", "specialty_shock_immunity", "specialty_emp_immunity", "specialty_signal_jammer"]);
    registerscriptperk("specialty_custom_gloves", undefined, undefined, ["specialty_quickswap"]);
    registerscriptperk("specialty_hijacked_iff_strobe", undefined, undefined, ["specialty_noplayertarget", "specialty_blindeye", "specialty_noscopeoutline"]);
    registerscriptperk("specialty_gas_warlord_resist");
    registerscriptperk("specialty_br_movement_mod", &function_7c927ee710825162, &function_33f65bc5db503a11, ["specialty_longslide", "specialty_mantle_scale", "specialty_fastladderclimb", "specialty_quickswap", "specialty_fasttransition", "specialty_sliding_ads", "specialty_sprintreload"]);
    registerscriptperk("specialty_outlander", &function_efd84dab18312f3f, &unsetoutlander);
    registerscriptperk("specialty_shroud");
    registerscriptperk("specialty_combat_scout", undefined, undefined);
    registerscriptperk("specialty_adrenaline", &function_198adc5136f6a4b3, &function_a4142d5fdfc879b4, ["specialty_fastcrouch"]);
    registerscriptperk("specialty_uav_tower_discount", &function_2cfe8d3390ebf739, &function_2aa14f9e313a7ba0);
    registerscriptperk("specialty_contract_payout", &function_30aea63c9309d877, &function_9fc353061d5d9106, ["specialty_uav_tower_discount"]);
    registerscriptperk("specialty_lightweight_br", &function_416b659a8c183f5, &function_61f59f06b860e9de);
    registerscriptperk("specialty_reduce_vehicle_repair_time", &function_b128334187ed23fb, &function_26088d91835eae50);
    registerscriptperk("specialty_reduce_vehicle_refill_time", &function_763531f5f7839ab6, &function_d5d1e40fc4911309);
    registerscriptperk("specialty_reduce_vehicle_fuel_usage", &function_91d30d6bd5c9987e, &function_67f057d98cc8b147);
    registerscriptperk("specialty_mechanic", undefined, undefined, ["specialty_reduce_vehicle_repair_time", "specialty_reduce_vehicle_refill_time", "specialty_reduce_vehicle_fuel_usage"]);
    registerscriptperk("specialty_scavenger_br", &setscavenger, &unsetscavenger, ["specialty_scavenger"]);
    registerscriptperk("specialty_restock_br", undefined, undefined, ["specialty_recharge_equipment"]);
    registerscriptperk("specialty_explosive_slow", &function_63e67108575e2dd7, &function_e750c905a0033fc0);
    registerscriptperk("specialty_explosive_regen_delay", &function_a0bbf85d80bdaabe, &function_78abdd07d9b93295);
    registerscriptperk("specialty_shrapnel_br", undefined, undefined, ["specialty_explosive_slow", "specialty_explosive_regen_delay"]);
    registerscriptperk("specialty_treadless_boots_br", undefined, undefined, ["specialty_fall_reduction"]);
    registerscriptperk("specialty_tac_pads_br", undefined, undefined, ["specialty_sliding_ads"]);
    registerscriptperk("specialty_shock_resist");
    registerscriptperk("specialty_frangible_resist");
    registerscriptperk("specialty_tac_resist_br", undefined, undefined, ["specialty_stun_resistance", "specialty_emp_resist", "specialty_gas_grenade_resist", "specialty_scrambler_resist", "specialty_snapshot_immunity", "specialty_frangible_resist", "specialty_shock_resist"]);
    registerscriptperk("specialty_silicon_gloves_br", undefined, undefined, ["specialty_bone_conduction", "specialty_signal_jammer"]);
    registerscriptperk("specialty_uav_buff", undefined, undefined);
    registerscriptperk("specialty_battlerage_reduce_damage", undefined, undefined);
    registerscriptperk("specialty_tempered_br", undefined, undefined, ["specialty_tempered_effect"]);
    registerscriptperk("specialty_ping_attacker_on_laststand");
    registerscriptperk("specialty_faster_health_regen", &function_3922f41cdbeb95b9, &function_de875074da5476ca);
    registerscriptperk("specialty_reduced_death_tax", &function_a8f9bfbe4bdf794, &function_a8f9bfbe4bdf794);
    registerscriptperk("specialty_revive_teammates_faster", &function_3a2773d17b85afb2, &function_90ff5254f7e28f7);
    registerscriptperk("specialty_revived_faster", &function_5ba973385ec4be3, &function_1021beef855460ac);
    registerscriptperk("specialty_survivor_br", undefined, undefined, ["specialty_revived_faster", "specialty_revive_teammates_faster", "specialty_reduced_death_tax", "specialty_faster_health_regen", "specialty_ping_attacker_on_laststand"]);
    registerscriptperk("specialty_tempered_effect", &function_f307e70927a22f9e, &function_618d9ea3d5fd1a77);
    registerscriptperk("specialty_onehanded_plating", undefined, undefined);
    registerscriptperk("specialty_ante_up", &setanteup, &function_22483f0bf514320b);
    registerscriptperk("specialty_flak_jacket", undefined, undefined, ["specialty_blastshield", "specialty_shrapnel_resist", "specialty_fire_resistence"], &initflakjacket);
    registerscriptperk("specialty_blastshield_limiter", &function_76826219412c80ce, &function_2a071b7e5d0351d3);
    registerscriptperk("specialty_fire_resistence", &function_df1f464b16738e76, &function_9a3330b21e0ad027);
    registerscriptperk("specialty_scavenger_ammo_and_equipment", undefined, undefined, ["specialty_scavenger_plus", "specialty_scavenger_equipment"], &function_e2df669ada6f810c);
    registerscriptperk("specialty_outline_killstreak_distance_limited", undefined, undefined, ["specialty_outlinekillstreaks"]);
    registercodeperkinfo("specialty_gungho", undefined, undefined, ["specialty_sprintoffhand", "specialty_supersprintreload"]);
    registerscriptperk("specialty_quartermaster", undefined, undefined, ["specialty_recharge_equipment"]);
    registerscriptperk("specialty_engineer_minimap", &function_71fce3d1d414f5f9, &function_96fb684092d79102, ["specialty_engineer"], &function_a20970a318808f61);
    registerscriptperk("specialty_support_streaker", &function_37de052fb8326c6f, &function_191ab60d4588d0c8, ["specialty_killstreak_to_scorestreak"], &function_3e285d679cd4ac57);
    registerscriptperk("specialty_emp_immunity");
    registerscriptperk("specialty_gas_immunity");
    registerscriptperk("specialty_hallucination_immunity");
    registerscriptperk("specialty_fast_hands", undefined, undefined, ["specialty_quickswap", "specialty_throwback", "specialty_throwback_extrafusetime"]);
    registerscriptperk("specialty_coldblooded_and_hidden", undefined, undefined, ["specialty_blindeye", "specialty_noscopeoutline", "specialty_coldblooded", "specialty_noplayertarget"]);
    registerscriptperk("specialty_gearhead", &function_e77e0f080cbde77a, &function_91c59fd71ce44c87, ["specialty_hack", "specialty_overcharge_field_upgrade", "specialty_carepackage_boobytrap"]);
    registercodeperkinfo("specialty_operative", &setoperative, &unsetoperative, ["specialty_sixth_sense"]);
    registerscriptperk("specialty_headhunter", undefined, undefined, undefined);
    registerscriptperk("specialty_armored", &function_6faff35e3a38ba5f, &function_d02ed6d205e7eb64, undefined);
    registerscriptperk("specialty_grenade_expert", &function_81f0718f6c5ab1d7, &function_2bba0e9e144c276c, ["specialty_missileprediction"]);
    registerscriptperk("specialty_extra_tactical", undefined, undefined, []);
    registerscriptperk("specialty_hustle", undefined, undefined, ["specialty_supersprint_enhanced", "specialty_fastcrouchmovement"]);
    registerscriptperk("specialty_eod", undefined, undefined, ["specialty_blastshield", "specialty_throwback", "specialty_shrapnel_resist"]);
    registerscriptperk("specialty_scavenger_plus", undefined, undefined, ["specialty_scavenger"]);
    registerscriptperk("specialty_munitions_2", undefined, undefined, ["specialty_twoprimaries"]);
    registerscriptperk("specialty_tac_resist", undefined, undefined, ["specialty_stun_resistance", "specialty_emp_resist", "specialty_gas_grenade_resist", "specialty_scrambler_resist", "specialty_snapshot_immunity"]);
    registerscriptperk("specialty_huntmaster", undefined, undefined, ["specialty_tracker", "specialty_kill_report", "specialty_silentkill"]);
    registerscriptperk("specialty_warhead", undefined, undefined, ["specialty_quickswap", "specialty_fastreload", "specialty_fastoffhand"]);
    registerscriptperk("specialty_focus", undefined, undefined, ["specialty_viewkickoverride", "specialty_improvedholdbreath"]);
    registerscriptperk("specialty_quick_fix", undefined, undefined, ["specialty_reduce_regen_delay_on_kill", "specialty_reduce_regen_delay_on_objective", "specialty_reduce_regen_delay_on_plate"]);
    registerscriptperk("specialty_covert_ops", undefined, undefined, ["specialty_blindeye", "specialty_noscopeoutline", "specialty_coldblooded", "specialty_noplayertarget", "specialty_sixth_sense_immune"]);
    registerscriptperk("specialty_tactical_recon", undefined, undefined, ["specialty_engineer", "specialty_markequipment", "specialty_hack"]);
    registerscriptperk("specialty_restock", undefined, undefined, ["specialty_recharge_equipment", "specialty_extra_deadly"]);
    registerscriptperk("specialty_survivor", &setsurvivor, &unsetsurvivor, ["specialty_pistoldeath"]);
    registerscriptperk("specialty_overcharge_field_upgrade", &function_17f9b8d5579b7e98, &function_448448ac4206d715, ["specialty_improved_field_upgrades", "specialty_faster_field_upgrade"]);
    registerscriptperk("specialty_overwatch", &setoverwatch, &unsetoverwatch, function_af3d35751dfd4e79());
    registerscriptperk("specialty_surveillance", undefined, undefined, ["specialty_sixth_sense"]);
    registerscriptperk("specialty_guerrilla", undefined, undefined, ["specialty_ghost", "specialty_heartbreaker"]);
    registerscriptperk("specialty_hardline", &sethardline, &unsethardline, ["specialty_br_cheaper_kiosk"]);
    registercodeperkinfo("specialty_snakecam", undefined, undefined, undefined);
    registerscriptperk("specialty_pc_medic", undefined, undefined, ["specialty_revived_faster", "specialty_revive_teammates_faster", "specialty_reduced_death_tax", "specialty_faster_health_regen", "specialty_ping_attacker_on_laststand"]);
    registerscriptperk("specialty_pc_comms", &function_57fa0386e81eaf33, &function_4173e65571fbfd44);
    registerscriptperk("specialty_pc_stealth", &function_c834f1eacbb06d09, &function_b35c8cf5dd0e38a2, ["specialty_ghost", "specialty_heartbreaker"]);
    registerscriptperk("specialty_pc_tempered", undefined, undefined, ["specialty_tempered_effect"]);
    registerscriptperk("specialty_pc_high_capacity", &function_7603aadd14da7ec6, &function_6af20073381a18d3);
    registerscriptperk("specialty_super_protection");
    registerscriptperk("specialty_heavy_metal", undefined, undefined, ["specialty_chain_killstreaks", "specialty_br_extra_killstreak_chance"]);
    registerscriptperk("specialty_strategist", undefined, undefined, ["specialty_killstreak_to_scorestreak", "specialty_br_better_mission_rewards"]);
    registerscriptperk("specialty_underkill", undefined, undefined);
    registerscriptperk("specialty_third_person", &setthirdpersonmode, &function_fbd953549be66251);
    registerscriptperk("specialty_tune_up", undefined, undefined, ["specialty_improved_field_upgrades", "specialty_faster_field_upgrade", "specialty_br_faster_revive"]);
    registerscriptperk("specialty_extra_shrapnel", undefined, undefined, ["specialty_extra_deadly", "specialty_shrapnel"]);
    registerscriptperk("specialty_specialist_bonus", &setspecialistbonus, &unsetspecialistbonus);
    registerscriptperk("specialty_mercenary", undefined, undefined, ["specialty_bounty"]);
    registerscriptperk("specialty_sonar", undefined, undefined, ["specialty_always_minimap"]);
    registerscriptperk("specialty_graverobber", undefined, undefined, ["specialty_scrap_weapons"]);
    registerscriptperk("specialty_healer", &sethealer, &unsethealer);
    registerscriptperk("specialty_breacher", &setbreacher, &unsetbreacher);
    registerscriptperk("specialty_door_breach", &setdoorbreach, &unsetdoorbreach);
    registerscriptperk("specialty_killstreak_to_scorestreak", &setkillstreaktoscorestreak, &unsetkillstreaktoscorestreak);
    registerscriptperk("specialty_improved_field_upgrades");
    registerscriptperk("specialty_recharge_equipment", &setrechargeequipment, &unsetrechargeequipment);
    registerscriptperk("specialty_super_sprint_kill_refresh");
    registerscriptperk("specialty_markequipment", &setmarkequipment, &unsetmarkequipment);
    registerscriptperk("specialty_chain_killstreaks", &setchainkillstreaks, &unsetchainkillstreaks);
    registerscriptperk("specialty_scrap_weapons", &setscrapweapons, &unsetscrapweapons);
    registerscriptperk("specialty_door_alarm", &setdooralarm, &unsetdooralarm);
    registerscriptperk("specialty_always_minimap", &setalwaysminimap, &unsetalwaysminimap);
    registerscriptperk("specialty_shrapnel");
    registerscriptperk("specialty_team_scavenger");
    registerscriptperk("specialty_fastreload_launchers", &setfastreloadlaunchers, &unsetfastreloadlaunchers);
    registerscriptperk("specialty_emp_resist");
    registerscriptperk("specialty_sixth_sense_immune");
    registerscriptperk("specialty_shrapnel_resist");
    registerscriptperk("specialty_reduce_regen_delay_on_kill", &setreduceregendelayonkill, &unsetreduceregendelayonkill);
    registerscriptperk("specialty_reduce_regen_delay_on_objective", &setreduceregendelayonobjective, &unsetreduceregendelayonobjective);
    registerscriptperk("specialty_reduce_regen_delay_on_plate");
    registerscriptperk("specialty_scrambler_resist");
    registerscriptperk("specialty_no_battle_chatter");
    registerscriptperk("specialty_engineer", &setengineer, &unsetengineer, ["specialty_outlinekillstreaks"]);
    registerscriptperk("speciality_undying", &function_d31614685fb778e1, &function_62e54942c53b9bda);
    registerscriptperk("specialty_br_cheaper_kiosk");
    registerscriptperk("specialty_br_faster_revive");
    registerscriptperk("specialty_br_better_mission_rewards", &setbettermissionrewards, &unsetbettermissionrewards);
    registerscriptperk("specialty_br_extra_killstreak_chance");
    registerscriptperk("specialty_regenfaster", &setregenfaster, &unsetregenfaster);
    registerscriptperk("specialty_medic");
    registerscriptperk("specialty_regen_delay_reduced", &setreduceregendelay, &unsetreduceregendelay);
    registerscriptperk("specialty_can_be_revived");
    registerscriptperk("specialty_kill_report");
    registerscriptperk("specialty_ads_mark_target", &setadsmarktarget, &unsetadsmarktarget);
    registerscriptperk("specialty_armorvest", &setarmorvest, &unsetarmorvest);
    registerscriptperk("specialty_tracker", &settracker, &unsettracker, ["specialty_tracker_pro"]);
    registerscriptperk("specialty_ghost", &setghost, &unsetghost, ["specialty_gpsjammer"]);
    registerscriptperk("specialty_helmet", &sethelmet, &unsethelmet);
    registerscriptperk("specialty_extra_deadly", &setextradeadly, &unsetextradeadly);
    registerscriptperk("specialty_remote_defuse", &setremotedefuse, &unsetremotedefuse);
    registerscriptperk("specialty_hack");
    registerscriptperk("specialty_faster_field_upgrade");
    registerscriptperk("specialty_improved_target_mark");
    registerscriptperk("specialty_door_sense", &setdoorsense, &unsetdoorsense);
    registerscriptperk("specialty_worsenedgunkick", &setworsenedgunkick, &unsetworsenedgunkick);
    registerscriptperk("specialty_ammo_disabling");
    registerscriptperk("specialty_gunperk_xp");
    registerscriptperk("specialty_location_marking", &setlocationmarking, &unsetlocationmarking);
    registerscriptperk("specialty_swimming", undefined, undefined, ["specialty_spygame", "specialty_coldblooded"]);
    registerscriptperk("specialty_afterburner", &setafterburner, &unsetafterburner, ["specialty_thruster"]);
    registerscriptperk("specialty_autospot", &setautospot, &unsetautospot);
    registerscriptperk("specialty_boom", &setboom, &unsetboom);
    registerscriptperk("specialty_delaymine", &setdelaymine, &unsetdelaymine);
    registerscriptperk("specialty_hardwired", undefined, undefined, ["specialty_tracker_jammer", "specialty_noscopeoutline", "specialty_empimmune"]);
    registerscriptperk("specialty_empimmune", &setempimmune, &unsetempimmune);
    registerscriptperk("specialty_explosivedamage");
    registerscriptperk("specialty_extraammo", &setextraammo, &unsetextraammo);
    registerscriptperk("specialty_falldamage", &setfreefall, &unsetfreefall);
    registerscriptperk("specialty_hard_shell", &sethardshell, &unsethardshell);
    registerscriptperk("specialty_powercell", &setpowercell, &unsetpowercell);
    registerscriptperk("specialty_incog", &setincog, &unsetincog);
    registerscriptperk("specialty_localjammer", &setlocaljammer, &unsetlocaljammer);
    registerscriptperk("specialty_overclock", &setoverclock, &unsetoverclock);
    registerscriptperk("specialty_outlinekillstreaks", &setoutlinekillstreaks, &unsetoutlinekillstreaks);
    registerscriptperk("specialty_pitcher", &setpitcher, &unsetpitcher, ["specialty_throwback"]);
    registerscriptperk("specialty_stun_resistance", &setstunresistance, &unsetstunresistance, ["specialty_hard_shell"]);
    registerscriptperk("specialty_twoprimaries", &setoverkill, &unsetoverkill, []);
    registerscriptperk("specialty_bullet_outline", &setbulletoutline, &unsetbulletoutline);
    registerscriptperk("specialty_activereload", &setactivereload, &unsetactivereload);
    registerscriptperk("specialty_sixth_sense", &setsixthsense, &unsetsixthsense);
    registerscriptperk("specialty_enhanced_sixth_sense", &setenhancedsixthsense, &unsetenhancedsixthsense);
    registerscriptperk("specialty_meleekill", &setmeleekill, &unsetmeleekill);
    registerscriptperk("specialty_gung_ho");
    registerscriptperk("specialty_man_at_arms", &setmanatarms, &unsetmanatarms, ["specialty_extraammo", "specialty_overrideweaponspeed"]);
    registerscriptperk("specialty_momentum", &setmomentum, &unsetmomentum);
    registerscriptperk("specialty_improvedmelee", &setimprovedmelee, &unsetimprovedmelee, ["specialty_extendedmelee", "specialty_fastermelee", "specialty_thief"]);
    registerscriptperk("specialty_thief", &setthief, &unsetthief);
    registerscriptperk("specialty_silentkill");
    registerscriptperk("specialty_armorpiercingks");
    registerscriptperk("specialty_fastcrouch", &setfastcrouch, &unsetfastcrouch);
    registerscriptperk("specialty_bulletdamage", undefined, undefined, ["specialty_overcharge", "specialty_worsenedgunkick"]);
    registerscriptperk("specialty_solobuddyboost", &setsolobuddyboost, &unsetsolobuddyboost);
    registerscriptperk("specialty_offhand_provider", &setoffhandprovider, &unsetoffhandprovider);
    registerscriptperk("specialty_glintreduce");
    registerscriptperk("specialty_gas_grenade_resist", &setgasgrenaderesist, &unsetgasgrenaderesist);
    registerscriptperk("specialty_extra_planted_equipment");
    registerscriptperk("specialty_blastshield", &setblastshield, &unsetblastshield);
    registerscriptperk("specialty_bulletsuppress", &function_7cfa6000210cbd68, &function_f1a813fe1b8a2275);
    registerscriptperk("specialty_battleslide", &setbattleslide, &unsetbattleslide);
    registerscriptperk("specialty_battleslide_offense", &setbattleslideoffense, &unsetbattleslideoffense);
    registerscriptperk("specialty_battleslide_shield", &setbattleslideshield, &unsetbattleslideshield);
    registerscriptperk("specialty_disruptor_punch", &setdisruptorpunch, &unsetdisruptorpunch);
    registerscriptperk("specialty_ground_pound", &setgroundpound, &unsetgroundpound);
    registerscriptperk("specialty_ground_pound_shield", &setgroundpoundshield, &unsetgroundpoundshield);
    registerscriptperk("specialty_ground_pound_shock", &setgroundpoundshock, &unsetgroundpoundshock);
    registerscriptperk("specialty_thruster", &setthruster, &unsetthruster);
    registerscriptperk("specialty_dodge", &setdodge, &unsetdodge);
    registerscriptperk("specialty_extra_dodge", &setextradodge, &unsetextradodge);
    registerscriptperk("specialty_extend_dodge", &setextenddodge, &unsetextenddodge);
    registerscriptperk("specialty_phase_slide", &setphaseslide, &unsetphaseslide);
    registerscriptperk("specialty_tele_slide", &setteleslide, &unsetteleslide);
    registerscriptperk("specialty_phaseslash", undefined, undefined, ["specialty_phaseslash_rephase"]);
    registerscriptperk("specialty_phaseslash_rephase", &setphaseslashrephase, &unsetphaseslashrephase);
    registerscriptperk("specialty_phase_fall", &setphasefall, &unsetphasefall);
    registerscriptperk("specialty_aura_quickswap", &setauraquickswap, &unsetauraquickswap);
    registerscriptperk("specialty_aura_speed", &setauraspeed, &unsetauraspeed);
    registerscriptperk("specialty_mark_targets", &setmarktargets, &unsetmarktargets);
    registerscriptperk("specialty_batterypack", &setbatterypack, &unsetbatterypack);
    registerscriptperk("specialty_camo_elite", &setcamoelite, &unsetcamoelite);
    registerscriptperk("specialty_scorestreakpack", &setscorestreakpack, &unsetscorestreakpack);
    registerscriptperk("specialty_superpack", &setsuperpack, &unsetsuperpack);
    registerscriptperk("specialty_dodge_defense", &setdodgedefense, &unsetdodgedefense);
    registerscriptperk("specialty_spawncloak", &setspawncloak, &unsetspawncloak);
    registerscriptperk("specialty_commando");
    registerscriptperk("specialty_personal_trophy", &setpersonaltrophy, &unsetpersonaltrophy);
    registerscriptperk("specialty_equipment_ping", &setequipmentping, &unsetequipmentping, ["specialty_paint"]);
    registerscriptperk("specialty_cloak", &setcloak, &unsetcloak);
    registerscriptperk("specialty_wall_lock", &setwalllock, &unsetwalllock);
    registerscriptperk("specialty_rush", &setrush, &unsetrush);
    registerscriptperk("specialty_hover", &sethover, &unsethover);
    registerscriptperk("specialty_scavenger_eqp", &setscavengereqp, &unsetscavengereqp);
    registerscriptperk("specialty_spawnview", &setspawnview, &unsetspawnview);
    registerscriptperk("specialty_headgear", &setheadgear, &unsetheadgear);
    registerscriptperk("specialty_ftlslide", &setftlslide, &unsetftlslide);
    registerscriptperk("specialty_improved_prone", &setimprovedprone, &unsetimprovedprone);
    registerscriptperk("specialty_support_killstreaks", &setsupportkillstreaks, &unsetsupportkillstreaks);
    registerscriptperk("specialty_overrideweaponspeed", &setoverrideweaponspeed, &unsetoverrideweaponspeed);
    registerscriptperk("specialty_cloak_aerial", &setcloakaerial, &unsetcloakaerial);
    registerscriptperk("specialty_spawn_radar", &setspawnradar, &unsetspawnradar);
    registerscriptperk("specialty_ads_awareness", &setadsawareness, &unsetadsawareness);
    registerscriptperk("specialty_rearguard", &setrearguard, &unsetrearguard);
    registerscriptperk("specialty_rugged_eqp");
    registerscriptperk("specialty_sharp_focus", &setsharpfocus, &unsetsharpfocus);
    registerscriptperk("specialty_bling");
    registerscriptperk("specialty_comexp", &setcomexp, &unsetcomexp);
    registerscriptperk("specialty_paint");
    registerscriptperk("specialty_paint_pro");
    registerscriptperk("specialty_steadyaimpro", &setsteadyaimpro, &unsetsteadyaimpro);
    registerscriptperk("specialty_block_health_regen", &setblockhealthregen, &unsetblockhealthregen);
    registerscriptperk("specialty_rshieldradar", &setrshieldradar, &unsetrshieldradar);
    registerscriptperk("specialty_rshieldscrambler", &setrshieldscrambler, &unsetrshieldscrambler);
    registerscriptperk("specialty_delayhealing");
    registerscriptperk("specialty_wounding");
    registerscriptperk("specialty_explosivebullet");
    registerscriptperk("specialty_armorpiercing");
    registerscriptperk("specialty_hardmelee");
    registerscriptperk("specialty_highlight");
    registerscriptperk("specialty_incendiary");
    registerscriptperk("specialty_incendiary_alt");
    registerscriptperk("specialty_ub_flamethrower");
    registerscriptperk("specialty_flashlight");
    registerscriptperk("specialty_glintxsml");
    registerscriptperk("specialty_glintsml");
    registerscriptperk("specialty_glintmed");
    registerscriptperk("specialty_glintlrg");
    registerscriptperk("specialty_glintxlrg");
    registerscriptperk("specialty_extraclip");
    registerscriptperk("specialty_smags");
    registerscriptperk("specialty_akimbo");
    registerscriptperk("specialty_gunmelee");
    registerscriptperk("specialty_magwell", undefined, undefined, ["specialty_fastreload"]);
    registerscriptperk("specialty_combathigh", &setcombathigh, &unsetcombathigh);
    registerscriptperk("specialty_juiced", &setjuiced, &unsetjuiced);
    registerscriptperk("specialty_revenge", &setrevenge, &unsetrevenge);
    registerscriptperk("specialty_light_armor", &setlightarmor, &unsetlightarmor);
    registerscriptperk("specialty_carepackage", &setcarepackage, &unsetcarepackage);
    registerscriptperk("specialty_stopping_power");
    registerscriptperk("specialty_uav", &setuav, &unsetuav);
    registerscriptperk("specialty_viewkickoverride", &setviewkickoverride, &unsetviewkickoverride);
    registerscriptperk("specialty_affinityspeedboost", &setaffinityspeedboost, &unsetaffinityspeedboost);
    registerscriptperk("specialty_affinityextralauncher", &setaffinityextralauncher, &unsetaffinityextralauncher);
    registerscriptperk("specialty_equip_throwingKnife", &setthrowingknifemelee, &unsetthrowingknifemelee);
    registerscriptperk("specialty_tacticalinsertion", &settacticalinsertion, &unsettacticalinsertion);
    weaponpassives = scripts\mp\passives::getweapontypepassives();
    foreach (weaponpassive in weaponpassives) {
        level.scriptperks[weaponpassive] = 1;
        var_f6ec76e875e6f59e = scripts\mp\passives::getpassiveperk(weaponpassive);
        if (isdefined(var_f6ec76e875e6f59e)) {
            level.extraperkmap[weaponpassive] = [var_f6ec76e875e6f59e];
        }
    }
    registerscriptperk("specialty_talkinggun_test1", &function_96f59fefd781e47, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test2", &function_96f5afefd78207a, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test3", &function_96f5bfefd7822ad, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_test4", &function_96f54fefd781348, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_announcer", &function_fc6e0b02abb995cb, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_robot", &function_73e4ae4f932e9f30, &function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_blackcell", &namespace_27c74152ccb91331::function_cc0fddfe26b772a7, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_npc", &namespace_27c74152ccb91331::function_fc09644394bf843f, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_cat", &namespace_27c74152ccb91331::function_44d73a43ca35cbcc, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_talkinggun_dog", &namespace_27c74152ccb91331::function_514a7643d295a3a2, &namespace_27c74152ccb91331::function_da3d9f34d24ac85a);
    registerscriptperk("specialty_doomscreen", &namespace_27c74152ccb91331::function_62e0bcef615a8d1d, &namespace_27c74152ccb91331::function_ade69726300553ac);
    registerscriptperk("specialty_ai_stealth_sixth_sense", &function_378625a93d79fdc2, &function_1a4d7090fc81e97);
    registerscriptperk("specialty_null");
    registercodeperkinfo("specialty_thermal", &setthermal, &unsetthermal);
    registercodeperkinfo("specialty_lightweight", undefined, undefined);
    registercodeperkinfo("specialty_steelnerves", &setsteelnerves, &unsetsteelnerves);
    registercodeperkinfo("specialty_saboteur", &setsaboteur, &unsetsaboteur);
    registercodeperkinfo("specialty_endgame", &setendgame, &unsetendgame);
    registercodeperkinfo("specialty_onemanarmy", &setonemanarmy, &unsetonemanarmy);
    registercodeperkinfo("specialty_weaponlaser", &setweaponlaser, &unsetweaponlaser);
    registercodeperkinfo("specialty_marksman", &setmarksman, &unsetmarksman);
    registercodeperkinfo("specialty_holdbreath", undefined, undefined);
    registercodeperkinfo("specialty_fastermelee", undefined, undefined);
    registercodeperkinfo("specialty_double_load", &setdoubleload, &unsetdoubleload);
    registercodeperkinfo("specialty_overkill_pro", &setoverkillpro, &unsetoverkillpro);
    registercodeperkinfo("specialty_refill_grenades", &setrefillgrenades, &unsetrefillgrenades);
    registercodeperkinfo("specialty_refill_ammo", &setrefillammo, &unsetrefillammo);
    registercodeperkinfo("specialty_combat_speed", &setcombatspeed, &unsetcombatspeed);
    registercodeperkinfo("specialty_tagger", &settagger, &unsettagger);
    registercodeperkinfo("specialty_triggerhappy", &settriggerhappy, &unsettriggerhappy);
    registercodeperkinfo("specialty_blindeye", &setblindeye, &unsetblindeye);
    registercodeperkinfo("specialty_quickswap", &setquickswap, &unsetquickswap, ["specialty_fastoffhand"]);
    registercodeperkinfo("specialty_extra_equipment");
    registercodeperkinfo("specialty_lifepack", &setlifepack, &unsetlifepack);
    registercodeperkinfo("specialty_toughenup", &settoughenup, &unsettoughenup);
    registercodeperkinfo("specialty_scoutping", &setscoutping, &unsetscoutping);
    registercodeperkinfo("specialty_phase_speed", &setphasespeed, &unsetphasespeed);
    registercodeperkinfo("specialty_camo_clone", &setcamoclone, &unsetcamoclone);
    registercodeperkinfo("specialty_improvedgunkick");
    registercodeperkinfo("specialty_sprintfire", undefined, undefined, ["specialty_fastsprintrecovery"]);
    registercodeperkinfo("specialty_overcharge", &setovercharge, &unsetovercharge);
    registercodeperkinfo("specialty_supersprint_enhanced", &setsupersprintenhanced, &unsetsupersprintenhanced);
    registercodeperkinfo("specialty_noscopeoutline", &setnoscopeoutline, &unsetnoscopeoutline);
    registercodeperkinfo("specialty_snapshot_immunity");
    registercodeperkinfo("specialty_spygame");
    registercodeperkinfo("specialty_dexterity", undefined, undefined, ["specialty_quickswap"]);
    registercodeperkinfo("specialty_criticalaim");
    registerperkparams = spawnstruct();
    registerperkparams.var_65863a18b3d1ad87 = &registerscriptperk;
    registerperkparams.var_604742051f2ae309 = &registercodeperkinfo;
    registerperkparams.var_2b41f7eeb43bf87a = &function_791007a01c96516a;
    callback::callback(#"register_perk", registerperkparams);
    callback::remove(#"register_perk", #"all");
    initperkdvars();
    level thread onplayerconnect();
}

// Namespace perks / scripts\mp\perks\perks
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x549d
// Size: 0x39
function registerscriptperk(perkname, setfunc, unsetfunc, extraperkmap, initfunc) {
    registerperk(perkname, 1, setfunc, unsetfunc, extraperkmap, initfunc);
}

// Namespace perks / scripts\mp\perks\perks
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54de
// Size: 0x38
function registercodeperkinfo(perkname, setfunc, unsetfunc, extraperkmap, initfunc) {
    registerperk(perkname, 0, setfunc, unsetfunc, extraperkmap, initfunc);
}

// Namespace perks / scripts\mp\perks\perks
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551e
// Size: 0x132
function registerperk(perkname, var_9aa715f8120f5692, setfunc, unsetfunc, extraperkmap, initfunc) {
    assert(isdefined(perkname));
    assert(isarray(level.perkbundles), "Perk Bundles should be initialized before registering perks.");
    if (function_e6d4bde94154c10e(perkname) && !isdefined(level.perkbundles[perkname])) {
        return;
    }
    assert(!isdefined(level.scriptperks[perkname]), "Cannot register two perks to the name: " + perkname);
    if (istrue(var_9aa715f8120f5692)) {
        level.scriptperks[perkname] = 1;
    } else {
        level.codeperks[perkname] = 1;
    }
    if (isdefined(setfunc)) {
        assert(isfunction(setfunc));
        level.perksetfuncs[perkname] = setfunc;
    }
    if (isdefined(unsetfunc)) {
        assert(isfunction(unsetfunc));
        level.perkunsetfuncs[perkname] = unsetfunc;
    }
    if (isdefined(extraperkmap)) {
        assert(isarray(extraperkmap));
        level.extraperkmap[perkname] = extraperkmap;
    }
    if (isdefined(initfunc)) {
        assert(isfunction(initfunc));
        level [[ initfunc ]]();
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5658
// Size: 0x44
function function_791007a01c96516a(perkname, onkillcallback) {
    assert(isdefined(perkname));
    assert(isfunction(onkillcallback));
    level.var_3c58bd77bb86658c[perkname] = {#var_c4452c3a1edbf657:onkillcallback};
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a4
// Size: 0x27
function function_f45c19871b412ea5(perkname) {
    return isdefined(level.scriptperks[perkname]) || isdefined(level.codeperks[perkname]);
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d4
// Size: 0x17
function function_e6d4bde94154c10e(perkname) {
    return isdefined(level.cacperks[perkname]);
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f4
// Size: 0x2f2
function function_301144e1b628a10c() {
    if (!isdefined(level.perkbundles)) {
        level.perkbundles = [];
    }
    level.var_d5f3dcf05b7e8be6 = [];
    level.cacperks = [];
    var_3ac7980d8ca4b1ad = undefined;
    assert(isdefined(level.gamemodebundle), "Gamemode bundle required.");
    assert(isdefined(level.gamemodebundle.perk_list), "Perk list needs to be specified in the current gamemode bundle.");
    var_3ac7980d8ca4b1ad = getscriptbundle("perklist:" + level.gamemodebundle.perk_list);
    assert(isdefined(var_3ac7980d8ca4b1ad), "Perk list wasn't specified for this gamemode bundle.");
    assert(isdefined(var_3ac7980d8ca4b1ad.perk_list));
    if (!isdefined(var_3ac7980d8ca4b1ad.perk_list)) {
        return;
    }
    level.var_41cf8d43ac1cd207 = var_3ac7980d8ca4b1ad.var_af260db32747b66a;
    var_f1055f06005e590f = [];
    if (isdefined(level.var_41cf8d43ac1cd207)) {
        foreach (var_2d1cebb0bab8319f in level.var_41cf8d43ac1cd207) {
            if (isdefined(var_2d1cebb0bab8319f.bundle)) {
                var_f1055f06005e590f[var_2d1cebb0bab8319f.bundle] = 1;
            }
        }
    }
    var_adf241ecc8935598 = 1;
    foreach (id, var_5b4192a2af2b26cb in var_3ac7980d8ca4b1ad.perk_list) {
        if (!isnumber(id)) {
            continue;
        }
        if (!isdefined(var_5b4192a2af2b26cb)) {
            continue;
        }
        perkref = var_5b4192a2af2b26cb.ref;
        if (!isdefined(perkref)) {
            continue;
        }
        if (!istrue(var_5b4192a2af2b26cb.var_f36d8e40136f7f30)) {
            level.cacperks[perkref] = perkref;
        }
        if (var_adf241ecc8935598 == 0 && perkref == "specialty_null") {
            continue;
        }
        perkbundlename = var_5b4192a2af2b26cb.bundle;
        if (!isdefined(perkbundlename)) {
            continue;
        }
        if (perkbundlename == "replace_me") {
            continue;
        }
        var_1e98f3ba9660d523 = hashcat(%"hash_284b297186abe3f4", perkbundlename);
        if (var_1e98f3ba9660d523 == %"hash_3636afb8639a35a5") {
            bundle = {#unused:1};
        } else {
            bundle = getscriptbundle(var_1e98f3ba9660d523);
        }
        if (!isdefined(bundle)) {
            continue;
        }
        if (istrue(var_f1055f06005e590f[perkbundlename])) {
            level.var_f54c174ff247a969[perkbundlename] = perkref;
        }
        level.perkbundles[perkref] = bundle;
        level.var_d5f3dcf05b7e8be6[perkref] = id;
        if (isdefined(bundle.specialistvo)) {
            game["dialog"][perkref] = bundle.specialistvo;
        }
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ee
// Size: 0x4a
function initspecialistkillstreaks() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("specialist_perk_1", undefined, &onspecialistkillstreakavailable);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("specialist_perk_2", undefined, &onspecialistkillstreakavailable);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("specialist_perk_3", undefined, &onspecialistkillstreakavailable);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("specialist_perk_bonus", undefined, &onspecialistbonusavailable);
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a40
// Size: 0x3f
function onspecialistkillstreakavailable(streakitem) {
    perk = getspecialistperkforstreak(streakitem.streakname);
    assert(isdefined(perk), "Loadouts with specialist activated should have 3 perks set for extra_perks");
    giveperk(perk);
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a87
// Size: 0x3b
function getspecialistperkforstreak(streakname) {
    specialistindex = scripts\mp\perks\perks::getspecialistindexforstreak(streakname);
    if (specialistindex == -1) {
        return undefined;
    }
    return self.classstruct.loadoutextraperks[specialistindex];
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5acb
// Size: 0x45
function getspecialistindexforstreak(streakname) {
    if (!isdefined(streakname)) {
        return -1;
    }
    if (streakname == "specialist_perk_1") {
        return 0;
    }
    if (streakname == "specialist_perk_2") {
        return 1;
    }
    if (streakname == "specialist_perk_3") {
        return 2;
    }
    return -1;
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b18
// Size: 0x55
function isspecialiststreak(streakname) {
    switch (streakname) {
    case #"hash_25daf4f1a090db48":
    case #"hash_25daf5f1a090dcdb":
    case #"hash_25daf7f1a090e001":
    case #"hash_894c703f54088bdd": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b75
// Size: 0x12
function onspecialistbonusavailable(streakitem) {
    addspecialistbonus();
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b8f
// Size: 0x99
function addspecialistbonus() {
    isbr = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    foreach (perk, bundle in level.perkbundles) {
        var_e72ddc0fdefe52ec = ter_op(isbr, istrue(bundle.specialistbr), istrue(bundle.specialist));
        if (!var_e72ddc0fdefe52ec) {
            continue;
        }
        giveperk(perk);
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c30
// Size: 0x99
function removespecialistbonus() {
    isbr = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    foreach (perk, bundle in level.perkbundles) {
        var_e72ddc0fdefe52ec = ter_op(isbr, istrue(bundle.specialistbr), istrue(bundle.specialist));
        if (!var_e72ddc0fdefe52ec) {
            continue;
        }
        removeperk(perk);
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cd1
// Size: 0x97
function getavailableperks() {
    availableperks = [];
    foreach (perkref in level.cacperks) {
        if (_hasperk(perkref)) {
            continue;
        }
        bundle = level.perkbundles[perkref];
        if (!istrue(bundle.var_594af43597023062)) {
            continue;
        }
        availableperks[availableperks.size] = perkref;
    }
    return availableperks;
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d71
// Size: 0x3a
function getperkslot(perkref) {
    if (!isdefined(perkref)) {
        return undefined;
    }
    bundle = level.perkbundles[perkref];
    if (!isdefined(bundle)) {
        return undefined;
    }
    return bundle.menuslot;
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5db4
// Size: 0x47
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        player.perks = [];
        player.perksblocked = [];
        player.weaponlist = [];
        function_a9811e9d60c20505(player);
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e03
// Size: 0xc1
function function_a9811e9d60c20505(newplayer) {
    totalcharge = 0;
    foreach (player in level.players) {
        if (isdefined(player scripts\mp\utility\stats::getpersstat("perkPackageProgress"))) {
            totalcharge += player scripts\mp\utility\stats::getpersstat("perkPackageProgress");
        }
    }
    averagecharge = 0;
    if (istrue(level.players.size > 0)) {
        averagecharge = totalcharge / level.players.size;
    }
    newplayer.pers["perkPackageProgress"] = averagecharge;
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ecc
// Size: 0x2c4
function initperkdvars() {
    maxhealth = getdvarint(@"hash_b1d561f9a9241e09", 150);
    level.graceperiodgrenademod = 0.08;
    level.armorpiercingmod = 1.5;
    level.var_3395494b137909bb = 1.5;
    level.var_f83dd54fb01d0b92 = 1.75;
    level.regenfasterhealthmod = getintproperty(@"hash_8e7c2be7678f7efc", 2);
    level.explosivedamagemod = getintproperty(@"hash_ba7635c20c20da2b", 40) / 100;
    level.blastshieldmod = getfloatproperty(@"hash_fdc1e088cb180fc", 0.65);
    level.blastshieldclamp = getfloatproperty(@"hash_171bcebcaa849d95", 0.8) * maxhealth;
    level.riotshieldmod = getintproperty(@"hash_44dd0d59d214ae0c", 100) / 100;
    level.armorvestbulletdelta = getintproperty(@"hash_f5552d1367ce77c8", 1);
    level.var_ddc10ba2983b0b0c = dvars::getfloatproperty(@"hash_811e77d419715fbc", 0.8);
    level.minspeed = getintproperty(@"hash_39d060b7fe00e04e", 100);
    level.mindistance = getintproperty(@"hash_e8c42ed00fd99a2c", 10);
    level.timeperiod = getintproperty(@"hash_cb49c33367633135", 200) / 1000;
    level.minspeedsq = level.minspeed * level.minspeed;
    level.mindistancesq = level.mindistance * level.mindistance;
    if (namespace_708f627020de59d3::function_c0d385a09d173a36() && !function_ec3aea190c440d29(@"hash_de884e7ed943c255")) {
        level.var_eeccf9e10242815 = 0;
    } else {
        level.var_eeccf9e10242815 = getdvarint(@"hash_de884e7ed943c255", 1);
    }
    if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        level.blastshieldmod = getfloatproperty(@"hash_323beb481f9f3500", 0.65);
        level.blastshieldclamp = getfloatproperty(@"hash_580844a0ede1b0f3", 0.66) * maxhealth;
    }
    if (scripts\mp\utility\game::getgametype() == "arena") {
        level.blastshieldmod = dvarfloatvalue("blastShieldMod", 0.65, 0, 1);
        level.blastshieldclamp = dvarfloatvalue("blastShieldClamp", 0.8, 0, 1) * maxhealth;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level.blastshieldmod = getfloatproperty(@"hash_eea6d50ea045fdf", 0.8);
        level.blastshieldclamp = getfloatproperty(@"hash_60e279f4f47f7b8e", 0.8) * maxhealth;
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6198
// Size: 0x6d
function giveperks(loadoutperks) {
    foreach (perk in loadoutperks) {
        if (perk != "none" && perk != "specialty_null") {
            scripts\mp\class::loadout_giveperk(perk);
        }
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x620d
// Size: 0x27
function function_4613ec15f87b7cf2(tier2perk, tier3perk) {
    self.var_15f3e6df722fb1cf = tier2perk;
    self.var_15f3e5df722faf9c = tier3perk;
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x623c
// Size: 0x88
function _setperk(perkname) {
    assertex(isdefined(perkname), "_setPerk perkName not defined and should be");
    if (!isdefined(self.perks)) {
        self.perks = [];
    }
    if (!_hasperk(perkname)) {
        self.perks[perkname] = 1;
    } else {
        self.perks[perkname]++;
    }
    if (self.perks[perkname] == 1 && !function_8641edd897d42547(perkname)) {
        _setperkinternal(perkname);
    }
    /#
        level notify("<dev string:x1c>");
    #/
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62cc
// Size: 0x41
function _setperkinternal(perkname) {
    perksetfunc = level.perksetfuncs[perkname];
    if (isdefined(perksetfunc)) {
        self thread [[ perksetfunc ]]();
    }
    self setperk(perkname, !isdefined(level.scriptperks[perkname]));
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6315
// Size: 0x84
function _setextraperks(perkname) {
    if (isdefined(level.extraperkmap[perkname])) {
        foreach (extraperk in level.extraperkmap[perkname]) {
            _setperk(extraperk);
            _setextraperks(extraperk);
        }
    }
    /#
        level notify("<dev string:x1c>");
    #/
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63a1
// Size: 0x79
function _unsetextraperks(perkname) {
    if (isdefined(level.extraperkmap[perkname])) {
        foreach (extraperk in level.extraperkmap[perkname]) {
            _unsetperk(extraperk);
            _unsetextraperks(extraperk);
        }
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6422
// Size: 0x9f
function _unsetperk(perkname) {
    if (!_hasperk(perkname)) {
        assertex(isdefined(level.perks_suppressasserts), "_unsetPerk() passed perk not in self.perks: " + perkname);
        return;
    }
    assertex(self.perks[perkname] > 0 || isdefined(level.perks_suppressasserts), "_unsetPerk() called on already disabled perk: " + perkname);
    self.perks[perkname]--;
    if (self.perks[perkname] == 0) {
        if (!function_8641edd897d42547(perkname)) {
            _unsetperkinternal(perkname);
        }
        self.perks[perkname] = undefined;
    }
    /#
        level notify("<dev string:x1c>");
    #/
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c9
// Size: 0x3f
function _unsetperkinternal(perkname) {
    if (isdefined(level.perkunsetfuncs[perkname])) {
        self thread [[ level.perkunsetfuncs[perkname] ]]();
    }
    self unsetperk(perkname, !isdefined(level.scriptperks[perkname]));
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6510
// Size: 0xa5
function _clearperks() {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.perks)) {
        foreach (perkname, perkvalue in self.perks) {
            if (isdefined(level.perkunsetfuncs[perkname])) {
                self [[ level.perkunsetfuncs[perkname] ]]();
            }
        }
    }
    self.perks = [];
    self.perksblocked = [];
    self.weaponperks = [];
    self clearperks();
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65bd
// Size: 0x16a
function function_29ef7a1951b051f7() {
    if (!isdefined(self)) {
        return;
    }
    var_672a655f9c24b7 = [];
    if (isdefined(self.perks)) {
        var_672a655f9c24b7 = self.perks;
    }
    if (isdefined(self.weaponperks)) {
        foreach (perk in self.weaponperks) {
            var_672a655f9c24b7 = array_remove_key(var_672a655f9c24b7, perk);
        }
    }
    if (isdefined(var_672a655f9c24b7)) {
        foreach (perkname, perkvalue in var_672a655f9c24b7) {
            if (isdefined(level.perkunsetfuncs[perkname])) {
                self [[ level.perkunsetfuncs[perkname] ]]();
            }
        }
    }
    foreach (perk, value in var_672a655f9c24b7) {
        self.perks = array_remove_key(self.perks, perk);
        self unsetperk(perk, !isdefined(level.scriptperks[perk]));
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x672f
// Size: 0x99
function giveperksafterspawn() {
    self endon("death_or_disconnect");
    self endon("joined_spectators");
    self endon("giveLoadout_start");
    self endon("loadout_perks_cleared");
    activespawnprotection = spawnstruct();
    activespawnprotection.perks = [];
    function_dd88698a047c2064(activespawnprotection, "specialty_blindeye");
    function_dd88698a047c2064(activespawnprotection, "specialty_gpsjammer");
    function_dd88698a047c2064(activespawnprotection, "specialty_noscopeoutline");
    function_dd88698a047c2064(activespawnprotection, "specialty_gas_grenade_resist");
    self.avoidkillstreakonspawntimer = undefined;
    scripts\mp\perks\perkfunctions::function_a587d6e4331b6211(self.avoidkillstreakonspawntimer);
    function_39322ee01e03bcf6(activespawnprotection);
    self notify("removed_spawn_perks");
}

// Namespace perks / scripts\mp\perks\perks
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d0
// Size: 0x3d
function function_dd88698a047c2064(activespawnprotection, perkname) {
    activespawnprotection.perks[activespawnprotection.perks.size] = perkname;
    scripts\mp\perks\perks::_setperk(perkname);
    scripts\mp\perks\perks::_setextraperks(perkname);
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6815
// Size: 0x75
function function_39322ee01e03bcf6(activespawnprotection) {
    foreach (perkname in activespawnprotection.perks) {
        scripts\mp\perks\perks::_unsetperk(perkname);
        scripts\mp\perks\perks::_unsetextraperks(perkname);
    }
    activespawnprotection.perks = undefined;
}

// Namespace perks / scripts\mp\perks\perks
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6892
// Size: 0x2cc
function updateactiveperks(einflictor, attacker, victim, idamage, smeansofdeath, objweapon, shitloc, vdir) {
    var_c3a55ee9f23fb616 = isplayer(einflictor);
    var_d758f68157febc76 = isthrowingknife(objweapon);
    var_4f5e5bf85bdb8c7a = var_d758f68157febc76 && isdefined(einflictor) && isdefined(einflictor.classname) && einflictor.classname == "grenade";
    var_99d1abc1148a35ad = isdefined(attacker) && isplayer(attacker) && attacker != victim;
    if (var_99d1abc1148a35ad && (var_c3a55ee9f23fb616 || var_4f5e5bf85bdb8c7a)) {
        attacker.lastgunkilltime = gettime();
        thread scripts\mp\perks\weaponpassives::updateweaponpassivesonkill(einflictor, attacker, victim, idamage, smeansofdeath, objweapon, shitloc, vdir);
        if (attacker _hasperk("specialty_triggerhappy")) {
            attacker thread scripts\mp\perks\perkfunctions::settriggerhappyinternal();
        }
        if (attacker _hasperk("specialty_boom")) {
            victim thread scripts\mp\perks\perkfunctions::setboominternal(attacker);
        }
        if (attacker _hasperk("specialty_deadeye")) {
            attacker.deadeyekillcount++;
        }
        var_f3f59686c0fabc4c = attacker scripts\mp\utility\stats::getpersstat("abilityRecharging");
        if (isdefined(var_f3f59686c0fabc4c) && var_f3f59686c0fabc4c) {
            attacker notify("abilityFastRecharge");
        }
        var_2edb46e413cbc42f = attacker scripts\mp\utility\stats::getpersstat("abilityOn");
        if (isdefined(var_2edb46e413cbc42f) && var_2edb46e413cbc42f) {
            attacker notify("abilityExtraTime");
        }
        if (attacker _hasperk("specialty_super_sprint_kill_refresh")) {
            attacker scripts\mp\perks\perkfunctions::supersprintkillrefresh_onkill();
        }
        if (attacker _hasperk("specialty_reduce_regen_delay_on_kill")) {
            attacker scripts\mp\perks\perkfunctions::regendelayreduce_onkill();
        }
        if (attacker _hasperk("specialty_regen_on_kill")) {
            attacker scripts\mp\perks\perkfunctions::regenonkill();
        }
        if (attacker _hasperk("specialty_armored") && attacker getammocount("bandage_br") < 1) {
            attacker namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(1);
        }
        if (level.var_3c58bd77bb86658c.size > 0) {
            var_8e417d49ad0e18a5 = {#smeansofdeath:smeansofdeath};
            onkillkeys = getarraykeys(level.var_3c58bd77bb86658c);
            foreach (perkname in onkillkeys) {
                if (attacker _hasperk(perkname)) {
                    attacker thread [[ level.var_3c58bd77bb86658c[perkname].var_c4452c3a1edbf657 ]](var_8e417d49ad0e18a5);
                }
            }
        }
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b66
// Size: 0x2a
function function_7c8cc44b58093ce4(perksarray) {
    index = scripts\mp\class::function_ed0c3acfdac0baed(perksarray);
    self setclientomnvar("ui_perk_package_bundle_index", index);
}

// Namespace perks / scripts\mp\perks\perks
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b98
// Size: 0x20c
function setomnvarsforperklist(var_5dc06b0667135c87, perklist, extraperkslist) {
    var_3e723d9f699e3373 = [];
    var_f46d514de2f55768 = 0;
    foreach (perk in perklist) {
        if (!function_f45c19871b412ea5(perk)) {
            continue;
        }
        slot = getperkslot(perk);
        if (!isdefined(slot)) {
            continue;
        }
        if (!isdefined(var_3e723d9f699e3373[slot])) {
            var_3e723d9f699e3373[slot] = [];
        }
        var_3e723d9f699e3373[slot][var_3e723d9f699e3373[slot].size] = perk;
        var_f46d514de2f55768++;
    }
    foreach (perk in extraperkslist) {
        if (!function_f45c19871b412ea5(perk)) {
            continue;
        }
        slot = getperkslot(perk);
        if (!isdefined(slot)) {
            continue;
        }
        if (!isdefined(var_3e723d9f699e3373[slot])) {
            var_3e723d9f699e3373[slot] = [];
        }
        var_3e723d9f699e3373[slot][var_3e723d9f699e3373[slot].size] = perk;
        var_f46d514de2f55768++;
    }
    loopcount = max(4, var_f46d514de2f55768);
    sortedperks = [];
    for (slot = 1; slot < loopcount; slot++) {
        if (isdefined(var_3e723d9f699e3373[slot])) {
            foreach (perk in var_3e723d9f699e3373[slot]) {
                sortedperks[sortedperks.size] = perk;
            }
        }
    }
    for (var_d861f893072a477e = 0; var_d861f893072a477e < 7; var_d861f893072a477e++) {
        var_5c9ddcf56d36f133 = sortedperks[var_d861f893072a477e];
        if (!isdefined(var_5c9ddcf56d36f133)) {
            var_5c9ddcf56d36f133 = "none";
        }
        self setclientomnvar(var_5dc06b0667135c87 + var_d861f893072a477e, var_5c9ddcf56d36f133);
    }
    self setclientomnvar("ui_spawn_perks_updated", gettime());
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dac
// Size: 0x74
function isperkinloadout(perk) {
    perks = self.pers["loadoutPerks"];
    foreach (loadoutperk in perks) {
        if (loadoutperk == perk) {
            return true;
        }
    }
    return false;
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e29
// Size: 0x34
function getperkid(perkref) {
    if (!isdefined(perkref)) {
        return 0;
    }
    perkid = level.var_d5f3dcf05b7e8be6[perkref];
    if (!isnumber(perkid)) {
        return 0;
    }
    return perkid;
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e66
// Size: 0x102
function function_ccdbd1f6da822d2c() {
    level endon("game_ended");
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\flags::gameflagwait("prematch_done");
    }
    starttime = gettime();
    waitframe();
    if (!isdefined(game["perk_package_progress_global"])) {
        game["perk_package_progress_global"] = 0;
    }
    while (true) {
        if (isdefined(level.var_d659494e95bd9496) && level.var_d659494e95bd9496) {
            starttime = gettime();
            waitframe();
            continue;
        }
        game["perk_package_progress_global"] = game["perk_package_progress_global"] + 10 * level.framedurationseconds;
        if (int(game["perk_package_progress_global"]) % 10 == 0) {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                player function_f2dbab6f947771f2();
            }
        }
        waitframe();
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f70
// Size: 0x271
function function_f2dbab6f947771f2() {
    if (!isplayer(self)) {
        return;
    }
    if (!istrue(level.var_606eb45e074ff204)) {
        return;
    }
    if (!istrue(level.var_f3a9bf9e4404820f)) {
        return;
    }
    if (!isdefined(self.pers["perkPackageProgress"])) {
        self.pers["perkPackageProgress"] = 0;
    }
    if (!isdefined(self.pers["perkPackageTier2Earned"])) {
        self.pers["perkPackageTier2Earned"] = 0;
    }
    if (!isdefined(self.pers["perkPackageTier3State"])) {
        self.pers["perkPackageTier3State"] = 0;
    }
    var_ff54a98a1569a09d = level.var_5a3318627fb4465d;
    var_1601c1f95d06209a = level.var_5cdaa841f503d45a;
    if (self.pers["perkPackageProgress"] + game["perk_package_progress_global"] > var_ff54a98a1569a09d && !self.pers["perkPackageTier2Earned"] || level.var_f3d4343da6d28c4c == 1) {
        giveperk(self.var_15f3e6df722fb1cf);
        self.pers["perkPackageTier2Earned"] = 1;
        if (istrue(self.perksgiven)) {
            self setclientomnvar("ui_perk_bonus_splash", 1);
            scripts\mp\utility\dialog::leaderdialogonplayer(self.var_15f3e6df722fb1cf);
        }
        if (_hasperk("specialty_recharge_equipment")) {
            namespace_8a392daf295e43f8::function_e27c4d2340d9d56b();
        }
        self dlog_recordplayerevent("dlog_event_mp_perk_tier2_earn", ["match_time", scripts\cp_mp\utility\game_utility::gettimepassed(), "t2_cost", var_ff54a98a1569a09d]);
    }
    perkPackageProgress = self.pers["perkPackageProgress"] + game["perk_package_progress_global"];
    var_76d0e2dfc8bb69e = perkPackageProgress > var_1601c1f95d06209a && self.pers["perkPackageTier3State"] < 1;
    if ((var_76d0e2dfc8bb69e || level.var_f3d4353da6d28e7f == 1) && self.var_15f3e5df722faf9c != "specialty_null") {
        self.pers["perkPackageTier3State"] = 1;
        if (istrue(self.perksgiven)) {
            self setclientomnvar("ui_perk_ultimate_splash", 1);
            scripts\mp\utility\dialog::leaderdialogonplayer(self.var_15f3e5df722faf9c);
        }
        scripts\mp\perks\perks::function_2e9bd87bf55528f9();
        self dlog_recordplayerevent("dlog_event_mp_perk_tier3_earn", ["match_time", scripts\cp_mp\utility\game_utility::gettimepassed(), "t3_cost", var_1601c1f95d06209a]);
    }
    function_ff3e705ec08c840();
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71e9
// Size: 0xb2
function function_2e9bd87bf55528f9() {
    if (!istrue(level.var_606eb45e074ff204)) {
        return;
    }
    if (isdefined(level.var_952400f520b7f68d)) {
        return;
    }
    if (isdefined(self.pers["perkPackageTier3State"])) {
        giveperk(self.var_15f3e5df722faf9c);
        self.pers["perkPackageTier3State"] = 2;
        if (istrue(level.var_3f893c812b909915)) {
            scripts\mp\perks\perkfunctions::function_6964a0e0e8d00b09(self.var_15f3e5df722faf9c);
        }
        var_1601c1f95d06209a = level.var_5cdaa841f503d45a;
        self dlog_recordplayerevent("dlog_event_mp_perk_tier3_activate", ["match_time", scripts\cp_mp\utility\game_utility::gettimepassed(), "t3_cost", var_1601c1f95d06209a]);
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a3
// Size: 0x7d
function function_2cb1405f41491297(amount) {
    if (!isplayer(self)) {
        return;
    }
    if (!istrue(level.var_606eb45e074ff204)) {
        return;
    }
    if (isdefined(level.var_952400f520b7f68d)) {
        return;
    }
    if (!isdefined(self.pers["perkPackageProgress"])) {
        self.pers["perkPackageProgress"] = 0;
    }
    self.pers["perkPackageProgress"] = self.pers["perkPackageProgress"] + amount;
    function_ff3e705ec08c840();
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7328
// Size: 0x7e
function function_ff3e705ec08c840() {
    perkPackageProgress = self.pers["perkPackageProgress"] + game["perk_package_progress_global"];
    bonusprogress = perkPackageProgress / level.var_5a3318627fb4465d;
    ultimateprogress = (perkPackageProgress - level.var_5a3318627fb4465d) / (level.var_5cdaa841f503d45a - level.var_5a3318627fb4465d);
    self setclientomnvar("ui_perk_bonus_progress", bonusprogress);
    self setclientomnvar("ui_perk_ultimate_progress", ultimateprogress);
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73ae
// Size: 0x64
function function_b30e1c92800e9f5f() {
    if (!istrue(level.var_606eb45e074ff204)) {
        return false;
    }
    if (isdefined(level.var_952400f520b7f68d)) {
        return false;
    }
    if (self.var_4c6852d3c7765d04 >= level.var_f36dcecdebe6160b && isdefined(self.pers["perkPackageTier3State"]) && self.pers["perkPackageTier3State"] == 1) {
        return true;
    }
    return false;
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741b
// Size: 0x82
function function_7ef2f6d740da9325() {
    if (!isdefined(self.pers["perkPackageProgress"])) {
        self.pers["perkPackageProgress"] = 0;
    }
    if (!isdefined(self.pers["perkPackageTier3State"])) {
        self.pers["perkPackageTier3State"] = 0;
    }
    if (!isdefined(self.pers["perkPackageTier2Earned"])) {
        self.pers["perkPackageTier2Earned"] = 0;
    }
    if (!isdefined(game["perk_package_progress_global"])) {
        game["perk_package_progress_global"] = 0;
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a5
// Size: 0xbb
function function_7a60d901339410(amount) {
    if (!isdefined(amount)) {
        amount = 0;
    }
    foreach (player in level.players) {
        player.pers["perkPackageTier2Earned"] = 0;
        player.pers["perkPackageTier3State"] = 0;
        player.pers["perkPackageProgress"] = amount;
        self setclientomnvar("ui_perk_bonus_splash", 0);
        self setclientomnvar("ui_perk_ultimate_splash", 0);
        player function_f2dbab6f947771f2();
    }
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7568
// Size: 0x142
function function_667ec8f124fe1ab3() {
    level endon("game_ended");
    level endon("perk_package_round_switch");
    level waittill("prematch_done");
    if (level.roundswitch == 0) {
        return;
    }
    currentroundmod = game["roundsPlayed"] % level.roundswitch;
    if (istrue(level.var_63d440b3041ca2a7)) {
        if (game["roundsPlayed"] >= level.var_24b471ce5e06ff1e || level.halftimetype == "overtime") {
            game["perk_package_progress_global"] = level.var_5cdaa841f503d45a - level.var_4ad21852735184e9;
        } else if (game["roundsPlayed"] >= level.var_9c166c328fe115b7) {
            game["perk_package_progress_global"] = level.var_5a3318627fb4465d;
        } else {
            game["perk_package_progress_global"] = 0;
        }
    } else if (currentroundmod >= level.var_24b471ce5e06ff1e || level.halftimetype == "overtime") {
        game["perk_package_progress_global"] = level.var_5cdaa841f503d45a - level.var_4ad21852735184e9;
    } else if (currentroundmod >= level.var_9c166c328fe115b7) {
        game["perk_package_progress_global"] = level.var_5a3318627fb4465d;
    } else {
        game["perk_package_progress_global"] = 0;
    }
    function_7a60d901339410();
    level notify("perk_package_round_switch");
}

// Namespace perks / scripts\mp\perks\perks
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76b2
// Size: 0x29
function activatePerk(perkref) {
    self setclientomnvar("ui_perk_activation", perkref);
    self setclientomnvar("ui_perk_activation_notify", gettime());
}

// Namespace perks / scripts\mp\perks\perks
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76e3
// Size: 0x97
function function_d1a7e9b22c284b92() {
    if (isdefined(self.var_15f3e6df722fb1cf)) {
        removeperk(self.var_15f3e6df722fb1cf);
    }
    if (isdefined(self.var_15f3e5df722faf9c)) {
        removeperk(self.var_15f3e5df722faf9c);
    }
    foreach (perk in self.pers["loadoutPerks"]) {
        removeperk(perk);
    }
}

