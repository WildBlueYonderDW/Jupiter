#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_summon_cs;

// Namespace mp_jup_st_h_ob_activities_summon_cs / namespace_339d4216c02163aa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_summon_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_summon_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_summon_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_summon_cs / namespace_339d4216c02163aa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_summon_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_summon_cs");
}

// Namespace mp_jup_st_h_ob_activities_summon_cs / namespace_339d4216c02163aa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7
// Size: 0x5e3
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "map_location_2_d";
    fe [[ f ]](s, us, cf, (18591.5, -33996.4, 2950.82), (0.09, 109.09, -3.5), "map_location_2_d", undefined, "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "map_location_1_d";
    fe [[ f ]](s, us, cf, (18590.7, -33996.4, 2980.08), (0.03, 108.7, -1.5), "map_location_1_d", undefined, "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "map_location_3_d";
    fe [[ f ]](s, us, cf, (18501.3, -34025.9, 2950.98), (0, 107.7, -2.3), "map_location_3_d", undefined, "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "map_location_4_d";
    fe [[ f ]](s, us, cf, (18501, -34025.7, 2981.79), (360, 107.69, 4.7), "map_location_4_d", undefined, "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "green_map_pin_2_d";
    fe [[ f ]](s, us, cf, (18525.2, -34018, 2982.27), (1.2, 108.69, -0), undefined, undefined, "green_map_pin_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "red_map_pin_2_d";
    fe [[ f ]](s, us, cf, (18539.8, -34013.3, 2965.83), (0, 108.69, 0), undefined, undefined, "red_map_pin_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "red_map_pin_1_d";
    fe [[ f ]](s, us, cf, (18544.8, -34011.7, 2968.51), (0, 108.69, 0), undefined, undefined, "red_map_pin_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "red_map_pin_3_d";
    fe [[ f ]](s, us, cf, (18543.6, -34012.1, 2962.24), (0, 108.69, 0), undefined, undefined, "red_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "yellow_map_pin_4_d";
    fe [[ f ]](s, us, cf, (18559.5, -34006.9, 2967.16), (0, 108.69, 0), undefined, undefined, "yellow_map_pin_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "yellow_map_pin_2_d";
    fe [[ f ]](s, us, cf, (18544.4, -34011.8, 2952.54), (0, 108.69, 0), undefined, undefined, "yellow_map_pin_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "yellow_map_pin_3_d";
    fe [[ f ]](s, us, cf, (18555.3, -34008.2, 2957.64), (0, 108.69, 0), undefined, undefined, "yellow_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "yellow_console_2";
    fe [[ f ]](s, us, cf, (3730, -25195, 1744), (0, 214, 0), "yellow_console_2", "summon_console_yellow_controller", "summon_consoles");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "green_map_pin_3_d";
    fe [[ f ]](s, us, cf, (18527.2, -34017.3, 2964.02), (1.4, 108.69, -0), undefined, undefined, "green_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "yellow_map_pin_1_d";
    fe [[ f ]](s, us, cf, (18543.7, -34012, 2976.45), (0, 108.69, 0), undefined, undefined, "yellow_map_pin_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "green_map_pin_4_d";
    fe [[ f ]](s, us, cf, (18532.3, -34015.7, 2946.83), (0, 108.69, 0), undefined, undefined, "green_map_pin_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "green_map_pin_5_d";
    fe [[ f ]](s, us, cf, (18556.9, -34007.7, 2945.35), (0, 108.69, 0), undefined, undefined, "green_map_pin_5");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_summon_cs";
    s.name = "green_map_pin_1_d";
    fe [[ f ]](s, us, cf, (18558.7, -34007.1, 2986.18), (0, 108.69, 0), undefined, undefined, "green_map_pin_1");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_summon_cs / namespace_339d4216c02163aa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_summon_cs / namespace_339d4216c02163aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ec
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_summon_cs");
}

