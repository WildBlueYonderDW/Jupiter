// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_summon_cs;

// Namespace mp_jup_st_f_ob_activities_summon_cs/namespace_81c6cb1ffe54e5ce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x425
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_summon_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_summon_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_summon_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_summon_cs/namespace_81c6cb1ffe54e5ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x499
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_summon_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_summon_cs");
}

// Namespace mp_jup_st_f_ob_activities_summon_cs/namespace_81c6cb1ffe54e5ce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x508
// Size: 0x1481
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "summon_console_green_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26068.7, -24927.8, 3301), (0, 93.5, 0), "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26734, -23099, 3097), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26915, -23263, 3105), (0, 0, 0), "cspf_1_auto7205886467820540478", undefined, "refractor_set", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26751, -23276, 3106), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26723, -22077, 2963), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26783, -23390, 3102), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27043, -23384, 3107), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26490, -22101, 2962), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26671, -22265, 2970), (0, 0, 0), "cspf_1_auto13076757328401767664", undefined, "refractor_set", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27040, -23256, 3107), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26539, -22392, 2967), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26799, -22386, 2972), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26967, -23075, 3098), (0, 0, 0), undefined, "cspf_1_auto7205886467820540478", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26498, -22277, 2967), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26780, -22216, 2967), (0, 0, 0), undefined, "cspf_1_auto13076757328401767664", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26485, -29638, 3584), (0, 0, 0), undefined, "cspf_2_auto15210430063923400149", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25485, -29638, 3584), (0, 0, 0), undefined, "cspf_2_auto15210430063923400149", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26485, -30638, 3583), (0, 0, 0), undefined, "cspf_2_auto15210430063923400149", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25485, -30638, 3586), (0, 0, 0), undefined, "cspf_2_auto15210430063923400149", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25985, -30138, 3595), (0, 0, 0), "cspf_2_auto15210430063923400149", undefined, "aether_storm_spawnpoint", undefined, undefined, (0, 0, 0), (0, 0, 0), 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "summon_console_yellow_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25223.1, -25369.8, 3315), (0, 93.5, 0), "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "summon_console_red_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24485.3, -25235.2, 3297), (0, 93.5, 0), "summon_console_red_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_2_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25204.1, -24933.8, 3246), (0, 93.5, 0), "map_location_2_a", "map_controller", "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_1_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25412.1, -24922.8, 3246), (0, 93.5, 0), "map_location_1_a", "map_controller", "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_3_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25413.1, -24923.8, 3110), (0, 93.5, 0), "map_location_3_a", "map_controller", "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_4_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25203.1, -24936.8, 3110), (0, 93.5, 0), "map_location_4_a", "map_controller", "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25303.1, -24930.8, 3177), (0, 93.5, 0), "map_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25215.1, -25000.8, 3243), (0, 93.5, 0), "map_location_2_b", undefined, "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_1_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25411.1, -24990.8, 3243), (0, 93.5, 0), "map_location_1_b", undefined, "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25505, -24242, 3112), (0, 0, 0), "summon_z_spawn1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25770, -24274, 3115), (0, 0, 0), "summon_z_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_3_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25413.1, -24992.8, 3109), (0, 93.5, 0), "map_location_3_b", undefined, "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_4_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25215.1, -25004.8, 3109), (0, 93.5, 0), "map_location_4_b", undefined, "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_2_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25221.1, -25085.8, 3243), (0, 93.5, 0), "map_location_2_c", undefined, "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_1_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25417.1, -25075.8, 3243), (0, 93.5, 0), "map_location_1_c", undefined, "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_3_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25419.1, -25077.8, 3109), (0, 93.5, 0), "map_location_3_c", undefined, "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_4_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25221.1, -25089.8, 3109), (0, 93.5, 0), "map_location_4_c", undefined, "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_2_d";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25227.1, -25177.8, 3243), (0, 93.5, 0), "map_location_2_d", undefined, "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_1_d";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25423.1, -25167.8, 3243), (0, 93.5, 0), "map_location_1_d", undefined, "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_3_d";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25425.1, -25169.8, 3109), (0, 93.5, 0), "map_location_3_d", undefined, "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "map_location_4_d";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25227.1, -25181.8, 3109), (0, 93.5, 0), "map_location_4_d", undefined, "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26455, -25448, 3106), (0, 14.7, 0), "spawn_refractor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26308.9, -25486.3, 3106), (0, 14.7, 0), "spawn_refractor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26378.6, -25468, 3106), (0, 14.7, 0), "spawn_refractor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26529.5, -25428.5, 3106), (0, 14.7, 0), "spawn_refractor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25525, -24178, 3142), (0, 0, 0), "summon_button");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "green_console_3";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26069, -24986, 3104), (0, 14.2, 0), "green_console_3", "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "green_console_4";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25883.2, -25022.1, 3101), (0, 13.6, 0), "green_console_4", "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "green_console_5";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25684.3, -25065.8, 3102), (0, 4.1, 0), "green_console_5", "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "green_console_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26225.8, -24947, 3101), (0, 4.9, 0), "green_console_2", "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "green_console_1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26384.7, -24900.8, 3101), (0, 3.7, 0), "green_console_1", "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "yellow_console_1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25548.9, -25341.3, 3103), (0, 93.5, 0), "yellow_console_1", "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "yellow_console_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25336.1, -25361.8, 3103), (0, 93.5, 0), "yellow_console_2", "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "yellow_console_3";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25123.3, -25369.2, 3105), (0, 93.5, 0), "yellow_console_3", "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "yellow_console_4";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24906.5, -25382.1, 3106), (0, 93.5, 0), "yellow_console_4", "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "red_console_1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24675, -25236.2, 3106), (0, 93.5, 0), "red_console_1", "summon_console_red_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "red_console_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24478.3, -25235.2, 3107), (0, 93.5, 0), "red_console_2", "summon_console_red_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    s.name = "red_console_3";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24260.8, -25176.2, 3106), (0, 93.5, 0), "red_console_3", "summon_console_red_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25158, -27425, 3485), (0, 0, 0), "summon_cs");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_summon_cs/namespace_81c6cb1ffe54e5ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1990
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_summon_cs/namespace_81c6cb1ffe54e5ce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199a
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_summon_cs");
}

