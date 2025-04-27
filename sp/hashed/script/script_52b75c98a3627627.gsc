#using script_73e89fcb51b31802;
#using scripts\anim\dialogue;
#using scripts\anim\shared;
#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\anim;
#using scripts\sp\maps\sp_jup_silo\sp_jup_silo_lighting;
#using scripts\sp\utility;

#namespace namespace_d7740e9dc284e25e;

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c4
// Size: 0x25
function main()
{
    player();
    xcams();
    human();
    face();
    script_models();
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25f1
// Size: 0x139
function player()
{
    rig = "player_rig";
    level.scr_animtree[ rig ] = #player;
    level.scr_model[ rig ] = "vm_c_jup_sp_hero_price_desert";
    level.scr_anim[ rig ][ "infil_2" ] = player#jup_silo_0010_igc_intro_sh020_plr;
    animation::addnotetrack_customfunction( rig, "stop_userskip", &stop_userskip, "infil_2" );
    animation::addnotetrack_customfunction( rig, "start_weapon_raise", &start_weapon_raise, "infil_2" );
    level.scr_anim[ rig ][ "keycard_interact" ] = player#jup_silo_vm_keycard_plr;
    level.scr_anim[ rig ][ "maintenance_door_enter_alt" ] = player#jup_silo_maintenance_door_vm01;
    level.scr_anim[ rig ][ "silo_interact_early" ] = player#jup_silo_defuse_enter_to_scene_b_plr;
    level.scr_anim[ rig ][ "silo_interact_early_idle" ][ 0 ] = player#jup_silo_defuse_scene_b_idle_plr;
    level.scr_anim[ rig ][ "silo_interact_scene_alt" ] = player#jup_silo_defuse_scene_b_no_int_plr;
    level.scr_anim[ rig ][ "silo_interact_scene" ] = player#jup_silo_defuse_scene_b_plr;
    level.scr_anim[ rig ][ "outro_1" ] = player#jup_silo_1000_igc_outro_sh010_plr_cam;
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2732
// Size: 0x12
function stop_userskip( rig )
{
    utility::userskip_stop();
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x274c
// Size: 0x36
function start_weapon_raise( rig )
{
    level.player showviewmodel();
    level.player val::set( "igc", "weapon", 1 );
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278a
// Size: 0x95
function xcams()
{
    level.scr_xcam[ "infil_1" ] = "jup_silo_0010_igc_intro_sh010_xcam";
    level.scr_xcam[ "outro_2" ] = "jup_silo_1000_igc_outro_sh012_xcam";
    level.scr_xcam[ "outro_3" ] = "jup_silo_1000_igc_outro_sh015_xcam";
    level.scr_xcam[ "outro_4" ] = "jup_silo_1000_igc_outro_sh017_xcam";
    level.scr_xcam[ "outro_5" ] = "jup_silo_1000_igc_outro_sh020_xcam";
    level.scr_xcam[ "cctv" ] = "jup_silo_control_room_cctv_cam01";
    level.scr_xcam[ "cctv" ] = "jup_silo_control_room_cctv_cam02";
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2827
// Size: 0xd2e
function human()
{
    generic = "generic";
    var_9a04df6e6fdfceae = "poster_guy_1";
    var_9a04de6e6fdfcc7b = "poster_guy_2";
    var_a6d39bf70e442ada = "spray_guy_1";
    var_a6d39af70e4428a7 = "spray_guy_2";
    var_89d279b40133217 = "meetup_guard_1";
    var_89d289b4013344a = "meetup_guard_2";
    var_89d299b4013367d = "meetup_guard_3";
    var_69cb3754bb7f7588 = "guard_1";
    var_69cb3a54bb7f7c21 = "guard_2";
    var_69cb3954bb7f79ee = "guard_3";
    level.scr_animtree[ "fakePlayer" ] = #generic_human;
    level.scr_anim[ "fakePlayer" ][ "infil_2" ] = generic_human#jup_silo_0010_igc_intro_sh020_price;
    level.scr_anim[ "fakePlayer" ][ "crouch_pose" ][ 0 ] = generic_human#sdr_cap_stand_to_crouch_use_tablet__loop;
    level.scr_anim[ "fakePlayer" ][ "prone_pose" ][ 0 ] = generic_human#mp_killstreak_laptop_idle_prone;
    animation::addnotetrack_customfunction( "fakePlayer", "fade", &function_9e0f6e7984526925, "infil_2" );
    level.scr_anim[ "drone_guy_1" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy01_alt;
    level.scr_anim[ "drone_guy_2" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy02_alt;
    level.scr_anim[ "drone_guy_3" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy03_alt;
    level.scr_anim[ "drone_guy_4" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy04_alt;
    level.scr_anim[ "drone_guy_5" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy05_alt;
    level.scr_anim[ "drone_guy_6" ][ "drone_view_1" ] = generic_human#jup_silo_truck_arrival_enemy06_alt;
    level.scr_anim[ var_9a04df6e6fdfceae ][ "idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_a_enemy01;
    level.scr_anim[ var_9a04df6e6fdfceae ][ "scene_2" ] = generic_human#jup_silo_falseflag_poster_scene_a_enemy01;
    level.scr_anim[ var_9a04df6e6fdfceae ][ "idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_b_enemy01;
    level.scr_anim[ var_9a04df6e6fdfceae ][ "scene_3" ] = generic_human#jup_silo_falseflag_poster_scene_b_enemy01;
    level.scr_anim[ var_9a04df6e6fdfceae ][ "idle_3" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_c_enemy01;
    level.scr_anim[ var_9a04de6e6fdfcc7b ][ "idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_a_enemy02;
    level.scr_anim[ var_9a04de6e6fdfcc7b ][ "scene_2" ] = generic_human#jup_silo_falseflag_poster_scene_a_enemy02;
    level.scr_anim[ var_9a04de6e6fdfcc7b ][ "idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_b_enemy02;
    level.scr_anim[ var_9a04de6e6fdfcc7b ][ "scene_3" ] = generic_human#jup_silo_falseflag_poster_scene_b_enemy02;
    level.scr_anim[ var_9a04de6e6fdfcc7b ][ "idle_3" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_c_enemy02;
    level.scr_anim[ var_a6d39bf70e442ada ][ "idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_a_enemy03;
    level.scr_anim[ var_a6d39bf70e442ada ][ "scene_2" ] = generic_human#jup_silo_falseflag_painter_scene_a_enemy03;
    level.scr_anim[ var_a6d39bf70e442ada ][ "idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_b_enemy03;
    level.scr_anim[ var_a6d39bf70e442ada ][ "exit" ] = generic_human#jup_silo_falseflag_painter_exit_enemy03;
    level.scr_anim[ var_a6d39af70e4428a7 ][ "idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_a_enemy04;
    level.scr_anim[ var_a6d39af70e4428a7 ][ "scene_2" ] = generic_human#jup_silo_falseflag_painter_scene_a_enemy04;
    level.scr_anim[ var_a6d39af70e4428a7 ][ "idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_b_enemy04;
    level.scr_anim[ var_a6d39af70e4428a7 ][ "exit" ] = generic_human#jup_silo_falseflag_painter_exit_enemy04;
    level.scr_anim[ generic ][ "poster_idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_a_enemy02_generic;
    level.scr_anim[ generic ][ "poster_scene_2" ] = generic_human#jup_silo_falseflag_poster_scene_a_enemy02_generic;
    level.scr_anim[ generic ][ "poster_idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_poster_idle_b_enemy02_generic;
    level.scr_anim[ generic ][ "painter_idle_1" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_a_enemy03_generic;
    level.scr_anim[ generic ][ "painter_scene_2" ] = generic_human#jup_silo_falseflag_painter_scene_a_enemy03_generic;
    level.scr_anim[ generic ][ "painter_idle_2" ][ 0 ] = generic_human#jup_silo_falseflag_painter_idle_b_enemy03_generic;
    level.scr_anim[ "partner" ][ "meetup_scene_1" ] = generic_human#jup_silo_meetup_scene_a_farah;
    level.scr_anim[ "partner" ][ "meetup_idle" ][ 0 ] = generic_human#jup_silo_meetup_idle_a_farah;
    level.scr_anim[ "partner" ][ "meetup_scene_2" ] = generic_human#jup_silo_meetup_scene_b_farah;
    level.scr_anim[ "partner" ][ "meetup_idle_2" ][ 0 ] = generic_human#jup_silo_meetup_exit_idle_farah;
    animation::addnotetrack_customfunction( "partner", "door_open", &function_db4d7ba0fea6d09, "meetup_scene_2" );
    level.scr_anim[ var_89d279b40133217 ][ "meetup_scene_1" ] = generic_human#jup_silo_meetup_scene_a_enemy01;
    level.scr_anim[ var_89d279b40133217 ][ "meetup_idle" ][ 0 ] = generic_human#jup_silo_meetup_idle_a_enemy01;
    level.scr_anim[ var_89d279b40133217 ][ "meetup_scene_2" ] = generic_human#jup_silo_meetup_scene_b_enemy01;
    animation::addnotetrack_customfunction( var_89d279b40133217, "door_close", &function_d5896074b59df36f, "meetup_scene_1" );
    animation::addnotetrack_detach_gun( var_89d279b40133217, "drop_gun", "meetup_scene_2" );
    level.scr_anim[ var_89d289b4013344a ][ "meetup_scene_1" ] = generic_human#jup_silo_meetup_scene_a_enemy02;
    level.scr_anim[ var_89d289b4013344a ][ "meetup_idle" ][ 0 ] = generic_human#jup_silo_meetup_idle_a_enemy02;
    level.scr_anim[ var_89d289b4013344a ][ "meetup_scene_2" ] = generic_human#jup_silo_meetup_scene_b_enemy02;
    level.scr_anim[ var_89d299b4013367d ][ "meetup_scene_1" ] = generic_human#jup_silo_meetup_scene_a_enemy03;
    level.scr_anim[ var_89d299b4013367d ][ "meetup_idle" ][ 0 ] = generic_human#jup_silo_meetup_idle_a_enemy03;
    level.scr_anim[ var_89d299b4013367d ][ "meetup_scene_2" ] = generic_human#jup_silo_meetup_scene_b_enemy03;
    level.scr_goaltime[ var_89d299b4013367d ][ "meetup_scene_2" ] = 1;
    level.scr_goaltime[ "partner" ][ "meetup_scene_2" ] = 0;
    level.scr_anim[ "partner" ][ "maintenance_door_enter_alt" ] = generic_human#jup_silo_mainenance_door_enter01_farah_plr;
    level.scr_anim[ "partner" ][ "maintenance_door_enter" ] = generic_human#jup_silo_mainenance_door_enter01_farah;
    level.scr_anim[ "partner" ][ "maintenance_door_idle" ][ 0 ] = generic_human#jup_silo_mainenance_door_idle01_farah;
    level.scr_anim[ "partner" ][ "maintenance_door_exit" ] = generic_human#jup_silo_mainenance_door_main_exit;
    level.scr_anim[ "partner" ][ "hallway_full" ] = generic_human#jup_silo_mainenance_door_run_to_jump_down;
    level.scr_anim[ "partner" ][ "hallway_enter" ] = generic_human#jup_silo_jump_down_enter_to_hall_idle;
    level.scr_anim[ "partner" ][ "hallway_idle" ][ 0 ] = generic_human#jup_silo_jump_down_hall_idle;
    level.scr_anim[ "partner" ][ "hallway_exit" ] = generic_human#jup_silo_jump_down_exit_to_jump_down;
    level.scr_anim[ "partner" ][ "hallway_end_idle" ][ 0 ] = generic_human#jup_silo_jump_down_idle_farah;
    level.scr_goaltime[ "partner" ][ "hallway_full" ] = 0.08;
    level.scr_goaltime[ "partner" ][ "hallway_enter" ] = 0.08;
    level.scr_anim[ "cctv_1" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy01;
    level.scr_anim[ "cctv_2" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy02;
    level.scr_anim[ "cctv_3" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy03;
    level.scr_anim[ "cctv_4" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy04;
    level.scr_anim[ "cctv_5" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy05;
    level.scr_anim[ "cctv_6" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy06;
    level.scr_anim[ "cctv_7" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy07;
    level.scr_anim[ "cctv_8" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy08;
    level.scr_anim[ "cctv_9" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy09;
    level.scr_anim[ "cctv_10" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy10;
    level.scr_anim[ "cctv_11" ][ "cctv" ] = generic_human#jup_silo_control_room_cctv_enemy11;
    level.scr_anim[ "partner" ][ "jump_down" ] = generic_human#jup_silo_jump_down_farah;
    animation::addnotetrack_notify( "partner", "silo_room_kill_1", "silo_room_kill_1", "jump_down" );
    animation::addnotetrack_notify( "partner", "silo_room_kill_2", "silo_room_kill_2", "jump_down" );
    level.scr_goaltime[ "partner" ][ "jump_down" ] = 0;
    level.scr_anim[ var_69cb3754bb7f7588 ][ "silo_idle" ][ 0 ] = generic_human#jup_silo_control_room_cctv_enemy04;
    level.scr_anim[ var_69cb3a54bb7f7c21 ][ "silo_idle" ][ 0 ] = generic_human#jup_silo_control_room_cctv_enemy10;
    level.scr_anim[ var_69cb3954bb7f79ee ][ "silo_idle" ][ 0 ] = generic_human#jup_silo_control_room_cctv_enemy11;
    level.scr_anim[ "partner" ][ "silo_defuse_idle" ][ 0 ] = generic_human#jup_silo_defuse_idle_a_farah;
    level.scr_anim[ "partner" ][ "silo_defuse_scene" ] = generic_human#jup_silo_defuse_scene_a_farah;
    level.scr_anim[ "partner" ][ "silo_defuse_idle_b" ] = generic_human#jup_silo_defuse_idle_b_farah;
    level.scr_anim[ "partner" ][ "silo_defuse_idle_b_nag_0" ] = generic_human#jup_silo_defuse_idle_b_nag_1_farah;
    level.scr_anim[ "partner" ][ "silo_defuse_idle_b_nag_1" ] = generic_human#jup_silo_defuse_idle_b_nag_2_farah;
    level.scr_anim[ "partner" ][ "silo_defuse_idle_b_nag_2" ] = generic_human#jup_silo_defuse_idle_b_nag_3_farah;
    animation::addnotetrack_flag( "partner", "prompt_laptop", "laptop_interact_ready", "silo_defuse_scene" );
    animation::addnotetrack_flag( "partner", "prompt_scene", "laptop_scene_ready", "silo_defuse_scene" );
    level.scr_anim[ "partner" ][ "silo_interact_scene" ] = generic_human#jup_silo_defuse_scene_b_farah;
    animation::addnotetrack_customfunction( "partner", "audio_missile_activate", &audio_missile_activate, "silo_interact_scene" );
    level.scr_anim[ "partner" ][ "silo_interact_idle" ][ 0 ] = generic_human#jup_silo_defuse_idle_c_farah;
    level.scr_anim[ "partner" ][ "silo_idle_to_combat" ] = generic_human#jup_silo_defuse_idle_c_to_combat_farah;
    level.scr_anim[ "partner" ][ "silo_combat_to_idle" ] = generic_human#jup_silo_defuse_combat_to_idle_d_farah;
    level.scr_anim[ "partner" ][ "silo_post_combat_idle" ][ 0 ] = generic_human#jup_silo_defuse_idle_d_farah;
    level.scr_anim[ "pilot" ][ "heli_pilot_idle" ][ 0 ] = generic_human#vh_blima_rappel_pilot;
    level.scr_anim[ "copilot" ][ "heli_pilot_idle" ][ 0 ] = generic_human#vh_blima_rappel_copilot;
    level.scr_anim[ "enemy01" ][ "finale_idle" ][ 0 ] = generic_human#jup_silo_surprise_idle_enmy01;
    level.scr_anim[ "enemy01" ][ "finale_react" ] = generic_human#jup_silo_surprise_react_enmy01;
    level.scr_anim[ "fakePlayer" ][ "outro_1" ] = generic_human#jup_silo_1000_igc_outro_sh010_price;
    level.scr_anim[ "fakePlayer" ][ "outro_2" ] = generic_human#jup_silo_1000_igc_outro_sh012_price;
    level.scr_anim[ "fakePlayer" ][ "outro_3" ] = generic_human#jup_silo_1000_igc_outro_sh015_price;
    level.scr_anim[ "fakePlayer" ][ "outro_4" ] = generic_human#jup_silo_1000_igc_outro_sh017_price;
    level.scr_anim[ "fakePlayer" ][ "outro_5" ] = generic_human#jup_silo_1000_igc_outro_sh020_price;
    level.scr_goaltime[ "fakePlayer" ][ "outro_2" ] = 0;
    level.scr_goaltime[ "fakePlayer" ][ "outro_3" ] = 0;
    level.scr_goaltime[ "fakePlayer" ][ "outro_4" ] = 0;
    level.scr_goaltime[ "fakePlayer" ][ "outro_5" ] = 0;
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355d
// Size: 0x366
function face()
{
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_ifwewastetimetheycou" ] = generic_human#dx_sp_jslo_itrp_fara_ifwewastetimetheycou_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_wecantstayherewehave" ] = generic_human#dx_sp_jslo_itrp_fara_wecantstayherewehave_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_throughthedoorcaptai" ] = generic_human#dx_sp_jslo_itrp_fara_throughthedoorcaptai_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_wehavetomove" ] = generic_human#dx_sp_jslo_itrp_fara_wehavetomove_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_onyou" ] = generic_human#dx_sp_jslo_itrp_fara_onyou_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_gunsandgrenadesherel" ] = generic_human#dx_sp_jslo_itrp_fara_gunsandgrenadesherel_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_theyknowwereheredont" ] = generic_human#dx_sp_jslo_itrp_fara_theyknowwereheredont_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_stayfrostyoldman" ] = generic_human#dx_sp_jslo_itrp_fara_stayfrostyoldman_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_gotyourbackcaptain" ] = generic_human#dx_sp_jslo_itrp_fara_gotyourbackcaptain_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_onyoursix" ] = generic_human#dx_sp_jslo_itrp_fara_onyoursix_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_keeppushingwehavetoc" ] = generic_human#dx_sp_jslo_itrp_fara_keeppushingwehavetoc_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_checkyourcorners" ] = generic_human#dx_sp_jslo_itrp_fara_checkyourcorners_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_itrp_fara_entrancetothecontrol" ] = generic_human#dx_sp_jslo_itrp_fara_entrancetothecontrol_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_keeppushingwehavetog" ] = generic_human#dx_sp_jslo_cntr_fara_keeppushingwehavetog_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_thelaunchplatformiso" ] = generic_human#dx_sp_jslo_cntr_fara_thelaunchplatformiso_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_itslocked" ] = generic_human#dx_sp_jslo_cntr_fara_itslocked_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_illgetitopenstandby" ] = generic_human#dx_sp_jslo_cntr_fara_illgetitopenstandby_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_doorsopen" ] = generic_human#dx_sp_jslo_cntr_fara_doorsopen_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_letsmove" ] = generic_human#dx_sp_jslo_cntr_fara_letsmove_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_movetocover" ] = generic_human#dx_sp_jslo_cntr_fara_movetocover_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_shootersuptop" ] = generic_human#dx_sp_jslo_cntr_fara_shootersuptop_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_captaindoyouhearthat" ] = generic_human#dx_sp_jslo_cntr_fara_captaindoyouhearthat_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_theyretryingtolaunch" ] = generic_human#dx_sp_jslo_cntr_fara_theyretryingtolaunch_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_thedoortothesilosatt" ] = generic_human#dx_sp_jslo_cntr_fara_thedoortothesilosatt_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_ifwecangettothemissi" ] = generic_human#dx_sp_jslo_cntr_fara_ifwecangettothemissi_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_cntr_fara_weneedtogetthroughth" ] = generic_human#dx_sp_jslo_cntr_fara_weneedtogetthroughth_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_defs_fara_konnisincoming" ] = generic_human#dx_sp_jslo_defs_fara_konnisincoming_face;
    level.scr_face[ "partner" ][ "dx_sp_jslo_mslr_fara_thiswayletsmove" ] = generic_human#dx_sp_jslo_mslr_fara_thiswayletsmove_face;
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38cb
// Size: 0x18
function function_9e0f6e7984526925( guy )
{
    anim_sp::letterbox_enable( 0, 1.5 );
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38eb
// Size: 0x76
function function_d5896074b59df36f( guy )
{
    utility::flag_set( "close_meetup_doors" );
    level.meetup.door moveto( level.meetup.origin, 1.2 );
    level.meetup.door playsound( "scn_jup_lower_base_security_door_close" );
    thread namespace_318af18595992d06::function_7dff40c0e5cc9dbe();
    thread scripts\sp\maps\sp_jup_silo\sp_jup_silo_lighting::function_14a0501f982ee582();
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3969
// Size: 0xc6
function function_db4d7ba0fea6d09( guy )
{
    blocker = getent( "meetup_blocker", "targetname" );
    blocker delete();
    level.meetup.door moveto( level.meetup.struct.origin, 1.2 );
    level.meetup.door playsound( "scn_jup_lower_base_security_door_open" );
    scripts\anim\shared::placeweaponon( level.partner.primaryweapon, "right" );
    level.partner notify( "weapon_switch_done" );
    wait 1.2;
    utility::flag_set( "farah_opens_door" );
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a37
// Size: 0x5a
function function_36a288a4986bda3c( guy )
{
    guy endon( "death" );
    guy.allowdeath = 1;
    guy.diequietly = 1;
    guy.skipdeathanim = 1;
    guy kill( level.partner geteye(), level.partner );
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a99
// Size: 0x6f2
function script_models()
{
    drone = "intro_drone";
    level.scr_animtree[ drone ] = #script_model;
    level.scr_model[ drone ] = "projectile_switchdrone_00_silo";
    level.scr_anim[ drone ][ "infil_1" ] = script_model#jup_silo_0010_igc_intro_sh010_drone;
    truck = "drone_truck";
    level.scr_animtree[ truck ] = #script_model;
    level.scr_model[ truck ] = "green::veh9_mil_lnd_cargo_truck_cover_open_vehphys_sp";
    level.scr_anim[ truck ][ "drone_view_1" ] = script_model#jup_silo_truck_arrival_truck01;
    truck = "poster_truck";
    level.scr_animtree[ truck ] = #script_model;
    level.scr_anim[ truck ][ "idle_1" ] = script_model#jup_silo_falseflag_poster_idle_a_truck;
    truck = "painter_truck";
    level.scr_animtree[ truck ] = #script_model;
    level.scr_anim[ truck ][ "idle_1" ][ 0 ] = script_model#jup_silo_falseflag_painter_idle_a_truck;
    level.scr_anim[ truck ][ "scene_2" ] = script_model#jup_silo_falseflag_painter_scene_a_truck;
    vent = "meetup_vent";
    level.scr_animtree[ vent ] = #script_model;
    level.scr_model[ vent ] = "duct_metal_square_vent_b";
    level.scr_anim[ vent ][ "meetup_scene_2" ] = script_model#jup_silo_meetup_scene_b_hatch;
    level.scr_goaltime[ vent ][ "meetup_scene_2" ] = 0;
    button = "meetup_button";
    level.scr_animtree[ button ] = #script_model;
    level.scr_anim[ button ][ "meetup_scene_1" ] = script_model#jup_silo_meetup_scene_a_cellbutton;
    level.scr_anim[ button ][ "meetup_scene_2" ] = script_model#jup_silo_meetup_scene_b_cellbutton;
    door = "maintenance_door_r";
    level.scr_animtree[ door ] = #script_model;
    level.scr_anim[ door ][ "maintenance_door_exit" ] = script_model#jup_silo_mainenance_door_exit02_door01;
    door = "maintenance_door_l";
    level.scr_animtree[ door ] = #script_model;
    level.scr_anim[ door ][ "maintenance_door_exit" ] = script_model#jup_silo_mainenance_door_exit02_door02;
    button = "maintenance_button";
    level.scr_animtree[ button ] = #script_model;
    level.scr_model[ button ] = "electrical_cell_door_button_red";
    level.scr_anim[ button ][ "maintenance_door_enter_alt" ] = script_model#jup_silo_mainenance_door_vm01_cellbutton;
    level.scr_anim[ button ][ "maintenance_door_idle" ][ 0 ] = script_model#jup_silo_mainenance_door_idle01_cellbutton;
    level.scr_anim[ button ][ "maintenance_door_exit" ] = script_model#jup_silo_mainenance_door_exit02_cellbutton;
    animation::addnotetrack_customfunction( button, "swap_model_on", &function_9e30d3207113511a, "maintenance_door_exit" );
    rocket = "silo_container";
    level.scr_animtree[ rocket ] = #script_model;
    level.scr_anim[ rocket ][ "back_door_open" ] = script_model#jup_silo_defuse_interrupt_container;
    laptop = "laptop";
    level.scr_animtree[ laptop ] = #script_model;
    level.scr_model[ laptop ] = "cinematic_brush::misc_vm_missiledefusalconsole_v0";
    level.scr_anim[ laptop ][ "silo_defuse_scene" ] = script_model#jup_silo_defuse_scene_a_briefcase;
    level.scr_anim[ laptop ][ "silo_interact_scene" ] = script_model#jup_silo_defuse_scene_b_briefcase;
    tablet = "farah_tablet";
    level.scr_animtree[ tablet ] = #script_model;
    level.scr_model[ tablet ] = "cinematic_brush_example::offhand_1h_vm_tablet_v0_silo";
    level.scr_anim[ tablet ][ "silo_defuse_scene" ] = script_model#jup_silo_defuse_scene_a_tablet;
    level.scr_anim[ tablet ][ "silo_defuse_idle_b" ] = script_model#jup_silo_defuse_idle_b_tablet;
    level.scr_anim[ tablet ][ "silo_defuse_idle_b_nag_0" ] = script_model#jup_silo_defuse_idle_b_nag_1_tablet;
    level.scr_anim[ tablet ][ "silo_defuse_idle_b_nag_1" ] = script_model#jup_silo_defuse_idle_b_nag_2_tablet;
    level.scr_anim[ tablet ][ "silo_defuse_idle_b_nag_2" ] = script_model#jup_silo_defuse_idle_b_nag_3_tablet;
    level.scr_anim[ tablet ][ "silo_interact_scene" ] = script_model#jup_silo_defuse_scene_b_tablet;
    level.scr_anim[ tablet ][ "silo_interact_idle" ][ 0 ] = script_model#jup_silo_defuse_idle_c_tablet;
    level.scr_anim[ tablet ][ "silo_idle_to_combat" ] = script_model#jup_silo_defuse_idle_c_to_combat_tablet;
    level.scr_anim[ tablet ][ "silo_combat_to_idle" ] = script_model#jup_silo_defuse_combat_to_idle_d_tablet;
    level.scr_anim[ tablet ][ "silo_post_combat_idle" ][ 0 ] = script_model#jup_silo_defuse_idle_d_tablet;
    hatch = "silo_hatch";
    level.scr_animtree[ hatch ] = #script_model;
    level.scr_anim[ hatch ][ "hatch_open" ] = script_model#jup_silo_hatch_open;
    level.scr_anim[ hatch ][ "hatch_close" ] = script_model#jup_silo_hatch_close;
    level.scr_anim[ hatch ][ "outro_1" ] = script_model#jup_silo_1000_igc_outro_sh010_hatch;
    level.scr_anim[ hatch ][ "outro_2" ] = script_model#jup_silo_1000_igc_outro_sh012_hatch;
    level.scr_anim[ hatch ][ "outro_3" ] = script_model#jup_silo_1000_igc_outro_sh015_hatch;
    level.scr_anim[ hatch ][ "outro_4" ] = script_model#jup_silo_1000_igc_outro_sh017_hatch;
    level.scr_anim[ hatch ][ "outro_5" ] = script_model#jup_silo_1000_igc_outro_sh020_hatch;
    level.scr_goaltime[ hatch ][ "outro_1" ] = 0;
    level.scr_goaltime[ hatch ][ "outro_2" ] = 0;
    level.scr_goaltime[ hatch ][ "outro_3" ] = 0;
    level.scr_goaltime[ hatch ][ "outro_4" ] = 0;
    level.scr_goaltime[ hatch ][ "outro_5" ] = 0;
    lever = "silo_lever";
    level.scr_animtree[ lever ] = #script_model;
    level.scr_anim[ lever ][ "outro_1" ] = script_model#jup_silo_1000_igc_outro_sh010_lever;
    level.scr_anim[ lever ][ "outro_2" ] = script_model#jup_silo_1000_igc_outro_sh012_lever;
    level.scr_anim[ lever ][ "outro_3" ] = script_model#jup_silo_1000_igc_outro_sh015_lever;
    level.scr_anim[ lever ][ "outro_4" ] = script_model#jup_silo_1000_igc_outro_sh017_lever;
    level.scr_anim[ lever ][ "outro_5" ] = script_model#jup_silo_1000_igc_outro_sh020_lever;
    level.scr_goaltime[ lever ][ "outro_1" ] = 0;
    level.scr_goaltime[ lever ][ "outro_2" ] = 0;
    level.scr_goaltime[ lever ][ "outro_3" ] = 0;
    level.scr_goaltime[ lever ][ "outro_4" ] = 0;
    level.scr_goaltime[ lever ][ "outro_5" ] = 0;
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4193
// Size: 0x17
function function_9e30d3207113511a( item )
{
    item setmodel( "electrical_cell_door_button_green" );
}

// Namespace namespace_d7740e9dc284e25e / namespace_6296f71367e91e31
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41b2
// Size: 0x7f
function audio_missile_activate( guy )
{
    wait 1;
    var_6db06a39fbfe8edd = ( 3921, 2633, -260 );
    var_d6e4fabcf37d9893 = spawn_script_origin( var_6db06a39fbfe8edd );
    var_d6e4fabcf37d9893 scalevolume( 0, 0 );
    level thread play_sound_in_space( "scn_jup_silo_missle_activate", var_6db06a39fbfe8edd );
    var_d6e4fabcf37d9893 playloopsound( "scn_jup_silo_missle_active_lp" );
    var_d6e4fabcf37d9893 scalevolume( 1, 1 );
    utility::flag_wait( "player_is_exiting_hatch" );
    var_d6e4fabcf37d9893 sound_fade_and_delete( 5, 1 );
}

