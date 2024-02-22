// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\flags.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gamescore.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_f5af6f6fc1dbd6b7;

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x392c
// Size: 0x1f
function init() {
    function_d0c04d2061f1e80a();
    function_ed24376a19a1b0fe();
    function_aab0cd8461430413();
    function_6ca37af6683e78ec();
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3952
// Size: 0x91
function function_d0c04d2061f1e80a() {
    if (istrue(game["isLaunchChunk"])) {
        var_ae34c52213832650 = "ustl";
    } else {
        var_ae34c52213832650 = "uktl";
    }
    if (isdefined(level.alliessquadleader)) {
        var_ae34c52213832650 = level.alliessquadleader;
    }
    var_b24c891508e7c927 = "rutl";
    if (isdefined(level.axissquadleader)) {
        var_b24c891508e7c927 = level.axissquadleader;
    }
    if (!isdefined(game["voice"])) {
        game["voice"]["allies"] = var_ae34c52213832650;
        game["voice"]["axis"] = var_b24c891508e7c927;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ea
// Size: 0x15
function function_aab0cd8461430413() {
    if (!isdefined(game["music"])) {
        function_1d15528daa831962();
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a06
// Size: 0x15f
function function_1d15528daa831962() {
    function_b11cfee3350d246a("axis_used_nuke", "mus_fd_nuke_fired");
    function_b11cfee3350d246a("axis_hit_by_nuke", "mus_fd_nuke_hit");
    trials_loss = [0:"mp_round_lose_playlist"];
    function_b11cfee3350d246a("trials_loss", trials_loss);
    trials_win_low = [0:"mp_round_win_playlist"];
    function_b11cfee3350d246a("trials_win_low", trials_win_low);
    trials_win_mid = [0:"mp_round_win_playlist"];
    function_b11cfee3350d246a("trials_win_mid", trials_win_mid);
    trials_win_high = [0:"mp_round_win_playlist"];
    function_b11cfee3350d246a("trials_win_high", trials_win_high);
    infected = [0:"infected_01", 1:"infected_02", 2:"infected_03", 3:"infected_04", 4:"infected_05"];
    function_b11cfee3350d246a("infected", infected);
    ko_carry_music = [0:"mp_hp_new_playlist", 1:"mp_hp_captured_playlist"];
    function_b11cfee3350d246a("ko_carry_music", ko_carry_music);
    prisoner_carry_music = [0:"mp_prisoner_loop_1", 1:"mp_prisoner_loop_2"];
    function_b11cfee3350d246a("prisoner_carry_music", prisoner_carry_music);
    function_79d09d8dff37ff80();
    function_c85c8d480a1f8d97();
    function_350d33613fa93e9();
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b6c
// Size: 0x4a6
function function_a5e3fac0c5201a8() {
    allies_suspense = [0:"mx_mp_generic_suspense_1", 1:"mx_mp_generic_suspense_2", 2:"mx_mp_generic_suspense_3", 3:"mx_mp_generic_suspense_4", 4:"mx_mp_generic_suspense_5", 5:"mx_mp_generic_suspense_6", 6:"mx_mp_generic_suspense_7", 7:"mx_mp_generic_suspense_8", 8:"mx_mp_mexico_suspense_1", 9:"mx_mp_mexico_suspense_2", 10:"mx_mp_mexico_suspense_3", 11:"mx_mp_mexico_suspense_4", 12:"mx_mp_mexico_suspense_5", 13:"mx_mp_mexico_suspense_6", 14:"mx_mp_mexico_suspense_7", 15:"mx_mp_mexico_suspense_8"];
    if (function_5df2f278f44a6ffd("middle_east")) {
        var_7bb0f6f911721ebc = [0:"mx_mp_mideast_suspense_1", 1:"mx_mp_mideast_suspense_2", 2:"mx_mp_mideast_suspense_3", 3:"mx_mp_mideast_suspense_4", 4:"mx_mp_mideast_suspense_5", 5:"mx_mp_mideast_suspense_6", 6:"mx_mp_mideast_suspense_7", 7:"mx_mp_mideast_suspense_8"];
        allies_suspense = array_combine(allies_suspense, var_7bb0f6f911721ebc);
    }
    function_b11cfee3350d246a("allies_suspense", allies_suspense);
    allies_suspense_classic = [0:"mx_mp_generic_suspense_1_classic", 1:"mx_mp_generic_suspense_2_classic", 2:"mx_mp_generic_suspense_3_classic", 3:"mx_mp_generic_suspense_4_classic", 4:"mx_mp_generic_suspense_5_classic", 5:"mx_mp_generic_suspense_6_classic", 6:"mx_mp_generic_suspense_7_classic", 7:"mx_mp_generic_suspense_8_classic"];
    if (function_5df2f278f44a6ffd("middle_east")) {
        var_117a27f685ad48c7 = [0:"mx_mp_mideast_suspense_1_classic", 1:"mx_mp_mideast_suspense_2_classic", 2:"mx_mp_mideast_suspense_3_classic", 3:"mx_mp_mideast_suspense_4_classic", 4:"mx_mp_mideast_suspense_5_classic", 5:"mx_mp_mideast_suspense_6_classic", 6:"mx_mp_mideast_suspense_7_classic", 7:"mx_mp_mideast_suspense_8_classic"];
        allies_suspense_classic = array_combine(allies_suspense_classic, var_117a27f685ad48c7);
    }
    if (function_5df2f278f44a6ffd("mexico")) {
        var_ba852636d22aeecd = [0:"mx_mp_mexico_suspense_1_classic", 1:"mx_mp_mexico_suspense_2_classic", 2:"mx_mp_mexico_suspense_3_classic", 3:"mx_mp_mexico_suspense_4_classic", 4:"mx_mp_mexico_suspense_5_classic", 5:"mx_mp_mexico_suspense_6_classic", 6:"mx_mp_mexico_suspense_7_classic", 7:"mx_mp_mexico_suspense_8_classic"];
        allies_suspense_classic = array_combine(allies_suspense_classic, var_ba852636d22aeecd);
    }
    function_b11cfee3350d246a("allies_suspense_classic", allies_suspense_classic);
    axis_suspense = [0:"mx_mp_generic_suspense_1", 1:"mx_mp_generic_suspense_2", 2:"mx_mp_generic_suspense_3", 3:"mx_mp_generic_suspense_4", 4:"mx_mp_generic_suspense_5", 5:"mx_mp_generic_suspense_6", 6:"mx_mp_generic_suspense_7", 7:"mx_mp_generic_suspense_8", 8:"mx_mp_mexico_suspense_1", 9:"mx_mp_mexico_suspense_2", 10:"mx_mp_mexico_suspense_3", 11:"mx_mp_mexico_suspense_4", 12:"mx_mp_mexico_suspense_5", 13:"mx_mp_mexico_suspense_6", 14:"mx_mp_mexico_suspense_7", 15:"mx_mp_mexico_suspense_8"];
    if (function_5df2f278f44a6ffd("middle_east")) {
        var_8cbc4de0ff7369f1 = [0:"mx_mp_mideast_suspense_1", 1:"mx_mp_mideast_suspense_2", 2:"mx_mp_mideast_suspense_3", 3:"mx_mp_mideast_suspense_4", 4:"mx_mp_mideast_suspense_5", 5:"mx_mp_mideast_suspense_6", 6:"mx_mp_mideast_suspense_7", 7:"mx_mp_mideast_suspense_8"];
        axis_suspense = array_combine(axis_suspense, var_8cbc4de0ff7369f1);
    }
    function_b11cfee3350d246a("axis_suspense", axis_suspense);
    axis_suspense_classic = [0:"mx_mp_generic_suspense_1_classic", 1:"mx_mp_generic_suspense_2_classic", 2:"mx_mp_generic_suspense_3_classic", 3:"mx_mp_generic_suspense_4_classic", 4:"mx_mp_generic_suspense_5_classic", 5:"mx_mp_generic_suspense_6_classic", 6:"mx_mp_generic_suspense_7_classic", 7:"mx_mp_generic_suspense_8_classic"];
    if (function_5df2f278f44a6ffd("middle_east")) {
        var_688a88378ff6ab1e = [0:"mx_mp_mideast_suspense_1_classic", 1:"mx_mp_mideast_suspense_2_classic", 2:"mx_mp_mideast_suspense_3_classic", 3:"mx_mp_mideast_suspense_4_classic", 4:"mx_mp_mideast_suspense_5_classic", 5:"mx_mp_mideast_suspense_6_classic", 6:"mx_mp_mideast_suspense_7_classic", 7:"mx_mp_mideast_suspense_8_classic"];
        axis_suspense_classic = array_combine(axis_suspense_classic, var_688a88378ff6ab1e);
    }
    if (function_5df2f278f44a6ffd("mexico")) {
        var_ac960a84746d1e6e = [0:"mx_mp_mexico_suspense_1_classic", 1:"mx_mp_mexico_suspense_2_classic", 2:"mx_mp_mexico_suspense_3_classic", 3:"mx_mp_mexico_suspense_4_classic", 4:"mx_mp_mexico_suspense_5_classic", 5:"mx_mp_mexico_suspense_6_classic", 6:"mx_mp_mexico_suspense_7_classic", 7:"mx_mp_mexico_suspense_8_classic"];
        axis_suspense_classic = array_combine(axis_suspense_classic, var_ac960a84746d1e6e);
    }
    function_b11cfee3350d246a("axis_suspense_classic", axis_suspense_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4019
// Size: 0xc20
function function_79d09d8dff37ff80() {
    var_fdd4cb56c3b978a3 = namespace_36f464722d326bbe::isbrstylegametype();
    if (!istrue(var_fdd4cb56c3b978a3)) {
        return;
    }
    br_lobby_intro = [0:""];
    function_b11cfee3350d246a("br_lobby_intro", br_lobby_intro);
    br_lobby_outro = [0:"mx_mp_br_prelobby_outro"];
    function_b11cfee3350d246a("br_lobby_outro", br_lobby_outro);
    br_infil_intro = [0:"mx_mp_br_infil_1"];
    function_b11cfee3350d246a("br_infil_intro", br_infil_intro);
    br_plane_jump = [0:""];
    function_b11cfee3350d246a("br_plane_jump", br_plane_jump);
    br_plane_jump_parachute = [0:""];
    function_b11cfee3350d246a("br_plane_jump_parachute", br_plane_jump_parachute);
    br_gulag_intro = [0:"mx_mp_br_gulag_intro_1"];
    function_b11cfee3350d246a("br_gulag_intro", br_gulag_intro);
    br_gulag_jailer = [0:""];
    function_b11cfee3350d246a("br_gulag_jailer", br_gulag_jailer);
    br_gulag_lose = [0:"mx_mp_br_gulag_lose"];
    function_b11cfee3350d246a("br_gulag_lose", br_gulag_lose);
    br_gulag_win = [0:"mx_mp_br_gulag_win"];
    function_b11cfee3350d246a("br_gulag_win", br_gulag_win);
    br_ring_low = [0:"mx_mp_br_circle_close_low_1", 1:"mx_mp_br_circle_close_low_2", 2:"mx_mp_br_circle_close_low_3", 3:"mx_mp_br_circle_close_low_4"];
    function_b11cfee3350d246a("br_ring_low", br_ring_low);
    br_ring_med = [0:"mx_mp_br_circle_close_med_1", 1:"mx_mp_br_circle_close_med_2", 2:"mx_mp_br_circle_close_med_3", 3:"mx_mp_br_circle_close_med_4"];
    function_b11cfee3350d246a("br_ring_med", br_ring_med);
    br_ring_high = [0:"mx_mp_br_circle_close_high_1", 1:"mx_mp_br_circle_close_high_2", 2:"mx_mp_br_circle_close_high_3", 3:"mx_mp_br_circle_close_high_4"];
    function_b11cfee3350d246a("br_ring_high", br_ring_high);
    br_ring_final = [0:"mx_mp_br_circle_close_final_1", 1:"mx_mp_br_circle_close_final_2"];
    function_b11cfee3350d246a("br_ring_final", br_ring_final);
    br_exfil_intro1 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro1", br_exfil_intro1);
    br_exfil_intro2 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro2", br_exfil_intro2);
    br_exfil_intro3 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro3", br_exfil_intro3);
    br_exfil_intro4 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro4", br_exfil_intro4);
    br_exfil_intro5 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro5", br_exfil_intro5);
    br_exfil_intro6 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro6", br_exfil_intro6);
    br_exfil_intro7 = [0:"mx_mp_br_exfil1"];
    function_b11cfee3350d246a("br_exfil_intro7", br_exfil_intro7);
    br_secondary_exfil = [0:"mx_mp_br_sv_exfil_loop"];
    function_b11cfee3350d246a("br_secondary_exfil", br_secondary_exfil);
    br_secondary_exfil_aborted = [0:"mx_mp_br_sv_exfil_abort"];
    function_b11cfee3350d246a("br_secondary_exfil_aborted", br_secondary_exfil_aborted);
    br_secondary_exfil_success = [0:"mx_mp_br_sv_exfil_success"];
    function_b11cfee3350d246a("br_secondary_exfil_success", br_secondary_exfil_success);
    br_cq_element = [0:"mx_mp_br_cq_elementfound_1", 1:"mx_mp_br_cq_elementfound_2", 2:"mx_mp_br_cq_elementfound_3", 3:"mx_mp_br_cq_elementfound_7"];
    function_b11cfee3350d246a("br_cq_element", br_cq_element);
    br_cq_bomb_armed = [0:"mx_mp_br_cq_bombarmed_1", 1:"mx_mp_br_cq_bombarmed_2", 2:"mx_mp_br_cq_bombarmed_3", 3:"mx_mp_br_cq_bombarmed_4", 4:"mx_mp_br_cq_bombarmed_5"];
    function_b11cfee3350d246a("br_cq_bomb_armed", br_cq_bomb_armed);
    br_cq_ending_flyby = [0:"mx_mp_br_cq_airplaneoneshot_1"];
    function_b11cfee3350d246a("br_cq_ending_flyby", br_cq_ending_flyby);
    br_cq_exfil = [0:"mx_mp_br_cq_exfil_1"];
    function_b11cfee3350d246a("br_cq_exfil", br_cq_exfil);
    plunder_tenpercent = [0:"br_plunder_tenpercent_1", 1:"br_plunder_tenpercent_2"];
    function_b11cfee3350d246a("plunder_tenpercent", plunder_tenpercent);
    plunder_thirtypercent = [0:"br_plunder_thirtypercent_1", 1:"br_plunder_thirtypercent_2"];
    function_b11cfee3350d246a("plunder_thirtypercent", plunder_thirtypercent);
    plunder_fiftypercent = [0:"br_plunder_fiftypercent_1", 1:"br_plunder_fiftypercent_2", 2:"br_plunder_fiftypercent_3"];
    function_b11cfee3350d246a("plunder_fiftypercent", plunder_fiftypercent);
    plunder_seventyfivepercent = [0:"br_plunder_seventyfivepercent_1", 1:"br_plunder_seventyfivepercent_2", 2:"br_plunder_seventyfivepercent_3"];
    function_b11cfee3350d246a("plunder_seventyfivepercent", plunder_seventyfivepercent);
    plunder_ninetypercent = [0:"br_plunder_ninetypercent_1", 1:"br_plunder_ninetypercent_2", 2:"br_plunder_ninetypercent_3"];
    function_b11cfee3350d246a("plunder_ninetypercent", plunder_ninetypercent);
    plunder_bonustime_long = [0:"br_plunder_bonustime_long"];
    function_b11cfee3350d246a("plunder_bonustime_long", plunder_bonustime_long);
    var_e9602e7cd3b7a190 = [0:"mx_mp_br_delta_zonecontrol_loop1", 1:"mx_mp_br_delta_zonecontrol_loop2", 2:"mx_mp_br_delta_zonecontrol_loop3"];
    function_b11cfee3350d246a("zc_zone_streak_main", var_e9602e7cd3b7a190);
    if (namespace_36f464722d326bbe::function_314ff105a27cc131()) {
        br_lobby_outro = [0:"mx_mp_br_fk_prelobby_outro"];
        function_b11cfee3350d246a("br_lobby_outro", br_lobby_outro);
        br_infil_intro = [0:"mx_mp_br_fk_infil_1"];
        function_b11cfee3350d246a("br_infil_intro", br_infil_intro);
        br_plane_jump = [0:""];
        function_b11cfee3350d246a("br_plane_jump", br_plane_jump);
        br_plane_jump_parachute = [0:""];
        function_b11cfee3350d246a("br_plane_jump_parachute", br_plane_jump_parachute);
        br_ring_low = [0:"mx_mp_br_fk_circle_close_low_1", 1:"mx_mp_br_fk_circle_close_low_2", 2:"mx_mp_br_fk_circle_close_low_3", 3:"mx_mp_br_fk_circle_close_low_4"];
        function_b11cfee3350d246a("br_ring_low", br_ring_low);
        br_ring_med = [0:"mx_mp_br_fk_circle_close_med_1", 1:"mx_mp_br_fk_circle_close_med_2", 2:"mx_mp_br_fk_circle_close_med_3", 3:"mx_mp_br_fk_circle_close_med_4"];
        function_b11cfee3350d246a("br_ring_med", br_ring_med);
        br_ring_high = [0:"mx_mp_br_fk_circle_close_high_1", 1:"mx_mp_br_fk_circle_close_high_2", 2:"mx_mp_br_fk_circle_close_high_3", 3:"mx_mp_br_fk_circle_close_high_4"];
        function_b11cfee3350d246a("br_ring_high", br_ring_high);
        br_ring_final = [0:"mx_mp_br_fk_circle_close_final_loop_1", 1:"mx_mp_br_fk_circle_close_final_loop_2"];
        function_b11cfee3350d246a("br_ring_final", br_ring_final);
        br_exfil_intro1 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro1", br_exfil_intro1);
        br_exfil_intro2 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro2", br_exfil_intro2);
        br_exfil_intro3 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro3", br_exfil_intro3);
        br_exfil_intro4 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro4", br_exfil_intro4);
        br_exfil_intro5 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro5", br_exfil_intro5);
        br_exfil_intro6 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro6", br_exfil_intro6);
        br_exfil_intro7 = [0:"mx_mp_br_fk_exfil_1"];
        function_b11cfee3350d246a("br_exfil_intro7", br_exfil_intro7);
    }
    if (namespace_36f464722d326bbe::function_5e0e3a24dbb1fae1()) {
        br_lobby_outro = [0:"mx_mp_br_delta_prelobby_outro"];
        function_b11cfee3350d246a("br_lobby_outro", br_lobby_outro);
        br_infil_intro = [0:"mx_mp_br_delta_infil_1"];
        function_b11cfee3350d246a("br_infil_intro", br_infil_intro);
        br_plane_jump = [0:""];
        function_b11cfee3350d246a("br_plane_jump", br_plane_jump);
        br_plane_jump_parachute = [0:""];
        function_b11cfee3350d246a("br_plane_jump_parachute", br_plane_jump_parachute);
        br_gulag_intro = [0:"mx_mp_br_delta_gulag_intro_1"];
        function_b11cfee3350d246a("br_gulag_intro", br_gulag_intro);
        br_ring_low = [0:"mx_mp_br_delta_circle_close_low_1", 1:"mx_mp_br_delta_circle_close_low_2", 2:"mx_mp_br_delta_circle_close_low_3", 3:"mx_mp_br_delta_circle_close_low_4"];
        function_b11cfee3350d246a("br_ring_low", br_ring_low);
        br_ring_med = [0:"mx_mp_br_delta_circle_close_med_1", 1:"mx_mp_br_delta_circle_close_med_2", 2:"mx_mp_br_delta_circle_close_med_3", 3:"mx_mp_br_delta_circle_close_med_4"];
        function_b11cfee3350d246a("br_ring_med", br_ring_med);
        br_ring_high = [0:"mx_mp_br_delta_circle_close_high_1", 1:"mx_mp_br_delta_circle_close_high_2", 2:"mx_mp_br_delta_circle_close_high_3", 3:"mx_mp_br_delta_circle_close_high_4"];
        function_b11cfee3350d246a("br_ring_high", br_ring_high);
        br_ring_final = [0:"mx_mp_br_delta_circle_close_final_loop_1", 1:"mx_mp_br_delta_circle_close_final_loop_2"];
        function_b11cfee3350d246a("br_ring_final", br_ring_final);
        br_exfil_intro1 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro1", br_exfil_intro1);
        br_exfil_intro2 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro2", br_exfil_intro2);
        br_exfil_intro3 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro3", br_exfil_intro3);
        br_exfil_intro4 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro4", br_exfil_intro4);
        br_exfil_intro5 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro5", br_exfil_intro5);
        br_exfil_intro6 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro6", br_exfil_intro6);
        br_exfil_intro7 = [0:"mx_mp_br_delta_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro7", br_exfil_intro7);
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        br_lobby_intro = [0:"mx_mp_br_prelobby_intro"];
        function_b11cfee3350d246a("br_lobby_intro", br_lobby_intro);
        br_lobby_outro = [0:"mx_mp_br_prelobby_outro"];
        function_b11cfee3350d246a("br_lobby_outro", br_lobby_outro);
        br_infil_intro = [0:"mx_mp_br_infil_1"];
        function_b11cfee3350d246a("br_infil_intro", br_infil_intro);
        br_plane_jump = [0:"mx_mp_br_infil_parachute_1", 1:"mx_mp_br_infil_parachute_2", 2:"mx_mp_br_infil_parachute_3", 3:"mx_mp_br_infil_parachute_4"];
        function_b11cfee3350d246a("br_plane_jump", br_plane_jump);
        br_plane_jump_parachute = [0:""];
        function_b11cfee3350d246a("br_plane_jump_parachute", br_plane_jump_parachute);
        br_gulag_intro = [0:"mx_mp_br_gulag_intro_1", 1:"mx_mp_br_gulag_intro_2", 2:"mx_mp_br_gulag_intro_3"];
        function_b11cfee3350d246a("br_gulag_intro", br_gulag_intro);
        br_gulag_jailer = [0:"mx_mp_br_gulag_juggernaut"];
        function_b11cfee3350d246a("br_gulag_jailer", br_gulag_jailer);
        br_gulag_lose = [0:"mx_mp_br_gulag_lose"];
        function_b11cfee3350d246a("br_gulag_lose", br_gulag_lose);
        br_gulag_win = [0:"mx_mp_br_gulag_win"];
        function_b11cfee3350d246a("br_gulag_win", br_gulag_win);
        br_ring_low = [0:"mx_mp_br_circle_close_low_1", 1:"mx_mp_br_circle_close_low_2", 2:"mx_mp_br_circle_close_low_3"];
        function_b11cfee3350d246a("br_ring_low", br_ring_low);
        br_ring_med = [0:"mx_mp_br_circle_close_med_1", 1:"mx_mp_br_circle_close_med_2", 2:"mx_mp_br_circle_close_med_3"];
        function_b11cfee3350d246a("br_ring_med", br_ring_med);
        br_ring_high = [0:"mx_mp_br_circle_close_high_1", 1:"mx_mp_br_circle_close_high_2", 2:"mx_mp_br_circle_close_high_3"];
        function_b11cfee3350d246a("br_ring_high", br_ring_high);
        br_ring_final = [0:"mx_mp_br_circle_close_final_loop_1", 1:"mx_mp_br_circle_close_final_loop_2", 2:"mx_mp_br_circle_close_final_loop_3"];
        function_b11cfee3350d246a("br_ring_final", br_ring_final);
        br_exfil_intro1 = [0:"mx_mp_br_exfil1"];
        function_b11cfee3350d246a("br_exfil_intro1", br_exfil_intro1);
        br_exfil_intro2 = [0:"mx_mp_br_exfil2"];
        function_b11cfee3350d246a("br_exfil_intro2", br_exfil_intro2);
        br_exfil_intro3 = [0:"mx_mp_br_exfil3"];
        function_b11cfee3350d246a("br_exfil_intro3", br_exfil_intro3);
        br_exfil_intro4 = [0:"mx_mp_br_exfil4"];
        function_b11cfee3350d246a("br_exfil_intro4", br_exfil_intro4);
        br_exfil_intro5 = [0:"mx_mp_br_exfil5"];
        function_b11cfee3350d246a("br_exfil_intro5", br_exfil_intro5);
        br_exfil_intro6 = [0:"mx_mp_br_exfil6"];
        function_b11cfee3350d246a("br_exfil_intro6", br_exfil_intro6);
        br_exfil_intro7 = [0:"mx_mp_br_exfil7"];
        function_b11cfee3350d246a("br_exfil_intro7", br_exfil_intro7);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c40
// Size: 0x5ed
function function_c85c8d480a1f8d97() {
    var_6a1d06b01f51312e = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz";
    if (!istrue(var_6a1d06b01f51312e)) {
        return;
    }
    dmz_infil = [0:"iw9_mp_dmz_infil1", 1:"iw9_mp_dmz_infil2", 2:"iw9_mp_dmz_infil3", 3:"iw9_mp_dmz_infil4", 4:"iw9_mp_dmz_infil5"];
    function_b11cfee3350d246a("dmz_infil", dmz_infil);
    dmz_activity_start = [0:"iw9_mp_dmz_activity_start"];
    function_b11cfee3350d246a("dmz_activity_start", dmz_activity_start);
    dmz_activity_tension = [0:"iw9_mp_dmz_activity_tension"];
    function_b11cfee3350d246a("dmz_activity_tension", dmz_activity_tension);
    dmz_activity_action = [0:"iw9_mp_dmz_activity_action"];
    function_b11cfee3350d246a("dmz_activity_action", dmz_activity_action);
    dmz_activity_win = [0:"iw9_mp_dmz_activity_won"];
    function_b11cfee3350d246a("dmz_activity_win", dmz_activity_win);
    dmz_activity_lose = [0:"iw9_mp_dmz_activity_lose"];
    function_b11cfee3350d246a("dmz_activity_lose", dmz_activity_lose);
    dmz_exfil_start = [0:"iw9_mp_dmz_exfil1", 1:"iw9_mp_dmz_exfil2"];
    function_b11cfee3350d246a("dmz_exfil_start", dmz_exfil_start);
    dmz_exfil_manual = [0:"iw9_mp_dmz_exfil_manual"];
    function_b11cfee3350d246a("dmz_exfil_manual", dmz_exfil_manual);
    dmz_exfil_end = [0:""];
    function_b11cfee3350d246a("dmz_exfil_end", dmz_exfil_end);
    dmz_exfil_abort = [0:"iw9_mp_dmz_exfil_abort"];
    function_b11cfee3350d246a("dmz_exfil_abort", dmz_exfil_abort);
    dmz_stronghold_unlock = [0:"dmz_stronghold_unlock"];
    function_b11cfee3350d246a("dmz_stronghold_unlock", dmz_stronghold_unlock);
    dmz_elimination_start = [0:"dmz_elimination_accept"];
    function_b11cfee3350d246a("dmz_elimination_start", dmz_elimination_start);
    dmz_elimination_approach = [0:"dmz_elimination_approach"];
    function_b11cfee3350d246a("dmz_elimination_approach", dmz_elimination_approach);
    dmz_elimination_win = [0:"dmz_elimination_kill"];
    function_b11cfee3350d246a("dmz_elimination_win", dmz_elimination_win);
    dmz_geigersearch_pickups = [0:"dmz_geigersearch_pickups"];
    function_b11cfee3350d246a("dmz_geigersearch_pickups", dmz_geigersearch_pickups);
    dmz_hostage_start = [0:"dmz_fortress_hostage_contract"];
    function_b11cfee3350d246a("dmz_hostage_start", dmz_hostage_start);
    dmz_hostage_approach = [0:"dmz_fortress_hostage_approach"];
    function_b11cfee3350d246a("dmz_hostage_approach", dmz_hostage_approach);
    dmz_hostage_breach = [0:"dmz_stronghold_unlock"];
    function_b11cfee3350d246a("dmz_hostage_breach", dmz_hostage_breach);
    dmz_hostage_rescue = [0:"dmz_fortress_hostage_rescue"];
    function_b11cfee3350d246a("dmz_hostage_rescue", dmz_hostage_rescue);
    dmz_hostage_rescue_failed = [0:"dmz_fortress_hostage_rescuefailed"];
    function_b11cfee3350d246a("dmz_hostage_rescue_failed", dmz_hostage_rescue_failed);
    dmz_trap_start = [0:"dmz_trap_assigned"];
    function_b11cfee3350d246a("dmz_trap_start", dmz_trap_start);
    dmz_trap_approach = [0:"dmz_trap_approach"];
    function_b11cfee3350d246a("dmz_trap_approach", dmz_trap_approach);
    dmz_trap_drill = [0:"dmz_trap_drill"];
    function_b11cfee3350d246a("dmz_trap_drill", dmz_trap_drill);
    dmz_train_safe_drill = [0:"mx_mp_dmz_safecracker_train_loop"];
    function_b11cfee3350d246a("dmz_train_safe_drill", dmz_train_safe_drill);
    if (level.mapname == "mp_bio_lab" || level.mapname == "mp_biobunker") {
        dmz_infil = [0:"dmz_stronghold_unlock"];
        function_b11cfee3350d246a("dmz_infil", dmz_infil);
    }
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        dmz_infil = [0:"mx_mp_dmz_s2_infil1", 1:"mx_mp_dmz_s2_infil2"];
        function_b11cfee3350d246a("dmz_infil", dmz_infil);
        dmz_activity_start = [0:"mx_mp_dmz_s2_activity_start"];
        function_b11cfee3350d246a("dmz_activity_start", dmz_activity_start);
        dmz_activity_tension = [0:"mx_mp_dmz_s2_activity_tension"];
        function_b11cfee3350d246a("dmz_activity_tension", dmz_activity_tension);
        dmz_activity_action = [0:"mx_mp_dmz_s2_activity_action"];
        function_b11cfee3350d246a("dmz_activity_action", dmz_activity_action);
        dmz_activity_win = [0:"mx_mp_dmz_s2_activity_win"];
        function_b11cfee3350d246a("dmz_activity_win", dmz_activity_win);
        dmz_activity_lose = [0:"mx_mp_dmz_s2_activity_lose"];
        function_b11cfee3350d246a("dmz_activity_lose", dmz_activity_lose);
        dmz_exfil_start = [0:"mx_mp_dmz_s2_exfil1", 1:"mx_mp_dmz_s2_exfil2"];
        function_b11cfee3350d246a("dmz_exfil_start", dmz_exfil_start);
        dmz_stronghold_unlock = [0:"dmz_stronghold_unlock"];
        function_b11cfee3350d246a("dmz_stronghold_unlock", dmz_stronghold_unlock);
        dmz_elimination_start = [0:"mx_mp_dmz_s2_activity_start"];
        function_b11cfee3350d246a("dmz_elimination_start", dmz_activity_start);
        dmz_elimination_approach = [0:"mx_mp_dmz_s2_activity_action_loop2"];
        function_b11cfee3350d246a("dmz_elimination_approach", dmz_elimination_approach);
        dmz_elimination_win = [0:""];
        function_b11cfee3350d246a("dmz_elimination_win", dmz_elimination_win);
        dmz_geigersearch_pickups = [0:"mx_mp_dmz_s2_activity_pickups"];
        function_b11cfee3350d246a("dmz_geigersearch_pickups", dmz_geigersearch_pickups);
        dmz_hostage_start = [0:"mx_mp_dmz_s2_activity_start"];
        function_b11cfee3350d246a("dmz_hostage_start", dmz_hostage_start);
        dmz_hostage_approach = [0:"mx_mp_dmz_s2_activity_tension"];
        function_b11cfee3350d246a("dmz_hostage_approach", dmz_hostage_approach);
        dmz_hostage_breach = [0:"dmz_stronghold_unlock"];
        function_b11cfee3350d246a("dmz_hostage_breach", dmz_hostage_breach);
        dmz_hostage_rescue = [0:"mx_mp_dmz_s2_activity_action_loop3"];
        function_b11cfee3350d246a("dmz_hostage_rescue", dmz_hostage_rescue);
        dmz_hostage_rescue_failed = [0:"mx_mp_dmz_s2_activity_lose"];
        function_b11cfee3350d246a("dmz_hostage_rescue_failed", dmz_hostage_rescue_failed);
        dmz_trap_start = [0:"mx_mp_dmz_s2_activity_start"];
        function_b11cfee3350d246a("dmz_trap_start", dmz_trap_start);
        dmz_trap_approach = [0:"mx_mp_dmz_s2_activity_tension"];
        function_b11cfee3350d246a("dmz_trap_approach", dmz_trap_approach);
        dmz_trap_drill = [0:"mx_mp_dmz_s2_activity_action_loop2"];
        function_b11cfee3350d246a("dmz_trap_drill", dmz_trap_drill);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5234
// Size: 0xa
function function_350d33613fa93e9() {
    function_8b0c0a46f9743150();
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5245
// Size: 0x592
function function_8b0c0a46f9743150() {
    br_infil_intro_classic = [0:"mx_mp_br_infil_1_classic"];
    function_b11cfee3350d246a("br_infil_intro_classic", br_infil_intro_classic);
    br_gulag_lose_classic = [0:"mx_mp_br_gulag_lose_classic"];
    function_b11cfee3350d246a("br_gulag_lose_classic", br_gulag_lose_classic);
    br_gulag_win_classic = [0:"mx_mp_br_gulag_win_classic"];
    function_b11cfee3350d246a("br_gulag_win_classic", br_gulag_win_classic);
    br_ring_low_classic = [0:"mx_mp_br_circle_close_low_1_classic", 1:"mx_mp_br_circle_close_low_2_classic"];
    function_b11cfee3350d246a("br_ring_low_classic", br_ring_low_classic);
    br_ring_med_classic = [0:"mx_mp_br_circle_close_med_1_classic", 1:"mx_mp_br_circle_close_med_2_classic"];
    function_b11cfee3350d246a("br_ring_med_classic", br_ring_med_classic);
    br_ring_high_classic = [0:"mx_mp_br_circle_close_high_1_classic", 1:"mx_mp_br_circle_close_high_2_classic"];
    function_b11cfee3350d246a("br_ring_high_classic", br_ring_high_classic);
    br_ring_final_classic = [0:"mx_mp_br_circle_close_final_loop_1_classic", 1:"mx_mp_br_circle_close_final_loop_2_classic"];
    function_b11cfee3350d246a("br_ring_final_classic", br_ring_final_classic);
    br_exfil_intro1_classic = [0:"mx_mp_br_exfil1_classic"];
    function_b11cfee3350d246a("br_exfil_intro1_classic", br_exfil_intro1_classic);
    br_exfil_intro2_classic = [0:"mx_mp_br_exfil2_classic"];
    function_b11cfee3350d246a("br_exfil_intro2_classic", br_exfil_intro2_classic);
    br_exfil_intro3_classic = [0:"mx_mp_br_exfil3_classic"];
    function_b11cfee3350d246a("br_exfil_intro3_classic", br_exfil_intro3_classic);
    br_exfil_intro4_classic = [0:"mx_mp_br_exfil4_classic"];
    function_b11cfee3350d246a("br_exfil_intro4_classic", br_exfil_intro4_classic);
    br_exfil_intro5_classic = [0:"mx_mp_br_exfil5_classic"];
    function_b11cfee3350d246a("br_exfil_intro5_classic", br_exfil_intro5_classic);
    br_exfil_intro6_classic = [0:"mx_mp_br_exfil6_classic"];
    function_b11cfee3350d246a("br_exfil_intro6_classic", br_exfil_intro6_classic);
    br_exfil_intro7_classic = [0:"mx_mp_br_exfil6_classic"];
    function_b11cfee3350d246a("br_exfil_intro7_classic", br_exfil_intro7_classic);
    br_cq_element_classic = [0:"mx_mp_br_cq_elementfound_1_classic", 1:"mx_mp_br_cq_elementfound_2_classic", 2:"mx_mp_br_cq_elementfound_3_classic"];
    function_b11cfee3350d246a("br_cq_element_classic", br_cq_element_classic);
    br_cq_bomb_armed_classic = [0:"mx_mp_br_cq_bombarmed_1_classic"];
    function_b11cfee3350d246a("br_cq_bomb_armed_classic", br_cq_bomb_armed_classic);
    dmz_infil_classic = [0:"iw9_mp_dmz_infil1_classic", 1:"iw9_mp_dmz_infil2_classic", 2:"iw9_mp_dmz_infil3_classic", 3:"iw9_mp_dmz_infil4_classic", 4:"iw9_mp_dmz_infil5_classic"];
    function_b11cfee3350d246a("dmz_infil_classic", dmz_infil_classic);
    dmz_activity_start_classic = [0:"iw9_mp_dmz_activity_start_classic"];
    function_b11cfee3350d246a("dmz_activity_start_classic", dmz_activity_start_classic);
    dmz_activity_tension_classic = [0:"iw9_mp_dmz_activity_tension_classic"];
    function_b11cfee3350d246a("dmz_activity_tension_classic", dmz_activity_tension_classic);
    dmz_activity_action_classic = [0:"iw9_mp_dmz_activity_action_classic"];
    function_b11cfee3350d246a("dmz_activity_action_classic", dmz_activity_action_classic);
    dmz_activity_win_classic = [0:"iw9_mp_dmz_activity_won_classic"];
    function_b11cfee3350d246a("dmz_activity_win_classic", dmz_activity_win_classic);
    dmz_activity_lose_classic = [0:"iw9_mp_dmz_activity_lose_classic"];
    function_b11cfee3350d246a("dmz_activity_lose_classic", dmz_activity_lose_classic);
    dmz_exfil_start_classic = [0:"iw9_mp_dmz_exfil1_classic", 1:"iw9_mp_dmz_exfil2_classic"];
    function_b11cfee3350d246a("dmz_exfil_start_classic", dmz_exfil_start_classic);
    dmz_stronghold_unlock_classic = [0:"dmz_stronghold_unlock_classic"];
    function_b11cfee3350d246a("dmz_stronghold_unlock_classic", dmz_stronghold_unlock_classic);
    dmz_elimination_start_classic = [0:"dmz_elimination_accept_classic"];
    function_b11cfee3350d246a("dmz_elimination_start_classic", dmz_elimination_start_classic);
    dmz_elimination_approach_classic = [0:"dmz_elimination_approach_classic"];
    function_b11cfee3350d246a("dmz_elimination_approach_classic", dmz_elimination_approach_classic);
    dmz_elimination_win_classic = [0:"dmz_elimination_kill_classic"];
    function_b11cfee3350d246a("dmz_elimination_win_classic", dmz_elimination_win_classic);
    dmz_geigersearch_pickups_classic = [0:"dmz_geigersearch_pickups_classic"];
    function_b11cfee3350d246a("dmz_geigersearch_pickups_classic", dmz_geigersearch_pickups_classic);
    dmz_hostage_start_classic = [0:"dmz_fortress_hostage_contract_classic"];
    function_b11cfee3350d246a("dmz_hostage_start_classic", dmz_hostage_start_classic);
    dmz_hostage_approach_classic = [0:"dmz_fortress_hostage_approach_classic"];
    function_b11cfee3350d246a("dmz_hostage_approach_classic", dmz_hostage_approach_classic);
    dmz_hostage_breach_classic = [0:"dmz_stronghold_unlock_classic"];
    function_b11cfee3350d246a("dmz_hostage_breach_classic", dmz_hostage_breach_classic);
    dmz_hostage_rescue_classic = [0:"dmz_fortress_hostage_rescue_classic"];
    function_b11cfee3350d246a("dmz_hostage_rescue_classic", dmz_hostage_rescue_classic);
    dmz_hostage_rescue_failed_classic = [0:"dmz_fortress_hostage_rescuefailed_classic"];
    function_b11cfee3350d246a("dmz_hostage_rescue_failed_classic", dmz_hostage_rescue_failed_classic);
    dmz_trap_start_classic = [0:"dmz_trap_assigned_classic"];
    function_b11cfee3350d246a("dmz_trap_start_classic", dmz_trap_start_classic);
    dmz_trap_approach_classic = [0:"dmz_trap_approach_classic"];
    function_b11cfee3350d246a("dmz_trap_approach_classic", dmz_trap_approach_classic);
    dmz_trap_drill_classic = [0:"dmz_trap_drill_classic"];
    function_b11cfee3350d246a("dmz_trap_drill_classic", dmz_trap_drill_classic);
    dmz_train_safe_drill_classic = [0:"mx_mp_dmz_safecracker_train_loop"];
    function_b11cfee3350d246a("dmz_train_safe_drill_classic", dmz_train_safe_drill_classic);
    var_9be07d4da97c507b = [0:"zc_points_streak_classic"];
    function_b11cfee3350d246a("zc_zone_streak_main_classic", var_9be07d4da97c507b);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57de
// Size: 0x4b
function function_a7859595cdf7077(var_8b8c889f4a1b7c8) {
    self endon("disconnect");
    self.var_dacd6424f90c605d = [];
    if (var_8b8c889f4a1b7c8 == "faction") {
        thread function_42b070fb8d72b5f8();
    } else {
        if (var_8b8c889f4a1b7c8 == "musicStyle") {
            goto LOC_00000049;
        }
        function_414b65c7174581d1("mp_default");
    LOC_00000049:
    }
LOC_00000049:
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5830
// Size: 0x753
function function_42b070fb8d72b5f8() {
    var_f42e10b1b219ca25 = namespace_54d20dd0dd79277f::getteamvoiceinfix("allies");
    var_97018a742c407dd0 = namespace_54d20dd0dd79277f::getteamvoiceinfix("axis");
    self.var_dacd6424f90c605d["musicbank_allies"] = undefined;
    self.var_dacd6424f90c605d["musicbank_axis"] = undefined;
    if (getgametype() == "xfire") {
        var_bf375eeb814dd878 = namespace_54d20dd0dd79277f::getteamvoiceinfix("team_three");
        self.var_dacd6424f90c605d["musicbank_team_three"] = undefined;
        if (self.var_acfbb9caed7125f9 == 1) {
            switch (var_f42e10b1b219ca25) {
            case #"hash_af17f86d59bb3d35":
                function_414b65c7174581d1("mp_faction_tf141_classic", "allies");
                break;
            case #"hash_20abb6900079e8a3":
                function_414b65c7174581d1("mp_faction_rangers_classic", "allies");
                break;
            case #"hash_b4f27b89f5a78a00":
                function_414b65c7174581d1("mp_faction_navyseals_classic", "allies");
                break;
            default:
                function_414b65c7174581d1("mp_default", "allies");
                break;
            }
            switch (var_97018a742c407dd0) {
            case #"hash_d73ed93ff1b09b71":
                function_414b65c7174581d1("mp_faction_opfor_classic", "axis");
                break;
            case #"hash_521188a1f4fac07":
                function_414b65c7174581d1("mp_faction_spetsnaz_classic", "axis");
                break;
            case #"hash_bfb1c034c59a88dc":
                function_414b65c7174581d1("mp_faction_militia_classic", "axis");
                break;
            default:
                function_414b65c7174581d1("mp_default", "axis");
                break;
            }
            switch (var_bf375eeb814dd878) {
            case #"hash_af17f86d59bb3d35":
                function_414b65c7174581d1("mp_faction_tf141_classic", "team_three");
                break;
            case #"hash_20abb6900079e8a3":
                function_414b65c7174581d1("mp_faction_rangers_classic", "team_three");
                break;
            case #"hash_b4f27b89f5a78a00":
                function_414b65c7174581d1("mp_faction_navyseals_classic", "team_three");
                break;
            case #"hash_d73ed93ff1b09b71":
                function_414b65c7174581d1("mp_faction_opfor_classic", "team_three");
                break;
            case #"hash_521188a1f4fac07":
                function_414b65c7174581d1("mp_faction_spetsnaz_classic", "team_three");
                break;
            case #"hash_bfb1c034c59a88dc":
                function_414b65c7174581d1("mp_faction_militia_classic", "team_three");
                break;
            default:
                function_414b65c7174581d1("mp_default", "team_three");
                break;
            }
        } else {
            switch (var_f42e10b1b219ca25) {
            case #"hash_af17f86d59bb3d35":
                function_414b65c7174581d1("mp_faction_tf141", "allies");
                break;
            case #"hash_20abb6900079e8a3":
                function_414b65c7174581d1("mp_faction_rangers", "allies");
                break;
            case #"hash_b4f27b89f5a78a00":
                function_414b65c7174581d1("mp_faction_navyseals", "allies");
                break;
            default:
                function_414b65c7174581d1("mp_default", "allies");
                break;
            }
            switch (var_97018a742c407dd0) {
            case #"hash_d73ed93ff1b09b71":
                function_414b65c7174581d1("mp_faction_opfor", "axis");
                break;
            case #"hash_521188a1f4fac07":
                function_414b65c7174581d1("mp_faction_spetsnaz", "axis");
                break;
            case #"hash_bfb1c034c59a88dc":
                function_414b65c7174581d1("mp_faction_militia", "axis");
                break;
            default:
                function_414b65c7174581d1("mp_default", "axis");
                break;
            }
            switch (var_bf375eeb814dd878) {
            case #"hash_af17f86d59bb3d35":
                function_414b65c7174581d1("mp_faction_tf141", "team_three");
                break;
            case #"hash_20abb6900079e8a3":
                function_414b65c7174581d1("mp_faction_rangers", "team_three");
                break;
            case #"hash_b4f27b89f5a78a00":
                function_414b65c7174581d1("mp_faction_navyseals", "team_three");
                break;
            case #"hash_d73ed93ff1b09b71":
                function_414b65c7174581d1("mp_faction_opfor", "team_three");
                break;
            case #"hash_521188a1f4fac07":
                function_414b65c7174581d1("mp_faction_spetsnaz", "team_three");
                break;
            case #"hash_bfb1c034c59a88dc":
                function_414b65c7174581d1("mp_faction_militia", "team_three");
                break;
            default:
                function_414b65c7174581d1("mp_default", "team_three");
                break;
            }
        }
    } else if (getdvarint(@"hash_57efffe601711595", 0) && getgametype() == "koth") {
        if (var_f42e10b1b219ca25 == "t141" || var_f42e10b1b219ca25 == "rang" || var_f42e10b1b219ca25 == "seal") {
            function_414b65c7174581d1("mp_mode_hordepoint", "allies");
        } else {
            function_414b65c7174581d1("mp_mode_hordepoint", "allies");
        }
        if (var_97018a742c407dd0 == "opfo" || var_97018a742c407dd0 == "spet" || var_97018a742c407dd0 == "mili") {
            function_414b65c7174581d1("mp_mode_hordepoint", "axis");
        } else {
            function_414b65c7174581d1("mp_mode_hordepoint", "axis");
        }
    } else if (self.var_acfbb9caed7125f9 == 1) {
        switch (var_f42e10b1b219ca25) {
        case #"hash_af17f86d59bb3d35":
            function_414b65c7174581d1("mp_faction_tf141_classic", "allies");
            break;
        case #"hash_20abb6900079e8a3":
            function_414b65c7174581d1("mp_faction_rangers_classic", "allies");
            break;
        case #"hash_b4f27b89f5a78a00":
            function_414b65c7174581d1("mp_faction_navyseals_classic", "allies");
            break;
        default:
            function_414b65c7174581d1("mp_default", "allies");
            break;
        }
        switch (var_97018a742c407dd0) {
        case #"hash_d73ed93ff1b09b71":
            function_414b65c7174581d1("mp_faction_opfor_classic", "axis");
            break;
        case #"hash_521188a1f4fac07":
            function_414b65c7174581d1("mp_faction_spetsnaz_classic", "axis");
            break;
        case #"hash_bfb1c034c59a88dc":
            function_414b65c7174581d1("mp_faction_militia_classic", "axis");
            break;
        default:
            function_414b65c7174581d1("mp_default", "axis");
            break;
        }
    } else {
        switch (var_f42e10b1b219ca25) {
        case #"hash_af17f86d59bb3d35":
            function_414b65c7174581d1("mp_faction_tf141", "allies");
            break;
        case #"hash_20abb6900079e8a3":
            function_414b65c7174581d1("mp_faction_rangers", "allies");
            break;
        case #"hash_b4f27b89f5a78a00":
            function_414b65c7174581d1("mp_faction_navyseals", "allies");
            break;
        default:
            function_414b65c7174581d1("mp_default", "allies");
            break;
        }
        switch (var_97018a742c407dd0) {
        case #"hash_d73ed93ff1b09b71":
            function_414b65c7174581d1("mp_faction_opfor", "axis");
            break;
        case #"hash_521188a1f4fac07":
            function_414b65c7174581d1("mp_faction_spetsnaz", "axis");
            break;
        case #"hash_bfb1c034c59a88dc":
            function_414b65c7174581d1("mp_faction_militia", "axis");
            break;
        default:
            function_414b65c7174581d1("mp_default", "axis");
            break;
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8a
// Size: 0x16c
function function_414b65c7174581d1(var_8e6988e5e46aad6e, var_efae3e4809d7d027, var_94297cc109e4d6a5) {
    if (isdefined(getscriptbundle("musicbank:" + var_8e6988e5e46aad6e))) {
        if (isdefined(var_efae3e4809d7d027)) {
            self.var_dacd6424f90c605d["musicbank"] = undefined;
            if (getgametype() == "xfire") {
                self.var_dacd6424f90c605d["musicbank_team_three"] = undefined;
            }
            switch (var_efae3e4809d7d027) {
            case #"hash_5f54b9bf7583687f":
                self.var_dacd6424f90c605d["musicbank_allies"] = var_8e6988e5e46aad6e;
                function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, getscriptbundle("musicbank:" + var_8e6988e5e46aad6e));
                break;
            case #"hash_7c2d091e6337bf54":
                self.var_dacd6424f90c605d["musicbank_axis"] = var_8e6988e5e46aad6e;
                function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, getscriptbundle("musicbank:" + var_8e6988e5e46aad6e));
                break;
            case #"hash_11f9d28d306ceab7":
                self.var_dacd6424f90c605d["musicbank_team_three"] = var_8e6988e5e46aad6e;
                function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, getscriptbundle("musicbank:" + var_8e6988e5e46aad6e));
                break;
            default:
                self.var_dacd6424f90c605d["musicbank"] = var_8e6988e5e46aad6e;
                function_ad9f5152bfdebcfe("musicbank", var_8e6988e5e46aad6e, getscriptbundle("musicbank:" + var_8e6988e5e46aad6e));
                break;
            }
            return;
        } else if (!isdefined(var_efae3e4809d7d027) && isdefined(var_94297cc109e4d6a5)) {
            return;
        } else if (isdefined(var_efae3e4809d7d027) && isdefined(var_94297cc109e4d6a5)) {
            return;
        } else {
            return;
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60fd
// Size: 0x51
function function_cd6fa41e597b8df0(var_83adde1ef76f568a) {
    var_8622842a2b7990a0 = function_291ab2db66d6ea2e(var_83adde1ef76f568a);
    if (isdefined(var_8622842a2b7990a0)) {
        musicstate = utility::function_7a2aaa4a09a4d250(var_8622842a2b7990a0.musicstates);
        self setplayermusicstate(musicstate.statename);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6155
// Size: 0x122
function function_291ab2db66d6ea2e(var_83adde1ef76f568a) {
    if (!isdefined(var_83adde1ef76f568a) || var_83adde1ef76f568a == "") {
        return undefined;
    }
    if (self.team == "allies") {
        musicbank = namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", self.var_dacd6424f90c605d["musicbank_allies"]);
    } else if (self.team == "axis") {
        musicbank = namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", self.var_dacd6424f90c605d["musicbank_axis"]);
    } else if (self.team == "team_three") {
        musicbank = namespace_f86ba2003950072a::function_9a0f23d8adcd6392("musicbank", self.var_dacd6424f90c605d["musicbank_team_three"]);
        goto LOC_000000d4;
    }
LOC_000000d4:
    if (!isdefined(musicbank)) {
        return;
    }
    foreach (event in musicbank.var_8622842a2b7990a0) {
        if (event.eventid == var_83adde1ef76f568a) {
            return event;
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x627e
// Size: 0xc4c
function function_ed24376a19a1b0fe() {
    if (!isdefined(game["dialogue"])) {
        game["dialogue"]["axis_male_cough"] = [];
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_1";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_2";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_3";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_4";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_5";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_6";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_7";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_8";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_1";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_2";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_3";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_4";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_5";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_6";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_7";
        game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_8";
        game["dialogue"]["axis_female_cough"] = [];
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_1";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_2";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_3";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_4";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_5";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_6";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_7";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_8";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_1";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_2";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_3";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_4";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_5";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_6";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_7";
        game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_8";
        game["dialogue"]["allies_male_cough"] = [];
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_1";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_2";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_3";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_4";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_5";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_6";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_7";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_8";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_1";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_2";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_3";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_4";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_5";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_6";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_7";
        game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_8";
        game["dialogue"]["allies_female_cough"] = [];
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_1";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_2";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_3";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_4";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_5";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_6";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_7";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_8";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_1";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_2";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_3";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_4";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_5";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_6";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_7";
        game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_8";
        game["dialog"]["timesup"] = "dx_mp_gmst_anno_uktl_gsta";
        game["dialog"]["timesup_sixty"] = "dx_mp_gmst_anno_uktl_gstd";
        game["dialog"]["timesup_thirty"] = "dx_mp_gmst_anno_uktl_gstc";
        game["dialog"]["timesup_ten"] = "dx_mp_gmst_anno_uktl_gstb";
        game["dialog"]["winning"] = "dx_mp_gmst_anno_uktl_gswa";
        game["dialog"]["winning_time"] = "dx_mp_gmst_anno_uktl_gswb";
        game["dialog"]["winning_score"] = "dx_mp_gmst_anno_uktl_gswc";
        game["dialog"]["winning_comeback"] = "dx_mp_gmst_anno_uktl_gswd";
        game["dialog"]["losing"] = "dx_mp_gmst_anno_uktl_gsla";
        game["dialog"]["losing_time"] = "dx_mp_gmst_anno_uktl_gslb";
        game["dialog"]["losing_score"] = "dx_mp_gmst_anno_uktl_gslc";
        game["dialog"]["lead_lost"] = "dx_mp_gmst_anno_uktl_gsld";
        game["dialog"]["lead_tied"] = "dx_mp_gmst_anno_uktl_gslf";
        game["dialog"]["lead_taken"] = "dx_mp_gmst_anno_uktl_gsle";
        game["dialog"]["halftime"] = "dx_mp_gmst_anno_uktl_gsht";
        game["dialog"]["overtime"] = "dx_mp_gmst_anno_uktl_gsot";
        game["dialog"]["side_switch"] = "dx_mp_gmst_anno_uktl_gsss";
        game["dialog"]["last_alive"] = "dx_mp_gmst_anno_uktl_gslr";
        if (!isdefined(game["dialog"]["halfway_enemy_score"])) {
            game["dialog"]["halfway_enemy_score"] = "dx_mp_gmst_anno_uktl_gshd";
        }
        if (!isdefined(game["dialog"]["halfway_enemy_time"])) {
            game["dialog"]["halfway_enemy_time"] = "dx_mp_gmst_anno_uktl_gshc";
        }
        if (!isdefined(game["dialog"]["halfway_friendly_score"])) {
            game["dialog"]["halfway_friendly_score"] = "dx_mp_gmst_anno_uktl_gshb";
        }
        if (!isdefined(game["dialog"]["halfway_friendly_time"])) {
            game["dialog"]["halfway_friendly_time"] = "dx_mp_gmst_anno_uktl_gsha";
        }
        if (!isdefined(game["dialog"]["boost"])) {
            game["dialog"]["boost"] = "dx_mp_gmst_anno_uktl_gsbo";
        }
        if (!isdefined(game["dialog"]["offense_obj"])) {
            game["dialog"]["offense_obj"] = "dx_mp_gmst_anno_uktl_gsbo";
        }
        if (!isdefined(game["dialog"]["defense_obj"])) {
            game["dialog"]["defense_obj"] = "dx_mp_gmst_anno_uktl_gsbo";
        }
        game["dialog"]["obj_defend"] = "dx_mp_gmst_anno_uktl_gsoa";
        game["dialog"]["objs_defend"] = "dx_mp_gmst_anno_uktl_gsob";
        game["dialog"]["obj_destroy"] = "dx_mp_gmst_anno_uktl_gsoc";
        game["dialog"]["objs_destroy"] = "dx_mp_gmst_anno_uktl_gsod";
        game["dialog"]["obj_capture"] = "dx_mp_gmst_anno_uktl_gsoe";
        game["dialog"]["objs_capture"] = "dx_mp_gmst_anno_uktl_gsof";
        game["dialog"]["captured_all_enemy"] = "dx_mp_gmst_anno_uktl_gsce";
        game["dialog"]["captured_all_friendly"] = "dx_mp_gmst_anno_uktl_gscf";
        game["dialog"]["ti_destroyed"] = "dx_mp_gmst_anno_uktl_gsti";
        game["dialog"]["revived"] = "dx_mp_gmst_anno_uktl_gsrv";
    }
    game["dialog"]["mission_success"] = "dx_mp_gmst_anno_uktl_gsms";
    game["dialog"]["mission_failure"] = "dx_mp_gmst_anno_uktl_gsmf";
    game["dialog"]["mission_draw"] = "dx_mp_gmst_anno_uktl_gsmt";
    game["dialog"]["round_success"] = "dx_mp_gmst_anno_uktl_gsrs";
    game["dialog"]["round_failure"] = "dx_mp_gmst_anno_uktl_gsrf";
    game["dialog"]["round_draw"] = "dx_mp_gmst_anno_uktl_gsrt";
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed1
// Size: 0x6e
function function_6ca37af6683e78ec() {
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    level thread onplayerconnect();
    level thread onlastalive();
    level thread musiccontroller();
    level thread ongameended();
    level thread onroundswitch();
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "gwai") {
        setdvar(@"hash_58a078a367c02ab3", 1);
        setdvar(@"hash_c5d765aefb9658bd", 1500);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f46
// Size: 0x85
function onplayerconnect() {
    for (;;) {
        player = level waittill("connected");
        var_acfbb9caed7125f9 = getdvarint(@"hash_61e9133b2e499a6c");
        player.var_acfbb9caed7125f9 = var_acfbb9caed7125f9;
        if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz") {
            player thread function_8ffc5ac70256254b();
        }
        player thread function_a7859595cdf7077("faction");
        player thread playflyoveraudioline();
        player thread watchhostmigration();
        player.needtoplayintro = 1;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fd2
// Size: 0x10b
function onplayerspawned() {
    setdvarifuninitialized(@"hash_61e9133b2e499a6c", 0);
    if (isai(self)) {
        return;
    }
    if (istrue(self.needtoplayintro)) {
        thread dointro();
        self.needtoplayintro = undefined;
    }
    if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || getgametype() == "gwbomb" || getgametype() == "gwtdm" || isgroundwarcoremode()) {
        self setsoundsubmix("iw9_mp_groundwar_focus");
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        self setsoundsubmix("wz_br_focus");
    } else if (getgametype() == "ballmode") {
        self setsoundsubmix("iw9_mp_soccer");
    } else {
        self setsoundsubmix("iw9_mp_core_focus");
    }
    if (getsubgametype() == "dmz" && namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        self setsoundsubmix("iw9_mp_sealion_dmz");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e4
// Size: 0x12b
function function_8ffc5ac70256254b() {
    self endon("disconnect");
    var_6a1d06b01f51312e = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz";
    var_cdee7f83a96700f2 = getdvarint(@"hash_9c43b60485fbd92e", 0) == 0;
    if (!istrue(var_6a1d06b01f51312e)) {
        return;
    }
    if (getdvarint(@"hash_61e9133b2e499a6c")) {
        dmz_infil_classic = function_17ee301cf0b5ba85("dmz_infil_classic");
        self setplayermusicstate(dmz_infil_classic);
    } else {
        dmz_infil = function_17ee301cf0b5ba85("dmz_infil");
        self setplayermusicstate(dmz_infil);
    }
    if (istrue(var_cdee7f83a96700f2)) {
        self setsoundsubmix("solo_cin_igc_music", 0);
        while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            if (istrue(level.var_466a09c79541fc26) || isnumber(level.matchcountdowntime) && level.matchcountdowntime <= 3) {
                break;
            }
            waitframe();
        }
        waitframe();
        self clearsoundsubmix("solo_cin_igc_music", 2);
    }
    if (isdefined(level.prematchperiod)) {
        while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            waitframe();
        }
    }
    waittillframeend();
    self setplayermusicstate("");
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7216
// Size: 0x33
function waitcountdown() {
    level endon("host_migration_begin");
    self endon("disconnect");
    for (;;) {
        for (;;) {
            if (namespace_4b0406965e556711::gameflag("prematch_done")) {
                self notify("luinotifyserver", "matchReady");
                return;
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7250
// Size: 0x1d4
function playflyoveraudioline() {
    level endon("host_migration_begin");
    self endon("disconnect");
    var_c924752368853f99 = gettimepassed() / 1000 + 6;
    if (var_c924752368853f99 >= level.prematchperiod) {
        return;
    }
    if (!level.rankedmatch) {
        return;
    }
    if (!rankingenabled()) {
        return;
    }
    teamid = 0;
    if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
        if (self.sessionteam == "allies") {
            switch (teamid) {
            case 0:
                self playannouncersound("jtfw_mtc1_un_flyover");
                break;
            case 1:
                self playannouncersound("oi_mtc3_un_flyover");
                break;
            case 2:
                self playannouncersound("st7_mtc4_prematch_flyover");
                break;
            case 3:
                self playannouncersound("wr_mtc5_un_flyover");
                break;
            case 4:
                self playannouncersound("ba_mtc2_un_flyover");
                break;
            default:
                break;
            }
        } else if (self.sessionteam == "axis") {
            switch (teamid) {
            case 0:
                self playannouncersound("jtfw_mtc1_sdf_flyover");
                break;
            case 1:
                self playannouncersound("oi_mtc3_sdf_flyover");
                break;
            case 2:
                self playannouncersound("st7_mtc4_prematch_flyover");
                break;
            case 3:
                self playannouncersound("wr_mtc5_sdf_flyover");
                break;
            case 4:
                self playannouncersound("ba_mtc2_sdf_flyover");
                break;
            default:
                break;
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742b
// Size: 0x44e
function dointro() {
    level endon("game_ended");
    level endon("host_migration_begin");
    self endon("disconnect");
    while (level.ingraceperiod > 15) {
        waitframe();
    }
    if (!isdefined(level.infilvotiming) && teamhasinfil(self.team) && game["roundsPlayed"] == 0) {
        level.infilvotiming = 1;
    }
    if (isdefined(game["trial"]) && isdefined(game["trial"]["tries_remaining"]) && game["trial"]["tries_remaining"] < 3) {
        return;
    }
    if (level.script == "mp_m_speed") {
        waiting = 0;
    } else {
        waiting = !namespace_4b0406965e556711::gameflag("prematch_done") && (!isroundbased() || isfirstround());
    }
    if (waiting) {
        thread waitcountdown();
        thread prematch_music();
        self setsoundsubmix("iw9_mp_core_prematch");
        for (;;) {
            value = result = self waittill("luinotifyserver");
            if (result == "matchReady") {
                break;
            }
        }
    }
    self clearsoundsubmix("iw9_mp_core_prematch", 2);
    if (istrue(level.infilvotiming)) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        wait(1.5);
    }
    if (isdefined(game["dialog"]["gametype"]) && (!level.splitscreen || self == level.players[0])) {
        if (isdefined(game["dialog"]["allies_gametype"]) && self.team == "allies") {
            leaderdialogonplayer("allies_gametype");
        } else if (isdefined(game["dialog"]["axis_gametype"]) && self.team == "axis") {
            leaderdialogonplayer("axis_gametype");
        } else if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
            var_ffa7278c9feebdf2 = 1;
            if (getgametype() == "arena") {
                if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                    var_ffa7278c9feebdf2 = 1;
                } else if (shouldplayarenaintro() || isdefined(game["roundsPlayed"]) && game["roundsPlayed"] % 2 == 0) {
                    var_ffa7278c9feebdf2 = 0;
                    if (game["matchPoint"] != 1 && game["finalRound"] != 1) {
                        if (game["roundsPlayed"] % 6 == 0) {
                            game["dialog"]["offense_obj"] = "boost_genericround";
                            game["dialog"]["defense_obj"] = "boost_genericround";
                        }
                    }
                    if (self.team == game["attackers"]) {
                        if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                            leaderdialogonplayer("offense_obj", "introboost");
                        }
                    } else if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                        leaderdialogonplayer("defense_obj", "introboost");
                    }
                } else {
                    var_ffa7278c9feebdf2 = 0;
                }
            }
            if (var_ffa7278c9feebdf2) {
                leaderdialogonplayer("gametype", "gametype");
            }
        }
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    waitframe();
    if (istrue(level.var_aaee655630513b9d)) {
        wait(3.5);
    }
    if (getdvarint(@"hash_ae1f081d4f476460", 1)) {
        waitframe();
    }
    if (getgametype() == "arena") {
        if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
            if (self.team == game["attackers"]) {
                if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                    leaderdialogonplayer("offense_obj", "introboost");
                }
            } else if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                leaderdialogonplayer("defense_obj", "introboost");
            }
        }
    } else if (self.team == game["attackers"]) {
        if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
            leaderdialogonplayer("offense_obj", "introboost");
        }
    } else if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
        leaderdialogonplayer("defense_obj", "introboost");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7880
// Size: 0xd4
function function_3aa69e0e6827ce5(var_167b74d4ec89f276) {
    self endon("disconnect");
    if (!isplayer(self)) {
        return;
    }
    if (isdefined(var_167b74d4ec89f276)) {
        self.var_5b097bde4417d7ad = var_167b74d4ec89f276;
    } else {
        var_a72551ff1c8f8278 = [];
        var_a72551ff1c8f8278[var_a72551ff1c8f8278.size] = "mp_infil_mix_musicheavy";
        var_a72551ff1c8f8278[var_a72551ff1c8f8278.size] = "mp_infil_mix_normal";
        var_2ab153106ab328f7 = var_a72551ff1c8f8278.size;
        var_d019be313dba7991 = randomint(var_2ab153106ab328f7);
        self.var_5b097bde4417d7ad = var_a72551ff1c8f8278[var_d019be313dba7991];
    }
    if (isdefined(self.team) && self.team != "spectator") {
        thread function_cd6fa41e597b8df0("mp_infil");
        self.playedinfilmusic = 1;
        wait(15);
        if (isent(self) && isplayer(self)) {
            self clearclienttriggeraudiozone(3);
        } else {
            return;
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795b
// Size: 0x3b8
function prematch_music() {
    self endon("disconnect");
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    level waittill("prematch_music");
    if (!level.splitscreen && !isdefined(self.playedinfilmusic) || level.splitscreen && !isdefined(level.playedstartingmusic)) {
        if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
            if (isdefined(self.team) && self.team != "spectator" && getgametype() != "arm" && getgametype() != "conflict" && !isroundbased()) {
                mapname = getdvar(@"hash_687fb8f9b7a23245");
                if (mapname == "mp_gunsmith_gl") {
                    self setplayermusicstate("");
                } else if (getgametype() == "training_course") {
                    level waittill("prematch_over");
                    if (self.team == "allies") {
                        if (ismusicenabled()) {
                            thread function_cd6fa41e597b8df0("mp_prematch");
                        }
                        self.nosuspensemusic = 1;
                    } else {
                        if (ismusicenabled()) {
                            thread function_cd6fa41e597b8df0("mp_prematch");
                        }
                        self.nosuspensemusic = 1;
                    }
                } else if (getgametype() == "ballmode") {
                    if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                        if (self.team == "allies") {
                            if (ismusicenabled()) {
                                thread function_cd6fa41e597b8df0("mp_prematch");
                            }
                            self.nosuspensemusic = 1;
                        } else {
                            if (ismusicenabled()) {
                                thread function_cd6fa41e597b8df0("mp_prematch");
                            }
                            self.nosuspensemusic = 1;
                        }
                    }
                } else if (self.team == "allies") {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                } else {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                }
            }
            if (isroundbased() && isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                if (self.team == "allies") {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                } else {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                }
            }
            if ((getgametype() == "arm" || getgametype() == "conflict") && !isdefined(level.playedstartingmusic)) {
                if (self.team == "allies") {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                } else {
                    if (ismusicenabled()) {
                        thread function_cd6fa41e597b8df0("mp_prematch");
                    }
                    self.nosuspensemusic = 1;
                }
            }
            if (getgametype() == "arena" && isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                thread function_cd6fa41e597b8df0("mp_prematch_gunfight");
            }
            if (getgametype() == "xfire" && isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
                thread function_cd6fa41e597b8df0("mp_prematch_gunfight");
            }
        }
        if (level.splitscreen) {
            level.playedstartingmusic = 1;
        }
        thread suspensemusic_reset(20);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1a
// Size: 0x139
function shouldplayarenaintro() {
    if (iswinbytworulegametype()) {
        return 0;
    }
    if (game["finalRound"] == 1) {
        game["dialog"]["offense_obj"] = "boost_tied_matchpoint";
        game["dialog"]["defense_obj"] = "boost_tied_matchpoint";
        return 1;
    } else if (game["matchPoint"] == 1) {
        var_10ba24a48f1b3f6d = "";
        foreach (entry in level.teamnamelist) {
            roundswon = getroundswon(entry);
            if (roundswon == level.winlimit - 1) {
                var_10ba24a48f1b3f6d = entry;
                break;
            }
        }
        if (game["attackers"] == var_10ba24a48f1b3f6d) {
            game["dialog"]["offense_obj"] = "boost_winning_matchpoint";
            game["dialog"]["defense_obj"] = "boost_losing_matchpoint";
        } else {
            game["dialog"]["offense_obj"] = "boost_losing_matchpoint";
            game["dialog"]["defense_obj"] = "boost_winning_matchpoint";
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e5b
// Size: 0x49
function watchhostmigration() {
    self endon("disconnect");
    level endon("grace_period_ending");
    while (1) {
        level waittill("host_migration_begin");
        var_70fb9c790a2bb63d = level.ingraceperiod;
        level waittill("host_migration_end");
        if (var_70fb9c790a2bb63d) {
            thread dointro();
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eab
// Size: 0x9f
function onlastalive() {
    level endon("game_ended");
    player = level waittill("last_alive");
    if (!isalive(player)) {
        return;
    }
    if (getgametype() == "siege") {
        player leaderdialogonplayer("siege_lastalive_zones");
        level thread onlastalive();
        return;
    } else if (getgametype() == "sr" && !level.nofriendlytags) {
        player leaderdialogonplayer("lastalive_revive");
        level thread onlastalive();
        return;
    }
    if (!namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_last_man_standing", player)) {
        player leaderdialogonplayer("last_alive");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f51
// Size: 0x1a1
function onroundswitch() {
    switchtype = level waittill("round_switch");
    switch (switchtype) {
    case #"hash_f7af050de10a5685":
        foreach (player in level.players) {
            if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                continue;
            }
            player leaderdialogonplayer("halftime");
        }
        break;
    case #"hash_4a79ea9678ed059e":
        foreach (player in level.players) {
            if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                continue;
            }
            player leaderdialogonplayer("overtime");
        }
        break;
    default:
        if (istrue(level.switchedsides)) {
            foreach (player in level.players) {
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                player leaderdialogonplayer("side_switch");
            }
            break;
        }
        break;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80f9
// Size: 0x1d8
function plunder_endgame_music() {
    if (isdefined(level.endmusicplayed)) {
        return;
    }
    game["music"]["payback_lose"] = [];
    game["music"]["payback_lose"][game["music"]["payback_lose"].size] = "mp_lose_1";
    game["music"]["payback_lose"][game["music"]["payback_lose"].size] = "mp_draw_1";
    game["music"]["payback_lose"][game["music"]["payback_lose"].size] = "mp_lose_2";
    game["music"]["payback_lose"][game["music"]["payback_lose"].size] = "mp_draw_1";
    game["music"]["payback_win"] = [];
    game["music"]["payback_win"][game["music"]["payback_win"].size] = "mp_win_1";
    game["music"]["payback_win"][game["music"]["payback_win"].size] = "mp_win_2";
    var_c3e10a42a81ade25 = namespace_e8a49b70d0769b66::getteamscoreplacements();
    level.endmusicplayed = 1;
    foreach (player in level.players) {
        placement = var_c3e10a42a81ade25[player.team];
        if (placement <= 10) {
            payback_win = function_17ee301cf0b5ba85("payback_win");
            player setplayermusicstate(payback_win);
        } else {
            payback_lose = function_17ee301cf0b5ba85("payback_lose");
            player setplayermusicstate(payback_lose);
        }
        player setsoundsubmix("mp_matchend_music", 2);
        player enableplayerbreathsystem(0);
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82d8
// Size: 0x44
function dmz_activity_start(players) {
    dmz_activity_start = function_17ee301cf0b5ba85("dmz_activity_start");
    dmz_activity_start_classic = function_17ee301cf0b5ba85("dmz_activity_start_classic");
    function_fe75a89529dd0fd0(players, dmz_activity_start, undefined, undefined, dmz_activity_start_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8323
// Size: 0x44
function dmz_activity_tension(players) {
    dmz_activity_tension = function_17ee301cf0b5ba85("dmz_activity_tension");
    dmz_activity_tension_classic = function_17ee301cf0b5ba85("dmz_activity_tension_classic");
    function_fe75a89529dd0fd0(players, dmz_activity_tension, undefined, undefined, dmz_activity_tension_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x836e
// Size: 0x44
function function_39a3ba69d3b190a5(players) {
    dmz_activity_action = function_17ee301cf0b5ba85("dmz_activity_action");
    dmz_activity_action_classic = function_17ee301cf0b5ba85("dmz_activity_action_classic");
    function_fe75a89529dd0fd0(players, dmz_activity_action, undefined, undefined, dmz_activity_action_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83b9
// Size: 0x44
function dmz_activity_win(players) {
    dmz_activity_win = function_17ee301cf0b5ba85("dmz_activity_win");
    dmz_activity_win_classic = function_17ee301cf0b5ba85("dmz_activity_win_classic");
    function_fe75a89529dd0fd0(players, dmz_activity_win, undefined, undefined, dmz_activity_win_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8404
// Size: 0x44
function dmz_activity_lose(players) {
    dmz_activity_lose = function_17ee301cf0b5ba85("dmz_activity_lose");
    dmz_activity_lose_classic = function_17ee301cf0b5ba85("dmz_activity_lose_classic");
    function_fe75a89529dd0fd0(players, dmz_activity_lose, undefined, undefined, dmz_activity_lose_classic);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x844f
// Size: 0x356
function ongameended() {
    level thread roundwinnerdialog();
    level thread gamewinnerdialog();
    winner = level waittill("start_game_win_audio");
    if (!isdefined(winner) || isdefined(level.endmusicplayed)) {
        return;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "rumble_mgl") {
        return;
    }
    if (!ismusicenabled()) {
        return;
    }
    if (getgametype() == "xfire") {
        function_9d7b08b1c2165e1(winner);
    } else if (level.teambased) {
        if (level.splitscreen) {
            foreach (player in level.players) {
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                player namespace_4887422e77f3514e::function_a2b4e6088394bade();
                if (winner == player.team) {
                    player thread function_cd6fa41e597b8df0("mp_victory");
                } else {
                    player thread function_cd6fa41e597b8df0("mp_defeat");
                }
                player setsoundsubmix("mp_matchend_music", 2);
            }
        } else {
            foreach (player in level.players) {
                player namespace_4887422e77f3514e::function_a2b4e6088394bade();
                player setsoundsubmix("mp_matchend_music", 2);
                if (winner == player.team) {
                    player thread function_cd6fa41e597b8df0("mp_victory");
                } else {
                    player thread function_cd6fa41e597b8df0("mp_defeat");
                }
            }
        }
    } else {
        foreach (player in level.players) {
            player namespace_4887422e77f3514e::function_a2b4e6088394bade();
            player setsoundsubmix("mp_matchend_music", 2);
            player setplayermusicstate("");
            if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                continue;
            }
            if (isstring(winner) && (winner == "tie" || winner == "none")) {
                continue;
            }
            /#
                assertex(isstring(winner) || isdefined(winner.team) && isstring(winner.team), "Winner variable does not contain reference to team.");
            #/
            if (isstring(winner) && winner == player.team || !isstring(winner) && isdefined(winner.team) && winner.team == player.team) {
                player thread function_cd6fa41e597b8df0("mp_victory");
            } else {
                player thread function_cd6fa41e597b8df0("mp_defeat");
            }
        }
    }
    level.endmusicplayed = 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87ac
// Size: 0xb4
function function_9d7b08b1c2165e1(winner) {
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        player namespace_4887422e77f3514e::function_a2b4e6088394bade();
        player setsoundsubmix("mp_matchend_music", 2);
        if (winner == player.team) {
            player thread function_cd6fa41e597b8df0("mp_victory");
        } else {
            player thread function_cd6fa41e597b8df0("mp_defeat");
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8867
// Size: 0x9b
function midpoint_music(winning_team) {
    thread stopsuspensemusic();
    foreach (player in level.players) {
        if (winning_team == player.team) {
            player thread function_cd6fa41e597b8df0("mp_midpoint_winning");
        } else {
            player thread function_cd6fa41e597b8df0("mp_midpoint_losing");
        }
    }
    wait(25);
    thread suspensemusic();
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8909
// Size: 0xce
function dominating_music(var_8b9b442335d5c181) {
    if (isdefined(level.dominating_music) && level.dominating_music == 1) {
        return;
    }
    thread stopsuspensemusic();
    foreach (player in level.players) {
        if (var_8b9b442335d5c181 == player.team) {
            player thread function_cd6fa41e597b8df0("mp_dominating");
        } else {
            player thread function_cd6fa41e597b8df0("mp_dominated");
        }
    }
    level.dominating_music = 1;
    wait(25);
    level.dominating_music = 0;
    thread suspensemusic();
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89de
// Size: 0x11a
function bombplanted_music() {
    if (isdefined(level.bombtimer) && level.bombtimer > 44) {
        waittime = level.bombtimer - 45;
        wait(waittime);
        foreach (player in level.players) {
            player thread function_cd6fa41e597b8df0("mp_bombplant");
        }
    } else if (isdefined(level.bombtimer)) {
        waittime = level.bombtimer - 30;
        if (waittime < 0) {
            waittime = 0;
        }
        wait(waittime);
        foreach (player in level.players) {
            player thread function_cd6fa41e597b8df0("mp_bombplant30");
        }
    }
    level.bombplanted_music = 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8aff
// Size: 0x254
function roundwinnerdialog() {
    if (getgametype() == "ballmode") {
        return;
    }
    if (getgametype() == "wm") {
        return;
    }
    winner = level waittill("round_win");
    if (istrue(level.var_1242a000845a4331)) {
        return;
    }
    delay = level.roundenddelay / 4;
    if (delay > 0) {
        wait(delay);
    }
    var_ba1d87a61aadec55 = getgametype() == "xfire";
    alliesscore = game["teamScores"]["allies"];
    axisscore = game["teamScores"]["axis"];
    if (!isdefined(winner) || isplayer(winner)) {
        return;
    }
    if (istrue(game["practiceRound"])) {
        game["dialog"]["round_success"] = "gamestate_practice_over";
        game["dialog"]["round_failure"] = "gamestate_practice_over";
        game["dialog"]["round_draw"] = "gamestate_practice_over";
    }
    if (winner == "allies") {
        leaderdialog("round_success", "allies");
        leaderdialog("round_failure", "axis");
        leaderdialog("round_failure", "team_three");
    } else if (winner == "axis") {
        leaderdialog("round_success", "axis");
        leaderdialog("round_failure", "allies");
        leaderdialog("round_failure", "team_three");
    } else if (winner == "team_three") {
        leaderdialog("round_success", "team_three");
        leaderdialog("round_failure", "allies");
        leaderdialog("round_failure", "axis");
    } else if (!var_ba1d87a61aadec55 && axisscore > alliesscore) {
        leaderdialog("round_success", "axis");
        leaderdialog("round_failure", "allies");
    } else if (!var_ba1d87a61aadec55 && alliesscore > axisscore) {
        leaderdialog("round_success", "allies");
        leaderdialog("round_failure", "axis");
    } else {
        leaderdialog("round_draw", "allies");
        leaderdialog("round_draw", "axis");
        leaderdialog("round_draw", "team_three");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5a
// Size: 0x1e6
function gamewinnerdialog() {
    winner = level waittill("start_game_win_audio");
    delay = level.postroundtime / 2;
    if (delay > 0) {
        wait(delay);
    }
    if (!isdefined(winner)) {
        return;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    if (getdvar(@"hash_e65e9a96eb2ff62b") == "wm") {
        return;
    }
    if (isplayer(winner) && !level.teambased) {
        for (i = 0; i < level.placement["all"].size; i++) {
            player = level.placement["all"][i];
            if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                continue;
            }
            if (i < 3) {
                player leaderdialogonplayer("mission_success");
            } else {
                player leaderdialogonplayer("mission_failure");
            }
        }
    } else if (winner == "allies") {
        leaderdialog("mission_success", "allies");
        leaderdialog("mission_failure", "axis");
        leaderdialog("mission_failure", "team_three");
    } else if (winner == "axis") {
        leaderdialog("mission_success", "axis");
        leaderdialog("mission_failure", "allies");
        leaderdialog("mission_failure", "team_three");
    } else if (winner == "team_three") {
        leaderdialog("mission_success", "team_three");
        leaderdialog("mission_failure", "axis");
        leaderdialog("mission_failure", "allies");
    } else {
        leaderdialog("mission_draw", "axis");
        leaderdialog("mission_draw", "allies");
        leaderdialog("mission_draw", "team_three");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f47
// Size: 0x481
function musiccontroller() {
    level endon("game_ended");
    if (!isdefined(level.musicenabled)) {
        level.musicenabled = 1;
    }
    thread suspensemusic();
    if (getgametype() == "ballmode") {
        return;
    }
    reason = level waittill("match_ending_soon");
    /#
        assert(isdefined(reason));
    #/
    if (level.roundlimit == 1 || game["roundsPlayed"] == level.roundlimit - 1 || ismoddedroundgame()) {
        if (!level.splitscreen) {
            if (reason == "time") {
                if (level.teambased) {
                    if (game["teamScores"]["allies"] > game["teamScores"]["axis"]) {
                        if (ismusicenabled()) {
                            thread timelimitmusic("allies");
                        }
                        leaderdialog("winning_time", "allies");
                        leaderdialog("losing_time", "axis");
                    } else if (game["teamScores"]["axis"] > game["teamScores"]["allies"]) {
                        if (ismusicenabled()) {
                            thread timelimitmusic("axis");
                        }
                        leaderdialog("winning_time", "axis");
                        leaderdialog("losing_time", "allies");
                    } else if (ismusicenabled()) {
                        thread timelimitmusic("draw");
                    }
                } else if (ismusicenabled()) {
                    foreach (player in level.players) {
                        player thread function_cd6fa41e597b8df0("mp_timesup_winning");
                    }
                }
            } else if (reason == "score") {
                if (level.teambased && getgametype() != "arena") {
                    if (game["teamScores"]["allies"] > game["teamScores"]["axis"]) {
                        if (ismusicenabled()) {
                            foreach (player in level.players) {
                                if (player.team == "allies") {
                                    player thread function_cd6fa41e597b8df0("mp_round_winning");
                                } else {
                                    player thread function_cd6fa41e597b8df0("mp_round_losing");
                                }
                            }
                        }
                        leaderdialog("winning_score", "allies");
                        leaderdialog("losing_score", "axis");
                    } else if (game["teamScores"]["axis"] > game["teamScores"]["allies"]) {
                        if (ismusicenabled()) {
                            foreach (player in level.players) {
                                if (player.team == "allies") {
                                    player thread function_cd6fa41e597b8df0("mp_round_losing");
                                } else {
                                    player thread function_cd6fa41e597b8df0("mp_round_winning");
                                }
                            }
                        }
                        leaderdialog("winning_score", "axis");
                        leaderdialog("losing_score", "allies");
                    }
                } else {
                    var_6dd753add7d1c236 = namespace_e8a49b70d0769b66::gethighestscoringplayer();
                    var_15030f107e796007 = namespace_e8a49b70d0769b66::getlosingplayers();
                    excludelist[0] = var_6dd753add7d1c236;
                    if (ismusicenabled()) {
                        foreach (player in level.players) {
                            if (var_6dd753add7d1c236.pers["team"] == player.team) {
                                player thread function_cd6fa41e597b8df0("mp_round_winning");
                            } else {
                                player thread function_cd6fa41e597b8df0("mp_round_losing");
                            }
                        }
                    }
                    var_6dd753add7d1c236 leaderdialogonplayer("winning_score");
                    leaderdialogonplayers("losing_score", var_15030f107e796007);
                }
            }
        }
    } else if (getgametype() != "arena") {
        function_6f9b54cea87f1c9e();
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93cf
// Size: 0x173
function matchendingsoonleaderdialog(dialog, timeleftint) {
    if (getgametype() == "arena") {
        if (isdefined(timeleftint) && !isdefined(level.notifiedtimesup) && timeleftint <= 10) {
            level.notifiedtimesup = 1;
            dialog = "timesup_ten";
        } else if (istrue(game["isLaunchChunk"])) {
            if (game["launchChunkRuleSet"] == 1 || game["launchChunkRuleSet"] == 2) {
                return 0;
            }
        } else {
            return 0;
        }
    }
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            if (team != "spectator") {
                leaderdialog(dialog, team);
            }
        }
    } else {
        players = [];
        foreach (p in level.players) {
            if (p.team != "spectator") {
                players[players.size] = p;
            }
        }
        namespace_944ddf7b8df1b0e3::leaderdialogonplayers(dialog, players);
    }
    return 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x954a
// Size: 0xa6
function timelimitmusic(team) {
    self endon("game_ended");
    level notify("stop_suspense_music");
    if (getgametype() != "arena") {
        foreach (player in level.players) {
            if (team == player.team) {
                player thread function_cd6fa41e597b8df0("mp_timesup_winning");
            } else {
                player thread function_cd6fa41e597b8df0("mp_timesup_losing");
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f7
// Size: 0x65
function headquarters_newhq_music() {
    stopsuspensemusic();
    foreach (player in level.players) {
        player thread function_cd6fa41e597b8df0("mp_hq_new");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9663
// Size: 0x84
function headquarters_captured_music() {
    level endon("hq_music_done");
    stopsuspensemusic();
    foreach (player in level.players) {
        player thread function_cd6fa41e597b8df0("mp_captured");
        level.hq_captured_music = 1;
        wait(60);
        level.hq_captured_music = 0;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96ee
// Size: 0xae
function headquarters_deactivate_music(claimteam) {
    stopsuspensemusic();
    if (istrue(level.hq_captured_music)) {
        level notify("hq_music_done");
        level.hq_captured_music = 0;
        foreach (player in level.players) {
            if (claimteam == player.team) {
                player thread function_cd6fa41e597b8df0("mp_destroyed_pos");
            } else {
                player thread function_cd6fa41e597b8df0("mp_destroyed_neg");
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a3
// Size: 0x8f
function function_de3628204e049a6d(claimteam) {
    stopsuspensemusic();
    foreach (player in level.players) {
        if (claimteam == player.team) {
            player thread function_cd6fa41e597b8df0("mp_destroyed_pos");
        } else {
            player thread function_cd6fa41e597b8df0("mp_destroyed_neg");
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9839
// Size: 0x21
function infected_music() {
    infected = function_17ee301cf0b5ba85("infected");
    self setplayermusicstate(infected);
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9861
// Size: 0xf8
function suspensemusic(var_8c71e0347db7824d) {
    if (!ismusicenabled()) {
        return;
    }
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (mapname == "mp_gunsmith_gl") {
        return;
    }
    level endon("game_ended");
    level endon("match_ending_soon");
    level endon("stop_suspense_music");
    if (istrue(level.nosuspensemusic)) {
        return;
    }
    if (isdefined(var_8c71e0347db7824d) && var_8c71e0347db7824d) {
        wait(120);
    }
    for (;;) {
        wait(randomfloatrange(75, 120));
        if (isdefined(level.nosuspensemusic) && level.nosuspensemusic) {
            return;
        }
        if (!istrue(game["inLiveLobby"])) {
            foreach (player in level.players) {
                player thread function_cd6fa41e597b8df0("mp_suspense");
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9960
// Size: 0x18
function suspensemusic_reset(waittime) {
    wait(waittime);
    self.nosuspensemusic = undefined;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x997f
// Size: 0x2f
function stopsuspensemusic() {
    level notify("stop_suspense_music");
    if (isdefined(level.cursuspsensetrack) && level.cursuspsensetrack.size == 2) {
        function_6f9b54cea87f1c9e();
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99b5
// Size: 0x23
function enablemusic() {
    if (level.musicenabled == 0) {
        thread suspensemusic();
    }
    level.musicenabled++;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99df
// Size: 0x48
function disablemusic() {
    if (!isdefined(level.musicenabled)) {
        level.musicenabled = 0;
        return;
    }
    if (level.musicenabled > 0) {
        level.musicenabled--;
        if (level.musicenabled == 0) {
            stopsuspensemusic();
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a2e
// Size: 0x34b
function round_end_music(winner, endreasontext, var_656b99fc50e799ae) {
    if (isdefined(level.endmusicplayed)) {
        return;
    }
    if (getgametype() == "ballmode") {
        return;
    }
    if (getgametype() == "xfire") {
        thread stopsuspensemusic();
        function_4f651c1e1ec8dae6(winner);
    } else {
        thread stopsuspensemusic();
        if (level.halftimetype == "halftime" && level.roundlimit && game["roundsPlayed"] * 2 == level.roundlimit) {
            setmusicstate("mus_mp_halftime");
        } else if (level.playovertime) {
            setmusicstate("mus_mp_halftime");
        } else if (level.halftimetype == "halftime" && !level.roundlimit) {
            foreach (player in level.players) {
                if (getgametype() != "arena") {
                    if (winner == "tie") {
                        player thread function_cd6fa41e597b8df0("mp_round_draw_" + getarenaroundendmusictype());
                    } else if (winner == player.team) {
                        player thread function_cd6fa41e597b8df0("mp_round_win_" + getarenaroundendmusictype());
                    } else {
                        player thread function_cd6fa41e597b8df0("mp_round_loss_" + getarenaroundendmusictype());
                    }
                } else if (winner == "tie") {
                    player thread function_cd6fa41e597b8df0("mp_round_draw_" + getarenaroundendmusictype());
                } else if (winner == player.team) {
                    player thread function_cd6fa41e597b8df0("mp_round_win_" + getarenaroundendmusictype());
                } else {
                    player thread function_cd6fa41e597b8df0("mp_round_loss_" + getarenaroundendmusictype());
                }
            }
        } else if (level.halftimetype == "halftime" && getgametype() == "dd" && !hitroundlimit()) {
            foreach (player in level.players) {
                if (getgametype() != "arena") {
                    if (winner == "tie") {
                        player thread function_cd6fa41e597b8df0("mp_round_draw_" + getarenaroundendmusictype());
                    } else if (winner == player.team) {
                        player thread function_cd6fa41e597b8df0("mp_round_win_" + getarenaroundendmusictype());
                    } else {
                        player thread function_cd6fa41e597b8df0("mp_round_loss_" + getarenaroundendmusictype());
                    }
                } else if (winner == "tie") {
                    player thread function_cd6fa41e597b8df0("mp_round_draw_" + getarenaroundendmusictype());
                } else if (winner == player.team) {
                    player thread function_cd6fa41e597b8df0("mp_round_win_" + getarenaroundendmusictype());
                } else {
                    player thread function_cd6fa41e597b8df0("mp_round_loss_" + getarenaroundendmusictype());
                }
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d80
// Size: 0xc0
function function_4f651c1e1ec8dae6(winner) {
    thread stopsuspensemusic();
    foreach (player in level.players) {
        if (winner == "tie") {
            player thread function_cd6fa41e597b8df0("mp_round_draw_" + getarenaroundendmusictype());
        } else if (winner == player.team) {
            player thread function_cd6fa41e597b8df0("mp_round_win_" + getarenaroundendmusictype());
        } else {
            player thread function_cd6fa41e597b8df0("mp_round_loss_" + getarenaroundendmusictype());
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e47
// Size: 0xc9
function function_6c71c8bc6495a0df(generic) {
    thread stopsuspensemusic();
    if (isdefined(generic)) {
        foreach (player in level.players) {
            player thread function_cd6fa41e597b8df0("mp_overtime");
        }
    } else {
        foreach (player in level.players) {
            player thread function_cd6fa41e597b8df0("mp_overtime");
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f17
// Size: 0xe1
function getarenaroundendmusictype() {
    var_dc1f442c2a011890 = "early";
    var_2a558c1bc57f2d69 = 0;
    foreach (entry in level.teamnamelist) {
        roundswon = game["roundsWon"][entry];
        if (roundswon > var_2a558c1bc57f2d69) {
            var_2a558c1bc57f2d69 = roundswon;
        }
    }
    if (var_2a558c1bc57f2d69 > 0) {
        perc = var_2a558c1bc57f2d69 / level.winlimit;
        if (perc <= 0.34) {
            var_dc1f442c2a011890 = "early";
        } else if (perc >= 0.34 && perc <= 0.67) {
            var_dc1f442c2a011890 = "mid";
        } else {
            var_dc1f442c2a011890 = "late";
        }
    }
    return var_dc1f442c2a011890;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa000
// Size: 0xb3
function function_aecafe54c65c0e35(players) {
    players = function_53c4c53197386572(players, level.players);
    var_5e2fbd511e678760 = [];
    if (isarray(players)) {
        foreach (player in players) {
            var_de14d878883d4c57 = player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
            if (isplayer(player) && !isagent(player) && !isbot(player) && !var_de14d878883d4c57) {
                var_5e2fbd511e678760[var_5e2fbd511e678760.size] = player;
            }
        }
    }
    return var_5e2fbd511e678760;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0bb
// Size: 0x313
function function_a486df26072a530a(circleindex, var_35157f8df527ffad, var_2948ca54731de34f) {
    level endon("game_ended");
    var_2948ca54731de34f = function_53c4c53197386572(var_2948ca54731de34f, 0.05);
    /#
        assert(isnumber(circleindex));
    #/
    /#
        assert(isnumber(var_35157f8df527ffad));
    #/
    if (isstruct(level.br_circle)) {
        if (isnumber(level.br_circle.var_da6c0f6a12518740) && level.br_circle.var_da6c0f6a12518740 == circleindex) {
            return;
        } else {
            level.br_circle.var_da6c0f6a12518740 = circleindex;
        }
    }
    var_272b0ee396e8a69a = int(var_35157f8df527ffad - 1);
    var_1b32fded15194cc7 = var_272b0ee396e8a69a / 3;
    var_3494d23f34a9dac = int(floor(var_1b32fded15194cc7));
    var_61d4cf0c14f1b38f = int(var_3494d23f34a9dac * 3);
    var_695acfe00695da06 = int(max(0, var_272b0ee396e8a69a - var_61d4cf0c14f1b38f));
    var_1de6c353a6694763 = int(var_3494d23f34a9dac) - 1;
    var_138f041ff5d8fecb = int(var_3494d23f34a9dac * 2 + var_695acfe00695da06) - 1;
    var_d9ec05fdc8a389a7 = int(var_3494d23f34a9dac * 3);
    finalindex = int(max(1, var_35157f8df527ffad - 1));
    waittime = max(0.05, var_2948ca54731de34f);
    wait(waittime);
    var_d7a79f6b50712f98 = "";
    var_96dd8ab6925778d3 = "";
    if (circleindex <= var_1de6c353a6694763) {
        var_d7a79f6b50712f98 = function_17ee301cf0b5ba85("br_ring_low");
        var_96dd8ab6925778d3 = function_17ee301cf0b5ba85("br_ring_low_classic");
    } else if (circleindex <= var_138f041ff5d8fecb) {
        var_d7a79f6b50712f98 = function_17ee301cf0b5ba85("br_ring_med");
        var_96dd8ab6925778d3 = function_17ee301cf0b5ba85("br_ring_med_classic");
    } else if (circleindex <= var_d9ec05fdc8a389a7) {
        var_d7a79f6b50712f98 = function_17ee301cf0b5ba85("br_ring_high");
        var_96dd8ab6925778d3 = function_17ee301cf0b5ba85("br_ring_high_classic");
    } else if (circleindex == finalindex) {
        var_d7a79f6b50712f98 = function_17ee301cf0b5ba85("br_ring_final");
        var_96dd8ab6925778d3 = function_17ee301cf0b5ba85("br_ring_final_classic");
    }
    players = function_aecafe54c65c0e35();
    exfil_players = [];
    foreach (player in players) {
        if (isplayer(player) && istrue(player.var_43fa6aa15d11c927)) {
            exfil_players[exfil_players.size] = player;
        }
    }
    players = array_remove_array(players, exfil_players);
    function_fe75a89529dd0fd0(players, var_d7a79f6b50712f98, undefined, undefined, var_96dd8ab6925778d3);
    if (circleindex != finalindex) {
        wait(30);
        function_fe75a89529dd0fd0(players, "", undefined, "wartracks");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3d5
// Size: 0xb
function plunder_tenpercent_music() {
    level notify("stop_suspense_music");
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3e7
// Size: 0x84
function plunder_thirtypercent_music() {
    level endon("fiftypercent_music");
    if (isdefined(level.thirtypercent_music) && level.thirtypercent_music == 1) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    level notify("stop_suspense_music");
    var_17c8d9e220164807 = game["music"]["plunder_tenpercent"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    setmusicstate(game["music"]["plunder_tenpercent"][var_dcc499c9734611f8]);
    level.thirtypercent_music = 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa472
// Size: 0x8d
function plunder_fiftypercent_music(team) {
    level endon("seventyfivepercent_music");
    if (isdefined(level.fiftypercent_music) && level.fiftypercent_music == 1) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    var_17c8d9e220164807 = game["music"]["plunder_thirtypercent"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    setmusicstate(game["music"]["plunder_thirtypercent"][var_dcc499c9734611f8]);
    level.fiftypercent_music = 1;
    level notify("fiftypercent_music");
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa506
// Size: 0x8d
function plunder_seventyfivepercent_music(team) {
    level endon("ninetypercent_music");
    if (isdefined(level.seventyfivepercent_music) && level.seventyfivepercent_music == 1) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    var_17c8d9e220164807 = game["music"]["plunder_fiftypercent"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    setmusicstate(game["music"]["plunder_fiftypercent"][var_dcc499c9734611f8]);
    level.seventyfivepercent_music = 1;
    level notify("seventyfivepercent_music");
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa59a
// Size: 0x86
function plunder_ninetypercent_music(team) {
    if (isdefined(level.ninetypercent_music) && level.ninetypercent_music == 1) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    var_17c8d9e220164807 = game["music"]["plunder_seventyfivepercent"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    setmusicstate(game["music"]["plunder_seventyfivepercent"][var_dcc499c9734611f8]);
    level.ninetypercent_music = 1;
    level notify("ninetypercent_music");
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa627
// Size: 0x75
function plunder_overtime_music() {
    if (isdefined(level.overtime_music) && level.overtime_music == 1) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    var_17c8d9e220164807 = game["music"]["plunder_ninetypercent"].size;
    var_dcc499c9734611f8 = randomint(var_17c8d9e220164807);
    setmusicstate(game["music"]["plunder_ninetypercent"][var_dcc499c9734611f8]);
    level.overtime_music = 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6a3
// Size: 0x31
function function_283a36147406b42f() {
    if (istrue(level.overtime_music)) {
        return;
    }
    setmusicstate(game["music"]["plunder_bonustime_long"][0]);
    level.overtime_music = 1;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6db
// Size: 0x27
function function_c080ebbcdcc3176f() {
    if (!isdefined(self.var_43653d344aa392af)) {
        self.var_43653d344aa392af = 1;
        self setplayermusicstate("iw9_mp_dmz_biobunker_enter");
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa709
// Size: 0xe
function ismusicenabled() {
    return level.musicenabled > 0;
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa71f
// Size: 0x35f
function function_535120141f535b49() {
    self endon("disconnect");
    level endon("game_ended");
    stopsuspensemusic();
    if (!isdefined(self.var_8ec3c32833063aaa)) {
        self.var_8ec3c32833063aaa = 0;
    }
    if (!isdefined(self.var_33ed4a0a9ccd0f0a)) {
        self.var_33ed4a0a9ccd0f0a = 0;
    }
    if (!isdefined(self.var_e37dad9b93dae844)) {
        self.var_e37dad9b93dae844 = 0;
    }
    while (1) {
        var_65c6ed2a9e69239a = self.var_8ec3c32833063aaa - self.var_33ed4a0a9ccd0f0a;
        if (self.var_8ec3c32833063aaa >= 0) {
            self.var_33ed4a0a9ccd0f0a = self.var_8ec3c32833063aaa;
        }
        iprintln("current music diff is " + var_65c6ed2a9e69239a);
        if (var_65c6ed2a9e69239a > 0) {
            if (var_65c6ed2a9e69239a > 1 && var_65c6ed2a9e69239a < 6) {
                if (!isdefined(self.var_cf8537c71bfa2021)) {
                    thread function_32e2796e3dbf61ac();
                }
            } else if (var_65c6ed2a9e69239a >= 6 && var_65c6ed2a9e69239a <= 15) {
                if (!isdefined(self.var_c369f1c713faff19)) {
                    thread function_3f789f6e464550d8();
                }
            } else if (var_65c6ed2a9e69239a > 15) {
                if (!isdefined(self.var_992116460039917d)) {
                    thread function_ee789bca4d90f206();
                }
            }
        }
        if (var_65c6ed2a9e69239a < 0) {
            if (var_65c6ed2a9e69239a <= -5 && var_65c6ed2a9e69239a > -10) {
                if (isdefined(self.var_c369f1c713faff19) || isdefined(self.var_992116460039917d) || isdefined(self.var_cf8537c71bfa2021)) {
                    self setsoundsubmix("iw9_mp_musictest_fadeout", 4);
                    self notify("clear_music_low");
                    self notify("clear_music_med");
                    self notify("clear_music_high");
                    self.var_cf8537c71bfa2021 = undefined;
                    self.var_992116460039917d = undefined;
                    self.var_c369f1c713faff19 = undefined;
                    wait(self.var_e37dad9b93dae844 + 10);
                    if (self.var_8ec3c32833063aaa >= 0) {
                        self.var_33ed4a0a9ccd0f0a = self.var_8ec3c32833063aaa;
                    }
                    self stoplocalsound("mus_iw9_mpmusictest_ambient1_intro");
                    self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
                }
            } else if (var_65c6ed2a9e69239a < -10) {
                if (isdefined(self.var_c369f1c713faff19) || isdefined(self.var_992116460039917d)) {
                    self playlocalsound("mus_iw9_mpmusictest_hit1_intro");
                }
                if (isdefined(self.var_c369f1c713faff19) || isdefined(self.var_992116460039917d) || isdefined(self.var_cf8537c71bfa2021)) {
                    self setsoundsubmix("iw9_mp_musictest_fadeout", 2);
                    self notify("clear_music_low");
                    self notify("clear_music_med");
                    self notify("clear_music_high");
                    self.var_cf8537c71bfa2021 = undefined;
                    self.var_992116460039917d = undefined;
                    self.var_c369f1c713faff19 = undefined;
                    wait(self.var_e37dad9b93dae844 + 10);
                    if (self.var_8ec3c32833063aaa >= 0) {
                        self.var_33ed4a0a9ccd0f0a = self.var_8ec3c32833063aaa;
                    }
                    self stoplocalsound("mus_iw9_mpmusictest_ambient1_intro");
                    self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
                }
            }
        }
        if (self.var_8ec3c32833063aaa >= 0) {
            self.var_8ec3c32833063aaa = self.var_8ec3c32833063aaa - 0.5;
        }
        if (self.var_8ec3c32833063aaa < 0) {
            self.var_8ec3c32833063aaa = 0;
        }
        iprintln("current music value is " + self.var_8ec3c32833063aaa);
        wait(2);
        if (self.var_e37dad9b93dae844 > 0) {
            self.var_e37dad9b93dae844 = self.var_e37dad9b93dae844 - 2;
            if (self.var_e37dad9b93dae844 < 0) {
                self.var_e37dad9b93dae844 = 0;
            }
        }
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa85
// Size: 0x71
function function_32e2796e3dbf61ac() {
    self endon("disconnect");
    self endon("clear_music_low");
    level endon("game_ended");
    if (!isdefined(self.var_cf8537c71bfa2021)) {
        self.var_cf8537c71bfa2021 = 1;
        self playlocalsound("mus_iw9_mpmusictest_ambient1_intro");
        iprintln("adding low music");
        self.var_e37dad9b93dae844 = 25;
        wait(self.var_e37dad9b93dae844);
        iprintln("low music state cleared");
        self.var_cf8537c71bfa2021 = undefined;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaafd
// Size: 0x123
function function_3f789f6e464550d8() {
    self endon("disconnect");
    self endon("clear_music_med");
    level endon("game_ended");
    if (isdefined(self.var_992116460039917d)) {
        self.var_992116460039917d = 1;
        self.var_c369f1c713faff19 = 1;
        self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self setplayermusicstate("");
        self notify("clear_music_high");
        iprintln("adding med music");
        self.var_e37dad9b93dae844 = 21;
        wait(self.var_e37dad9b93dae844);
        iprintln("music states cleared");
        self.var_992116460039917d = undefined;
        self.var_c369f1c713faff19 = undefined;
    } else {
        self.var_c369f1c713faff19 = 1;
        self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self setplayermusicstate("iw9_mpmusictest_perc1");
        iprintln("adding med music");
        self.var_e37dad9b93dae844 = 21;
        wait(self.var_e37dad9b93dae844 - 2);
        self setsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self stopplayermusicstate("iw9_mpmusictest_perc1");
        wait(self.var_e37dad9b93dae844 + 2);
        iprintln("med music state cleared");
        self.var_c369f1c713faff19 = undefined;
    }
}

// Namespace namespace_f5af6f6fc1dbd6b7/namespace_3bde6869e44a2770
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac27
// Size: 0x126
function function_ee789bca4d90f206() {
    self endon("disconnect");
    self endon("clear_music_high");
    level endon("game_ended");
    if (isdefined(self.var_c369f1c713faff19)) {
        self.var_992116460039917d = 1;
        self.var_c369f1c713faff19 = 1;
        self setplayermusicstate("");
        self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self notify("clear_music_med");
        iprintln("adding high music");
        self.var_e37dad9b93dae844 = 31;
        wait(self.var_e37dad9b93dae844);
        iprintln("music states cleared");
        self.var_992116460039917d = undefined;
        self.var_c369f1c713faff19 = undefined;
    } else {
        self.var_992116460039917d = 1;
        self clearsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self setplayermusicstate("iw9_mpmusictest_bass1");
        iprintln("adding high music");
        self.var_e37dad9b93dae844 = 30.5;
        wait(self.var_e37dad9b93dae844 - 2);
        self setsoundsubmix("iw9_mp_musictest_fadeout", 2);
        self stopplayermusicstate("iw9_mpmusictest_bass1");
        wait(self.var_e37dad9b93dae844 + 2);
        iprintln("high music state cleared");
        self.var_992116460039917d = undefined;
    }
}

