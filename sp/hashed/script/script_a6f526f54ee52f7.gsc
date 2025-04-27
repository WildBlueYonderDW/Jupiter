#using script_4ab4bd3ef85fb34c;
#using script_53f4e6352b0b2425;
#using script_5d0aad069db3eeb8;
#using script_5d5ed488e7b712ab;
#using scripts\anim\notetracks;
#using scripts\anim\notetracks_sp;
#using scripts\common\ai;
#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\analytics;
#using scripts\sp\anim;
#using scripts\sp\door;
#using scripts\sp\hud_util;
#using scripts\sp\utility;

#namespace namespace_813e4ba6b29c9ad8;

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fd5
// Size: 0x33
function main()
{
    face();
    generic_human();
    xcams();
    script_models();
    player();
    vehicles();
    scriptables();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa010
// Size: 0x3fad
function generic_human()
{
    level.scr_animtree[ "civ" ] = #generic_human;
    level.scr_anim[ "civ" ][ "civ_jup_fake_pnc_run" ][ 0 ] = generic_human#civ_jup_fake_pnc_run01;
    level.scr_anim[ "infil_civ01" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_runfront_civ03;
    addnotetrack_customfunction( "infil_civ01", "scn_fb_intro_24_walla_woman_near_miss_01", &function_9af9f1486a47aafe );
    level.scr_anim[ "infil_civ02" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_running1_civ05;
    level.scr_anim[ "infil_civ03" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_running2_civ06;
    addnotetrack_customfunction( "infil_civ03", "scn_fb_intro_23_walla_ramp_stumbler_01", &function_69d13f4a43b8132c );
    level.scr_anim[ "infil_civ04" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_running3_femaleciv03;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_driver_male" ][ "passenger_infil_crash" ] = generic_human#fbk_0110_outside_drive_crash_civ01;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_driver_female" ][ "passenger_infil_crash" ] = generic_human#fbk_0110_outside_drive_crash_civ01;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_male" ][ "passenger_infil_crash" ] = generic_human#fbk_0110_outside_drive_crash_civ02;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_female" ][ "passenger_infil_crash" ] = generic_human#fbk_0110_outside_drive_crash_civ02;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_male" ][ "outside_driver" ] = generic_human#fbk_0110_outside_drive_driver_civ04;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_female" ][ "outside_driver" ] = generic_human#fbk_0110_outside_drive_driver_civ04;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_hatch1985_driver;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_hatch1985_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_hatch1985_pass;
    level.scr_anim[ "veh9_civ_lnd_sedan_hatchback_1985_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_hatch1985_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_hatch_small_2015_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_hatchsmall_driver;
    level.scr_anim[ "veh9_civ_lnd_hatch_small_2015_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_hatchsmall_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_hatch_small_2015_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_hatchsmall_pass;
    level.scr_anim[ "veh9_civ_lnd_hatch_small_2015_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_hatchsmall_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_ralfa_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_ralfa_driver;
    level.scr_anim[ "veh9_civ_lnd_ralfa_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_ralfa_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_ralfa_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_ralfa_pass;
    level.scr_anim[ "veh9_civ_lnd_ralfa_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_ralfa_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_secho_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_secho_driver;
    level.scr_anim[ "veh9_civ_lnd_secho_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_secho_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_secho_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_secho_pass;
    level.scr_anim[ "veh9_civ_lnd_secho_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_secho_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_driver;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_male" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ04_f;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_driver_female" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ04_f;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_pass;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_police_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_driver;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_police_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_police_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_pass;
    level.scr_anim[ "veh9_civ_lnd_sedan_2009_police_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_sedan_pass_fem;
    level.scr_anim[ "veh9_ind_lnd_delivery_box_truck_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_truck_driver;
    level.scr_anim[ "veh9_ind_lnd_delivery_box_truck_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_truck_driver_fem;
    level.scr_anim[ "veh9_ind_lnd_delivery_box_truck_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_truck_pass;
    level.scr_anim[ "veh9_ind_lnd_delivery_box_truck_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_truck_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_van_palfa_ambulance_ru_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_ambulance_driver;
    level.scr_anim[ "veh9_civ_lnd_van_palfa_ambulance_ru_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_ambulance_driver;
    level.scr_anim[ "veh9_civ_lnd_van_small_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_van_driver;
    level.scr_anim[ "veh9_civ_lnd_van_small_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_van_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_van_small_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_van_pass;
    level.scr_anim[ "veh9_civ_lnd_van_small_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_van_pass_fem;
    level.scr_anim[ "veh9_civ_lnd_station_wagon_driver_male" ][ "passenger_infil" ] = generic_human#fbk_0115_wagon_driver;
    level.scr_anim[ "veh9_civ_lnd_station_wagon_driver_female" ][ "passenger_infil" ] = generic_human#fbk_0115_wagon_driver_fem;
    level.scr_anim[ "veh9_civ_lnd_station_wagon_passenger_male" ][ "passenger_infil" ] = generic_human#fbk_0115_wagon_pass;
    level.scr_anim[ "veh9_civ_lnd_station_wagon_passenger_female" ][ "passenger_infil" ] = generic_human#fbk_0115_wagon_pass_fem;
    level.scr_anim[ "makarov" ][ "garage_ambulance_hide" ] = generic_human#fbk_0170_garage_ambulance_hide_makrov;
    level.scr_anim[ "ambulace_enemy" ][ "garage_ambulance_hide" ] = generic_human#fbk_0170_garage_ambulance_hide_enmy;
    level.scr_anim[ "redshirt" ][ "fbk_0190_vehicle_exit" ] = generic_human#fbk_0190_garage_exit_ally01;
    level.scr_anim[ "price" ][ "fbk_0190_vehicle_exit" ] = generic_human#fbk_0190_garage_exit_price;
    level.scr_anim[ "price" ][ "fbk_0190_idle" ][ 0 ] = generic_human#fbk_0190_garage_exit_idle_price;
    level.scr_anim[ "price" ][ "fbk_0190_idle_nag" ] = generic_human#fbk_0190_garage_exit_nag_price;
    level.scr_anim[ "slaughter_police01" ][ "fbk_0185" ] = generic_human#fbk_0185_garage_exit_police01;
    level.scr_anim[ "slaughter_police02" ][ "fbk_0185" ] = generic_human#fbk_0185_garage_exit_police02;
    level.scr_anim[ "civ01" ][ "fbk_0185" ] = generic_human#fbk_0185_garage_exit_civ01;
    level.scr_anim[ "civ02" ][ "fbk_0185" ] = generic_human#fbk_0185_garage_exit_civ02;
    level.scr_anim[ "civ03" ][ "fbk_0185" ] = generic_human#fbk_0185_garage_exit_civ03;
    
    if ( getdvarint( @"hash_89c443a4a13df521", 1 ) > 0 )
    {
        addnotetrack_customfunction( "civ01", "bullet_impact", &function_df60914dce68798, "fbk_0185" );
        addnotetrack_customfunction( "civ02", "bullet_impact", &function_df60914dce68798, "fbk_0185" );
        addnotetrack_customfunction( "civ03", "bullet_impact", &function_df60914dce68798, "fbk_0185" );
        addnotetrack_customfunction( "civ03", "headshot", &squib_head, "fbk_0185" );
    }
    
    level.scr_anim[ "police01" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_police01;
    level.scr_anim[ "police01" ][ "fbk_0200_idle" ][ 0 ] = generic_human#fbk_0200_p1stairs_police_kill_idle_police01;
    level.scr_anim[ "police01" ][ "fbk_0200_death" ] = generic_human#fbk_0200_p1stairs_police_kill_death_police01;
    level.scr_anim[ "police02" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_police02;
    level.scr_anim[ "civ01" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_civ03;
    level.scr_anim[ "civ02" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_civ04;
    level.scr_anim[ "civ03" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_civ06;
    level.scr_anim[ "civ04" ][ "fbk_0200" ] = generic_human#fbk_0200_p1stairs_police_kill_civ07;
    level.scr_anim[ "redshirt" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_start_ally01;
    level.scr_anim[ "price" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_start_price;
    level.scr_anim[ "soap" ][ "fbk_0110" ] = generic_human#fbk_0110_outside_drive_start_soap;
    level.scr_anim[ "redshirt" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_ally01;
    level.scr_anim[ "price" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_price;
    level.scr_anim[ "civ01" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ01;
    level.scr_anim[ "civ01_f" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ01_f;
    level.scr_anim[ "civ02" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ02;
    addnotetrack_customfunction( "civ02", "scn_fb_intro_26_walla_garage_civ_2_01", &function_65961260db043491 );
    level.scr_anim[ "civ02_f" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ02_f;
    level.scr_anim[ "civ03" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ03;
    level.scr_anim[ "civ03_f" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ03_f;
    level.scr_anim[ "civ04" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ04;
    level.scr_anim[ "civ04_f" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ04_f;
    level.scr_anim[ "civ05" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ05;
    addnotetrack_customfunction( "civ05", "scn_fb_intro_29_walla_witness_hit_by_car_01", &function_ad47635c5fbe4845 );
    level.scr_anim[ "civ06" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ06;
    level.scr_anim[ "civ07" ][ "fbk_0150" ] = generic_human#fbk_0150_garage_drive_civ07;
    level.scr_anim[ "price" ][ "p1stairs_shield_fast_enter" ] = generic_human#fbk_0210_p1stairs_shield_fast_enter_price;
    level.scr_anim[ "price" ][ "p1stairs_shield_enter" ] = generic_human#fbk_0210_p1stairs_shield_enter_price;
    level.scr_anim[ "price" ][ "p1stairs_shield_enter_idle" ][ 0 ] = generic_human#fbk_0210_p1stairs_shield_enter_idle_price;
    level.scr_anim[ "price" ][ "p1stairs_shield_enter_idle_nags" ][ 0 ] = generic_human#fbk_0210_p1stairs_shield_enter_nag_price;
    level.scr_anim[ "price" ][ "p1stairs_shield_enter_idle_exit" ] = generic_human#fbk_0210_p1stairs_shield_enter_idle_exit_price;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_enter" ] = generic_human#fbk_0210_p1stairs_shield_enter_enmy01;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_enter_idle" ][ 0 ] = generic_human#fbk_0210_p1stairs_shield_enter_idle_enmy01;
    level.scr_anim[ "price" ][ "p1stairs_shield_intro" ] = generic_human#fbk_0210_p1stairs_shield_intro_price;
    level.scr_goaltime[ "price" ][ "p1stairs_shield_intro" ] = 0;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_intro" ] = generic_human#fbk_0210_p1stairs_shield_intro_enmy01;
    addnotetrack_flag( "price", "pre_shield_shoot", "nt_price_pre_shield_shoot", "p1stairs_shield_intro" );
    addnotetrack_flag( "price", "spotted_enemies_top", "nt_price_spotted_police02", "p1stairs_shield_intro" );
    addnotetrack_flag( "price", "reached_stairs_top", "nt_p1stairs_price_at_top", "p1stairs_shield_intro" );
    level.scr_anim[ "price" ][ "p1stairs_shield_idle" ][ 0 ] = generic_human#fbk_0210_p1stairs_shield_idle_price;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_idle" ][ 0 ] = generic_human#fbk_0210_p1stairs_shield_idle_enmy01;
    level.scr_anim[ "price" ][ "p1stairs_shield_shoot01" ] = generic_human#fbk_0210_p1stairs_shield_shoot_price;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_shot01" ] = generic_human#fbk_0210_p1stairs_shield_shoot_enmy01;
    level.scr_anim[ "price" ][ "p1stairs_shield_shoot02" ] = generic_human#fbk_0210_p1stairs_shield_shoot02_price;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_shot02" ] = generic_human#fbk_0210_p1stairs_shield_shoot02_enmy01;
    level.scr_anim[ "price" ][ "p1stairs_shield_exit" ] = generic_human#fbk_0210_p1stairs_shield_exit_price;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_exit" ] = generic_human#fbk_0210_p1stairs_shield_exit_enmy01;
    level.scr_anim[ "infil_police01" ][ "p1stairs_shield_exit_nag" ] = generic_human#fbk_0210_p1stairs_shield_exit_nag_price;
    level.scr_animtree[ "makarov" ] = #generic_human;
    level.scr_anim[ "makarov" ][ "crouch_arrival" ] = generic_human#civ_cctv_exposed_crouch_jog_arrival_l_1;
    level.scr_anim[ "makarov" ][ "crouch_exposed_idle" ][ 0 ] = generic_human#civ_cctv_exposed_crouch_hide_idle01;
    level.scr_goaltime[ "makarov" ][ "crouch_exposed_idle" ] = 0.3;
    level.scr_anim[ "makarov" ][ "makarov_takedown" ] = generic_human#jup_plr_melee_takedown01_attacker;
    level.scr_anim[ "makarov" ][ "pain_crouch" ] = generic_human#exposed_crouch_pain_flinch;
    level.scr_anim[ "makarov" ][ "pain_stand" ] = generic_human#emp_stand_pain_01;
    level.scr_anim[ "infil_stairs_enemy" ][ "infil_stairs_takedown" ] = generic_human#nwr_0750_laser_building_radio_takedown_enmy03;
    level.scr_anim[ "price" ][ "infil_stairs_takedown" ] = generic_human#nwr_0750_laser_building_radio_takedown_ally01;
    level.scr_anim[ "concourse_civ" ][ "concourse_cower" ][ 0 ] = generic_human#stp_apt_stairs_cower_idle;
    level.scr_anim[ "concourse_civ01" ][ "concourse_execute" ] = generic_human#lon_pic_035_subway_executions_civ01_execute;
    level.scr_anim[ "concourse_civ01" ][ "concourse_execute_idle" ][ 0 ] = generic_human#lon_pic_035_subway_executions_civ01_idle;
    level.scr_anim[ "concourse_civ02" ][ "concourse_execute" ] = generic_human#lon_pic_035_subway_executions_civ02_execute;
    level.scr_anim[ "concourse_civ02" ][ "concourse_execute_idle" ][ 0 ] = generic_human#lon_pic_035_subway_executions_civ02_idle;
    level.scr_anim[ "concourse_enemy" ][ "concourse_execute" ] = generic_human#lon_pic_035_subway_executions_t01_execute;
    addnotetrack_customfunction( "concourse_civ01", "shot", &shot_civ, "concourse_execute" );
    addnotetrack_customfunction( "concourse_civ02", "shot", &shot_civ, "concourse_execute" );
    level.scr_anim[ "concourse_civ01" ][ "concourse_die" ] = generic_human#sdr_com_exposed_crouch_death01_midbody_md_4;
    level.scr_anim[ "concourse_civ02" ][ "concourse_die" ] = generic_human#sdr_com_exposed_crouch_death01_midbody_md_4;
    level.scr_anim[ "enemy01" ][ "concourse_restaurant_enter" ] = generic_human#fbk_0240_concourse_restaurant_enter_enmy01;
    level.scr_anim[ "civ01" ][ "concourse_restaurant_enter" ] = generic_human#fbk_0240_concourse_restaurant_enter_civ01;
    level.scr_anim[ "enemy01" ][ "concourse_restaurant_idle" ][ 0 ] = generic_human#fbk_0240_concourse_restaurant_idle_enmy01;
    level.scr_anim[ "enemy01" ][ "concourse_restaurant_exit" ] = generic_human#fbk_0240_concourse_restaurant_exit_enmy01;
    addnotetrack_customfunction( "enemy01", "no_return_fire", &function_8b8be590f74c7c13, "concourse_restaurant_enter" );
    level.scr_anim[ "enemy01" ][ "fbk_0275_enter" ] = generic_human#fbk_0275_concourse_hostage_enter_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_enter" ] = generic_human#fbk_0275_concourse_hostage_enter_civ01;
    level.scr_anim[ "enemy01" ][ "fbk_0275_idle" ][ 0 ] = generic_human#fbk_0275_concourse_hostage_idle_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_idle" ][ 0 ] = generic_human#fbk_0275_concourse_hostage_idle_civ01;
    level.scr_anim[ "enemy01" ][ "fbk_0275_enemy_shoot" ] = generic_human#fbk_0275_concourse_hostage_shoot01_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_enemy_shoot" ] = generic_human#fbk_0275_concourse_hostage_shoot01_civ01;
    addnotetrack_flag( "enemy01", "start_shooting", "nt_fbk_0275_start_shooting", "fbk_0275_enemy_shoot" );
    addnotetrack_flag( "enemy01", "stop_shooting", "nt_fbk_0275_stop_shooting", "fbk_0275_enemy_shoot" );
    level.scr_anim[ "enemy01" ][ "fbk_0275_enemy_death_civ_live" ] = generic_human#fbk_0275_concourse_hostage_enmydeath_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_enemy_death_civ_live" ] = generic_human#fbk_0275_concourse_hostage_enmydeath_civ01;
    level.scr_anim[ "enemy01" ][ "fbk_0275_enemy_dead_civ_dead" ] = generic_human#fbk_0275_concourse_hostage_bothdeath_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_enemy_dead_civ_dead" ] = generic_human#fbk_0275_concourse_hostage_bothdeath_civ01;
    level.scr_anim[ "enemy01" ][ "fbk_0275_plr_killed_civ" ] = generic_human#fbk_0275_concourse_hostage_civdeath_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_plr_killed_civ" ] = generic_human#fbk_0275_concourse_hostage_civdeath_civ01;
    level.scr_anim[ "enemy01" ][ "fbk_0275_enemy_killed_civ" ] = generic_human#fbk_0275_concourse_hostage_execution_enmy01;
    level.scr_anim[ "civ01" ][ "fbk_0275_enemy_killed_civ" ] = generic_human#fbk_0275_concourse_hostage_execution_civ01;
    level.scr_anim[ "civ01" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_death_civ08;
    addnotetrack_customfunction( "civ01", "backshot", &function_df60914dce68798, "fbk_0290_slowdeath" );
    level.scr_anim[ "civ02" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_death_civ09;
    addnotetrack_customfunction( "civ02", "backshot", &function_df60914dce68798, "fbk_0290_slowdeath" );
    level.scr_anim[ "civ03" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_death_civ10;
    addnotetrack_customfunction( "civ03", "backshot", &function_df60914dce68798, "fbk_0290_slowdeath" );
    addnotetrack_customfunction( "civ03", "headshot", &squib_head, "fbk_0290_slowdeath" );
    level.scr_anim[ "cop01" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_slowdeath_cop02;
    level.scr_anim[ "cop02" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_slowdeath_cop03;
    level.scr_anim[ "survivor01" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_alive_civ_f01;
    level.scr_anim[ "survivor02" ][ "fbk_0290_slowdeath" ] = generic_human#fbk_0290_concourse_end_door_alive_civ01;
    level.scr_anim[ "survivor01" ][ "fbk_0290_slowdeath_killed" ] = generic_human#fbk_0290_concourse_end_door_death_civ_f01;
    addnotetrack_customfunction( "survivor01", "backshot", &function_df60914dce68798, "fbk_0290_slowdeath_killed" );
    level.scr_anim[ "survivor02" ][ "fbk_0290_slowdeath_killed" ] = generic_human#fbk_0290_concourse_end_door_death_civ01;
    addnotetrack_customfunction( "survivor02", "headshot", &squib_head, "fbk_0290_slowdeath_killed" );
    addnotetrack_flag( "cop01", "NO_RETURN_FIRE", "nt_fbk_0290_no_return", "fbk_0290_slowdeath" );
    addnotetrack_customfunction( "cop01", "NO_RETURN_FIRE", &scripted_fire, "fbk_0290_slowdeath" );
    level.scr_anim[ "civ01" ][ "concourse_stairs_first_floor" ] = generic_human#fbk_0300_constairs_civ_attack_1f_civ01;
    level.scr_anim[ "civ02" ][ "concourse_stairs_first_floor" ] = generic_human#fbk_0300_constairs_civ_attack_1f_civ02;
    level.scr_anim[ "civ01" ][ "concourse_stairs_second_floor" ] = generic_human#fbk_0300_constairs_civ_attack_2f_civ01;
    level.scr_anim[ "civ02" ][ "concourse_stairs_second_floor" ] = generic_human#fbk_0300_constairs_civ_attack_2f_civ02;
    level.scr_anim[ "civ01" ][ "concourse_stairs_third_floor" ] = generic_human#fbk_0300_constairs_civ_attack_3f_civ01;
    level.scr_anim[ "civ02" ][ "concourse_stairs_third_floor" ] = generic_human#fbk_0300_constairs_civ_attack_3f_civ02;
    level.scr_anim[ "civ03" ][ "concourse_stairs_third_floor" ] = generic_human#fbk_0300_constairs_civ_attack_3f_civ03;
    level.scr_anim[ "civ04" ][ "concourse_stairs_third_floor" ] = generic_human#fbk_0300_constairs_civ_attack_3f_civ04;
    level.scr_anim[ "civ05" ][ "concourse_stairs_third_floor" ] = generic_human#fbk_0300_constairs_civ_attack_3f_civ05;
    level.scr_anim[ "left_01_female" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_fem01;
    level.scr_anim[ "left_02_male" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_civ03;
    level.scr_anim[ "left_03_female" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_civ04;
    level.scr_anim[ "right_01_female" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_civ05;
    level.scr_anim[ "right_02_male" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_civ01;
    level.scr_anim[ "right_03_male" ][ "loop" ] = generic_human#fbk_0300_constairs_civ_attack_loop_civ02;
    level.scr_anim[ "left_01_female" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_fem01;
    level.scr_anim[ "left_02_male" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_civ03;
    level.scr_anim[ "left_03_female" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_civ04;
    level.scr_anim[ "right_01_female" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_civ05;
    level.scr_anim[ "right_02_male" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_civ01;
    level.scr_anim[ "right_03_male" ][ "exit" ] = generic_human#fbk_0300_constairs_civ_attack_exit_civ02;
    level.scr_anim[ "civ01" ][ "fourth_floor_civ_kick" ] = generic_human#fbk_0300_constairs_civ_attack_4f_civ01;
    level.scr_anim[ "enemy01" ][ "fourth_floor_civ_kick" ] = generic_human#fbk_0300_constairs_civ_attack_4f_enmy01;
    level.scr_anim[ "enemy02" ][ "fourth_floor_hostage_intro" ] = generic_human#fbk_0300_constairs_civ_attack_4f_intro_enmy02;
    level.scr_anim[ "civ02" ][ "fourth_floor_hostage_intro" ] = generic_human#fbk_0300_constairs_civ_attack_4f_intro_civ02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_loop" ][ 0 ] = generic_human#fbk_0300_constairs_civ_attack_4f_idle_enmy02;
    level.scr_anim[ "civ02" ][ "constairs_hostage_aim_idle" ][ 0 ] = generic_human#fbk_0300_constairs_civ_attack_4f_idle_civ02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_fire" ] = generic_human#fbk_0300_constairs_civ_attack_4f_shoot_enmy02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_2_knob" ] = generic_human#constairs_hostage_aim_2;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_2" ] = generic_human#fbk_0300_constairs_civ_attack_4f_aim2_enmy02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_4_knob" ] = generic_human#constairs_hostage_aim_4;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_4" ] = generic_human#fbk_0300_constairs_civ_attack_4f_aim4_enmy02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_5" ] = generic_human#fbk_0300_constairs_civ_attack_4f_idle_enmy02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_6_knob" ] = generic_human#constairs_hostage_aim_6;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_6" ] = generic_human#fbk_0300_constairs_civ_attack_4f_aim6_enmy02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_8_knob" ] = generic_human#constairs_hostage_aim_8;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_aim_8" ] = generic_human#fbk_0300_constairs_civ_attack_4f_aim8_enmy02;
    level.scr_anim[ "enemy02" ][ "fourth_floor_hostage_save" ] = generic_human#fbk_0300_constairs_civ_attack_4f_save_enmy02;
    level.scr_anim[ "civ02" ][ "fourth_floor_hostage_save" ] = generic_human#fbk_0300_constairs_civ_attack_4f_save_civ02;
    level.scr_anim[ "civ02" ][ "fourth_floor_hostage_save_idle" ][ 0 ] = generic_human#fbk_0300_constairs_civ_attack_4f_save_idle_civ02;
    level.scr_anim[ "enemy02" ][ "fourth_floor_hostage_execute" ] = generic_human#fbk_0300_constairs_civ_attack_4f_killed_enmy02;
    level.scr_anim[ "civ02" ][ "fourth_floor_hostage_execute" ] = generic_human#fbk_0300_constairs_civ_attack_4f_killed_civ02;
    level.scr_anim[ "enemy02" ][ "" ] = generic_human#fbk_0300_constairs_civ_attack_4f_allkilled_enmy02;
    level.scr_anim[ "civ02" ][ "" ] = generic_human#fbk_0300_constairs_civ_attack_4f_allkilled_civ02;
    level.scr_anim[ "enemy02" ][ "constairs_hostage_execute" ] = generic_human#fbk_0300_constairs_civ_attack_4f_execute_enmy02;
    level.scr_anim[ "civ02" ][ "constairs_hostage_execute" ] = generic_human#fbk_0300_constairs_civ_attack_4f_execute_civ02;
    level.scr_anim[ "price" ][ "concourse_stairs_top_open" ] = generic_human#fbk_0320_constairs_door_halliganopen_price;
    addnotetrack_customfunction( "price", "door_unlocked", &function_c4a3717ad61c9efe, "concourse_stairs_top_open" );
    addnotetrack_customfunction( "price", "haligan_pickup", &grab_halligan );
    addnotetrack_customfunction( "price", "haligan_stow", &stow_halligan );
    addnotetrack_customfunction( "price", "light_on", &function_98bd8493a41bef9f );
    addnotetrack_customfunction( "price", "light_off", &function_4dd79b1e996e523 );
    level.scr_goaltime[ "makarov" ][ "first_person_mak_attack" ] = 0;
    level.scr_anim[ "makarov" ][ "first_person_mak_attack" ] = generic_human#fbk_0510_garage_makarov_takedown_mak;
    level.scr_anim[ "price" ][ "elevator_intro" ] = generic_human#fbk_0400_clubhouse_elevator_intro_price;
    level.scr_goaltime[ "price" ][ "elevator_intro" ] = 0.4;
    level.scr_anim[ "price" ][ "elevator_idle" ][ 0 ] = generic_human#fbk_0400_clubhouse_elevator_idle_price;
    level.scr_anim[ "price" ][ "elevator_idle_nags" ][ 0 ] = generic_human#fbk_0400_clubhouse_elevator_nag1_price;
    level.scr_anim[ "price" ][ "elevator_open_enter" ] = generic_human#fbk_0400_clubhouse_elevator_open_enter_price;
    level.scr_anim[ "price" ][ "elevator_open_enter_early" ] = generic_human#fbk_0400_clubhouse_elevator_plr_open_enter_price;
    level.scr_anim[ "price" ][ "elevator_open" ] = generic_human#fbk_0400_clubhouse_elevator_open_price;
    level.scr_goaltime[ "price" ][ "elevator_open" ] = 0;
    level.scr_anim[ "price" ][ "elevator_go" ] = generic_human#fbk_0400_clubhouse_elevator_exit_price;
    level.scr_anim[ "price" ][ "truck_cover_arrive" ] = generic_human#fbk_0700_garage_gate_cover_enter_price;
    level.scr_anim[ "makarov" ][ "truck_cover_arrive" ] = generic_human#fbk_0700_garage_gate_cover_enter_makarov;
    level.scr_anim[ "price" ][ "truck_cover_idle" ][ 0 ] = generic_human#fbk_0700_garage_gate_cover_idle_price;
    level.scr_anim[ "makarov" ][ "truck_cover_idle" ][ 0 ] = generic_human#fbk_0700_garage_gate_cover_idle_makarov;
    level.scr_anim[ "price" ][ "truck_cover_shoot" ] = generic_human#fbk_0700_garage_gate_cover_shoot_price;
    level.scr_anim[ "makarov" ][ "truck_cover_shoot" ] = generic_human#fbk_0700_garage_gate_cover_shoot_makarov;
    level.scr_anim[ "price" ][ "gate_arrive" ] = generic_human#fbk_0700_garage_gate_intro_price;
    level.scr_anim[ "price" ][ "gate_arrive_idle" ][ 0 ] = generic_human#fbk_0700_garage_gate_intro_idle_price;
    level.scr_anim[ "price" ][ "gate_arrive_idle_nags" ][ 0 ] = generic_human#fbk_0700_garage_gate_intro_nag_price;
    level.scr_anim[ "makarov" ][ "gate_arrive" ] = generic_human#fbk_0700_garage_gate_intro_makarov;
    level.scr_anim[ "makarov" ][ "gate_arrive_idle" ][ 0 ] = generic_human#fbk_0700_garage_gate_intro_idle_makarov;
    level.scr_anim[ "price" ][ "gate_open" ] = generic_human#fbk_0700_garage_gate_price;
    level.scr_anim[ "makarov" ][ "gate_open" ] = generic_human#fbk_0700_garage_gate_makarov;
    level.scr_anim[ "price" ][ "fbk_0360_price_to_door" ] = generic_human#fbk_0360_clubhouse_conflict_enter_price;
    level.scr_anim[ "price" ][ "fbk_0360_price_idle_door" ][ 0 ] = generic_human#fbk_0360_clubhouse_conflict_enter_idle_price;
    level.scr_anim[ "price" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_price;
    level.scr_anim[ "redshirt" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_ally01;
    level.scr_anim[ "enemy01" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_enmy01;
    level.scr_anim[ "enemy02" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_enmy02;
    level.scr_anim[ "enemy03" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_enmy03;
    level.scr_anim[ "enemy04" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_enmy04;
    level.scr_anim[ "enemy05" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_enmy05;
    level.scr_anim[ "civ01" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_civ01;
    level.scr_anim[ "civ02" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_civ02;
    level.scr_anim[ "civ03" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_civ03;
    level.scr_anim[ "civ04" ][ "fbk_0360_intro" ] = generic_human#fbk_0360_clubhouse_conflict_civ04;
    level.scr_anim[ "redshirt" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_ally01;
    level.scr_goaltime[ "redshirt" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "enemy01" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_enmy01;
    level.scr_goaltime[ "enemy01" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "enemy02" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_enmy02;
    level.scr_goaltime[ "enemy02" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "enemy04" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_enmy04;
    level.scr_goaltime[ "enemy04" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "enemy05" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_enmy05;
    level.scr_goaltime[ "enemy05" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "enemy06" ][ "fbk_0360_react" ] = generic_human#fbk_0360_clubhouse_conflict_react_enmy06;
    level.scr_goaltime[ "enemy06" ][ "fbk_0360_react" ] = 0;
    level.scr_anim[ "price" ][ "fbk_0360_react_dynamic" ] = generic_human#fbk_0360_clubhouse_conflict_react02_price;
    level.scr_anim[ "redshirt" ][ "fbk_0360_react_dynamic" ] = generic_human#fbk_0360_clubhouse_conflict_react02_ally01;
    level.scr_anim[ "enemy01" ][ "fbk_0360_react_dive_death" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy01;
    level.scr_anim[ "enemy02" ][ "fbk_0360_react_crouch_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy02;
    level.scr_anim[ "enemy03" ][ "fbk_0360_react_toss_ar_into_ar" ] = generic_human#fbk_0360_clubhouse_conflict_react01_enmy03;
    level.scr_goaltime[ "enemy04" ][ "fbk_0360_react_toss_ar_into_ar" ] = 0;
    level.scr_anim[ "enemy03" ][ "fbk_0360_react_stand_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy03;
    level.scr_anim[ "enemy03" ][ "fbk_0360_react_walk_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy03;
    level.scr_anim[ "enemy04" ][ "fbk_0360_react_toss_ar_into_ar" ] = generic_human#fbk_0360_clubhouse_conflict_react01_enmy04;
    level.scr_goaltime[ "enemy03" ][ "fbk_0360_react_toss_ar_into_ar" ] = 0;
    level.scr_anim[ "enemy04" ][ "fbk_0360_react_stand_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy04;
    level.scr_anim[ "enemy04" ][ "fbk_0360_react_walk_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy04;
    level.scr_anim[ "enemy05" ][ "fbk_0360_react_walk_pistol" ] = generic_human#fbk_0360_clubhouse_conflict_react02_enmy05;
    addnotetrack_flag( "enemy03", "gun_throw_start", "nt_lure_ambush_gun_throw_start", "fbk_0360_react_toss_ar_into_ar" );
    addnotetrack_flag( "enemy04", "gun_throw_end", "nt_lure_ambush_gun_throw_end", "fbk_0360_react_toss_ar_into_ar" );
    level.scr_anim[ "price" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_price;
    level.scr_anim[ "redshirt" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_ally01;
    level.scr_anim[ "enemy01" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enmy01;
    level.scr_anim[ "enemy02" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enmy02;
    level.scr_goaltime[ "enemy02" ][ "lure_ambush" ] = 0;
    level.scr_anim[ "enemy02" ][ "lure_ambush_enter" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enter_enmy02;
    level.scr_anim[ "enemy03" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enmy03;
    level.scr_anim[ "enemy04" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enmy04;
    level.scr_anim[ "enemy05" ][ "lure_ambush" ] = generic_human#fbk_0360_clubhouse_conflict_ambush_enmy05;
    addnotetrack_customfunction( "enemy02", "hit_player", &function_533ef0489fd0d893, "lure_ambush" );
    addnotetrack_flag( "enemy02", "price_turnaround", "nt_lure_ambush_price_turnaround", "lure_ambush" );
    addnotetrack_flag( "enemy02", "hit_player", "nt_lure_ambush_hit_player", "lure_ambush" );
    addnotetrack_flag( "enemy02", "grab_player", "nt_lure_ambush_grab_player", "lure_ambush" );
    addnotetrack_customfunction( "enemy02", "headshot", &squib_head, "lure_ambush" );
    level.scr_anim[ "price" ][ "penthouse_bomb" ] = generic_human#fbk_0370_clubhouse_exit_price;
    level.scr_anim[ "redshirt" ][ "penthouse_bomb" ] = generic_human#fbk_0370_clubhouse_exit_ally01;
    addnotetrack_customfunction( "price", "price_at_door", &function_8bccb5c6c5858c48, "penthouse_bomb" );
    level.scr_anim[ "civ_executer" ][ "civ_execution" ] = generic_human#fbk_0220_concourse_civ_execute_police;
    level.scr_anim[ "civ_executee" ][ "civ_execution" ] = generic_human#fbk_0220_concourse_civ_execute_civ;
    level.scr_anim[ "civ_executee" ][ "civ_execution_long_death" ] = generic_human#fbk_0220_concourse_civ_execute_long_death_civ;
    level.scr_anim[ "civ_hanger" ][ "civ_hang" ] = generic_human#fbk_0285_concourse_civ_hang;
    level.scr_anim[ "cpr_runner" ][ "cpr_enter" ] = generic_human#fbk_0230_concourse_civ_cpr_start_civ03;
    level.scr_anim[ "cpr_killed_civ" ][ "cpr_enter" ] = generic_human#fbk_0230_concourse_civ_cpr_start_civ04;
    level.scr_anim[ "cpr_runner" ][ "cpr_idle" ][ 0 ] = generic_human#fbk_0230_concourse_civ_cpr_idol_civ03;
    level.scr_anim[ "cpr_killed_civ" ][ "cpr_idle" ][ 0 ] = generic_human#fbk_0230_concourse_civ_cpr_idol_civ04;
    level.scr_anim[ "cpr_runner" ][ "cpr_exit" ] = generic_human#fbk_0230_concourse_civ_cpr_end_civ03;
    level.scr_anim[ "cpr_killed_civ" ][ "cpr_exit" ] = generic_human#fbk_0230_concourse_civ_cpr_end_civ04;
    level.scr_anim[ "civ_recorder" ][ "civ_record" ] = generic_human#fbk_0235_concourse_civ_record_civ01;
    level.scr_anim[ "civ_recorder" ][ "civ_record_idle" ][ 0 ] = generic_human#fbk_0235_concourse_civ_record_idle_civ01;
    level.scr_anim[ "price" ][ "civ_rescue_enter" ] = generic_human#fbk_0280_concourse_price_rescue_enter_price;
    level.scr_anim[ "civ" ][ "civ_rescue_enter" ] = generic_human#fbk_0280_concourse_price_rescue_enter_civ01;
    level.scr_anim[ "price" ][ "civ_rescue_idle" ][ 0 ] = generic_human#fbk_0280_concourse_price_rescue_idle_price;
    level.scr_anim[ "civ" ][ "civ_rescue_idle" ][ 0 ] = generic_human#fbk_0280_concourse_price_rescue_idle_civ01;
    level.scr_anim[ "civ" ][ "civ_rescue_safe_idle" ][ 0 ] = generic_human#fbk_0280_concourse_price_rescue_safe_idle_civ01;
    level.scr_anim[ "price" ][ "civ_rescue" ] = generic_human#fbk_0280_concourse_price_rescue_price;
    level.scr_anim[ "civ" ][ "civ_rescue" ] = generic_human#fbk_0280_concourse_price_rescue_civ01;
    addnotetrack_customfunction( "price", "shoot_enemy01", &function_e42906399edfe536, "civ_rescue" );
    addnotetrack_customfunction( "price", "shoot_enemy02", &function_e42905399edfe303, "civ_rescue" );
    level.scr_animtree[ "burnt_body" ] = #generic_human;
    level.scr_model[ "burnt_body" ] = "burntbody_male";
    level.scr_anim[ "burnt_body" ][ "death" ] = generic_human#iw9_veh_suv_sedan_hatchback_1985_seat_1_death;
    level.scr_anim[ "enemy02" ][ "ambulance_10_dead" ] = generic_human#fbk_0500_igc_capture_sh010_enmy02;
    level.scr_anim[ "enemy01" ][ "ambulance_10_dead" ] = generic_human#fbk_0500_igc_capture_sh010_enmy01;
    level.scr_anim[ "soap" ][ "ambulance_10" ] = generic_human#fbk_0500_igc_capture_sh010_soap;
    level.scr_anim[ "price" ][ "ambulance_10" ] = generic_human#fbk_0500_igc_capture_sh010_price;
    level.scr_anim[ "makarov" ][ "ambulance_10" ] = generic_human#fbk_0500_igc_capture_sh010_makarov;
    level.scr_anim[ "soap" ][ "ambulance_15" ] = generic_human#fbk_0500_igc_capture_sh015_soap;
    level.scr_anim[ "price" ][ "ambulance_15" ] = generic_human#fbk_0500_igc_capture_sh015_price;
    level.scr_anim[ "makarov" ][ "ambulance_15" ] = generic_human#fbk_0500_igc_capture_sh015_makarov;
    level.scr_anim[ "soap" ][ "ambulance_20" ] = generic_human#fbk_0500_igc_capture_sh020_soap;
    level.scr_anim[ "price" ][ "ambulance_20" ] = generic_human#fbk_0500_igc_capture_sh020_price;
    level.scr_anim[ "makarov" ][ "ambulance_20" ] = generic_human#fbk_0500_igc_capture_sh020_makarov;
    level.scr_anim[ "soap" ][ "ambulance_25" ] = generic_human#fbk_0500_igc_capture_sh025_soap;
    level.scr_anim[ "price" ][ "ambulance_25" ] = generic_human#fbk_0500_igc_capture_sh025_price;
    level.scr_anim[ "makarov" ][ "ambulance_25" ] = generic_human#fbk_0500_igc_capture_sh025_makarov;
    level.scr_anim[ "soap" ][ "ambulance_30" ] = generic_human#fbk_0500_igc_capture_sh030_soap;
    level.scr_anim[ "price" ][ "ambulance_30" ] = generic_human#fbk_0500_igc_capture_sh030_price;
    level.scr_anim[ "makarov" ][ "ambulance_30" ] = generic_human#fbk_0500_igc_capture_sh030_makarov;
    level.scr_anim[ "soap" ][ "ambulance_35" ] = generic_human#fbk_0500_igc_capture_sh035_soap;
    level.scr_anim[ "price" ][ "ambulance_35" ] = generic_human#fbk_0500_igc_capture_sh035_price;
    level.scr_anim[ "makarov" ][ "ambulance_35" ] = generic_human#fbk_0500_igc_capture_sh035_makarov;
    level.scr_anim[ "soap" ][ "ambulance_40" ] = generic_human#fbk_0500_igc_capture_sh040_soap;
    level.scr_anim[ "price" ][ "ambulance_40" ] = generic_human#fbk_0500_igc_capture_sh040_price;
    level.scr_anim[ "makarov" ][ "ambulance_40" ] = generic_human#fbk_0500_igc_capture_sh040_makarov;
    level.scr_anim[ "soap" ][ "ambulance_45" ] = generic_human#fbk_0500_igc_capture_sh045_soap;
    level.scr_anim[ "price" ][ "ambulance_45" ] = generic_human#fbk_0500_igc_capture_sh045_price;
    level.scr_anim[ "makarov" ][ "ambulance_45" ] = generic_human#fbk_0500_igc_capture_sh045_makarov;
    level.scr_anim[ "soap" ][ "ambulance_50" ] = generic_human#fbk_0500_igc_capture_sh050_soap;
    level.scr_anim[ "price" ][ "ambulance_50" ] = generic_human#fbk_0500_igc_capture_sh050_price;
    level.scr_anim[ "makarov" ][ "ambulance_50" ] = generic_human#fbk_0500_igc_capture_sh050_makarov;
    level.scr_anim[ "soap" ][ "ambulance_55" ] = generic_human#fbk_0500_igc_capture_sh055_soap;
    level.scr_anim[ "price" ][ "ambulance_55" ] = generic_human#fbk_0500_igc_capture_sh055_price;
    level.scr_anim[ "makarov" ][ "ambulance_55" ] = generic_human#fbk_0500_igc_capture_sh055_makarov;
    level.scr_anim[ "soap" ][ "ambulance_60" ] = generic_human#fbk_0500_igc_capture_sh060_soap;
    level.scr_anim[ "price" ][ "ambulance_60" ] = generic_human#fbk_0500_igc_capture_sh060_price;
    level.scr_anim[ "makarov" ][ "ambulance_60" ] = generic_human#fbk_0500_igc_capture_sh060_makarov;
    level.scr_anim[ "soap" ][ "ambulance_65" ] = generic_human#fbk_0500_igc_capture_sh065_soap;
    level.scr_anim[ "price" ][ "ambulance_65" ] = generic_human#fbk_0500_igc_capture_sh065_price;
    level.scr_anim[ "makarov" ][ "ambulance_65" ] = generic_human#fbk_0500_igc_capture_sh065_makarov;
    level.scr_anim[ "soap" ][ "ambulance_70" ] = generic_human#fbk_0500_igc_capture_sh070_soap;
    level.scr_anim[ "price" ][ "ambulance_70" ] = generic_human#fbk_0500_igc_capture_sh070_price;
    level.scr_anim[ "makarov" ][ "ambulance_70" ] = generic_human#fbk_0500_igc_capture_sh070_makarov;
    level.scr_anim[ "soap" ][ "ambulance_75" ] = generic_human#fbk_0500_igc_capture_sh075_soap;
    level.scr_anim[ "price" ][ "ambulance_75" ] = generic_human#fbk_0500_igc_capture_sh075_price;
    level.scr_anim[ "makarov" ][ "ambulance_75" ] = generic_human#fbk_0500_igc_capture_sh075_makarov;
    level.scr_anim[ "driver" ][ "ambulance_75" ] = generic_human#fbk_0500_igc_capture_sh075_driver;
    level.scr_anim[ "soap" ][ "ambulance_80" ] = generic_human#fbk_0500_igc_capture_sh080_soap;
    level.scr_anim[ "price" ][ "ambulance_80" ] = generic_human#fbk_0500_igc_capture_sh080_price;
    level.scr_anim[ "makarov" ][ "ambulance_80" ] = generic_human#fbk_0500_igc_capture_sh080_makarov;
    level.scr_anim[ "pilot" ][ "idle" ] = generic_human#vh_blima_rappel_pilot;
    level.scr_anim[ "ghost" ][ "heli_open" ] = generic_human#fbk_1000_igc_outro_open_ghost;
    level.scr_anim[ "ghost" ][ "heli_open_idle" ][ 0 ] = generic_human#fbk_1000_igc_outro_open_idle_ghost;
    level.scr_anim[ "shepherd" ][ "heli_open_idle" ][ 0 ] = generic_human#fbk_1000_igc_outro_open_idle_shepherd;
    level.scr_anim[ "ghost" ][ "land" ] = generic_human#fbk_1000_igc_outro_enter_ghost;
    level.scr_anim[ "shepherd" ][ "land" ] = generic_human#fbk_1000_igc_outro_enter_shepherd;
    level.scr_anim[ "ghost" ][ "heli_landed_idle" ][ 0 ] = generic_human#fbk_1000_igc_outro_enter_idle_ghost;
    level.scr_anim[ "shepherd" ][ "heli_landed_idle" ][ 0 ] = generic_human#fbk_1000_igc_outro_enter_idle_shepherd;
    level.scr_anim[ "shepherd" ][ "heli_landed_idle_nags" ][ 0 ] = generic_human#fbk_1000_igc_outro_enter_nag_shepherd;
    level.scr_anim[ "shepherd" ][ "heli_landed_idle_nags_timer" ] = 7;
    level.scr_anim[ "soap" ][ "exfil" ] = generic_human#fbk_1000_igc_outro_sh010_soap;
    level.scr_anim[ "ghost" ][ "exfil" ] = generic_human#fbk_1000_igc_outro_sh010_ghost;
    level.scr_anim[ "makarov" ][ "exfil" ] = generic_human#fbk_1000_igc_outro_sh010_makarov;
    level.scr_anim[ "price" ][ "exfil" ] = generic_human#fbk_1000_igc_outro_sh010_price;
    level.scr_anim[ "shepherd" ][ "exfil" ] = generic_human#fbk_1000_igc_outro_sh010_shepherd;
    level.scr_anim[ "price" ][ "squeeze_arrive" ] = generic_human#fbk_0600_garage_squizz_intro_sc1_price;
    level.scr_anim[ "price" ][ "squeeze_arrive_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_intro_sc1_idle_price;
    level.scr_anim[ "price" ][ "squeeze_arrive_idle_nags" ][ 0 ] = generic_human#fbk_0600_garage_squizz_intro_sc1_nag_price;
    level.scr_anim[ "makarov" ][ "squeeze_arrive" ] = generic_human#fbk_0600_garage_squizz_intro_sc1_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_arrive_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_intro_sc1_idle_makarov;
    level.scr_anim[ "makarov" ][ "squizz_sc1" ] = generic_human#fbk_0600_garage_squizz_sc1_makarov;
    level.scr_anim[ "price" ][ "squizz_sc1" ] = generic_human#fbk_0600_garage_squizz_sc1_price;
    level.scr_anim[ "makarov" ][ "squizz_sc2" ] = generic_human#fbk_0600_garage_squizz_sc2_makarov;
    level.scr_anim[ "price" ][ "squizz_sc2" ] = generic_human#fbk_0600_garage_squizz_sc2_price;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_enter" ] = generic_human#fbk_0600_garage_squizz_sc2_enter_makarov;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_enter" ] = generic_human#fbk_0600_garage_squizz_sc2_enter_price;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_loop" ] = generic_human#fbk_0600_garage_squizz_sc2_idle_makarov;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_loop" ] = generic_human#fbk_0600_garage_squizz_sc2_idle_price;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_loop_nag01" ] = generic_human#fbk_0600_garage_squizz_sc2_nag01_price;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_loop_nag02" ] = generic_human#fbk_0600_garage_squizz_sc2_nag02_price;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_loop_nag03" ] = generic_human#fbk_0600_garage_squizz_sc2_nag03_price;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_loop_nag01" ] = generic_human#fbk_0600_garage_squizz_sc2_nag01_makarov;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_loop_nag02" ] = generic_human#fbk_0600_garage_squizz_sc2_nag02_makarov;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_loop_nag03" ] = generic_human#fbk_0600_garage_squizz_sc2_nag03_makarov;
    level.scr_anim[ "makarov" ][ "squizz_sc2_alt_exit" ] = generic_human#fbk_0600_garage_squizz_sc2_exit_makarov;
    level.scr_anim[ "price" ][ "squizz_sc2_alt_exit" ] = generic_human#fbk_0600_garage_squizz_sc2_exit_price;
    level.scr_anim[ "makarov" ][ "squizz_sc3" ] = generic_human#fbk_0600_garage_squizz_sc3_makarov;
    level.scr_anim[ "price" ][ "squizz_sc3" ] = generic_human#fbk_0600_garage_squizz_sc3_price;
    level.scr_anim[ "makarov" ][ "squizz_sc3_alt_enter" ] = generic_human#fbk_0600_garage_squizz_sc3_enter_makarov;
    level.scr_anim[ "price" ][ "squizz_sc3_alt_enter" ] = generic_human#fbk_0600_garage_squizz_sc3_enter_price;
    level.scr_anim[ "makarov" ][ "squizz_sc3_alt_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_sc3_idle_makarov;
    level.scr_anim[ "price" ][ "squizz_sc3_alt_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_sc3_idle_price;
    level.scr_anim[ "price" ][ "squizz_sc3_alt_idle_nags" ][ 0 ] = generic_human#fbk_0600_garage_squizz_sc3_nag01_price;
    level.scr_anim[ "makarov" ][ "squizz_sc3_alt_exit" ] = generic_human#fbk_0600_garage_squizz_sc3_exit_makarov;
    level.scr_anim[ "price" ][ "squizz_sc3_alt_exit" ] = generic_human#fbk_0600_garage_squizz_sc3_exit_price;
    level.scr_anim[ "makarov" ][ "squizz_sc4" ] = generic_human#fbk_0600_garage_squizz_sc4_makarov;
    level.scr_anim[ "price" ][ "squizz_sc4" ] = generic_human#fbk_0600_garage_squizz_sc4_price;
    level.scr_anim[ "price" ][ "squeeze_through" ] = generic_human#fbk_0600_garage_squizz_price;
    level.scr_anim[ "civ01" ][ "squeeze_through" ] = generic_human#fbk_0600_garage_squizz_sc1_civ01;
    level.scr_anim[ "civ02" ][ "squeeze_through" ] = generic_human#fbk_0600_garage_squizz_sc1_civ02;
    level.scr_anim[ "civ03" ][ "squeeze_through" ] = generic_human#fbk_0600_garage_squizz_civ03;
    level.scr_anim[ "civ04" ][ "squeeze_through" ] = generic_human#fbk_0600_garage_squizz_civ04;
    level.scr_anim[ "makarov" ][ "squeeze_01" ] = generic_human#fbk_0600_garage_squizz_p1_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_01_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_p1_idle_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_02" ] = generic_human#fbk_0600_garage_squizz_p2_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_02_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_p2_idle_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_03" ] = generic_human#fbk_0600_garage_squizz_p3_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_03_idle" ][ 0 ] = generic_human#fbk_0600_garage_squizz_p3_idle_makarov;
    level.scr_anim[ "makarov" ][ "squeeze_04" ] = generic_human#fbk_0600_garage_squizz_p4_makarov;
    level.scr_anim[ "civ01" ][ "concourse_intro_group1" ] = generic_human#fbk_0220_concourse_civ_execute_civ01;
    addnotetrack_customfunction( "civ01", "backshot", &function_51bc46a7b756c17e, "concourse_intro_group1" );
    addnotetrack_customfunction( "civ01", "whizbye", &function_3fcbefaab3d31c1c, "concourse_intro_group1" );
    level.scr_anim[ "civ02" ][ "concourse_intro_group1" ] = generic_human#fbk_0220_concourse_civ_execute_civ02;
    level.scr_anim[ "civ03" ][ "concourse_intro_group1" ] = generic_human#fbk_0220_concourse_civ_execute_civ03;
    level.scr_anim[ "civ03" ][ "concourse_intro_group1_idle" ][ 0 ] = generic_human#fbk_0220_concourse_civ_execute_idle_civ03;
    level.scr_anim[ "civ04" ][ "concourse_intro_group1" ] = generic_human#fbk_0220_concourse_civ_execute_civ04;
    addnotetrack_customfunction( "civ04", "backshot", &function_51bc46a7b756c17e, "concourse_intro_group1" );
    addnotetrack_customfunction( "civ04", "whizbye", &function_3fcbefaab3d31c1c, "concourse_intro_group1" );
    level.scr_anim[ "civ05" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_civ05;
    addnotetrack_customfunction( "civ05", "headshot", &function_1798a59ab1073008, "concourse_intro_group2" );
    level.scr_anim[ "civ06" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_civ06;
    addnotetrack_customfunction( "civ06", "backshot", &function_51bc46a7b756c17e, "concourse_intro_group2" );
    level.scr_anim[ "civ07" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_civ06f;
    addnotetrack_customfunction( "civ07", "backshot", &function_51bc46a7b756c17e, "concourse_intro_group2" );
    level.scr_anim[ "civ08" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_civ07;
    addnotetrack_customfunction( "civ08", "headshot", &function_1798a59ab1073008, "concourse_intro_group2" );
    level.scr_anim[ "civ09" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_civ08;
    addnotetrack_customfunction( "civ09", "headshot", &function_1798a59ab1073008, "concourse_intro_group2" );
    addnotetrack_customfunction( "civ09", "backshot", &function_51bc46a7b756c17e, "concourse_intro_group2" );
    level.scr_anim[ "enemy01" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_enmy01;
    level.scr_anim[ "enemy02" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_enmy02;
    level.scr_anim[ "enemy03" ][ "concourse_intro_group2" ] = generic_human#fbk_0220_concourse_civ_execute_enmy03;
    level.scr_anim[ "price" ][ "ambulance_crash_arrive" ] = generic_human#fbk_0420_garage_crash_enter_price;
    level.scr_anim[ "price" ][ "ambulance_crash_idle" ][ 0 ] = generic_human#fbk_0420_garage_crash_enter_idle_price;
    level.scr_anim[ "price" ][ "ambulance_crash" ] = generic_human#fbk_0420_garage_crash_price;
    level.scr_anim[ "ambulance_driver" ][ "driving" ][ 0 ] = generic_human#fbk_0420_garage_crash_enter_driver;
    level.scr_anim[ "ambulance_driver" ][ "driving_death" ] = generic_human#fbk_0420_garage_crash_death_driver;
    level.scr_anim[ "ambulance_driver" ][ "driving_death_pose" ][ 0 ] = generic_human#fbk_0420_garage_crash_death_idle_driver;
    level.scr_anim[ "price" ][ "cover_arrive" ] = generic_human#fbk_0520_garage_combat_cover_intro_price;
    level.scr_anim[ "price" ][ "cover_arrive_idle" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_intro_idle_price;
    level.scr_anim[ "price" ][ "cover_arrive_idle_nags" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_intro_nag_price;
    level.scr_anim[ "price" ][ "cover_together" ] = generic_human#fbk_0520_garage_combat_cover_price;
    level.scr_anim[ "makarov" ][ "cover_together" ] = generic_human#fbk_0520_garage_combat_cover_mak;
    level.scr_anim[ "price" ][ "cover_together_idle" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_idle_price;
    level.scr_anim[ "makarov" ][ "cover_together_idle" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_idle_mak;
    level.scr_anim[ "price" ][ "cover_shoot" ] = generic_human#fbk_0520_garage_combat_cover_fire_price;
    level.scr_anim[ "makarov" ][ "cover_shoot" ] = generic_human#fbk_0520_garage_combat_cover_fire_mak;
    level.scr_anim[ "price" ][ "cover_shoot2" ] = generic_human#fbk_0520_garage_combat_cover_fire2_price;
    level.scr_anim[ "makarov" ][ "cover_shoot2" ] = generic_human#fbk_0520_garage_combat_cover_fire2_mak;
    level.scr_anim[ "price" ][ "cover_exit" ] = generic_human#fbk_0520_garage_combat_cover_restrain_price;
    level.scr_anim[ "makarov" ][ "cover_exit" ] = generic_human#fbk_0520_garage_combat_cover_restrain_mak;
    level.scr_anim[ "price" ][ "coverexit_idle" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_restrain_idle_price;
    level.scr_anim[ "makarov" ][ "coverexit_idle" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_restrain_idle_mak;
    level.scr_anim[ "price" ][ "coverexit_idle_nags" ][ 0 ] = generic_human#fbk_0520_garage_combat_cover_restrain_nag_price;
    level.scr_anim[ "price" ][ "cover_release" ] = generic_human#fbk_0520_garage_combat_cover_exit_price;
    level.scr_anim[ "makarov" ][ "cover_release" ] = generic_human#fbk_0520_garage_combat_cover_exit_mak;
    addnotetrack_customfunction( "price", "scripted_fire", &pistol_burst );
    level.scr_anim[ "m1" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ01;
    level.scr_anim[ "m2" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ02;
    level.scr_anim[ "m3" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ03;
    level.scr_anim[ "m4" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ04;
    level.scr_anim[ "m5" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ07;
    level.scr_anim[ "m6" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ08;
    addnotetrack_customfunction( "m6", "scn_fb_intro_18_walla_street_corner_left_01", &function_b0287c95789418aa );
    level.scr_anim[ "m7" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ11;
    level.scr_anim[ "m8" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ12;
    level.scr_anim[ "m9" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ13;
    level.scr_anim[ "m10" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ14;
    level.scr_anim[ "m11" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ15;
    level.scr_anim[ "m12" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ19;
    level.scr_anim[ "m13" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ23;
    addnotetrack_customfunction( "m13", "scn_fb_intro_19_walla_street_corner_right_01", &function_f92b6f12c290e629 );
    level.scr_anim[ "f1" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ05;
    level.scr_anim[ "f2" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ06;
    level.scr_anim[ "f3" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ09;
    level.scr_anim[ "f4" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ10;
    level.scr_anim[ "f5" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ16;
    level.scr_anim[ "f6" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ17;
    level.scr_anim[ "f7" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ18;
    level.scr_anim[ "f8" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ20;
    level.scr_anim[ "f9" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ21;
    level.scr_anim[ "f10" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ22;
    level.scr_anim[ "f11" ][ "infil_street" ] = generic_human#fbk_0120_outside_civlook_civ24;
    level.scr_anim[ "f1" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ01;
    level.scr_anim[ "f2" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ13;
    level.scr_anim[ "f3" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ14;
    level.scr_anim[ "f4" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ03;
    level.scr_anim[ "f5" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ06;
    level.scr_anim[ "f6" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ09;
    level.scr_anim[ "f7" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ10;
    level.scr_anim[ "m1" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ02;
    level.scr_anim[ "m2" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ04;
    addnotetrack_customfunction( "m2", "scn_fb_intro_20_walla_gate_left_01", &function_35eb4a96117d3c9b );
    level.scr_anim[ "m3" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ05;
    level.scr_anim[ "m4" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ07;
    level.scr_anim[ "m5" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ08;
    level.scr_anim[ "m6" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ11;
    level.scr_anim[ "m7" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ12;
    level.scr_anim[ "m8" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ15;
    level.scr_anim[ "m9" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ16;
    addnotetrack_customfunction( "m9", "scn_fb_intro_22_walla_ramp_runner_left_01", &function_89e68a35cdb14e11 );
    level.scr_anim[ "m10" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ17;
    level.scr_anim[ "m11" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ18;
    level.scr_anim[ "m12" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ19;
    level.scr_anim[ "m13" ][ "stadium_flee" ] = generic_human#fbk_0130_outside_civescape_civ20;
    level.scr_anim[ "stadium_flee_driver" ][ "stadium_flee_drive" ] = generic_human#fbk_0130_outside_civescape_civ21;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfc5
// Size: 0xd54
function face()
{
    level.scr_face[ "price" ][ "dx_sp_flas_infs_pric_itsonthethirdfloorle" ] = generic_human#dx_sp_flas_infs_pric_itsonthethirdfloorle_face;
    level.scr_face[ "price" ][ "dx_sp_flas_infs_pric_rallyatthestairs" ] = generic_human#dx_sp_flas_infs_pric_rallyatthestairs_face;
    level.scr_face[ "price" ][ "dx_sp_flas_infs_pric_atthestairssergeant" ] = generic_human#dx_sp_flas_infs_pric_atthestairssergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_infs_pric_soapgettothestairs" ] = generic_human#dx_sp_flas_infs_pric_soapgettothestairs_face;
    level.scr_face[ "price" ][ "dx_sp_flas_shld_pric_upthestairs" ] = generic_human#dx_sp_flas_shld_pric_upthestairs_face;
    level.scr_face[ "price" ][ "dx_sp_flas_shld_pric_needyouwithussergean" ] = generic_human#dx_sp_flas_shld_pric_needyouwithussergean_face;
    level.scr_face[ "price" ][ "dx_sp_flas_shld_pric_soapweremovingonthec" ] = generic_human#dx_sp_flas_shld_pric_soapweremovingonthec_face;
    level.scr_face[ "price" ][ "dx_sp_flas_shld_pric_checkyourshotsinther" ] = generic_human#dx_sp_flas_shld_pric_checkyourshotsinther_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_contactfront" ] = generic_human#dx_sp_flas_stcn_pric_contactfront_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_movemove" ] = generic_human#dx_sp_flas_stcn_pric_movemove_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_staydown" ] = generic_human#dx_sp_flas_stcn_pric_staydown_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_goldeaglebravo6werei" ] = generic_human#dx_sp_flas_stcn_pric_goldeaglebravo6werei_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_rogerthat" ] = generic_human#dx_sp_flas_stcn_pric_rogerthat_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_keepmovingthroughthe" ] = generic_human#dx_sp_flas_stcn_pric_keepmovingthroughthe_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_clearemoutfast" ] = generic_human#dx_sp_flas_stcn_pric_clearemoutfast_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_soapgetuphere" ] = generic_human#dx_sp_flas_stcn_pric_soapgetuphere_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_moveupsergeantwerepu" ] = generic_human#dx_sp_flas_stcn_pric_moveupsergeantwerepu_face;
    level.scr_face[ "price" ][ "dx_sp_flas_ccrs_pric_smokeaheadcareful" ] = generic_human#dx_sp_flas_ccrs_pric_smokeaheadcareful_face;
    level.scr_face[ "price" ][ "dx_sp_flas_ccrs_pric_clearsecurethestairw" ] = generic_human#dx_sp_flas_ccrs_pric_clearsecurethestairw_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_watchforcivilians" ] = generic_human#dx_sp_flas_stcn_pric_watchforcivilians_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_thirdfloorsourtarget" ] = generic_human#dx_sp_flas_stcn_pric_thirdfloorsourtarget_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_takepointsoap" ] = generic_human#dx_sp_flas_stcn_pric_takepointsoap_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_headupstairssergeant" ] = generic_human#dx_sp_flas_stcn_pric_headupstairssergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_upthestairssergeantg" ] = generic_human#dx_sp_flas_stcn_pric_upthestairssergeantg_face;
    level.scr_face[ "price" ][ "dx_sp_flas_stcn_pric_onyousoapletsgetupst" ] = generic_human#dx_sp_flas_stcn_pric_onyousoapletsgetupst_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_eyesontheviparea" ] = generic_human#dx_sp_flas_penf_pric_eyesontheviparea_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_weremovingupsergeant" ] = generic_human#dx_sp_flas_penf_pric_weremovingupsergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_goteyesonthevipareas" ] = generic_human#dx_sp_flas_penf_pric_goteyesonthevipareas_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_sergeantgetyourarseu" ] = generic_human#dx_sp_flas_penf_pric_sergeantgetyourarseu_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_gotmovementinsidesta" ] = generic_human#dx_sp_flas_penf_pric_gotmovementinsidesta_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_letsgetinthere" ] = generic_human#dx_sp_flas_penf_pric_letsgetinthere_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_onyousergeant" ] = generic_human#dx_sp_flas_penf_pric_onyousergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_penf_pric_ready" ] = generic_human#dx_sp_flas_penf_pric_ready_face;
    level.scr_face[ "price" ][ "dx_sp_flas_phlv_pric_takethedoorletsgetit" ] = generic_human#dx_sp_flas_phlv_pric_takethedoorletsgetit_face;
    level.scr_face[ "price" ][ "dx_sp_flas_phlv_pric_getonthedoor" ] = generic_human#dx_sp_flas_phlv_pric_getonthedoor_face;
    level.scr_face[ "price" ][ "dx_sp_flas_phlv_pric_ineedyouonthatdoorse" ] = generic_human#dx_sp_flas_phlv_pric_ineedyouonthatdoorse_face;
    level.scr_face[ "price" ][ "dx_sp_flas_pena_pric_goodcallthen" ] = generic_human#dx_sp_flas_pena_pric_goodcallthen_face;
    level.scr_face[ "price" ][ "dx_sp_flas_pena_pric_sergeantyoubroken" ] = generic_human#dx_sp_flas_pena_pric_sergeantyoubroken_face;
    level.scr_face[ "price" ][ "dx_sp_flas_pena_pric_soapweregoingformaka" ] = generic_human#dx_sp_flas_pena_pric_soapweregoingformaka_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_eyespeeledformakarov" ] = generic_human#dx_sp_flas_mblc_pric_eyespeeledformakarov_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_checkfirethatsacivil" ] = generic_human#dx_sp_flas_mblc_pric_checkfirethatsacivil_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_gettosafetygo" ] = generic_human#dx_sp_flas_mblc_pric_gettosafetygo_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_vehicleincoming" ] = generic_human#dx_sp_flas_mblc_pric_vehicleincoming_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_gettocover" ] = generic_human#dx_sp_flas_mblc_pric_gettocover_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_itcouldbemakarov" ] = generic_human#dx_sp_flas_mblc_pric_itcouldbemakarov_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_stepoutofthevehicle" ] = generic_human#dx_sp_flas_mblc_pric_stepoutofthevehicle_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_outofthevehiclenow" ] = generic_human#dx_sp_flas_mblc_pric_outofthevehiclenow_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_incoming" ] = generic_human#dx_sp_flas_mblc_pric_incoming_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_movetosecure" ] = generic_human#dx_sp_flas_mblc_pric_movetosecure_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_holdingattheambulanc" ] = generic_human#dx_sp_flas_mblc_pric_holdingattheambulanc_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_soapgettotheambulanc" ] = generic_human#dx_sp_flas_mblc_pric_soapgettotheambulanc_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_ineedyouoverhereserg" ] = generic_human#dx_sp_flas_mblc_pric_ineedyouoverhereserg_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_openit" ] = generic_human#dx_sp_flas_mblc_pric_openit_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_getthedoorillcover" ] = generic_human#dx_sp_flas_mblc_pric_getthedoorillcover_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_openthedoorsoap" ] = generic_human#dx_sp_flas_mblc_pric_openthedoorsoap_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mblc_pric_getitopensergeantmak" ] = generic_human#dx_sp_flas_mblc_pric_getitopensergeantmak_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_keepmakarovmoving" ] = generic_human#dx_sp_flas_mks1_pric_keepmakarovmoving_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_illleadyouguardmakar" ] = generic_human#dx_sp_flas_mks1_pric_illleadyouguardmakar_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_contact" ] = generic_human#dx_sp_flas_mks1_pric_contact_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_ivegotmakarovreturnf" ] = generic_human#dx_sp_flas_mks1_pric_ivegotmakarovreturnf_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_donttakeyoureyesoffm" ] = generic_human#dx_sp_flas_mks1_pric_donttakeyoureyesoffm_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_staywithhimsoap" ] = generic_human#dx_sp_flas_mks1_pric_staywithhimsoap_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_keepyoureyesonhimser" ] = generic_human#dx_sp_flas_mks1_pric_keepyoureyesonhimser_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_keepmakarovinfrontof" ] = generic_human#dx_sp_flas_mks1_pric_keepmakarovinfrontof_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_rallyupsergeantwenee" ] = generic_human#dx_sp_flas_mks1_pric_rallyupsergeantwenee_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_weclear" ] = generic_human#dx_sp_flas_mks1_pric_weclear_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_soaptakehim" ] = generic_human#dx_sp_flas_mks1_pric_soaptakehim_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_takemakarovsergeant" ] = generic_human#dx_sp_flas_mks1_pric_takemakarovsergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_grabmakarovandletsmo" ] = generic_human#dx_sp_flas_mks1_pric_grabmakarovandletsmo_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_itsnotsafehereweneed" ] = generic_human#dx_sp_flas_mks1_pric_itsnotsafehereweneed_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_foundawaythroughserg" ] = generic_human#dx_sp_flas_mks1_pric_foundawaythroughserg_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks1_pric_ivegotmakarovmoveup" ] = generic_human#dx_sp_flas_mks1_pric_ivegotmakarovmoveup_face;
    level.scr_face[ "price" ][ "dx_sp_flas_tnlp_pric_onme" ] = generic_human#dx_sp_flas_tnlp_pric_onme_face;
    level.scr_face[ "price" ][ "dx_sp_flas_tnlp_pric_weneedtohitextractio" ] = generic_human#dx_sp_flas_tnlp_pric_weneedtohitextractio_face;
    level.scr_face[ "price" ][ "dx_sp_flas_tnlp_pric_tightenupsoapweneedt" ] = generic_human#dx_sp_flas_tnlp_pric_tightenupsoapweneedt_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks2_pric_getonthegatesergeant" ] = generic_human#dx_sp_flas_mks2_pric_getonthegatesergeant_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks2_pric_letsgetthisgateopen" ] = generic_human#dx_sp_flas_mks2_pric_letsgetthisgateopen_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks2_pric_liftthegatesoaptimet" ] = generic_human#dx_sp_flas_mks2_pric_liftthegatesoaptimet_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks2_pric_soaphelpmewiththegat" ] = generic_human#dx_sp_flas_mks2_pric_soaphelpmewiththegat_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks3_pric_goldeagleactualweree" ] = generic_human#dx_sp_flas_mks3_pric_goldeagleactualweree_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks3_pric_copywellmeetyouatpri" ] = generic_human#dx_sp_flas_mks3_pric_copywellmeetyouatpri_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks3_pric_illhandlemakarovyouc" ] = generic_human#dx_sp_flas_mks3_pric_illhandlemakarovyouc_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks3_pric_securetheareasergean" ] = generic_human#dx_sp_flas_mks3_pric_securetheareasergean_face;
    level.scr_face[ "price" ][ "dx_sp_flas_mks3_pric_solidcopyweremoving" ] = generic_human#dx_sp_flas_mks3_pric_solidcopyweremoving_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_yourewalkingintoatra" ] = generic_human#dx_sp_flas_mks1_maka_yourewalkingintoatra_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_youthinkyoulljustwal" ] = generic_human#dx_sp_flas_mks1_maka_youthinkyoulljustwal_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_capturingmeitmeansno" ] = generic_human#dx_sp_flas_mks1_maka_capturingmeitmeansno_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_dontbeafool" ] = generic_human#dx_sp_flas_mks1_maka_dontbeafool_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_youcantbeatmeunlessy" ] = generic_human#dx_sp_flas_mks1_maka_youcantbeatmeunlessy_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_imhere" ] = generic_human#dx_sp_flas_mks1_maka_imhere_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_werebehindthecar" ] = generic_human#dx_sp_flas_mks1_maka_werebehindthecar_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_therearetwoofthem" ] = generic_human#dx_sp_flas_mks1_maka_therearetwoofthem_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_yourenotsafeanywhere" ] = generic_human#dx_sp_flas_mks1_maka_yourenotsafeanywhere_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_idontbelieveinluckib" ] = generic_human#dx_sp_flas_mks1_maka_idontbelieveinluckib_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_amancanbelockedupani" ] = generic_human#dx_sp_flas_mks1_maka_amancanbelockedupani_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_ibestowmyblessingson" ] = generic_human#dx_sp_flas_mks1_maka_ibestowmyblessingson_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_everymanisreplaceabl" ] = generic_human#dx_sp_flas_mks1_maka_everymanisreplaceabl_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_tnlp_maka_takeyourtime" ] = generic_human#dx_sp_flas_tnlp_maka_takeyourtime_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_tnlp_maka_dontlistentohimserge" ] = generic_human#dx_sp_flas_tnlp_maka_dontlistentohimserge_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_tnlp_maka_hesgoingtogetyoukill" ] = generic_human#dx_sp_flas_tnlp_maka_hesgoingtogetyoukill_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_youwontmakeitoutofhe" ] = generic_human#dx_sp_flas_mks1_maka_youwontmakeitoutofhe_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks1_maka_mymenwontletyouleave" ] = generic_human#dx_sp_flas_mks1_maka_mymenwontletyouleave_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks2_maka_wherearethey" ] = generic_human#dx_sp_flas_mks2_maka_wherearethey_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks2_maka_soaremine" ] = generic_human#dx_sp_flas_mks2_maka_soaremine_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks2_maka_yourestillthinkingab" ] = generic_human#dx_sp_flas_mks2_maka_yourestillthinkingab_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks2_maka_thewickedprosperthey" ] = generic_human#dx_sp_flas_mks2_maka_thewickedprosperthey_face;
    level.scr_face[ "makarov" ][ "dx_sp_flas_mks2_maka_revengeislikeaghost" ] = generic_human#dx_sp_flas_mks2_maka_revengeislikeaghost_face;
    level.scr_face[ "shepherd" ][ "dx_sp_flas_xfil_shep_timetogosergeant" ] = generic_human#dx_sp_flas_xfil_shep_timetogosergeant_face;
    level.scr_face[ "shepherd" ][ "dx_sp_flas_xfil_shep_getonthebirdletsgo" ] = generic_human#dx_sp_flas_xfil_shep_getonthebirdletsgo_face;
    level.scr_face[ "shepherd" ][ "dx_sp_flas_xfil_shep_moveyourasssergeantg" ] = generic_human#dx_sp_flas_xfil_shep_moveyourasssergeantg_face;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed21
// Size: 0x128
function xcams()
{
    level.scr_xcam[ "execution_24" ] = "iw9_mp_execution_024_stand_xcam";
    level.scr_xcam[ "ambulance_15" ] = "fbk_0500_igc_capture_sh015_xcam";
    level.scr_xcam[ "ambulance_20" ] = "fbk_0500_igc_capture_sh020_xcam";
    level.scr_xcam[ "ambulance_25" ] = "fbk_0500_igc_capture_sh025_xcam";
    level.scr_xcam[ "ambulance_30" ] = "fbk_0500_igc_capture_sh030_xcam";
    level.scr_xcam[ "ambulance_35" ] = "fbk_0500_igc_capture_sh035_xcam";
    level.scr_xcam[ "ambulance_40" ] = "fbk_0500_igc_capture_sh040_xcam";
    level.scr_xcam[ "ambulance_45" ] = "fbk_0500_igc_capture_sh045_xcam";
    level.scr_xcam[ "ambulance_50" ] = "fbk_0500_igc_capture_sh050_xcam";
    level.scr_xcam[ "ambulance_55" ] = "fbk_0500_igc_capture_sh055_xcam";
    level.scr_xcam[ "ambulance_60" ] = "fbk_0500_igc_capture_sh060_xcam";
    level.scr_xcam[ "ambulance_65" ] = "fbk_0500_igc_capture_sh065_xcam";
    level.scr_xcam[ "ambulance_70" ] = "fbk_0500_igc_capture_sh070_xcam";
    level.scr_xcam[ "ambulance_75" ] = "fbk_0500_igc_capture_sh075_xcam";
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee51
// Size: 0x4a9
function script_models()
{
    level.scr_animtree[ "halligan" ] = #script_model;
    level.scr_model[ "halligan" ] = "misc_vm_halligan_tool_cp";
    level.scr_anim[ "halligan" ][ "concourse_stairs_top_open" ] = script_model#fbk_0320_constairs_door_halliganopen_halligan;
    level.scr_model[ "bomb_bag" ] = "as_accessory_medical_bag_c4";
    level.scr_animtree[ "bomb_bag" ] = #script_model;
    level.scr_anim[ "bomb_bag" ][ "penthouse_bomb" ] = script_model#fbk_0370_clubhouse_exit_bag;
    level.scr_animtree[ "penthouse_back_door_left" ] = #script_model;
    level.scr_anim[ "penthouse_back_door_left" ][ "penthouse_bomb" ] = script_model#fbk_0370_clubhouse_exit_door;
    level.scr_animtree[ "concourse_door_left" ] = #script_model;
    level.scr_anim[ "concourse_door_left" ][ "fbk_0290_slowdeath" ] = script_model#fbk_0290_concourse_end_door_slowdeath_door_l;
    level.scr_animtree[ "concourse_door_right" ] = #script_model;
    level.scr_anim[ "concourse_door_right" ][ "fbk_0290_slowdeath" ] = script_model#fbk_0290_concourse_end_door_slowdeath_door_r;
    level.scr_animtree[ "fourth_floor_door" ] = #script_model;
    level.scr_anim[ "fourth_floor_door" ][ "fourth_floor_door_close" ] = script_model#fbk_0300_constairs_civ_attack_4f_door;
    level.scr_animtree[ "door" ] = #script_model;
    level.scr_model[ "door" ] = "jup_door_emergency_left_01_rl";
    level.scr_anim[ "door" ][ "concourse_stairs_top_open" ] = script_model#fbk_0320_constairs_door_halliganopen_door;
    level.scr_anim[ "door" ][ "concourse_stairs_top_plr_open" ] = script_model#fbk_0320_constairs_door_handle;
    level.scr_animtree[ "elevator_door_l" ] = #script_model;
    level.scr_model[ "elevator_door_l" ] = "building_elevator_door_01_l";
    level.scr_anim[ "elevator_door_l" ][ "elevator_open" ] = script_model#fbk_0400_clubhouse_elevator_open_elevatorleft;
    level.scr_animtree[ "elevator_door_r" ] = #script_model;
    level.scr_model[ "elevator_door_r" ] = "building_elevator_door_01_r";
    level.scr_anim[ "elevator_door_r" ][ "elevator_open" ] = script_model#fbk_0400_clubhouse_elevator_open_elevatorright;
    level.scr_animtree[ "gate" ] = #script_model;
    level.scr_anim[ "gate" ][ "gate_open" ] = script_model#fbk_0700_garage_gate_gate;
    level.scr_animtree[ "duffel_bag" ] = #script_model;
    level.scr_model[ "duffel_bag" ] = "as_accessory_medical_bag_c4";
    level.scr_anim[ "duffel_bag" ][ "garage_ambulance_hide" ] = script_model#fbk_0170_garage_ambulance_hide_bag;
    level.scr_animtree[ "penthouse_front_door_left" ] = #script_model;
    level.scr_anim[ "penthouse_front_door_left" ][ "fbk_0360_intro" ] = script_model#fbk_0360_clubhouse_conflict_door_left;
    level.scr_animtree[ "penthouse_front_door_right" ] = #script_model;
    level.scr_anim[ "penthouse_front_door_right" ][ "fbk_0360_intro" ] = script_model#fbk_0360_clubhouse_conflict_door_right;
    level.scr_goaltime[ "penthouse_front_door_right" ][ "fbk_0360_intro" ] = 0;
    level.scr_animtree[ "stretcher_1" ] = #script_model;
    level.scr_model[ "stretcher_1" ] = "jup_accessory_medical_stretcher_02_flashback";
    level.scr_anim[ "stretcher_1" ][ "fbk_0360_intro" ] = script_model#fbk_0360_clubhouse_conflict_stretcher01;
    level.scr_animtree[ "stretcher_2" ] = #script_model;
    level.scr_model[ "stretcher_2" ] = "jup_accessory_medical_stretcher_01";
    level.scr_anim[ "stretcher_2" ][ "fbk_0360_intro" ] = script_model#fbk_0360_clubhouse_conflict_stretcher02;
    level.scr_animtree[ "stretcher_3" ] = #script_model;
    level.scr_model[ "stretcher_3" ] = "jup_accessory_medical_stretcher_02_flashback";
    level.scr_anim[ "stretcher_3" ][ "fbk_0360_intro" ] = script_model#fbk_0360_clubhouse_conflict_stretcher03;
    level.scr_animtree[ "squeeze_truck" ] = #script_model;
    level.scr_anim[ "squeeze_truck" ][ "squeeze_through" ] = script_model#fbk_0600_garage_squizz_truck01;
    level.scr_animtree[ "squeeze_bus" ] = #script_model;
    level.scr_anim[ "squeeze_bus" ][ "squeeze_through" ] = script_model#fbk_0600_garage_squizz_bus01;
    level.scr_anim[ "squeeze_truck" ][ "squizz_sc2" ] = script_model#fbk_0600_garage_squizz_sc2_truck_doorclose;
    level.scr_anim[ "squeeze_truck" ][ "squizz_sc2_alt_exit" ] = script_model#fbk_0600_garage_squizz_sc2_exit_truck_doorclose;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf302
// Size: 0x723
function player()
{
    level.scr_animtree[ "player_rig" ] = #player;
    level.scr_model[ "player_rig" ] = "vm_c_jup_sp_hero_soap_bravo";
    level.scr_anim[ "player_rig" ][ "makarov_takedown" ] = player#jup_plr_melee_takedown01_player;
    level.scr_anim[ "player_rig" ][ "elevator_open_enter_early" ] = player#fbk_0400_clubhouse_elevator_open_enter_left_plr;
    level.scr_anim[ "player_rig" ][ "elevator_open_enter" ] = player#fbk_0400_clubhouse_elevator_plr_open_enter_left_plr;
    level.scr_anim[ "player_rig" ][ "elevator_open" ] = player#fbk_0400_clubhouse_elevator_open_plr;
    level.scr_goaltime[ "player_rig" ][ "elevator_open" ] = 0;
    level.scr_anim[ "player_rig" ][ "elevator_rappel_enter" ] = player#fbk_0400_clubhouse_elevator_interact2_enter_front_plr;
    level.scr_anim[ "player_rig" ][ "elevator_go" ] = player#fbk_0400_clubhouse_elevator_interact2_plr;
    addnotetrack_customfunction( "player_rig", "fbk_0400_elevator_feet_land_01", &function_b5b7356d717e95fe );
    level.scr_goaltime[ "player_rig" ][ "elevator_go" ] = 0;
    level.scr_anim[ "player_rig" ][ "fbk_0110" ] = player#fbk_0110_outside_drive_start_plr;
    addnotetrack_flag( "player_rig", "150_start", "fbk_0150_start", "fbk_0110" );
    addnotetrack_flag( "player_rig", "150_start", "infil_vehicle_stop_at_gate", "fbk_0110" );
    addnotetrack_flag( "player_rig", "start_0185", "nt_start_garage_exit", "fbk_0110" );
    addnotetrack_customfunction( "player_rig", "big_shake", &function_632c3a8f7bf355d2, "fbk_0110" );
    addnotetrack_customfunction( "player_rig", "small_shake", &function_dd5f56d0e7d1c29, "fbk_0110" );
    addnotetrack_flag( "player_rig", "lense_fx_blend_start", "nt_infil_dof_blend_start", "fbk_0110" );
    addnotetrack_flag( "player_rig", "lense_fx_blend_stop", "nt_infil_dof_blend_stop", "fbk_0110" );
    level.scr_anim[ "player_rig" ][ "fbk_0150" ] = player#fbk_0150_garage_drive_plr;
    level.scr_anim[ "player_rig" ][ "fbk_0190" ] = player#fbk_0190_garage_exit_plr;
    addnotetrack_customfunction( "player_rig", "enable_weapons", &function_b6f0903a27536471, "fbk_0190" );
    level.scr_anim[ "player_rig" ][ "gate_open" ] = player#fbk_0700_garage_gate_plr;
    level.scr_anim[ "player_rig" ][ "fbk_0360_intro" ] = player#fbk_0360_clubhouse_conflict_plr;
    level.scr_anim[ "player_rig" ][ "fbk_0360_intro_enter_front" ] = player#fbk_0360_clubhouse_conflict_enter_front_plr;
    level.scr_goaltime[ "player_rig" ][ "fbk_0360_intro_enter_front" ] = 0;
    level.scr_anim[ "player_rig" ][ "fbk_0360_intro_enter_left" ] = player#fbk_0360_clubhouse_conflict_enter_left_plr;
    level.scr_goaltime[ "player_rig" ][ "fbk_0360_intro_enter_left" ] = 0;
    level.scr_anim[ "player_rig" ][ "fbk_0360_intro_enter_right" ] = player#fbk_0360_clubhouse_conflict_enter_right_plr;
    level.scr_goaltime[ "player_rig" ][ "fbk_0360_intro_enter_right" ] = 0;
    level.scr_anim[ "player_rig" ][ "lure_ambush" ] = player#fbk_0360_clubhouse_conflict_ambush_plr;
    level.scr_anim[ "player_rig" ][ "lure_ambush_enter_front" ] = player#fbk_0360_clubhouse_conflict_ambush_enter_front_plr;
    level.scr_goaltime[ "player_rig" ][ "lure_ambush_enter_front" ] = 0;
    level.scr_anim[ "player_rig" ][ "lure_ambush_enter_right" ] = player#fbk_0360_clubhouse_conflict_ambush_enter_right_plr;
    level.scr_goaltime[ "player_rig" ][ "lure_ambush_enter_right" ] = 0;
    addnotetrack_customfunction( "player_rig", "enable_weapons", &function_68b27b68e82009b7, "lure_ambush" );
    level.scr_anim[ "player_rig" ][ "ambulance_10" ] = player#fbk_0500_igc_capture_sh010_front_plr;
    level.scr_anim[ "player_rig" ][ "ambulance_80" ] = player#fbk_0500_igc_capture_sh080_plr;
    level.scr_anim[ "player_rig" ][ "first_person_mak_attack" ] = player#fbk_0510_garage_makarov_takedown_plr;
    level.scr_anim[ "player_rig" ][ "exfil" ] = player#fbk_1000_igc_outro_sh010_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_01" ] = player#fbk_0600_garage_squizz_p1_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_01_idle" ][ 0 ] = player#fbk_0600_garage_squizz_p1_idle_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_02" ] = player#fbk_0600_garage_squizz_p2_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_02_idle" ][ 0 ] = player#fbk_0600_garage_squizz_p2_idle_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_03" ] = player#fbk_0600_garage_squizz_p3_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_03_idle" ][ 0 ] = player#fbk_0600_garage_squizz_p3_idle_plr;
    level.scr_anim[ "player_rig" ][ "squeeze_04" ] = player#fbk_0600_garage_squizz_p4_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc1" ] = player#fbk_0600_garage_squizz_sc1_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2" ] = player#fbk_0600_garage_squizz_sc2_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_exit" ] = player#fbk_0600_garage_squizz_sc2_exit_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_enter" ] = player#fbk_0600_garage_squizz_sc2_enter_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_loop" ] = player#fbk_0600_garage_squizz_sc2_idle_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_loop_nag01" ] = player#fbk_0600_garage_squizz_sc2_nag01_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_loop_nag02" ] = player#fbk_0600_garage_squizz_sc2_nag02_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc2_alt_loop_nag03" ] = player#fbk_0600_garage_squizz_sc2_nag03_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc3" ] = player#fbk_0600_garage_squizz_sc3_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc3_alt_exit" ] = player#fbk_0600_garage_squizz_sc3_exit_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc3_alt_enter" ] = player#fbk_0600_garage_squizz_sc3_enter_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc3_alt_idle" ][ 0 ] = player#fbk_0600_garage_squizz_sc3_idle_plr;
    level.scr_anim[ "player_rig" ][ "squizz_sc4" ] = player#fbk_0600_garage_squizz_sc4_plr;
    level.scr_anim[ "player_rig" ][ "concourse_stairs_top_open_left" ] = player#fbk_0320_constairs_door_left_plr;
    addnotetrack_customfunction( "player_rig", "start_price_anim", &function_8988d14729bb8d79 );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa2d
// Size: 0xd87
function vehicles()
{
    level.scr_animtree[ "heli" ] = #vehicles;
    level.scr_anim[ "heli" ][ "exfil" ] = vehicles#fbk_1000_igc_outro_sh010_heli;
    level.scr_anim[ "heli" ][ "land" ] = vehicles#fbk_1000_igc_outro_land_heli;
    level.scr_anim[ "heli" ][ "land_idle" ][ 0 ] = vehicles#fbk_1000_igc_outro_land_idle_heli;
    level.scr_goaltime[ "heli" ][ "land_idle" ] = 0;
    level.scr_animtree[ "infilVehicle" ] = #vehicles;
    level.scr_model[ "infilVehicle" ] = "green::" + "veh9_civ_lnd_suv_overland_2016_tech_jup_vehphys_sp";
    level.scr_anim[ "infilVehicle" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_veh;
    addnotetrack_customfunction( "infilVehicle", "break_start", &function_3687ff6bc12c4c70 );
    level.scr_anim[ "infilVehicle" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_veh;
    addnotetrack_customfunction( "infilVehicle", "crowd_mass_exodus_sfx", &function_83bb01475228bd9f );
    addnotetrack_customfunction( "infilVehicle", "stadium_ext_fire_sfx", &function_382691ce33a95dbb );
    addnotetrack_customfunction( "infilVehicle", "walla_civ_panic_med_group_01", &function_db05bb2d3e681441 );
    addnotetrack_customfunction( "infilVehicle", "walla_civ_panic_med_group_02", &function_db05b82d3e680da8 );
    addnotetrack_customfunction( "infilVehicle", "walla_civ_panic_med_group_03", &function_db05b92d3e680fdb );
    addnotetrack_customfunction( "infilVehicle", "walla_civ_panic_med_group_04", &function_db05be2d3e681ada );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_onboard_int_01", &function_9adf902a9deef333 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_onboard_int_02", &function_9adf912a9deef566 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_onboard_int_03", &function_9adf922a9deef799 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_onboard_int_04", &function_9adf932a9deef9cc );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_01", &function_4608a37cd6e022ea );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_02", &function_4608a27cd6e020b7 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_03", &function_4608a17cd6e01e84 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_04", &function_4608a07cd6e01c51 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_05", &function_46089f7cd6e01a1e );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_ramp_up_bump_susp_tires_06", &function_5221b23fb59c6166 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_ramp_down_bump_susp_tires_07", &function_2b21df2e80f3380e );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_08", &function_46089c7cd6e01385 );
    addnotetrack_customfunction( "infilVehicle", "fb_intro_igc_speed_bump_susp_tires_09", &function_46089b7cd6e01152 );
    level.scr_anim[ "infilVehicle" ][ "fbk_0190" ] = vehicles#fbk_0190_garage_exit_veh;
    level.scr_anim[ "infilVehicle" ][ "fbk_0190_idle" ] = vehicles#fbk_0190_garage_exit_idle_veh;
    level.scr_anim[ "infilVehicle" ][ "fbk_0190_plr" ] = vehicles#fbk_0190_garage_exit_plr_veh;
    level.scr_animtree[ "policecar01" ] = #vehicles;
    level.scr_model[ "policecar01" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "policecar01" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_policecar01;
    level.scr_animtree[ "truck01" ] = #vehicles;
    level.scr_model[ "truck01" ] = "veh9_ind_lnd_delivery_box_truck";
    level.scr_anim[ "truck01" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_truck01;
    level.scr_animtree[ "car01" ] = #vehicles;
    level.scr_model[ "car01" ] = "veh9_civ_lnd_ralfa";
    level.scr_anim[ "car01" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car01;
    level.scr_animtree[ "car02" ] = #vehicles;
    level.scr_model[ "car02" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car02" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car02;
    level.scr_animtree[ "car03" ] = #vehicles;
    level.scr_model[ "car03" ] = "veh9_civ_lnd_hatch_small_2015";
    level.scr_anim[ "car03" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car03;
    level.scr_animtree[ "car04" ] = #vehicles;
    level.scr_model[ "car04" ] = "veh9_civ_lnd_station_wagon";
    level.scr_anim[ "car04" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car04;
    level.scr_animtree[ "car05" ] = #vehicles;
    level.scr_model[ "car05" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car05" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car05;
    level.scr_animtree[ "car06" ] = #vehicles;
    level.scr_model[ "car06" ] = "veh9_civ_lnd_van_small";
    level.scr_anim[ "car06" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car06;
    level.scr_animtree[ "car07" ] = #vehicles;
    level.scr_model[ "car07" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car07" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car07;
    level.scr_animtree[ "car08" ] = #vehicles;
    level.scr_model[ "car08" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car08" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car08;
    level.scr_animtree[ "car09" ] = #vehicles;
    level.scr_model[ "car09" ] = "veh9_civ_lnd_sedan_hatchback_1985";
    level.scr_anim[ "car09" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car09;
    level.scr_animtree[ "car10" ] = #vehicles;
    level.scr_model[ "car10" ] = "veh9_civ_lnd_van_small";
    level.scr_anim[ "car10" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car10;
    level.scr_animtree[ "car11" ] = #vehicles;
    level.scr_model[ "car11" ] = "veh9_civ_lnd_ralfa";
    level.scr_anim[ "car11" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car11;
    level.scr_animtree[ "car12" ] = #vehicles;
    level.scr_model[ "car12" ] = "veh9_civ_lnd_secho";
    level.scr_anim[ "car12" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car12;
    level.scr_animtree[ "car13" ] = #vehicles;
    level.scr_model[ "car13" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car13" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car13;
    level.scr_animtree[ "car14" ] = #vehicles;
    level.scr_model[ "car14" ] = "veh9_civ_lnd_sedan_hatchback_1985";
    level.scr_anim[ "car14" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car14;
    level.scr_animtree[ "car15" ] = #vehicles;
    level.scr_model[ "car15" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car15" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car15;
    level.scr_animtree[ "car16" ] = #vehicles;
    level.scr_model[ "car16" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car16" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car16;
    level.scr_animtree[ "car17" ] = #vehicles;
    level.scr_model[ "car17" ] = "veh9_civ_lnd_secho";
    level.scr_anim[ "car17" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car17;
    level.scr_animtree[ "car19" ] = #vehicles;
    level.scr_model[ "car19" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car19" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car19;
    level.scr_animtree[ "car20" ] = #vehicles;
    level.scr_model[ "car20" ] = "veh9_civ_lnd_station_wagon";
    level.scr_anim[ "car20" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car20;
    level.scr_animtree[ "car21" ] = #vehicles;
    level.scr_model[ "car21" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "car21" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car21;
    level.scr_animtree[ "car22" ] = #vehicles;
    level.scr_model[ "car22" ] = "veh9_civ_lnd_ralfa";
    level.scr_anim[ "car22" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car22;
    level.scr_animtree[ "car23" ] = #vehicles;
    level.scr_model[ "car23" ] = "veh9_civ_lnd_secho";
    level.scr_anim[ "car23" ][ "fbk_0110" ] = vehicles#fbk_0110_outside_drive_car23;
    level.scr_animtree[ "garage_car01" ] = #vehicles;
    level.scr_model[ "garage_car01" ] = "veh9_civ_lnd_hatch_small_2015";
    level.scr_anim[ "garage_car01" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car01;
    level.scr_animtree[ "garage_car02" ] = #vehicles;
    level.scr_model[ "garage_car02" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "garage_car02" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car02;
    level.scr_animtree[ "garage_car03" ] = #vehicles;
    level.scr_model[ "garage_car03" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "garage_car03" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car03;
    level.scr_animtree[ "garage_car04" ] = #vehicles;
    level.scr_model[ "garage_car04" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "garage_car04" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car04;
    level.scr_animtree[ "garage_car05" ] = #vehicles;
    level.scr_model[ "garage_car05" ] = "veh9_civ_lnd_hatch_small_2015";
    level.scr_anim[ "garage_car05" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car05;
    level.scr_animtree[ "garage_car06" ] = #vehicles;
    level.scr_model[ "garage_car06" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "garage_car06" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_car06;
    level.scr_animtree[ "garage_car08" ] = #vehicles;
    level.scr_model[ "garage_car08" ] = "veh9_civ_lnd_van_palfa_ambulance_ru";
    level.scr_anim[ "garage_car08" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_ambulance01;
    level.scr_animtree[ "garage_car09" ] = #vehicles;
    level.scr_model[ "garage_car09" ] = "veh9_civ_lnd_van_palfa_ambulance_ru_rig";
    level.scr_anim[ "garage_car09" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_ambulance02;
    level.scr_animtree[ "garage_car10" ] = #vehicles;
    level.scr_model[ "garage_car10" ] = "veh9_civ_lnd_van_palfa_ambulance_ru";
    level.scr_anim[ "garage_car10" ][ "fbk_0150" ] = vehicles#fbk_0150_garage_drive_ambulance03;
    level.scr_animtree[ "makarov_ambulance" ] = #vehicles;
    level.scr_model[ "makarov_ambulance" ] = "veh8_civ_lnd_palfa_static_ambulance_ukraine";
    level.scr_anim[ "makarov_ambulance" ][ "ambulanbce_intro" ] = vehicles#fbk_0420_garage_crash_enter_ambulance;
    level.scr_anim[ "makarov_ambulance" ][ "ambulanbce_idle" ][ 0 ] = vehicles#fbk_0420_garage_crash_enter_idle_ambulance;
    level.scr_anim[ "makarov_ambulance" ][ "ambulance_crash" ] = vehicles#fbk_0420_garage_crash_ambulance;
    level.scr_anim[ "makarov_ambulance" ][ "ambulance_10" ] = vehicles#fbk_0500_igc_capture_sh010_ambulance;
    level.scr_animtree[ "van01" ] = #vehicles;
    level.scr_model[ "van01" ] = "veh9_civ_lnd_van_palfa";
    level.scr_anim[ "van01" ][ "ambulance_crash" ] = vehicles#fbk_0420_garage_crash_van01;
    level.scr_animtree[ "vehicle01" ] = #vehicles;
    level.scr_model[ "vehicle01" ] = "veh9_civ_lnd_sedan_2009";
    level.scr_anim[ "vehicle01" ][ "ambulance_crash" ] = vehicles#fbk_0420_garage_crash_car01;
    level.scr_animtree[ "stadium_flee_car" ] = #vehicles;
    level.scr_model[ "stadium_flee_car" ] = "veh9_civ_lnd_secho";
    level.scr_anim[ "stadium_flee_car" ][ "stadium_flee_drive" ] = vehicles#fbk_0130_outside_civescape_car01;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107bc
// Size: 0x33
function scriptables()
{
    level.scr_animtree[ "vehicle01_scriptable" ] = #scriptables;
    level.scr_anim[ "vehicle01_scriptable" ][ "ambulance_crash" ] = scriptables#fbk_0420_garage_crash_car01;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x107f7
// Size: 0x70
function shot_civ( guy )
{
    guy.shot = 1;
    squib_head( guy );
    wait 0.5;
    
    if ( isdefined( guy.magic_bullet_shield ) && guy.magic_bullet_shield )
    {
        guy scripts\common\ai::stop_magic_bullet_shield();
    }
    
    guy.allowdeath = 1;
    guy.skipdeathanim = 1;
    guy kill();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1086f
// Size: 0x34
function function_98bd8493a41bef9f( price )
{
    playfxontag( getfx( "vfx_flashback_flashlight_midtro" ), level.price.flashlight, "tag_origin" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108ab
// Size: 0x34
function function_4dd79b1e996e523( price )
{
    stopfxontag( getfx( "vfx_flashback_flashlight_midtro" ), level.price.flashlight, "tag_origin" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108e7
// Size: 0x32
function function_daebed379b22cca1( tag )
{
    playfxontag( getfx( "vfx_imp_flesh_lrg_a" ), self, tag );
    thread play_sound_in_space( "npc_bullet_impact_script", self gettagorigin( tag ) );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10921
// Size: 0xbc
function function_1798a59ab1073008( who )
{
    bullet_start = undefined;
    
    switch ( self.animname )
    {
        case #"hash_743e42a7aaadb43e":
            bullet_start = ( 30872, 3168, -628 );
            break;
        case #"hash_743e3fa7aaadaf85":
            bullet_start = ( 30360, 3160, -628 );
            break;
        case #"hash_743e3ea7aaadadf2":
            bullet_start = ( 30768, 3400, -628 );
            break;
    }
    
    assert( isdefined( bullet_start ) );
    bullet_end = self gettagorigin( "tag_eye" );
    magicbullet( "iw9_ar_akilo_sp", bullet_start, bullet_end );
    function_daebed379b22cca1( "tag_eye" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109e5
// Size: 0x68
function function_3fcbefaab3d31c1c( who )
{
    bullet_start = ( 30728, 3360, -624 );
    offset = ( randomintrange( 250, 500 ), 0, randomintrange( 20, 50 ) );
    bullet_end = self gettagorigin( "j_spine4" ) + offset;
    magicbullet( "iw9_ar_akilo_sp", bullet_start, bullet_end );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a55
// Size: 0x16a
function function_51bc46a7b756c17e( who )
{
    body_tags = [ "j_spineupper", "j_spinelower", "j_clavicle_ri", "j_clavicle_le", "j_neck", "j_shoulder_ri", "j_shoulder_le", "j_spine4", "j_elbow_ri", "j_elbow_le" ];
    body_tag = body_tags[ randomint( body_tags.size ) ];
    bullet_start = undefined;
    
    switch ( self.animname )
    {
        case #"hash_743e46a7aaadba8a":
            bullet_start = ( 31072, 2992, -628 );
            break;
        case #"hash_743e43a7aaadb5d1":
            bullet_start = ( 31264, 3184, -628 );
            break;
        case #"hash_743e41a7aaadb2ab":
            bullet_start = ( 31248, 3056, -628 );
            break;
        case #"hash_743e40a7aaadb118":
            bullet_start = ( 31040, 3264, -628 );
            break;
        case #"hash_743e3ea7aaadadf2":
            bullet_start = ( 30768, 3400, -628 );
            break;
    }
    
    assert( isdefined( bullet_start ) );
    bullet_end = self gettagorigin( body_tag );
    magicbullet( "iw9_ar_akilo_sp", bullet_start, bullet_end );
    function_daebed379b22cca1( body_tag );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10bc7
// Size: 0x8e
function function_df60914dce68798( who )
{
    tags = [ "j_spineupper", "j_spinelower", "j_clavicle_ri", "j_clavicle_le", "j_neck", "j_shoulder_ri", "j_shoulder_le", "j_spine4", "j_elbow_ri", "j_elbow_le" ];
    tag = tags[ randomint( tags.size ) ];
    who function_daebed379b22cca1( tag );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c5d
// Size: 0x18
function squib_head( who )
{
    who function_daebed379b22cca1( "tag_eye" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c7d
// Size: 0x29
function function_c4a3717ad61c9efe( guy )
{
    doorright = scripts\sp\door::get_interactive_door( "door_concourse_stair_right" );
    doorright scripts\sp\door::unlock_door();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cae
// Size: 0x85
function grab_halligan( guy )
{
    model = getmodel( "halligan" );
    assertex( !istrue( guy.var_a23595d25a934e9 ), "Already holding hammer!!" );
    
    if ( guy.var_2bef2d79d7610fd3 )
    {
        guy.var_2bef2d79d7610fd3 = 0;
        guy detach( model, guy.hammer_tag );
    }
    
    guy attach( model, "tag_accessory_right" );
    guy.var_a23595d25a934e9 = 1;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d3b
// Size: 0x84
function stow_halligan( guy )
{
    model = getmodel( "halligan" );
    assertex( !istrue( guy.var_2bef2d79d7610fd3 ), "Hammer is already stowed!" );
    
    if ( isdefined( guy.var_a23595d25a934e9 ) )
    {
        guy detach( model, "tag_accessory_right" );
        guy.var_a23595d25a934e9 = undefined;
    }
    
    guy.var_2bef2d79d7610fd3 = 1;
    guy attach( model, guy.hammer_tag );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10dc7
// Size: 0x81
function function_f327236a6f4e591c( guy )
{
    police01 = get_living_ai( "police01", "script_noteworthy" );
    
    if ( !is_dead_or_dying( police01 ) )
    {
        for (i = 0; i < 3; i++) {
            guy shoot( 1, police01 gettagorigin( "j_head" ) );
            thread squib_head( police01 );
            wait 0.2;
        }
        
        if ( !is_dead_or_dying( police01 ) )
        {
            police01 die();
        }
    }
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e50
// Size: 0x26
function ar_drop( actor )
{
    self [[ self.fnplaceweaponon ]]( self.weapon, "left" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e7e
// Size: 0x17
function ar_grab( actor )
{
    scripts\anim\notetracks_sp::notetrackgunhand( "right" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e9d
// Size: 0x12
function use_pistol( actor )
{
    scripts\anim\notetracks::notetrackpistolpickup();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10eb7
// Size: 0x12
function function_d9dae710423864a5( actor )
{
    scripts\anim\notetracks::notetrackpistolputaway();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ed1
// Size: 0x12
function function_2cb40d711570d702( actor )
{
    scripts\anim\notetracks::notetrackguntochest();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10eeb
// Size: 0x12
function fire_gun( who )
{
    who shoot();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f05
// Size: 0xef
function function_533ef0489fd0d893( actor )
{
    gameskill = scripts\sp\analytics::get_gameskill_as_string();
    
    switch ( gameskill )
    {
        case #"hash_2fc8332783e61561":
            damage_modifier = 2.4;
            break;
        case #"hash_bbbbeacfa1d3f357":
            damage_modifier = 1.2;
            break;
        case #"hash_ceb5b5ffdddbe1ce":
            damage_modifier = 0.8;
            break;
        case #"hash_4d059e78f7f34154":
        case #"hash_c6fc7812335fee70":
            damage_modifier = 0.4;
            break;
    }
    
    damage = level.player.health * damage_modifier;
    level.player dodamage( damage, actor.origin, actor, actor, "MOD_IMPACT" );
    level.penthouse.enemy02 thread function_50ec43fc3a33af65();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ffc
// Size: 0xf1
function function_50ec43fc3a33af65()
{
    utility::place_weapon_on( self.weapon, "none" );
    namespace_997789c5b521a997::function_7ba88b2ee15a39a1( "iw9_pi_golf17_sp", "tag_weapon_right" );
    launch_dir = vectornormalize( level.player geteye() - self.fake_rifle.origin );
    launch_speed = 600;
    self.fake_rifle physicslaunchserver( self.fake_rifle.origin, launch_dir * ( launch_speed, launch_speed, launch_speed ) );
    rifle = self.fake_rifle;
    flag_wait( "lure_ambush_weapons_raised" );
    wait 1;
    
    if ( flag( "lure_ambush_player_had_pistol" ) )
    {
        utility::function_ec8a443fe8165fe4( rifle.weaponname, rifle.origin, [], rifle.angles );
    }
    
    rifle delete();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110f5
// Size: 0x48
function function_87e149cd444483f0()
{
    overlay = scripts\sp\hud_util::get_optional_overlay( "white" );
    overlay.alpha = 0.8;
    wait 0.1;
    overlay fadeovertime( 0.25 );
    overlay.alpha = 0;
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11145
// Size: 0x73
function function_68b27b68e82009b7( actor )
{
    flag_set( "lure_ambush_weapons_raised" );
    level.player enableweapons();
    level.player_rig hide();
    level.player lerpviewangleclamp( 0, 0, 0, 90, 90, 90, 30 );
    level.player delaycall( 0.5, &unlink );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111c0
// Size: 0x68
function function_b6f0903a27536471( actor )
{
    level.player.rig hide();
    level.player namespace_47819225b08b445d::function_5407d3d400318b45( 1 );
    level.player switchtoweapon( level.player.rifle );
    level.player namespace_84ed3a3872f22d68::function_9d3a5764e9212213();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11230
// Size: 0x3e
function function_e42906399edfe536( price )
{
    enemy = get_living_ai( "enemy_concourse_b_extra01", "script_noteworthy" );
    
    if ( !is_dead_or_dying( enemy ) )
    {
        enemy kill();
        price shoot();
    }
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11276
// Size: 0x3e
function function_e42905399edfe303( price )
{
    enemy = get_living_ai( "enemy_concourse_b_extra02", "script_noteworthy" );
    
    if ( !is_dead_or_dying( enemy ) )
    {
        enemy kill();
        price shoot();
    }
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112bc
// Size: 0x92
function pistol_burst( guy )
{
    self notify( "stop_pistol_shoot" );
    self endon( "stop_pistol_shoot" );
    
    if ( ent_flag( "notetrack_shooting" ) )
    {
        /#
        #/
        
        ent_flag_clear( "notetrack_shooting" );
    }
    
    ent_flag_set( "notetrack_shooting" );
    num = randomintrange( 2, 3 );
    
    for (i = 0; i < num; i++) {
        self shoot();
        wait randomfloatrange( 0.15, 0.2 );
    }
    
    ent_flag_clear( "notetrack_shooting" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11356
// Size: 0x1e
function function_8b8be590f74c7c13( guy )
{
    self shoot();
    flag_set( "restaurant_shooter_killed_civ" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1137c
// Size: 0x12
function scripted_fire( guy )
{
    self shoot();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11396
// Size: 0x6a
function function_8bccb5c6c5858c48( guy )
{
    left_door = scripts\sp\door::get_interactive_door( "penthouse_back_door_left" );
    
    if ( left_door scripts\sp\door::function_bb083055639abcf3() )
    {
        level.price stopanimscripted();
        level.penthouse.back_door_left stopanimscripted();
        flag_set( "penthouse_bomb_scene_done" );
        return;
    }
    
    left_door namespace_47819225b08b445d::function_cd8107d772ca6582();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11408
// Size: 0x5d
function function_382691ce33a95dbb( guy )
{
    level.var_98456c1c93b5dcc5 = spawn( "script_origin", ( 28221, -2209, 27 ) );
    level.var_98456c1c93b5dcc5 sound_fade_in( "scn_outside_stadium_fire_large_lp", 1, 6, 1 );
    wait 28;
    level.var_98456c1c93b5dcc5 sound_fade_and_delete( 5, 1 );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1146d
// Size: 0xa9
function function_83bb01475228bd9f( guy )
{
    level.player delaycall( 9, &setsoundsubmix, "sp_jup_flashback_intro_scripted3_up", 0.2 );
    level.player delaycall( 12, &clearsoundsubmix, "sp_jup_flashback_intro_scripted3_up", 0.5 );
    level.var_7326064e1e6654ca = spawn( "script_origin", ( 25351, -1423, -432 ) );
    waitframe();
    level.var_7326064e1e6654ca playsound( "scn_outside_stadium_crowd_mass_exodus", "sounddone" );
    level.var_7326064e1e6654ca waittill( "sounddone" );
    waitframe();
    level.var_7326064e1e6654ca delete();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1151e
// Size: 0x1f
function function_632c3a8f7bf355d2( guy )
{
    level.player playrumbleonentity( "damage_heavy" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11545
// Size: 0x1f
function function_dd5f56d0e7d1c29( guy )
{
    level.player playrumbleonentity( "damage_light" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1156c
// Size: 0x1a
function function_8422cce422243874( guy )
{
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1158e
// Size: 0xb
function function_7463f80896c36170( guy )
{
    
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115a1
// Size: 0x17
function function_8988d14729bb8d79( guy )
{
    flag_set( "concourse_stairs_price_at_door" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115c0
// Size: 0xad
function function_3687ff6bc12c4c70( who )
{
    var_61a0a0db7baf1603 = anglestoforward( level.infilvehicle gettagangles( "tag_body" ) );
    plr_forward = anglestoforward( level.player getplayerangles() );
    dot = vectordot( var_61a0a0db7baf1603, plr_forward );
    angle = acos( dot );
    
    if ( angle < 30 )
    {
        return;
    }
    
    lerp_time = 0.7;
    level.player lerpviewangleclamp( lerp_time, lerp_time * 0.5, lerp_time * 0.5, 5, 5, 5, 5 );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11675
// Size: 0x63
function function_9af9f1486a47aafe( guy )
{
    level.var_5e883c7c0b77f6b8 = spawn( "script_origin", self.origin );
    level.var_5e883c7c0b77f6b8 linkto( self );
    level.var_5e883c7c0b77f6b8 thread play_sound_on_entity( "scn_fb_intro_24_walla_woman_near_miss_01", "sounddone" );
    level.var_5e883c7c0b77f6b8 thread delete_on_sounddone();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116e0
// Size: 0x63
function function_69d13f4a43b8132c( guy )
{
    level.var_28434c39ae500112 = spawn( "script_origin", self.origin );
    level.var_28434c39ae500112 linkto( self );
    level.var_28434c39ae500112 thread play_sound_on_entity( "scn_fb_intro_23_walla_ramp_stumbler_01", "sounddone" );
    level.var_28434c39ae500112 thread delete_on_sounddone();
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1174b
// Size: 0x22
function function_b0287c95789418aa( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_18_walla_street_corner_left_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11775
// Size: 0x22
function function_f92b6f12c290e629( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_19_walla_street_corner_right_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1179f
// Size: 0x22
function function_35eb4a96117d3c9b( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_20_walla_gate_left_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117c9
// Size: 0x22
function function_89e68a35cdb14e11( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_22_walla_ramp_runner_left_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117f3
// Size: 0x22
function function_65961260db043491( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_26_walla_garage_civ_2_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1181d
// Size: 0x22
function function_ad47635c5fbe4845( guy )
{
    level thread play_sound_in_space( "scn_fb_intro_29_walla_witness_hit_by_car_01", self.origin );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11847
// Size: 0x26
function function_db05bb2d3e681441( guy )
{
    level thread play_sound_in_space( "walla_civ_panic_med_group", ( 27826, 82, -852 ) );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11875
// Size: 0x26
function function_db05b82d3e680da8( guy )
{
    level thread play_sound_in_space( "walla_civ_panic_med_group", ( 28429, -461, -852 ) );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118a3
// Size: 0x41
function function_db05b92d3e680fdb( guy )
{
    level thread play_sound_in_space( "walla_civ_panic_med_group", ( 31004, 405, -852 ) );
    level thread play_sound_in_space( "walla_civ_panic_med_group", ( 31625, 522, -852 ) );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118ec
// Size: 0x26
function function_db05be2d3e681ada( guy )
{
    level thread play_sound_in_space( "walla_civ_panic_med_group", ( 31893, 1626, -803 ) );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1191a
// Size: 0x1f
function function_b5b7356d717e95fe( guy )
{
    level.player playsound( "fbk_0400_elevator_feet_land_01" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11941
// Size: 0x63
function function_9adf8f2a9deef100( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.var_bf97ba528a738d87 = snd::snd_play( "fb_intro_igc_onboard_int_00_lr", level.infilvehicle.var_e6f87d9c1d194fa3 );
    level.var_bf97bb528a738fba = snd::snd_play( "fb_intro_igc_onboard_int_00_lsrs", level.infilvehicle.var_fdd8d757a4e3c42d );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119ac
// Size: 0x51
function function_9adf902a9deef333( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_onboard_int_01_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_onboard_int_01_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a05
// Size: 0x51
function function_9adf912a9deef566( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_onboard_int_02_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_onboard_int_02_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a5e
// Size: 0x51
function function_9adf922a9deef799( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_onboard_int_03_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_onboard_int_03_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ab7
// Size: 0x51
function function_9adf932a9deef9cc( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_onboard_int_04_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_onboard_int_04_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b10
// Size: 0x51
function function_4608a37cd6e022ea( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_01_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_01_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b69
// Size: 0x51
function function_4608a27cd6e020b7( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_02_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_02_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11bc2
// Size: 0x51
function function_4608a17cd6e01e84( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_03_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_03_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c1b
// Size: 0x51
function function_4608a07cd6e01c51( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_04_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_04_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c74
// Size: 0x51
function function_46089f7cd6e01a1e( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_05_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_05_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ccd
// Size: 0x51
function function_5221b23fb59c6166( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_ramp_up_bump_susp_tires_06_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_ramp_up_bump_susp_tires_06_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d26
// Size: 0x51
function function_2b21df2e80f3380e( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_ramp_down_bump_susp_tires_07_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_ramp_down_bump_susp_tires_07_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d7f
// Size: 0x51
function function_46089c7cd6e01385( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_08_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_08_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11dd8
// Size: 0x51
function function_46089b7cd6e01152( guy )
{
    if ( !function_3fbc97b086e66f67() )
    {
        return;
    }
    
    level.infilvehicle.var_e6f87d9c1d194fa3 playsound( "fb_intro_igc_speed_bump_susp_tires_09_lr" );
    level.infilvehicle.var_fdd8d757a4e3c42d playsound( "fb_intro_igc_speed_bump_susp_tires_09_lsrs" );
}

// Namespace namespace_813e4ba6b29c9ad8 / namespace_7f81dff3bcaf7919
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e31
// Size: 0x43
function function_3fbc97b086e66f67()
{
    result = 1;
    
    if ( !isdefined( level.infilvehicle.var_e6f87d9c1d194fa3 ) || !isdefined( level.infilvehicle.var_fdd8d757a4e3c42d ) )
    {
        result = 0;
    }
    
    return result;
}

