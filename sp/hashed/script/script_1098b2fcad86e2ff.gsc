#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\sp\anim;
#using scripts\sp\utility;

#namespace namespace_4533949bf88c6c5;

// Namespace namespace_4533949bf88c6c5 / namespace_a60113f3bd67f601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ecd
// Size: 0x17
function main()
{
    player();
    humans();
    script_models();
}

// Namespace namespace_4533949bf88c6c5 / namespace_a60113f3bd67f601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eec
// Size: 0xaf
function player()
{
    level.player.animname = "player";
    playerrig = "player_rig";
    var_86c3f8a18ac6713b = "player_rig_fullbody";
    level.scr_animtree[ playerrig ] = #player;
    level.scr_model[ playerrig ] = "vm_c_jup_sp_hero_fitri";
    level.scr_animtree[ var_86c3f8a18ac6713b ] = #player;
    level.scr_model[ var_86c3f8a18ac6713b ] = "body_c_jup_sp_hero_fitri";
    level.scr_anim[ var_86c3f8a18ac6713b ][ "jup_hij_010" ] = player#jup_hij_010_intro_vm;
    level.scr_anim[ playerrig ][ "jup_hij_0525_fail" ] = player#jup_hij_0525_fail_death_vm;
}

// Namespace namespace_4533949bf88c6c5 / namespace_a60113f3bd67f601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa3
// Size: 0x1f46
function humans()
{
    fakeplayer = "fakeplayer";
    level.scr_animtree[ fakeplayer ] = #generic_human;
    level.scr_model[ fakeplayer ] = "body_c_jup_sp_hero_fitri";
    level.scr_anim[ fakeplayer ][ "jup_hij_010" ] = generic_human#jup_hij_010_intro_vm_body;
    level.scr_anim[ "steward" ][ "jup_hij_010" ] = generic_human#jup_hij_010_intro_stewardess;
    level.scr_anim[ "neighbor" ][ "jup_hij_010" ] = generic_human#jup_hij_010_intro_passenger;
    level.scr_anim[ "lead_hijacker" ][ "jup_hij_0525_death_enemy01" ] = generic_human#jup_hij_0525_death_enemy01;
    level.scr_anim[ "alt_aisle_hijacker" ][ "jup_hij_0525_death_enemy02" ] = generic_human#jup_hij_0525_death_enemy02;
    level.scr_anim[ "rear_hijacker" ][ "jup_hij_0525_death_enemy03" ] = generic_human#jup_hij_0525_death_enemy01;
    level.scr_anim[ "Civilian" ][ "jup_hij_0200_standoff_stewardess_01_death" ] = generic_human#jup_hij_0200_standoff_stewardess_01_death;
    level.scr_anim[ "lead_hijacker" ][ "jup_hij_0525_pain_enemy01" ] = generic_human#jup_hij_0525_pain_enemy01;
    level.scr_anim[ "lead_hijacker" ][ "jup_hij_0525_react_enemy01" ] = generic_human#jup_hij_0525_react_enemy01;
    level.scr_anim[ "alt_aisle_hijacker" ][ "jup_hij_0525_pain_enemy02" ] = generic_human#jup_hij_0525_pain_enemy02;
    level.scr_anim[ "alt_aisle_hijacker" ][ "jup_hij_0525_react_enemy02" ] = generic_human#jup_hij_0525_react_enemy02;
    level.scr_anim[ "rear_hijacker" ][ "jup_hij_0525_pain_enemy01" ] = generic_human#jup_hij_0525_pain_enemy01;
    level.scr_anim[ "rear_hijacker" ][ "jup_hij_0525_react_enemy02" ] = generic_human#jup_hij_0525_react_enemy02;
    level.scr_anim[ "rear_hijacker" ][ "jup_hij_0525_fail" ] = generic_human#jup_hij_0525_fail_death_enemy03;
    level.scr_anim[ "air_marshal_1" ][ "jup_hij_0200_standoff_airmarshal_01_start" ] = generic_human#jup_hij_0200_standoff_airmarshal_01_start;
    level.scr_anim[ "air_marshal_2" ][ "jup_hij_0200_standoff_airmarshal_02_start" ] = generic_human#jup_hij_0200_standoff_airmarshal_02_start;
    level.scr_anim[ "front_civ" ][ "jup_hij_0200_standoff_civ_01_start" ] = generic_human#jup_hij_0200_standoff_civ_01_start;
    level.scr_anim[ "front_civ" ][ "jup_hij_0200_standoff_civ_01_loop" ][ 0 ] = generic_human#jup_hij_0200_standoff_civ_01_loop;
    level.scr_anim[ "filming_civ" ][ "jup_hij_0200_standoff_civ_02_start" ] = generic_human#jup_hij_0200_standoff_civ_02_start;
    level.scr_anim[ "filming_civ" ][ "jup_hij_0200_standoff_civ_02_endidle" ][ 0 ] = generic_human#jup_hij_0200_standoff_civ_02_endidle;
    level.scr_animtree[ "civ" ] = #generic_human;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_civ_01" ][ 0 ] = generic_human#jup_hij_idle_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_civ_02" ][ 0 ] = generic_human#jup_hij_idle_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_window_01_civ_02" ][ 0 ] = generic_human#jup_hij_idle_window_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_window_01_civ_02" ][ 1 ] = generic_human#jup_hij_idle_window_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_window_01_civ_02" ][ 2 ] = generic_human#jup_hij_idle_window_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_window_01_idle_to_alert_01_civ_02" ] = generic_human#jup_hij_window_01_idle_to_alert_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_to_alert_01_civ_01" ] = generic_human#jup_hij_idle_01_to_alert_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_to_alert_01_civ_02" ] = generic_human#jup_hij_idle_01_to_alert_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_01_civ_01" ][ 0 ] = generic_human#jup_hij_alert_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_01_civ_02" ][ 0 ] = generic_human#jup_hij_alert_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_01_to_panic_01_civ_01" ] = generic_human#jup_hij_alert_01_to_panic_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_01_to_panic_01_civ_02" ] = generic_human#jup_hij_alert_01_to_panic_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_01_civ_01" ][ 0 ] = generic_human#jup_hij_panic_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_01_civ_02" ][ 0 ] = generic_human#jup_hij_panic_01_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_civ_01_twitch" ] = generic_human#jup_hij_idle_01_twitch_01_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_01_civ_02_twitch" ] = generic_human#jup_hij_idle_01_twitch_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_02_civ_01" ][ 0 ] = generic_human#jup_hij_idle_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_02_civ_02" ][ 0 ] = generic_human#jup_hij_idle_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_02_civ_01" ] = generic_human#jup_hij_idle_to_alert_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_02_civ_02" ] = generic_human#jup_hij_idle_to_alert_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_02_civ_01" ][ 0 ] = generic_human#jup_hij_alert_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_02_civ_02" ][ 0 ] = generic_human#jup_hij_alert_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_02_civ_01" ] = generic_human#jup_hij_alert_to_panic_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_02_civ_02" ] = generic_human#jup_hij_alert_to_panic_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_02_civ_01" ][ 0 ] = generic_human#jup_hij_panic_02_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_02_civ_02" ][ 0 ] = generic_human#jup_hij_panic_02_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_02_civ01" ][ 0 ] = generic_human#jup_hij_idle_02_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_02_civ02" ][ 0 ] = generic_human#jup_hij_idle_02_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_02_civ01" ] = generic_human#jup_hij_idle_to_alert_02_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_02_civ02" ] = generic_human#jup_hij_idle_to_alert_02_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_02_civ01" ][ 0 ] = generic_human#jup_hij_alert_02_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_02_civ02" ][ 0 ] = generic_human#jup_hij_alert_02_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_02_civ01" ] = generic_human#jup_hij_alert_to_panic_02_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_02_civ02" ] = generic_human#jup_hij_alert_to_panic_02_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_02_civ01" ][ 0 ] = generic_human#jup_hij_panic_02_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_02_civ02" ][ 0 ] = generic_human#jup_hij_panic_02_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_civ_01" ][ 0 ] = generic_human#jup_hij_idle_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_civ_02" ][ 0 ] = generic_human#jup_hij_idle_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_to_alert_04_civ_01" ] = generic_human#jup_hij_idle_04_to_alert_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_to_alert_04_civ_02" ] = generic_human#jup_hij_idle_04_to_alert_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_civ_01" ][ 0 ] = generic_human#jup_hij_alert_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_civ_02" ][ 0 ] = generic_human#jup_hij_alert_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_to_panic_04_civ_01" ] = generic_human#jup_hij_alert_04_to_panic_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_to_panic_04_civ_02" ] = generic_human#jup_hij_alert_04_to_panic_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_04_civ_01" ][ 0 ] = generic_human#jup_hij_panic_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_04_civ_02" ][ 0 ] = generic_human#jup_hij_panic_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_civ_01" ][ 0 ] = generic_human#jup_hij_idle_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_civ_02" ][ 0 ] = generic_human#jup_hij_idle_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_to_idle_handhold_03_civ_01" ] = generic_human#jup_hij_idle_03_to_idle_handhold_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_to_idle_handhold_03_civ_02" ] = generic_human#jup_hij_idle_03_to_idle_handhold_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_handhold_civ_01" ][ 0 ] = generic_human#jup_hij_idle_03_handhold_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_03_handhold_civ_02" ][ 0 ] = generic_human#jup_hij_idle_03_handhold_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_handhold_03_to_alert_03_civ_01" ] = generic_human#jup_hij_idle_handhold_03_to_alert_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_handhold_03_to_alert_03_civ_02" ] = generic_human#jup_hij_idle_handhold_03_to_alert_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_03_civ_01" ][ 0 ] = generic_human#jup_hij_alert_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_03_civ_02" ][ 0 ] = generic_human#jup_hij_alert_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_03_to_panic_03_civ_01" ] = generic_human#jup_hij_alert_03_to_panic_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_03_to_panic_03_civ_02" ] = generic_human#jup_hij_alert_03_to_panic_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_03_civ_01" ][ 0 ] = generic_human#jup_hij_panic_03_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_03_civ_02" ][ 0 ] = generic_human#jup_hij_panic_03_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ01" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ01" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ01" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_civ01" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_to_react_civ01" ] = generic_human#jup_hij_seated_large_right_idle_to_react_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_react_loop_civ01" ][ 0 ] = generic_human#jup_hij_seated_large_right_react_loop_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ02" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ02" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ02" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_civ02" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_to_react_civ02" ] = generic_human#jup_hij_seated_large_right_idle_to_react_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_react_loop_civ02" ][ 0 ] = generic_human#jup_hij_seated_large_right_react_loop_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ03" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ03" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ03" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_civ03" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_to_react_civ03" ] = generic_human#jup_hij_seated_large_right_idle_to_react_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_react_loop_civ03" ][ 0 ] = generic_human#jup_hij_seated_large_right_react_loop_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ04" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_idle_to_react_civ04" ] = generic_human#jup_hij_seated_large_right_idle_to_react_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_right_react_loop_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_right_react_loop_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_to_alert_04_civ_01" ] = generic_human#jup_hij_idle_04_to_alert_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_04_to_alert_04_civ_02" ] = generic_human#jup_hij_idle_04_to_alert_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_civ_01" ][ 0 ] = generic_human#jup_hij_alert_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_civ_02" ][ 0 ] = generic_human#jup_hij_alert_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_to_panic_04_civ_01" ] = generic_human#jup_hij_alert_04_to_panic_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_04_to_panic_04_civ_02" ] = generic_human#jup_hij_alert_04_to_panic_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_04_civ_01" ][ 0 ] = generic_human#jup_hij_panic_04_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_04_civ_02" ][ 0 ] = generic_human#jup_hij_panic_04_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ04" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ04" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_recoil_left_civ01" ] = generic_human#jup_hij_alert_to_recoil_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_left_idle_civ01" ][ 0 ] = generic_human#jup_hij_recoil_left_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_to_alert_left_civ01" ] = generic_human#jup_hij_recoil_to_alert_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_civ05" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_idle_to_react_civ05" ] = generic_human#jup_hij_seated_large_left_idle_to_react_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_seated_large_left_react_loop_civ05" ][ 0 ] = generic_human#jup_hij_seated_large_left_react_loop_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_idle_civ01" ][ 0 ] = generic_human#jup_hij_overhead_compartment_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_idle_civ02" ][ 0 ] = generic_human#jup_hij_overhead_compartment_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_idle_civ03" ][ 0 ] = generic_human#jup_hij_overhead_compartment_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_open_bin_civ01" ] = generic_human#jup_hij_overhead_compartment_open_bin_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_open_bin_civ02" ] = generic_human#jup_hij_overhead_compartment_open_bin_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_overhead_compartment_open_bin_civ03" ] = generic_human#jup_hij_overhead_compartment_open_bin_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_idle_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_02_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_transition_civ01" ] = generic_human#jup_hij_smartphone_02_transition_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_recording_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_02_recording_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_idle_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_02_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_transition_civ02" ] = generic_human#jup_hij_smartphone_02_transition_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_recording_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_02_recording_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_idle_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_02_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_transition_civ03" ] = generic_human#jup_hij_smartphone_02_transition_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_02_recording_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_02_recording_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_idle_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_03_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_transition_civ01" ] = generic_human#jup_hij_smartphone_03_transition_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_record_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_03_record_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_idle_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_03_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_transition_civ02" ] = generic_human#jup_hij_smartphone_03_transition_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_record_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_03_record_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_idle_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_03_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_transition_civ03" ] = generic_human#jup_hij_smartphone_03_transition_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_03_record_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_03_record_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_idle_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_04_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_transition_civ01" ] = generic_human#jup_hij_smartphone_04_transition_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_recording_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_04_recording_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_idle_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_04_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_transition_civ02" ] = generic_human#jup_hij_smartphone_04_transition_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_recording_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_04_recording_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_idle_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_04_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_transition_civ03" ] = generic_human#jup_hij_smartphone_04_transition_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_04_recording_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_04_recording_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_idle_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_06_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_transition_civ01" ] = generic_human#jup_hij_smartphone_06_transition_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_record_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_06_record_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_idle_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_06_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_transition_civ02" ] = generic_human#jup_hij_smartphone_06_transition_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_record_civ02" ][ 0 ] = generic_human#jup_hij_smartphone_06_record_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_idle_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_06_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_transition_civ03" ] = generic_human#jup_hij_smartphone_06_transition_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_06_record_civ03" ][ 0 ] = generic_human#jup_hij_smartphone_06_record_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_recording_to_recoil_civ01" ] = generic_human#jup_hij_smartphone_recording_to_recoil_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_recoil_idle_civ01" ][ 0 ] = generic_human#jup_hij_smartphone_recoil_idle_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_smartphone_recoil_to_recording_civ01" ] = generic_human#jup_hij_smartphone_recoil_to_recording_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ01" ] = generic_human#jup_hij_death_pose_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ02" ] = generic_human#jup_hij_death_pose_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ03" ] = generic_human#jup_hij_death_pose_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ04" ] = generic_human#jup_hij_death_pose_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ05" ] = generic_human#jup_hij_death_pose_civ05;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ06" ] = generic_human#jup_hij_death_pose_civ06;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ07" ] = generic_human#jup_hij_death_pose_civ07;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ08" ] = generic_human#jup_hij_death_pose_civ08;
    level.scr_anim[ "civ" ][ "jup_hij_death_pose_civ09" ] = generic_human#jup_hij_death_pose_civ09;
    level.scr_anim[ "civ" ][ "jup_hij_0150_disarm_from_enemy_01_civ01" ] = generic_human#jup_hij_0150_disarm_from_enemy_01_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_0150_disarm_from_enemy_01_civ02" ] = generic_human#jup_hij_0150_disarm_from_enemy_01_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_0150_disarm_from_enemy_01_civ03" ] = generic_human#jup_hij_0150_disarm_from_enemy_01_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_0150_disarm_from_enemy_01_civ04" ] = generic_human#jup_hij_0150_disarm_from_enemy_01_civ04;
    level.scr_anim[ "civ" ][ "jup_hij_0150_disarm_from_enemy_01_civ05" ] = generic_human#jup_hij_0150_disarm_from_enemy_01_civ05;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ01" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ02" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ03" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ04" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ05" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ06" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ07" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ08" ] = 0.25;
    level.scr_goaltime[ "civ" ][ "jup_hij_death_pose_civ09" ] = 0.25;
    level.var_70a7354d67759191 = [];
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ01" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ01" ][ 1 ] = generic_human#jup_hij_smartphone_02_tracking_civ01;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ02" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ02" ][ 1 ] = generic_human#jup_hij_smartphone_02_tracking_civ02;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ03" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_02_recording_civ03" ][ 1 ] = generic_human#jup_hij_smartphone_02_tracking_civ03;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ01" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ01" ][ 1 ] = generic_human#jup_hij_smartphone_03_tracking_civ01;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ02" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ02" ][ 1 ] = generic_human#jup_hij_smartphone_03_tracking_civ02;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ03" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_03_record_civ03" ][ 1 ] = generic_human#jup_hij_smartphone_03_tracking_civ03;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ01" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ01" ][ 1 ] = generic_human#jup_hij_smartphone_04_tracking_civ01;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ02" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ02" ][ 1 ] = generic_human#jup_hij_smartphone_04_tracking_civ02;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ03" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_04_recording_civ03" ][ 1 ] = generic_human#jup_hij_smartphone_04_tracking_civ03;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ01" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ01" ][ 1 ] = generic_human#jup_hij_smartphone_06_tracking_civ01;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ02" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ02" ][ 1 ] = generic_human#jup_hij_smartphone_06_tracking_civ02;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ03" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_06_record_civ03" ][ 1 ] = generic_human#jup_hij_smartphone_06_tracking_civ03;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_recoil_idle_civ01" ][ 0 ] = generic_human#jup_hij_additive_tracking;
    level.var_70a7354d67759191[ "civ" ][ "jup_hij_smartphone_recoil_idle_civ01" ][ 1 ] = generic_human#jup_hij_smartphone_04_tracking_recoil_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_back_left_civ_01" ] = generic_human#jup_hij_idle_to_alert_back_left_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_idle_left_civ01" ][ 0 ] = generic_human#jup_hij_alert_idle_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_left_civ01" ] = generic_human#jup_hij_alert_to_panic_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_idle_left_civ01" ][ 0 ] = generic_human#jup_hij_panic_idle_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_recoil_left_civ01" ] = generic_human#jup_hij_alert_to_recoil_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_idle_left_civ01" ][ 0 ] = generic_human#jup_hij_recoil_idle_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_to_alert_left_civ01" ] = generic_human#jup_hij_recoil_to_alert_left_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_back_left_civ_02" ] = generic_human#jup_hij_idle_to_alert_back_left_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_idle_left_civ02" ][ 0 ] = generic_human#jup_hij_alert_idle_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_left_civ02" ] = generic_human#jup_hij_alert_to_panic_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_idle_left_civ02" ][ 0 ] = generic_human#jup_hij_panic_idle_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_recoil_left_civ02" ] = generic_human#jup_hij_alert_to_recoil_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_idle_left_civ02" ][ 0 ] = generic_human#jup_hij_recoil_idle_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_to_alert_left_civ02" ] = generic_human#jup_hij_recoil_to_alert_left_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_back_right_civ_01" ] = generic_human#jup_hij_idle_to_alert_back_right_civ_01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_idle_right_civ01" ][ 0 ] = generic_human#jup_hij_alert_idle_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_right_civ01" ] = generic_human#jup_hij_alert_to_panic_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_panic_idle_right_civ01" ][ 0 ] = generic_human#jup_hij_panic_idle_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_recoil_right_civ01" ] = generic_human#jup_hij_alert_to_recoil_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_idle_right_civ01" ][ 0 ] = generic_human#jup_hij_recoil_idle_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_to_alert_right_civ01" ] = generic_human#jup_hij_recoil_to_alert_right_civ01;
    level.scr_anim[ "civ" ][ "jup_hij_idle_to_alert_back_right_civ_02" ] = generic_human#jup_hij_idle_to_alert_back_right_civ_02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_idle_right_civ02" ][ 0 ] = generic_human#jup_hij_alert_idle_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_panic_right_civ02" ] = generic_human#jup_hij_alert_to_panic_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_panic_idle_right_civ02" ][ 0 ] = generic_human#jup_hij_panic_idle_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_alert_to_recoil_right_civ02" ] = generic_human#jup_hij_alert_to_recoil_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_idle_right_civ02" ][ 0 ] = generic_human#jup_hij_recoil_idle_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_recoil_to_alert_right_civ02" ] = generic_human#jup_hij_recoil_to_alert_right_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_left_civ_01" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_left_civ_02" ][ 0 ] = generic_human#jup_hij_seated_large_left_idle_civ03;
    level.scr_anim[ "civ" ][ "jup_hij_idle_right_civ_01" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ02;
    level.scr_anim[ "civ" ][ "jup_hij_idle_right_civ_02" ][ 0 ] = generic_human#jup_hij_seated_large_right_idle_civ03;
    level.scr_anim[ "blocker" ][ "jup_hij_panic_01_civ_01" ][ 0 ] = generic_human#jup_hij_panic_01_civ_01;
}

// Namespace namespace_4533949bf88c6c5 / namespace_a60113f3bd67f601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ef1
// Size: 0xe3
function script_models()
{
    level.scr_animtree[ "left_overhead" ] = #script_model;
    level.scr_model[ "left_overhead" ] = "jup_machinery_plane_hijack_left_bin_rig";
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_open_bin_civ01" ] = script_model#jup_hij_overhead_compartment_bin_prop01;
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_open_bin_civ02" ] = script_model#jup_hij_overhead_compartment_bin_prop02;
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_open_bin_civ03" ] = script_model#jup_hij_overhead_compartment_bin_prop03;
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_bin_prop01" ] = script_model#jup_hij_overhead_compartment_bin_prop01;
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_bin_prop02" ] = script_model#jup_hij_overhead_compartment_bin_prop02;
    level.scr_anim[ "left_overhead" ][ "jup_hij_overhead_compartment_bin_prop03" ] = script_model#jup_hij_overhead_compartment_bin_prop03;
}

