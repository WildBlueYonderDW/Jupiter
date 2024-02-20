// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_vehicles_cs;

// Namespace mp_jup_st_a_ob_vehicles_cs/namespace_9300a7e57b81fb7a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_vehicles_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_vehicles_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_vehicles_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_vehicles_cs/namespace_9300a7e57b81fb7a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x432
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_vehicles_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_vehicles_cs");
}

// Namespace mp_jup_st_a_ob_vehicles_cs/namespace_9300a7e57b81fb7a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0xca0
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24824, 19072, 1544), (0, 270, 0), "jup_suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_motorcycle_blood_burner_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21205, 20164, 1729), (0, 144.05, 0), "motorcycle_blood_burner_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_motorcycle_blood_burner_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17652, 26401, 3011), (0, 43.6, 0), "motorcycle_blood_burner_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_air_heli_medium_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20044.2, 37171.4, 2362), (0, 300, 0), "littlebird_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34277, 34665.5, 1406), (0, 220, 0), "atv_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_pickup_fullsized_2014_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23564, 18167, 1558), (0, 260, 0), "jup_pickup_2014_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-37879.4, 31156.3, 877), (0, 292, 0), "rhib_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18357.5, 28841, 3026.74), (0, 310, 0), "atv_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-37196, 28742, 877), (0, 288, 0), "rhib_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36491.7, 24494.6, 877), (0, 308, 0), "rhib_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_rhib_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34125.4, 18949.7, 877), (0, 204, 0), "rhib_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30178.2, 35014.6, 1430.25), (0, 350, 0), "mil_cargo_truck_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_civ_lnd_pickup_fullsized_2014_tech_armor_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-37107, 41391, 1715.11), (0.83, 314.3, -2.65), "techo_rebel_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28669.2, 25126.6, 1314), (0, 209, 0), "sedan_hatchback_1985_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30737.5, 23305, 1312), (0, 208, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28484.5, 33037, 1414), (0, 28, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28051.2, 29184.6, 1410), (0, 209, 0), "sedan_hatchback_1985_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30881, 20152.5, 1168), (0, 40, 0), "atv_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16017.8, 26997.4, 3125.79), (0, 190, 0), "mil_cargo_truck_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15925.8, 28175.4, 3119.79), (0, 190, 0), "mil_cargo_truck_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_atv_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16833.5, 27299, 3094.88), (0, 310, 0), "atv_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18169.1, 38806.1, 2229.37), (0, 342, -0), "mil_cargo_truck_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_mil_lnd_cargo_truck_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31577.4, 39280.2, 1570), (0, 246, 0), "mil_cargo_truck_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27889.2, 38272.6, 1596.05), (0, 149, 0), "sedan_hatchback_1985_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22673.5, 39615, 2138), (0, 226, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_sedan_hatchback_1985_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32974.6, 43116.8, 1568), (0, 239, 0), "sedan_hatchback_1985_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17234.5, 32745, 1646), (0, 358, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13602.5, 38067, 2476), (0, 66, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28680.5, 44273, 1934), (0, 74, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35522.5, 43015, 1806), (0, 28, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_mil_lnd_tank_razorback_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-38589, 43303, 1757.84), (358.5, 301.83, 2.82), "jup_razorback_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_truck_tech_aa_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34290, 45034, 1736.63), (359.37, 286.01, -1.25), "jup_truck_tech_aa_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_pickup_1990_tech_hmg_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19850, 38368, 2092.42), (359.77, 359.98, 5.87), "jup_truck_tech_hmg_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_mil_lnd_buggy_orav_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21772, 41982, 2107.37), (0, 301.97, 0), "jup_orav_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22656, 20986, 1777), (0, 270, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22126, 21692, 1777), (0, 0, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21688, 24696, 1744), (0, 250, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh9_suv_1996_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21300, 19650, 1737.27), (0, 135, 0), "suv_1996_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_vehicles_cs";
    s.vehicletype = "veh_jup_pickup_fullsized_2014_physics_mp";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20720, 19883, 1742), (0, 255, 0), "jup_pickup_2014_spawn");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_vehicles_cs/namespace_9300a7e57b81fb7a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1148
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_vehicles_cs/namespace_9300a7e57b81fb7a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1152
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_vehicles_cs");
}

