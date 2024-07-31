#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;

#namespace namespace_83b166db657d8e25;

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc86
// Size: 0x5d
function main() {
    initanim();
    function_b7859cb26794e233();
    function_234f0be18cecda1f();
    function_483f9ae44574bdf0();
    function_153cee665b2d4a48();
    function_66388dc09630969e();
    function_b3a4e8f4f708b0f0();
    function_e82c45ea8633243c();
    function_d79c07503074631e();
    function_e5c4e335df2843c();
    function_3a30249a5c64c552();
    function_566826c5ccdd0270();
    xcams();
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xceb
// Size: 0xd8
function function_b7859cb26794e233() {
    level.scr_animtree["outro_player"] = %script_model;
    level.scr_anim["outro_player"]["attacker_outro_shot01"] = script_model%jup_war_mp_attacker_exfil_player;
    level.scr_animtree["outro_body"] = %script_model;
    level.scr_anim["outro_body"]["attacker_outro_shot01"] = script_model%jup_war_mp_attacker_exfil_guy01;
    level.scr_animtree["outro_button"] = %script_model;
    level.scr_anim["outro_button"]["attacker_outro_shot01"] = script_model%jup_war_mp_attacker_exfil_button;
    level.scr_animtree["outro_missile"] = %script_model;
    level.scr_anim["outro_missile"]["attacker_outro_shot02"] = script_model%jup_war_mp_attacker_exfil_end_missile;
    level.var_cce2d86c9cf3563b["attacker_outro_shot01"] = 65;
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcb
// Size: 0x19f
function function_234f0be18cecda1f() {
    level.scr_animtree["tank_cougar"] = %script_model;
    level.scr_anim["tank_cougar"]["defender_outro"] = script_model%jup_war_defender_exfil_tank_cougar;
    level.scr_animtree["tank_cougar_dst"] = %script_model;
    level.scr_anim["tank_cougar_dst"]["defender_outro"] = script_model%jup_war_defender_exfil_tank_cougar_dst;
    level.scr_animtree["missile"] = %script_model;
    level.scr_anim["missile"]["defender_outro"] = script_model%jup_war_defender_exfil_missile;
    level.scr_animtree["icbm_launch_01"] = %script_model;
    level.scr_anim["icbm_launch_01"]["defender_outro"] = script_model%jup_war_defender_exfil_missile_01_launch;
    level.scr_animtree["icbm_launch_02"] = %script_model;
    level.scr_anim["icbm_launch_02"]["defender_outro"] = script_model%jup_war_defender_exfil_missile_02_launch;
    level.scr_animtree["soldier_01"] = %script_model;
    level.scr_anim["soldier_01"]["defender_outro"] = script_model%jup_war_defender_exfil_soldier_01;
    level.scr_animtree["soldier_02"] = %script_model;
    level.scr_anim["soldier_02"]["defender_outro"] = script_model%jup_war_defender_exfil_soldier_02;
    level.scr_animtree["soldier_03"] = %script_model;
    level.scr_anim["soldier_03"]["defender_outro"] = script_model%jup_war_defender_exfil_soldier_03;
    level.var_cce2d86c9cf3563b["defender_outro"] = 81.2;
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf72
// Size: 0xfe
function function_483f9ae44574bdf0() {
    level.scr_animtree["missile"] = %script_model;
    level.scr_model["missile"] = "jup_military_launchfacility_missile_01_fxanim";
    level.scr_anim["missile"]["launch"] = script_model%jup_fxanim_war_military_launchfacility_missile_01_launch;
    level.scr_animname["missile"]["launch"] = "jup_fxanim_war_military_launchfacility_missile_01_launch";
    level.scr_anim["missile"]["launch02"] = script_model%jup_fxanim_war_military_launchfacility_missile_02_launch;
    level.scr_animname["missile"]["launch02"] = "jup_fxanim_war_military_launchfacility_missile_02_launch";
    level.scr_animtree["crashed_pickup"] = %script_model;
    level.scr_model["crashed_pickup"] = "jup_urz_veh9_civ_lnd_pickup_launchfacility_dst_air";
    level.scr_anim["crashed_pickup"]["crash"] = script_model%jup_veh_war_civ_ind_pickup_tankcrush_front;
    level.scr_animname["crashed_pickup"]["crash"] = "jup_veh_war_civ_ind_pickup_tankcrush_front";
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1078
// Size: 0x88
function function_153cee665b2d4a48() {
    level.scr_animtree["blima"] = %mp_vehicles_always_loaded;
    level.scr_anim["blima"]["reinforce_open_gate"] = mp_vehicles_always_loaded%cp_infil_blima_heli;
    level.scr_animname["blima"]["reinforce_open_gate"] = "cp_infil_blima_heli";
    level.scr_anim["blima"]["blima_infil_alpha"] = mp_vehicles_always_loaded%iw9_mp_infil_blima_heli;
    level.scr_animname["blima"]["blima_infil_alpha"] = "iw9_mp_infil_blima_heli";
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1108
// Size: 0x2e4
function function_66388dc09630969e() {
    level.scr_animtree["slot_0"] = %script_model;
    level.scr_anim["slot_0"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_0;
    level.scr_eventanim["slot_0"]["blima_infil"] = %"hash_260c79659d363de0";
    level.scr_animtree["slot_1"] = %script_model;
    level.scr_anim["slot_1"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_1;
    level.scr_eventanim["slot_1"]["blima_infil"] = %"hash_260c7c659d3642f9";
    level.scr_animtree["slot_2"] = %script_model;
    level.scr_anim["slot_2"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_2;
    level.scr_eventanim["slot_2"]["blima_infil"] = %"hash_260c7b659d364146";
    level.scr_animtree["slot_3"] = %script_model;
    level.scr_anim["slot_3"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_3;
    level.scr_eventanim["slot_3"]["blima_infil"] = %"hash_260c7e659d36465f";
    level.scr_animtree["slot_4"] = %script_model;
    level.scr_anim["slot_4"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_4;
    level.scr_eventanim["slot_4"]["blima_infil"] = %"hash_260c7d659d3644ac";
    level.scr_animtree["slot_5"] = %script_model;
    level.scr_anim["slot_5"]["blima_infil"] = script_model%iw9_mp_infil_blima_seat_5;
    level.scr_eventanim["slot_5"]["blima_infil"] = %"hash_260c80659d3649c5";
    level.scr_animtree["crew1"] = %script_model;
    level.scr_anim["crew1"]["blima_infil"] = script_model%iw9_mp_infil_blima_crew_1;
    level.scr_eventanim["crew1"]["blima_infil"] = %"hash_d53d1710cb1e814";
    level.scr_animtree["crew2"] = %script_model;
    level.scr_anim["crew2"]["blima_infil"] = script_model%iw9_mp_infil_blima_crew_2;
    level.scr_eventanim["crew2"]["blima_infil"] = %"hash_d53d1710cb1e814";
    level.scr_animtree["rope_l"] = %script_model;
    level.scr_anim["rope_l"]["blima_infil"] = script_model%iw9_mp_infil_blima_rope_l;
    level.scr_animtree["rope_r"] = %script_model;
    level.scr_anim["rope_r"]["blima_infil"] = script_model%iw9_mp_infil_blima_rope_r;
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f4
// Size: 0x4e
function function_b3a4e8f4f708b0f0() {
    level.scr_animtree["attacker_infil"] = %animated_props;
    level.scr_anim["attacker_infil"]["infil_missile"] = animated_props%jup_war_mp_infil_missile;
    level.scr_animname["attacker_infil"]["infil_missile"] = "jup_war_mp_infil_missile";
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144a
// Size: 0xa2
function function_e82c45ea8633243c() {
    level.scr_animtree["veh9_cougar"] = %mp_vehicles_always_loaded;
    level.scr_anim["veh9_cougar"]["crash"] = mp_vehicles_always_loaded%jup_veh_war_mil_ind_tank_cougar_pickup_tankcrush_front;
    level.scr_anim["veh9_cougar"]["collide"] = mp_vehicles_always_loaded%jup_veh_war_mil_lnd_tank_cougar_hit_gate;
    level.scr_animtree["veh_jup_cougar_mg"] = %mp_vehicles_always_loaded;
    level.scr_anim["veh_jup_cougar_mg"]["crash"] = mp_vehicles_always_loaded%jup_veh_war_mil_ind_tank_cougar_pickup_tankcrush_front;
    level.scr_anim["veh_jup_cougar_mg"]["collide"] = mp_vehicles_always_loaded%jup_veh_war_mil_lnd_tank_cougar_hit_gate;
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f4
// Size: 0xfc
function function_d79c07503074631e() {
    level.scr_animtree["crash_door"] = %script_model;
    level.scr_anim["crash_door"]["door_le_close"] = script_model%jup_fxanim_war_military_blockade_01_gate_le_close;
    level.scr_animname["crash_door"]["door_le_close"] = "jup_fxanim_war_military_blockade_01_gate_le_close";
    level.scr_anim["crash_door"]["door_le_open"] = script_model%jup_fxanim_war_military_blockade_01_gate_le_open;
    level.scr_animname["crash_door"]["door_le_open"] = "jup_fxanim_war_military_blockade_01_gate_le_open";
    level.scr_anim["crash_door"]["door_dg_close"] = script_model%jup_fxanim_war_military_blockade_01_gate_damaged_close;
    level.scr_animname["crash_door"]["door_dg_close"] = "jup_fxanim_war_military_blockade_01_gate_damaged_close";
    level.scr_anim["crash_door"]["door_dg_open"] = script_model%jup_fxanim_war_military_blockade_01_gate_damaged_open;
    level.scr_animname["crash_door"]["door_dg_open"] = "jup_fxanim_war_military_blockade_01_gate_damaged_open";
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f8
// Size: 0x184
function function_e5c4e335df2843c() {
    level.scr_animtree["EarthenWall"] = %animated_props;
    level.scr_anim["EarthenWall"]["building_1"] = animated_props%jup_fxanim_war_military_buildable_wall_repair_half;
    level.scr_animname["EarthenWall"]["building_1"] = "jup_fxanim_war_military_buildable_wall_repair_half";
    level.scr_anim["EarthenWall"]["building_2"] = animated_props%jup_fxanim_war_military_buildable_wall_repair_full;
    level.scr_animname["EarthenWall"]["building_2"] = "jup_fxanim_war_military_buildable_wall_repair_full";
    level.scr_anim["EarthenWall"]["idle_1"] = animated_props%jup_fxanim_war_military_buildable_wall_idle_half;
    level.scr_animname["EarthenWall"]["idle_1"] = "jup_fxanim_war_military_buildable_wall_idle_half";
    level.scr_anim["EarthenWall"]["idle_2"] = animated_props%jup_fxanim_war_military_buildable_wall_idle_full;
    level.scr_animname["EarthenWall"]["idle_2"] = "jup_fxanim_war_military_buildable_wall_idle_full";
    level.var_c88bedfa8ddcb42c["EarthenWall"] = [];
    level.var_c88bedfa8ddcb42c["EarthenWall"]["models"] = ["jup_military_buildable_wall_05_fxanim", "jup_military_buildable_wall_06_fxanim"];
    level.var_c88bedfa8ddcb42c["EarthenWall"]["animations"] = ["EarthenWall", ["building_1", "building_2"], ["idle_1", "idle_2"]];
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1784
// Size: 0x13d
function function_3a30249a5c64c552() {
    level.scr_animtree["TankTrap"] = %animated_props;
    level.scr_anim["TankTrap"]["idle"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_idle;
    level.scr_animname["TankTrap"]["idle"] = "jup_fxanim_war_military_buildable_hedgehog_idle";
    level.scr_anim["TankTrap"]["building"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_repair;
    level.scr_animname["TankTrap"]["building"] = "jup_fxanim_war_military_buildable_hedgehog_repair";
    level.scr_anim["TankTrap"]["destroy"] = animated_props%jup_fxanim_war_military_buildable_hedgehog_destroy;
    level.scr_animname["TankTrap"]["destroy"] = "jup_fxanim_war_military_buildable_hedgehog_destroy";
    level.var_c88bedfa8ddcb42c["TankTrap"] = [];
    level.var_c88bedfa8ddcb42c["TankTrap"]["models"] = ["jup_military_buildable_hedgehog_02_fxanim"];
    level.var_c88bedfa8ddcb42c["TankTrap"]["animations"] = ["TankTrap", ["building"], ["idle"], ["destroy"]];
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c9
// Size: 0xf5
function function_566826c5ccdd0270() {
    level.scr_animtree["Hesco"] = %animated_props;
    level.scr_anim["Hesco"]["building"] = animated_props%jup_fxanim_war_military_buildable_set_cosecho_barrier_open_01;
    level.scr_animname["Hesco"]["building"] = "jup_fxanim_war_military_buildable_set_cosecho_barrier_open_01";
    level.scr_anim["Hesco"]["idle"] = animated_props%jup_fxanim_war_military_buildable_set_cosecho_barrier_idle;
    level.scr_animname["Hesco"]["idle"] = "jup_fxanim_war_military_buildable_set_cosecho_barrier_idle";
    level.var_c88bedfa8ddcb42c["Hesco"] = [];
    level.var_c88bedfa8ddcb42c["Hesco"]["models"] = ["jup_military_buildable_cosecho_barrier_02_fxanim"];
    level.var_c88bedfa8ddcb42c["Hesco"]["animations"] = ["Hesco", ["building"], ["idle"]];
}

// Namespace namespace_83b166db657d8e25 / namespace_d7d87c46812c4227
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c6
// Size: 0x41
function xcams() {
    level.scr_xcam["attacker_outro_shot01"] = "jup_war_mp_attacker_exfil_start_xcam";
    level.scr_xcam["attacker_outro_shot02"] = "jup_war_mp_attacker_exfil_end_xcam";
    level.scr_xcam["defender_outro"] = "jup_war_defender_exfil_xcam";
}

