// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_summon_final_cs;

// Namespace mp_jup_st_f_ob_activities_summon_final_cs/namespace_a242de5912325773
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_summon_final_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_summon_final_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_summon_final_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_summon_final_cs/namespace_a242de5912325773
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_summon_final_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_summon_final_cs");
}

// Namespace mp_jup_st_f_ob_activities_summon_final_cs/namespace_a242de5912325773
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3
// Size: 0xc7d
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "summon_console_green_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38860, -2960, 3183), (0, 0, 0), "summon_console_green_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "summon_console_yellow_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38861, -2890, 3183), (0, 0, 0), "summon_console_yellow_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "summon_console_red_controller";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38862, -2819, 3183), (0, 0, 0), "summon_console_red_controller");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39290.4, -10890.6, 2886.58), (3.71, 210.35, 0.77), undefined, "refractor_controller_c", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39156.8, -11678.1, 2835), (0, 308.5, 0), undefined, "refractor_controller_c", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_controller_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39581.5, -11463.5, 2869.05), (0, 0, 0), "refractor_controller_c", undefined, "refractor_set", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40086.4, -11533.6, 2890.76), (5.75, 81.85, 0.63), undefined, "refractor_controller_c", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40084, -11072.7, 2883.03), (0, 127.6, 0), undefined, "refractor_controller_c", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "ammo_crate_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39781.8, -10998.2, 2885.36), (0, 225.7, 0), undefined, "refractor_controller_c", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "ammo_crate_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39492.4, -11914.4, 2834.82), (0, 334.3, 0), undefined, "refractor_controller_c", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38610.2, -13149.1, 2836.72), (0, 0, 0), undefined, "worm_arena_c", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38609.2, -10807.4, 2862.22), (0, 0, 0), "worm_arena_c", undefined, "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40809.7, -10808.4, 2862.22), (0, 0, 0), undefined, "worm_arena_c", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40473.2, -12646, 3045.72), (0, 0, 0), undefined, "worm_arena_c", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43474.1, -11001.9, 2780.33), (0, 0, 0), undefined, "worm_arena_c", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_c";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42724.1, -12927.6, 2763.86), (0, 0, 0), undefined, "worm_arena_c", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24448, 12859.6, 1590.64), (0, 190.5, -0.1), undefined, "refractor_controller_a", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23503.9, 11744.3, 1600.85), (0.09, 256, -0.04), undefined, "refractor_controller_a", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24690.9, 10702.5, 1645.38), (359.96, 36, 0.09), undefined, "refractor_controller_a", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24969.3, 12166.3, 1495.43), (359.9, 113.4, -5.72), undefined, "refractor_controller_a", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "ammo_crate_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23717.1, 11311.1, 1471.35), (0, 221.7, 0), undefined, "refractor_controller_a", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "ammo_crate_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25464.1, 11795.3, 1572.8), (0, 125.5, -7.4), undefined, "refractor_controller_a", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "refractor_controller_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24540.6, 11751.5, 1475.78), (0, 0, 0.07), "refractor_controller_a", undefined, "refractor_set", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24353.7, 12745.1, 1469.82), (0.04, 322.2, 0.06), undefined, "worm_arena_a", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23062.6, 10887.3, 1478.86), (0.04, 322.2, 0.06), undefined, "worm_arena_a", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25896, 11548.5, 1575.4), (0.04, 322.2, 0.06), undefined, "worm_arena_a", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "worm_arena_a";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24400.5, 9618.17, 1586.86), (0.04, 322.2, 0.06), "worm_arena_a", undefined, "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_activities_summon_final_cs";
    s.name = "green_console_3";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38859, -2560, 2968), (0, 0, 0), "green_console_3", "summon_console_green_controller", "summon_consoles");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_summon_final_cs/namespace_a242de5912325773
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf57
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_summon_final_cs/namespace_a242de5912325773
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf61
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_summon_final_cs");
}

