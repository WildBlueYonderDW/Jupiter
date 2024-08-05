#using script_5d265b4fca61f070;
#using scripts\common\scene.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\asm\gesture.gsc;
#using scripts\common\values.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\loot.gsc;
#using script_389a9d54d8274d2a;
#using script_3ef1b643f06851a8;

#namespace namespace_f43c40f7bcbe17e7;

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6651
    // Size: 0x5
    function function_b85fe24f0a9139b2() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x665e
// Size: 0xc0
function function_72cf1844bf828de4() {
    level endon("flg_bomb_defused");
    if (isdefined(level.var_6ef05c49e46d8d70) && isarray(level.var_6ef05c49e46d8d70)) {
        foreach (var_d5ec907642ef55bc in level.var_6ef05c49e46d8d70) {
            if (utility::flag_exist(var_d5ec907642ef55bc) && utility::flag(var_d5ec907642ef55bc)) {
                return 0;
            }
        }
        return;
    }
    if (isdefined(level.var_6ef05c49e46d8d70) && utility::flag_exist(level.var_6ef05c49e46d8d70) && utility::flag(level.var_6ef05c49e46d8d70)) {
        return 0;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6726
// Size: 0x37
function function_34b628a5e3beadad() {
    level endon("flg_bomb_defused");
    while (true) {
        level waittill("stop_surge_nags");
        utility::flag_set("flag_surge_stop_nags");
        wait 1;
        utility::flag_clear("flag_surge_stop_nags");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6765
// Size: 0x54
function function_4256d29a648763ba() {
    level endon("flg_bomb_defused");
    f_wait = 0;
    var_cb2bef8d2651433f = 3;
    while (level.player dialogue::function_d871f93553913276() && f_wait < var_cb2bef8d2651433f) {
        wait 0.5;
        f_wait += 0.5;
    }
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x67c1
    // Size: 0x5
    function function_7d8f3cd61e8c2384() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67ce
// Size: 0x141
function function_11a71287b86d1e5c() {
    var_e92a2c7e71663510 = [[level.player, 2.4, "dx_sp_surg_pigc_ghos_bravo07towatchercctv"], [level.var_318c75041f10c73f, 2, "dx_sp_surg_pigc_lasw_copyvisualradiocheck"], [level.var_30ea3080946719e6, 0.4, "dx_sp_surg_pigc_pric_checksixinposition"], [level.var_1e081d778021da22, 0.6, "dx_sp_surg_pigc_soap_soaploudandclear"], [level.var_351f8aca05656919, 0.5, "dx_sp_surg_pigc_gazz_affirmeyesonthemarkb"], [level.var_318c75041f10c73f, 1.5, "dx_sp_surg_pigc_lasw_goodcheckletsgotowor"], [level.var_292c01a9cd0b2818, 0.4, "dx_sp_surg_pigc_ghos_roggetreadytomovesoa"], [level.var_318c75041f10c73f, 0.8, "dx_sp_surg_pigc_lasw_keepalowprofilewelos"]];
    level dialogue::say_sequence(var_e92a2c7e71663510, 1, 0, 0, 0, "team");
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6917
    // Size: 0x5
    function function_5efffec1d9fa71a8() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6924
// Size: 0x6a
function function_a8f8b681ba867e0c() {
    level thread function_d3bda24ae338ed2a();
    level thread function_6b62d6e86dbe829();
    level thread function_c70c4c0f13ee6fb8();
    level thread function_3421ffcf5ba766fb();
    level thread function_34b628a5e3beadad();
    level dialogue::function_c3a221031a1ff66c(0, 1, 0, "team");
    var_af36b904b56328b7 = getentarray("out_of_bounds", "targetname");
    utility::array_thread(var_af36b904b56328b7, &function_e9feeb282fcf3ef8);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6996
// Size: 0x266
function function_d3bda24ae338ed2a() {
    level endon("flg_park_whiskey_leave_1");
    if (utility::cointoss()) {
        var_db93d267ae7551c2 = [[level.var_318c75041f10c73f, 0.5, "dx_sp_surg_pstl_lasw_beadvisedshelooksski", &function_72cf1844bf828de4], [level.player, 0.2, "dx_sp_surg_pstl_soap_understood", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.5, "dx_sp_surg_pstl_ghos_solidnowpressuptogaz", &function_72cf1844bf828de4]];
    } else {
        var_db93d267ae7551c2 = [[level.var_30ea3080946719e6, 1, "dx_sp_surg_pstl_pric_rolleasykonnimaybewa", &function_72cf1844bf828de4], [level.player, 0.2, "dx_sp_surg_pstl_soap_ayeillstayunderthera", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.4, "dx_sp_surg_pstl_ghos_solidnowpressuptogaz", &function_72cf1844bf828de4]];
    }
    level.var_6ef05c49e46d8d70 = ["flg_park_blend_tut_start", "flg_park_hacker_exit_early"];
    level dialogue::say_sequence(var_db93d267ae7551c2, 1, 0, 0, 0, "team");
    level thread function_12e23c2499524bff();
    utility::flag_wait("flg_park_blended");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    var_5ec75e08d6e8473e = [[level.player, 0.6, "dx_sp_surg_pstl_soap_gotalight", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.6, "dx_sp_surg_pstl_ghos_smokingjohnny", &function_72cf1844bf828de4], [level.player, 0.3, "dx_sp_surg_pstl_soap_blendinginlt", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.4, "dx_sp_surg_pstl_ghos_yousayso", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_park_whiskey_leave_1";
    level dialogue::say_sequence(var_5ec75e08d6e8473e, 1, 0, 0, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c04
// Size: 0x109
function function_12e23c2499524bff() {
    level endon("flg_park_blended");
    level endon("flg_park_whiskey_leave_1");
    aliases = [];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_movetogaztogeteyeson"];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_soapcloseongaztilthe"];
    var_2fab0bb99cc2049b = utility::create_deck(aliases, 1, 1);
    var_5e531899936a10f9 = ["flg_park_player_close_to_gaz", "flg_park_blended", "flg_park_whiskey_leave_1", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(15, 30, 3), 15, 1);
    level thread function_ee9dec493e642a75();
    utility::flag_wait("flg_park_gaz_blend_start_nags");
    wait 1.6;
    if (!utility::flag("flg_park_whiskey_leave_1") || !utility::flag("flg_park_hacker_exit_early")) {
        level.var_292c01a9cd0b2818 dialogue::say_team("dx_sp_surg_pstl_ghos_nowjohnnylinkupwithg", 1, 2.5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d15
// Size: 0xd3
function function_ee9dec493e642a75() {
    level endon("flg_park_blended");
    level endon("flg_park_whiskey_leave_1");
    utility::flag_wait("flg_park_player_close_to_gaz");
    aliases = [];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_themarkswearingablac"];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_marksstandingbythewa"];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_sheswearingallblackh"];
    var_2fab0bb99cc2049b = utility::create_deck(aliases, 1, 1);
    var_5e531899936a10f9 = ["flg_park_blended", "flg_park_whiskey_leave_1", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(12, 24, 3), 8, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6df0
// Size: 0x1d3
function function_6b62d6e86dbe829() {
    level endon("flg_park_whiskey_path_2_arrived");
    level endon("flg_park_failed");
    utility::flag_wait("flg_park_whiskey_leave_1");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    if (utility::cointoss()) {
        var_8ba084b9e0b29ed4 = [[level.var_292c01a9cd0b2818, 0.8, "dx_sp_surg_pstl_ghos_targetsmovingsergean", &function_72cf1844bf828de4], [level.var_318c75041f10c73f, 0.4, "dx_sp_surg_pstl_lasw_ifshetakesacallortal", &function_72cf1844bf828de4], [level.player, 0.1, "dx_sp_surg_pstl_soap_copythatshetalksweli", &function_72cf1844bf828de4]];
    } else {
        var_8ba084b9e0b29ed4 = [[level.var_292c01a9cd0b2818, 0.8, "dx_sp_surg_pstl_ghos_targetsmovingsergean", &function_72cf1844bf828de4], [level.var_318c75041f10c73f, 0.5, "dx_sp_surg_pstl_lasw_staywithhersoap", &function_72cf1844bf828de4], [level.var_318c75041f10c73f, 0.2, "dx_sp_surg_pstl_lasw_justdontgettooclose", &function_72cf1844bf828de4], [level.player, 0.2, "dx_sp_surg_pstl_soap_onit", &function_72cf1844bf828de4]];
    }
    level.var_6ef05c49e46d8d70 = ["flg_park_whiskey_shoetie_start", "flg_park_hacker_react_vo_playing", "flg_park_failed"];
    level dialogue::say_sequence(var_8ba084b9e0b29ed4, 1, 0, 0, 0, "team");
    if (!utility::flag("flg_park_follow_hacker_obj_start")) {
        utility::flag_set("flg_park_follow_hacker_obj_start");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fcb
// Size: 0x15f
function function_c70c4c0f13ee6fb8() {
    level endon("flg_park_whiskey_path_2_arrived");
    level endon("flg_park_failed");
    utility::flag_wait("flg_park_whiskey_shoetie_start");
    level.var_292c01a9cd0b2818 dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_pstl_ghos_waitshestyinghershoe", 1, 2.5);
    wait 0.3;
    if (!utility::flag("flg_park_blended") && level.var_27842e9538a928a2 < 1 && !utility::flag("flg_park_hacker_react_vo_playing")) {
        if (utility::cointoss()) {
            level.var_292c01a9cd0b2818 dialogue::say_team("dx_sp_surg_pstl_ghos_makeyourselflookbusy", 0, 1);
        } else {
            level.var_318c75041f10c73f dialogue::say_team("dx_sp_surg_pstl_lasw_useyoursurroundingst", 0, 1);
        }
    } else if (utility::flag("flg_park_blended") && level.var_27842e9538a928a2 < 1 && !utility::flag("flg_park_hacker_react_vo_playing")) {
        level.player dialogue::function_fc0eb6b81c66c661(0.35, "dx_sp_surg_pstl_soap_yeahshescautious", 0, 2.5);
        level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.15, "dx_sp_surg_pstl_lasw_shesinoverherheadwit", 0, 2.5);
    }
    utility::flag_waitopen("flg_park_whiskey_shoetie_start");
    wait 0.5;
    if (!utility::flag("flg_park_hacker_react_vo_playing")) {
        level.var_292c01a9cd0b2818 dialogue::say_team("dx_sp_surg_pstl_ghos_marksmovingkeeponher", 1, 3);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7132
// Size: 0x247
function function_3421ffcf5ba766fb() {
    level endon("flg_park_failed");
    utility::flag_wait("flg_park_whiskey_path_2_arrived");
    level notify("stop_surge_nags");
    level.player dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_pstl_soap_herphonesringing", 1, 2.5);
    wait 0.6;
    if (!utility::flag("flg_park_hacker_react_vo_playing")) {
        level.var_318c75041f10c73f dialogue::say_team("dx_sp_surg_pstl_lasw_getcloseandlistenin", 1, 5);
    }
    utility::flag_set("flg_park_obj_listen_to_call_show");
    level thread function_7767079a237f9772();
    utility::flag_wait_all("flg_park_phonecall_done", "flg_park_whiskey_path_3_started");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    if (utility::flag("flg_park_flash_drive_known") && utility::flag("flg_park_meeting_location_known")) {
        while (utility::flag("flg_park_final_blend_in_progress")) {
            waitframe();
        }
        thread function_bde4345e7a4dfbe5();
        var_fc88a5ef0db3fbc5 = [[level.var_318c75041f10c73f, 1.2, "dx_sp_surg_pstl_lasw_whatstheword"], [level.player, 0.3, "dx_sp_surg_pstl_soap_shemadeadeaddropfora"], [level.var_30ea3080946719e6, 0.3, "dx_sp_surg_pstl_pric_weneedeyes"], [level.var_318c75041f10c73f, 0.6, "dx_sp_surg_pstl_lasw_ghosttakepointoncctv"], [level.player, 0.2, "dx_sp_surg_pstl_ghos_rog"]];
        level dialogue::say_sequence(var_fc88a5ef0db3fbc5, 1, 0, 0, 0, "team");
        return;
    }
    var_4b1bacf91219bf53 = [[level.var_318c75041f10c73f, 1.2, "dx_sp_surg_pstl_lasw_whatstheword"], [level.player, 0.5, "dx_sp_surg_pstl_soap_missedtheconversatio"], [level.var_318c75041f10c73f, 0.8, "dx_sp_surg_pstl_lasw_weneededalltheintelb"]];
    level dialogue::say_sequence(var_4b1bacf91219bf53, 1, 0, 0, 0, "team");
    utility::flag_set("flg_park_eavesdrop_fail");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7381
// Size: 0x1b9
function function_7767079a237f9772() {
    level endon("flg_park_failed");
    level thread function_dd2f338da6e5e948();
    while (!utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
        wait 4;
        if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
            level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_keptitsecureitspluga", 1, 5);
            break;
        }
        wait 4;
        if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
            level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_guaranteeditllwork", 1, 5);
        }
        break;
    }
    utility::flag_set("flg_park_phonecall_start");
    wait 3;
    if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
        level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_heyigotthepayment", 1, 5);
    } else {
        wait 2;
    }
    wait 2;
    if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
        level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_droppedtheflashdrive", 1, 5);
        utility::flag_set("flg_park_flash_drive_known");
    } else {
        /#
            iprintln("<dev string:x1c>");
        #/
        wait 2;
    }
    wait 3;
    if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
        level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_yeahbetweenbistro43a_01", 1, 5);
        utility::flag_set("flg_park_meeting_location_known");
    } else {
        /#
            iprintln("<dev string:x1c>");
        #/
        wait 2;
    }
    wait 2;
    if (utility::flag("flg_park_eavesdrop_player_close_to_hacker")) {
        level.ai_hacker dialogue::say("dx_sp_surg_pstl_hack_pleasuredoingbusines", 1, 5);
    } else {
        wait 2;
    }
    utility::flag_set("flg_park_phonecall_done");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7542
// Size: 0xb4
function function_dd2f338da6e5e948() {
    level endon("flg_park_failed");
    level endon("flg_park_phonecall_done");
    aliases = [];
    aliases[aliases.size] = [level.var_318c75041f10c73f, "dx_sp_surg_pstl_lasw_listentoherconversat"];
    aliases[aliases.size] = [level.var_318c75041f10c73f, "dx_sp_surg_pstl_lasw_closersergeantweneed"];
    aliases[aliases.size] = [level.var_292c01a9cd0b2818, "dx_sp_surg_pstl_ghos_johnnyweneedtoknowwh"];
    var_2fab0bb99cc2049b = utility::create_deck(aliases, 1, 1);
    while (true) {
        utility::flag_waitopen("flg_park_eavesdrop_player_close_to_hacker");
        level dialogue::nag_wait("flg_park_eavesdrop_player_close_to_hacker", var_2fab0bb99cc2049b, 6, 3, 1);
        wait 3;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75fe
// Size: 0xf4
function function_dc0da5dc4646c321() {
    if (!isdefined(level.var_1cbd781282e0541f)) {
        level.var_1cbd781282e0541f = spawnstruct();
        var_6afb807d5f353d8 = [];
        var_998843e8d5810e46 = [];
        var_6d5b71ac10ae1647 = [];
        var_6afb807d5f353d8[var_6afb807d5f353d8.size] = "dx_sp_surg_pstl_hack_helookingatme";
        var_6afb807d5f353d8[var_6afb807d5f353d8.size] = "dx_sp_surg_pstl_hack_whosthat";
        var_6afb807d5f353d8[var_6afb807d5f353d8.size] = "dx_sp_surg_pstl_hack_thefuckshelookingat";
        level.var_1cbd781282e0541f.var_65a29959291ddd0e = utility::create_deck(var_6afb807d5f353d8, 1, 1);
        var_998843e8d5810e46[var_998843e8d5810e46.size] = "dx_sp_surg_pstl_hack_moveitdude";
        var_998843e8d5810e46[var_998843e8d5810e46.size] = "dx_sp_surg_pstl_hack_oiwatchit";
        var_998843e8d5810e46[var_998843e8d5810e46.size] = "dx_sp_surg_pstl_hack_backoffmate";
        level.var_1cbd781282e0541f.var_8462aa5b86bfbd58 = utility::create_deck(var_998843e8d5810e46, 1, 1);
        var_6d5b71ac10ae1647[var_6d5b71ac10ae1647.size] = "dx_sp_surg_pstl_lasw_shesawyoustayhidden";
        var_6d5b71ac10ae1647[var_6d5b71ac10ae1647.size] = "dx_sp_surg_pstl_lasw_staywithherjustdontg";
        var_6d5b71ac10ae1647[var_6d5b71ac10ae1647.size] = "dx_sp_surg_pstl_lasw_niceandnaturalsergea";
        level.var_1cbd781282e0541f.var_2618c8a568e31c10 = utility::create_deck(var_6d5b71ac10ae1647);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76fa
// Size: 0xd7
function function_42d70b13f4e9e32a() {
    level endon("flg_park_phonecall_done");
    if (utility::flag("flg_park_hacker_react_vo_playing") || utility::flag("flg_park_phonecall_done")) {
        return;
    }
    utility::flag_set("flg_park_hacker_react_vo_playing");
    function_dc0da5dc4646c321();
    var_4e8d54ce1703dd7a = level.var_1cbd781282e0541f.var_8462aa5b86bfbd58 deck_draw();
    level.ai_hacker dialogue::say_delayed(0.3, var_4e8d54ce1703dd7a, 2, 2.5);
    wait 0.8;
    if (!utility::flag("flg_park_failed")) {
        var_f16f709264e3ca1b = level.var_1cbd781282e0541f.var_2618c8a568e31c10 deck_draw();
        level.var_318c75041f10c73f dialogue::say_team(var_f16f709264e3ca1b, 2, 5);
    }
    utility::flag_clear("flg_park_hacker_react_vo_playing");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77d9
// Size: 0x144
function function_ffd1fc2c265a4c38() {
    level endon("flg_park_phonecall_done");
    if (utility::flag("flg_park_hacker_react_vo_playing") || utility::flag("flg_park_phonecall_done")) {
        return;
    }
    utility::flag_set("flg_park_hacker_react_vo_playing");
    function_dc0da5dc4646c321();
    if (!utility::within_fov_of_players(level.ai_hacker.origin, cos(45))) {
        var_1cb2b97cf14b6ff3 = level.var_1cbd781282e0541f.var_65a29959291ddd0e deck_draw_specific("dx_sp_surg_pstl_hack_whosthat");
    } else {
        var_1cb2b97cf14b6ff3 = level.var_1cbd781282e0541f.var_65a29959291ddd0e deck_draw();
    }
    if (isdefined(var_1cb2b97cf14b6ff3)) {
        utility::flag_set("flg_suspicion_vo_cooldown");
        utility::delaythread(3, &flag_clear, "flg_suspicion_vo_cooldown");
        level.ai_hacker dialogue::say_delayed(0.3, var_1cb2b97cf14b6ff3, 2, 1);
    }
    wait 0.8;
    if (!utility::flag("flg_park_failed")) {
        var_f16f709264e3ca1b = level.var_1cbd781282e0541f.var_2618c8a568e31c10 deck_draw();
        level.var_318c75041f10c73f dialogue::say_team(var_f16f709264e3ca1b, 2, 5);
    }
    utility::flag_clear("flg_park_hacker_react_vo_playing");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7925
// Size: 0xd7
function function_e9feeb282fcf3ef8() {
    level endon("flg_park_whiskey_path_2_arrived");
    aliases = [];
    aliases[aliases.size] = "dx_sp_surg_pstl_ghos_wrongwayjohnnystayon";
    aliases[aliases.size] = "dx_sp_surg_pstl_ghos_thehellreyougoingsoa";
    aliases[aliases.size] = "dx_sp_surg_pstl_ghos_wrongdirectionjohnny";
    var_3ba00da147758d22 = utility::create_deck(aliases, 1, 1);
    while (!utility::flag("flg_park_whiskey_path_2_arrived")) {
        if (level.player istouching(self) && !flag("flg_park_oob_trigger_vo_playing")) {
            utility::flag_set("flg_park_oob_trigger_vo_playing");
            var_4e8d54ce1703dd7a = var_3ba00da147758d22 deck_draw();
            level.var_292c01a9cd0b2818 function_fc0eb6b81c66c661(0.2, var_4e8d54ce1703dd7a, 0, 2.5);
            wait randomfloatrange(8, 12);
            utility::flag_clear("flg_park_oob_trigger_vo_playing");
        }
        wait 1;
    }
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7a04
    // Size: 0x5
    function function_c83e2f5af6504843() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a11
// Size: 0x5c
function function_2ebf44c80181c535() {
    level.player.name = "Ghost";
    level thread function_7d992c931b3bb28b();
    level thread function_2b6ab3213b6ee8c2();
    level thread function_d5456b7827dca239();
    level thread function_d8658ffb33c211c1();
    level thread function_804d65fe69197985();
    level dialogue::function_c3a221031a1ff66c(0, 1, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a75
// Size: 0x13
function function_bde4345e7a4dfbe5() {
    wait 6.4;
    setmusicstate("mx_surge_cctv");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a90
// Size: 0x1d9
function function_7d992c931b3bb28b() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_scor_ghos_eyesonthealleyexit", 1);
    level.player dialogue::function_fc0eb6b81c66c661(1.5, "dx_sp_surg_scor_ghos_nosignofkonnimustvea", 1);
    level.var_318c75041f10c73f thread dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_scor_lasw_goodscrubthefootagef", 1);
    utility::flag_set("flg_cctv_rewind_1_allow");
    level thread function_60048cdc977d4931();
    utility::flag_wait("flg_rewind_target_first_seen");
    level notify("stop_surge_nags");
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_ghos_foundhim", 1);
    level.var_318c75041f10c73f thread dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_scor_lasw_stayonhimghostwhatev", 1);
    utility::flag_set("flg_cctv_allow_tracking_progress");
    level thread function_c1cd5610ed0b7f6c();
    utility::flag_wait("flg_rewind_target_entered_bistro");
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_ghos_buyerwentinteriorlos", 1);
    if (utility::flag("flg_cctv_1_active")) {
        level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_lasw_switchtoadifferentca", 1);
    }
    level thread function_eea73119adecbc4e();
    while (true) {
        utility::flag_wait("flg_cctv_target_visible");
        if (!utility::flag("flg_cctv_allow_reacquire_target_cctv_1")) {
            if (!utility::flag("flg_cctv_1_active")) {
                break;
            }
        } else {
            break;
        }
        waitframe();
    }
    dialogue::function_cb329cf8896edeaa(level.player.team);
    utility::flag_set("flg_cctv_reacquired_target_vo_playing");
    level.player dialogue::function_fc0eb6b81c66c661(0.15, "dx_sp_surg_scor_ghos_reacquirediseehim", 2);
    utility::flag_clear("flg_cctv_reacquired_target_vo_playing");
    utility::flag_set("flg_cctv_allow_react_vo");
    utility::flag_set("flg_cctv_allow_reacquire_target_cctv_1");
    level thread function_66c82397e9b8dea9();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c71
// Size: 0xfa
function function_60048cdc977d4931() {
    level endon("flg_rewind_target_first_seen");
    if (utility::flag("flg_rewind_target_first_seen")) {
        return;
    }
    wait 15;
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_ghos_notseeinganyone", 0, 1);
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_lasw_tryrewindingthefoota", 0, 1);
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_yourelookingforsomeo"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_keeprewindingtilwefi"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_rewindthefootageanyo"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6);
    level dialogue::function_91c23782840cf632(["flg_rewind_target_first_seen", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(16, 48, 4), 10);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d73
// Size: 0x1a5
function function_eea73119adecbc4e() {
    level endon("flg_cctv_reacquired_target_vo_playing");
    level endon("flg_rewind_target_seen_entering_tunnel");
    if (utility::flag("flg_cctv_reacquired_target_vo_playing") || utility::flag("flg_rewind_target_seen_entering_tunnel")) {
        return;
    }
    wait 6;
    if (utility::flag("flg_cctv_1_active")) {
        level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_lasw_useadifferentcamerag", 0, 1);
        wait 4;
    }
    wait 4;
    while (true) {
        utility::flag_waitopen("flg_cctv_1_active");
        wait 2;
        if (!utility::flag("flg_cctv_target_visible")) {
            utility::flag_set("flg_cctv_player_lost_target");
            break;
        }
        waitframe();
    }
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_ghos_ithinkilosthim", 0, 1);
    level.var_318c75041f10c73f thread dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_lasw_gobacktothealleywaya", 0, 1);
    wait 0.5;
    utility::flag_set("flg_cctv_allow_reacquire_target_cctv_1");
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_needtoretracehisfoot"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_retracebacktowhereyo"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_rewindtowhereyoulast"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    var_5e531899936a10f9 = ["flg_cctv_reacquired_target_vo_playing", "flg_rewind_target_seen_entering_tunnel"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(16, 48, 4), 10);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f20
// Size: 0xc8
function function_c1cd5610ed0b7f6c() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    if (!isdefined(level.var_4a0543394aaec1bd)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_fastforwardsowecanse"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_keepfastforwardinggh"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_fastforwardweneedtot"];
        level.var_4a0543394aaec1bd = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    }
    while (true) {
        utility::flag_wait("flg_cctv_target_fastforward_footage");
        level dialogue::function_bace8af56ef0688b("flg_cctv_target_fastforward_footage", level.var_4a0543394aaec1bd, dialogue::growing_delay(16, 32, 4), 12);
        wait 3;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ff0
// Size: 0xfc
function function_66c82397e9b8dea9() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    if (!isdefined(level.var_4bfcde372641d143)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_lookforanothercamera"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_tryadifferentcamera"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_findanotherangleandr"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_checkanothercameragh"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_318c75041f10c73f, "dx_sp_surg_scor_lasw_useadifferentcamerag"];
        level.var_4bfcde372641d143 = utility::create_deck(var_92f1a271f6b70ff6);
    }
    while (true) {
        utility::flag_wait("flg_cctv_target_switch_cameras");
        level dialogue::function_bace8af56ef0688b("flg_cctv_target_switch_cameras", level.var_4bfcde372641d143, dialogue::growing_delay(10, 25, 3), 5);
        wait 3;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80f4
// Size: 0xfe
function function_13118232dd2c9226() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    level endon("cctv_cancel_react_vo");
    if (!utility::flag("flg_cctv_allow_react_vo")) {
        return;
    }
    if (!isdefined(level.var_5501e7a0906eb74b)) {
        var_1f526ea2aa309e27 = [];
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_cantseehim";
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_notseeinghimnow";
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_ithinkilosthim";
        level.var_5501e7a0906eb74b = utility::create_deck(var_1f526ea2aa309e27);
    }
    wait 3;
    if (utility::flag("flg_cctv_ghost_react_force_disabled")) {
        utility::flag_waitopen_or_timeout("flg_cctv_ghost_react_force_disabled", 5);
        wait 1.5;
    }
    if (!utility::flag("flg_cctv_target_visible") && !utility::flag("flg_cctv_ghost_react_vo_playing")) {
        utility::flag_set("flg_cctv_ghost_react_vo_playing");
        var_4e8d54ce1703dd7a = level.var_5501e7a0906eb74b deck_draw();
        level.player dialogue::say_team(var_4e8d54ce1703dd7a, 0, 1);
        wait 3;
        utility::flag_clear("flg_cctv_ghost_react_vo_playing");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81fa
// Size: 0xf3
function function_c81ef10d3cc37fb2() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    level endon("cctv_cancel_react_vo");
    if (!utility::flag("flg_cctv_allow_react_vo")) {
        return;
    }
    if (!isdefined(level.var_2cf631a829f6c733)) {
        var_1f526ea2aa309e27 = [];
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_eyesbackon";
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_regainedvisual";
        var_1f526ea2aa309e27[var_1f526ea2aa309e27.size] = "dx_sp_surg_scor_ghos_thereheis";
        level.var_2cf631a829f6c733 = utility::create_deck(var_1f526ea2aa309e27, 1, 1);
    }
    if (utility::flag("flg_cctv_6_active")) {
        wait 0.2;
    } else {
        wait 1;
    }
    if (utility::flag("flg_cctv_target_visible") && !utility::flag("flg_cctv_ghost_react_vo_playing")) {
        utility::flag_set("flg_cctv_ghost_react_vo_playing");
        var_4e8d54ce1703dd7a = level.var_2cf631a829f6c733 deck_draw();
        level.player dialogue::say_team(var_4e8d54ce1703dd7a, 0, 1);
        wait 3;
        utility::flag_clear("flg_cctv_ghost_react_vo_playing");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82f5
// Size: 0xc4
function function_2b6ab3213b6ee8c2() {
    level endon("flg_rewind_target_seen_crossing_street");
    level endon("flg_rewind_target_seen_entering_tunnel");
    utility::flag_wait_all("bus_is_stationary", "flg_cctv_allow_react_vo");
    wait 0.3;
    if (utility::flag("flg_cctv_2_active")) {
        level thread function_8dae2d929d1c8655(5);
        level notify("cctv_cancel_react_vo");
        level.player dialogue::say_team("dx_sp_surg_scor_ghos_gotabusobscuringmyvi", 1);
        if (utility::flag("flg_cctv_target_switch_cameras")) {
            utility::flag_clear("flg_cctv_target_switch_cameras");
        }
        if (utility::flag("flg_cctv_1_active") || utility::flag("flg_cctv_2_active") || utility::flag("flg_cctv_3_active")) {
            level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_lasw_findanewanglethen", 1);
        }
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83c1
// Size: 0x10b
function function_d5456b7827dca239() {
    level endon("flg_rewind_target_seen_crossing_street");
    level endon("flg_rewind_target_seen_entering_tunnel");
    utility::flag_wait("flg_rewind_target_seen_on_cartensburg_street");
    level notify("stop_surge_nags");
    level thread function_8dae2d929d1c8655(5);
    level notify("cctv_cancel_react_vo");
    wait 0.4;
    if (utility::flag("flg_cctv_reacquired_target_vo_playing")) {
        utility::flag_set("flg_cctv_target_crossing_vo_playing");
        level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_lasw_affirmbuyerexitedbis", 1);
        utility::flag_clear("flg_cctv_target_crossing_vo_playing");
        return;
    }
    utility::flag_set("flg_cctv_target_crossing_vo_playing");
    function_4256d29a648763ba();
    var_524a445639fd299f = [[level.player, 0.1, "dx_sp_surg_scor_ghos_youseeinthislaswell"], [level.var_318c75041f10c73f, 0.15, "dx_sp_surg_scor_lasw_affirmbuyerexitedbis"]];
    level dialogue::say_sequence(var_524a445639fd299f, 1, 0, 0, 0, "team");
    utility::flag_clear("flg_cctv_target_crossing_vo_playing");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84d4
// Size: 0x90
function function_d8658ffb33c211c1() {
    level endon("flg_rewind_target_seen_entering_tunnel");
    utility::flag_wait_all("flg_rewind_target_seen_crossing_street", "flg_cctv_allow_react_vo");
    level thread function_8dae2d929d1c8655(5);
    level notify("cctv_cancel_react_vo");
    level.player function_fc0eb6b81c66c661(0.3, "dx_sp_surg_scor_ghos_targetscrossingthest", 1);
    if (utility::cointoss()) {
        level.var_318c75041f10c73f function_fc0eb6b81c66c661(0.4, "dx_sp_surg_scor_lasw_hescrossingtoaimsley", 1);
        return;
    }
    level.var_1e081d778021da22 dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_scor_soap_keeponhimltwerecount", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x856c
// Size: 0xff
function function_804d65fe69197985() {
    level endon("flg_hideout_entry_breach_start");
    utility::flag_wait("flg_rewind_target_seen_entering_tunnel");
    utility::flag_set("flg_cctv_end_vo_playing");
    level notify("stop_surge_nags");
    level notify("cctv_cancel_react_vo");
    wait 0.3;
    function_4256d29a648763ba();
    var_b3996da319700933 = [[level.player, 0.1, "dx_sp_surg_scor_ghos_allbravotargetsheadi"], [level.var_318c75041f10c73f, 0.1, "dx_sp_surg_scor_lasw_tunnelsadeadend"], [level.var_351f8aca05656919, 0.3, "dx_sp_surg_scor_gazz_goodplaceforkonnitoh"], [level.var_30ea3080946719e6, 0.2, "dx_sp_surg_scor_pric_andmakarov"]];
    level dialogue::say_sequence(var_b3996da319700933, 1, 0, 0, 0, "team");
    wait 0.8;
    utility::flag_clear("flg_cctv_end_vo_playing");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8673
// Size: 0x5f
function function_8dae2d929d1c8655(n_timeout) {
    level endon("flg_hideout_entry_breach_start");
    if (utility::flag("flg_cctv_ghost_react_force_disabled")) {
        utility::flag_waitopen_or_timeout("flg_cctv_ghost_react_force_disabled", n_timeout);
    }
    utility::flag_set("flg_cctv_ghost_react_force_disabled");
    utility::flag_set("flg_cctv_ghost_react_vo_playing");
    wait n_timeout;
    utility::flag_clear("flg_cctv_ghost_react_vo_playing");
    utility::flag_clear("flg_cctv_ghost_react_force_disabled");
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x86da
    // Size: 0x5
    function function_8559dad9732e85aa() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86e7
// Size: 0xfe
function function_6163de672e04d0e2() {
    level endon("flg_hideout_entry_breach_start");
    var_b418b4296e79ec17 = [[level.var_351f8aca05656919, 0.1, "dx_sp_surg_scor_gazz_wehavemetroandsforea"], [level.player, 0.2, "dx_sp_surg_scor_pric_copyallstationsgearu"], [level.var_30ea3080946719e6, 0.2, "dx_sp_surg_scor_pric_rogsixenroute"], [level.var_25932e13dae83dd3, 9.1, "dx_sp_surg_stun_sfo1_tunnelscleartheresal"], [level.var_25932e13dae83dd3, 0.4, "dx_sp_surg_stun_sfo1_atthedoorpreppingfor"]];
    level dialogue::say_sequence(var_b418b4296e79ec17, 1, 0, 0, 0, "team");
    level.player.name = "Price";
    level thread function_9f6a2e447d4f9a36();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87ed
// Size: 0x90
function function_9f6a2e447d4f9a36() {
    level endon("breach_start");
    level thread function_3685d8d90f8ca4d1();
    while (!isdefined(level.ai_hideout_sfo_interior_1) || !isdefined(level.ai_hideout_sfo_interior_1[0])) {
        waitframe();
    }
    level.ai_hideout_sfo_interior_1[0] thread dialogue::function_fc0eb6b81c66c661(1.4, "dx_sp_surg_stun_sfo1_breachisuponyoursign", 1);
    level thread function_1d948623bcbce24();
    utility::flag_wait("flg_hideout_entry_breach_start");
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_stun_pric_readyletsgetthisdone", 1);
    utility::flag_set("flg_hideout_breach_setup_vo_complete");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8885
// Size: 0x4b
function function_1d948623bcbce24() {
    level endon("flg_hideout_entry_breach_start");
    wait 10;
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_stun_soap_71holdingforbreach", 0, 2.5);
    wait 10;
    level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_stun_gazz_6issetonyoucaptain", 0, 2.5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88d8
// Size: 0x118
function function_3685d8d90f8ca4d1() {
    level endon("flg_hideout_breached");
    while (!isdefined(level.var_bee15146f952c6ed)) {
        waitframe();
    }
    var_d2b90162c17d78ed = [];
    var_d2b90162c17d78ed[var_d2b90162c17d78ed.size] = "dx_sp_surg_stun_plmn_movealong";
    var_d2b90162c17d78ed[var_d2b90162c17d78ed.size] = "dx_sp_surg_stun_plmn_nothingtoseehereonyo";
    var_d2b90162c17d78ed[var_d2b90162c17d78ed.size] = "dx_sp_surg_stun_plmn_keepitmovingnow";
    var_d2b90162c17d78ed[var_d2b90162c17d78ed.size] = "dx_sp_surg_stun_plmn_keepwalking";
    var_d2b90162c17d78ed[var_d2b90162c17d78ed.size] = "dx_sp_surg_stun_plmn_onyago";
    var_758e41bbf9534044 = utility::create_deck(var_d2b90162c17d78ed, 1, 1);
    while (!utility::flag("flg_hideout_breached")) {
        var_59719e8d22215336 = utility::getclosest(level.player.origin, level.var_bee15146f952c6ed);
        if (isdefined(var_59719e8d22215336)) {
            var_db7e7ff4175feab2 = distance(level.player.origin, var_59719e8d22215336.origin);
            if (var_db7e7ff4175feab2 <= 600) {
                var_4e8d54ce1703dd7a = var_758e41bbf9534044 deck_draw();
                var_59719e8d22215336 dialogue::say(var_4e8d54ce1703dd7a);
                wait randomfloatrange(8, 12);
            }
        }
        wait 1;
    }
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x89f8
    // Size: 0x5
    function function_458bd40c772ffd84() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a05
// Size: 0x31
function function_c5795c615a163823() {
    level thread function_c8a660649befbe28();
    level thread function_581e282f07f1c65c();
    level thread function_49f9c148989d36ca();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3e
// Size: 0xc8
function function_79d20beee276e4d5() {
    level.player endon("death");
    level endon("flg_hideout_final_room_clear");
    aliases = [];
    aliases[aliases.size] = "dx_sp_surg_hcqc_pric_smokeout";
    aliases[aliases.size] = "dx_sp_surg_hcqc_pric_throwingsmoke";
    aliases[aliases.size] = "dx_sp_surg_hcqc_pric_poppingsmoke";
    var_64bc5e9ac688d170 = utility::create_deck(aliases, 1, 1);
    while (!utility::flag("flg_hideout_finale_done")) {
        utility::flag_clear("flg_hideout_smoke_occluder_destroyed");
        utility::flag_wait("flg_hideout_smoke_grenade_thrown");
        var_4e8d54ce1703dd7a = var_64bc5e9ac688d170 utility::deck_draw();
        level.player dialogue::say(var_4e8d54ce1703dd7a, 0, 0.5);
        utility::flag_waitopen("flg_hideout_smoke_grenade_thrown");
        utility::flag_set("flg_hideout_smoke_occluder_destroyed");
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b0e
// Size: 0x8d
function function_56b4ff1dc2f4ee44() {
    foreach (weapon in level.player.offhandinventory) {
        if (weapon.basename == "smoke") {
            var_de8a9ead75a0581 = level.player getweaponammostock(weapon);
            if (var_de8a9ead75a0581 > 0) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ba4
// Size: 0x1fa
function function_c8a660649befbe28() {
    level.player endon("death");
    utility::flag_wait("breach_start");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    if (isdefined(level.ai_hideout_sfo_interior_1) && isdefined(level.ai_hideout_sfo_interior_1[0]) && isdefined(level.ai_hideout_sfo_interior_1[1])) {
        level.var_89739451f741631b = level.ai_hideout_sfo_interior_1[0];
        level.var_89739551f741654e = level.ai_hideout_sfo_interior_1[1];
    } else {
        level.var_89739451f741631b = level.var_25932e13dae83dd3;
        level.var_89739551f741654e = level.var_25932e13dae83dd3;
    }
    var_9bf0013dc0e90979 = [[level.var_89739451f741631b, 0, "dx_sp_surg_hint_sfo1_breachin321", &function_72cf1844bf828de4], [level.var_89739451f741631b, 0.3, "dx_sp_surg_hint_sfo1_execute", &function_72cf1844bf828de4], [level.var_89739551f741654e, 0.3, "dx_sp_surg_hint_sfo2_pushingin", &function_72cf1844bf828de4], [level.var_89739451f741631b, 0.2, "dx_sp_surg_hint_sfo1_sweepingleft", &function_72cf1844bf828de4], [level.var_89739551f741654e, 0.2, "dx_sp_surg_hint_sfo2_sweepingright", &function_72cf1844bf828de4], [level.var_89739451f741631b, 0.2, "dx_sp_surg_hint_sfo1_clear_01", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_hideout_breach_vo_complete";
    level dialogue::say_sequence(var_9bf0013dc0e90979, 1, 0, 0, 0, "team");
    utility::flag_set("flg_hideout_breach_vo_complete");
    level thread function_8963466d70b6e6de();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8da6
// Size: 0xb8
function function_8963466d70b6e6de() {
    level.player endon("death");
    level endon("flg_hideout_breached");
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hint_soap_movingonyoucaptain"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hint_gazz_goodbreachcapletsmov"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hint_gazz_onyoucap"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    level dialogue::function_91c23782840cf632(["flg_hideout_breached", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(12, 60, 4), 6);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e66
// Size: 0x162
function function_581e282f07f1c65c() {
    level.player endon("death");
    utility::flag_wait_all("flg_hideout_breached", "flg_hideout_breach_vo_complete");
    level notify("stop_surge_nags");
    wait 0.6;
    level.player thread function_2a5f16ea78f32af4("noncombat", 2);
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hint_pric_laswellwerein", 1);
    level.player thread function_600f9ba1d61f24f0();
    var_9f804d0f6cc677f4 = [[level.var_318c75041f10c73f, &function_d77e33f32ea993a9, "dx_sp_surg_hint_lasw_copyfindthatbuyerand", &function_72cf1844bf828de4], [level.player, &function_d77e33f32ea993a9, "dx_sp_surg_hint_pric_team1pushdownstairsw", &function_72cf1844bf828de4], [level.var_89739451f741631b, 0.1, "dx_sp_surg_hint_sfo1_copy", &function_72cf1844bf828de4], [level.var_25932e13dae83dd3, &function_d77e33f32ea993a9, "dx_sp_surg_hint_sfo2_team2willholdpositio", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_hideout_cqc_hallway_advance_3";
    level dialogue::say_sequence(var_9f804d0f6cc677f4, 1, 0, 0, 0, "team");
    level thread function_d399632309c26504();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fd0
// Size: 0x3b
function function_d77e33f32ea993a9() {
    level.player endon("death");
    if (utility::flag("flg_hideout_intro_pause_vo")) {
        utility::flag_wait("hideout_intro_vo_encounter_done");
    }
    wait randomfloatrange(0.2, 0.4);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9013
// Size: 0x109
function function_d399632309c26504() {
    level.player endon("death");
    level endon("flg_hideout_cqc_hallway_advance_3");
    if (utility::flag("flg_hideout_cqc_hallway_advance_3")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hint_soap_letsmovedownstairsan"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hint_gazz_letspushdownstairsca"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hint_soap_letsgetdownstairs"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hint_gazz_downstairscaponyou"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hint_gazz_shouldheaddownsir"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6);
    level dialogue::function_91c23782840cf632(["flg_hideout_intro_done", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 15);
    level thread function_68baa74925bfc558("flg_hideout_cqc_hallway_advance_3");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9124
// Size: 0x104
function function_b52f72e5d94144f9() {
    level endon("flg_hideout_cqc_hallway_advance_3");
    utility::flag_wait("flg_hideout_cqc_enemy_stagger");
    wait 0.4;
    if (isalive(self)) {
        dialogue::say_delayed(0.5, "dx_sp_surg_hcqc_kon1_shit", 0, 1);
    }
    wait 1;
    if (isalive(self)) {
        utility::flag_set("flg_hideout_intro_enemies_warned");
        dialogue::say("dx_sp_surg_hcqc_kon1_contactenemiesareher", 0, 1);
    }
    wait 1;
    if (isdefined(self) && isalive(self)) {
        utility::flag_set("flg_hideout_stagger_disappeared");
        if (!utility::flag("flg_hideout_cqc_hallway_advance_1_skip")) {
            level.var_d18d63c6d75cd1e dialogue::say_self("dx_sp_surg_hcqc_gazz_captainwegotmoreenem_01", 2, 0.1);
            level.player dialogue::function_8c1bbaeb5d3fe61a(0.2, "dx_sp_surg_hint_pric_moveup", 2, 0.1);
        }
        wait 1;
        if (utility::flag("flg_hideout_heroes_stairwell_hall_mid_3")) {
            dialogue::function_cb329cf8896edeaa("allies", 1, 1);
        }
        utility::flag_set("hideout_intro_vo_encounter_done");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9230
// Size: 0x93
function function_49f9c148989d36ca() {
    level.player endon("death");
    level endon("flg_hideout_stagger_disappeared");
    level endon("flg_hideout_cqc_hallway_advance_3");
    utility::flag_wait("flg_hideout_intro_stagger_enemy_visible");
    level notify("stop_surge_nags");
    level.player dialogue::function_8c1bbaeb5d3fe61a(0.2, "dx_sp_surg_hitl_pric_contact", 2, 0.1);
    utility::flag_wait("flg_hideout_intro_stagger_enemy_dead");
    level.player dialogue::function_8c1bbaeb5d3fe61a(1, "dx_sp_surg_chin_pric_clear", 2, 0.1);
    wait 1;
    utility::flag_set("hideout_intro_vo_encounter_done");
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x92cb
    // Size: 0x5
    function function_9ec8ef33e033f9c8() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92d8
// Size: 0x3a
function function_2c10063300667426() {
    level thread function_f3ea2c2fa1eac9a0();
    level thread function_521ba906759013a();
    level thread function_b1bea1f94f8fa6();
    level thread function_397c1ca360652f1d();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x931a
// Size: 0xa7
function function_2a23c0086536dfb2() {
    var_cd0f1921801b6d45 = sortbydistance(getaiarray("allies"), level.player.origin);
    foreach (ally in var_cd0f1921801b6d45) {
        if (ally != level.player && ally != level.var_9f0ca2b82636560f && ally != level.var_d18d63c6d75cd1e) {
            return ally;
        }
    }
    return level.var_25932e13dae83dd3;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93ca
// Size: 0x175
function function_f3ea2c2fa1eac9a0() {
    level.player endon("death");
    utility::flag_wait("flg_hideout_cqc_hallway_advance_3");
    utility::flag_wait_any("flg_hideout_cqc_mainhall_turret_visible", "flg_hideout_ab_turret_safety");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    var_1138130407ea4f77 = [[level.player, 0.6, "dx_sp_surg_hcqc_pric_contactsinthehallway", &function_72cf1844bf828de4], [level.player, 0.4, "dx_sp_surg_hcqc_pric_gazmovetoflank", &function_72cf1844bf828de4], [level.var_d18d63c6d75cd1e, 0.3, "dx_sp_surg_hcqc_gazz_rogmovingrightside", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 0.8, "dx_sp_surg_hcqc_soap_needtodisabletheturr", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = ["flg_hideout_bathroom_approach", "flg_hideout_servicehall_start"];
    level dialogue::say_sequence(var_1138130407ea4f77, 1, 0, 0, 0, "team");
    utility::flag_set("flg_hideout_clear_obj_start");
    level thread function_bbd337f65eadf9e();
    level thread function_caa7fd38c109546a();
    wait 1;
    level thread function_674adbcbf9e00855();
    level thread function_a6dbceb3425bba15(["flg_hideout_bathroom_start", "flg_hideout_servicehall_start"]);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9547
// Size: 0xca
function function_674adbcbf9e00855() {
    level.player endon("death");
    level endon("flg_hideout_bathroom_approach");
    level endon("flg_hideout_servicehall_start");
    level endon("flg_hideout_main_path_corridor01");
    level endon("flg_mainhall_turret_destroyed");
    var_5e531899936a10f9 = ["flg_hideout_bathroom_approach", "flg_hideout_servicehall_start", "flg_hideout_main_path_corridor01", "flg_mainhall_turret_destroyed"];
    foreach (flag_name in var_5e531899936a10f9) {
        if (utility::flag(flag_name)) {
            return;
        }
    }
    wait 18;
    level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_hcqc_gazz_wecanflankthroughthe", 0, 2.5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9619
// Size: 0x9c
function function_21e9945eedbb7027(var_53596e0c4a3b96aa) {
    level.player endon("death");
    level endon("flg_hideout_bathroom_enter");
    level endon("flg_hideout_servicehall_start");
    level endon("flg_hideout_shop_endpath");
    wait 1.5;
    if (!utility::flag("flg_hideout_intro_enemies_warned")) {
        if (isdefined(var_53596e0c4a3b96aa) && isdefined(var_53596e0c4a3b96aa[0]) && isalive(var_53596e0c4a3b96aa[0])) {
            var_53596e0c4a3b96aa[0] dialogue::say("dx_sp_surg_hcqc_kon1_contactenemiesareher");
        }
    }
    wait 1.5;
    if (isdefined(var_53596e0c4a3b96aa) && isdefined(var_53596e0c4a3b96aa[1]) && isalive(var_53596e0c4a3b96aa[1])) {
        var_53596e0c4a3b96aa[1] dialogue::say("dx_sp_surg_hcqc_kon2_theyrecomingdefensiv");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96bd
// Size: 0x87
function function_521ba906759013a() {
    level.player endon("death");
    level endon("flg_hideout_servicehall_start");
    level endon("flg_hideout_shop_endpath");
    utility::flag_wait("flg_hideout_bathroom_approach");
    level.player thread dialogue::say_team("dx_sp_surg_hcqc_pric_onmegazlavatoryside", 2);
    level.var_d18d63c6d75cd1e thread dialogue::function_fc0eb6b81c66c661(0.15, "dx_sp_surg_hcqc_gazz_rogerthat", 2);
    utility::flag_wait("flg_hideout_bathroom_start");
    level thread function_478aee5c4b9c65a();
    level thread function_87030258af22d221();
    level thread function_cbb20f2499d43199();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x974c
// Size: 0x120
function function_478aee5c4b9c65a() {
    level.player endon("death");
    while (!isdefined(level.var_2a2df0e9a2dbc5ae)) {
        waitframe();
    }
    var_155dc8d26a79f3a1 = [level.var_2a2df0e9a2dbc5ae, level.var_62ca7774886832a3, level.var_cc456419f1b1cb67];
    var_155dc8d26a79f3a1 = utility::array_removedead_or_dying(var_155dc8d26a79f3a1);
    if (var_155dc8d26a79f3a1.size == 0) {
        return;
    }
    utility::array_thread(var_155dc8d26a79f3a1, &function_aa8c9f3e29f975f0);
    var_3bb79e2e660e921d = utility::getclosest(level.player.origin, var_155dc8d26a79f3a1);
    var_3bb79e2e660e921d endon("death");
    var_3bb79e2e660e921d endon("entitydeleted");
    var_3bb79e2e660e921d dialogue::say("dx_sp_surg_hcqc_kon1_theyaregettingcloser", 0, 2.5);
    if (utility::flag("flg_hideout_bathroom_flash_grenade")) {
        wait 0.7;
        var_3bb79e2e660e921d dialogue::say("dx_sp_surg_hcqc_kon1_providingcoverforyou");
        return;
    }
    if (utility::flag("flg_hideout_bathroom_enemies_shooting")) {
        wait 1;
        var_3bb79e2e660e921d dialogue::say("dx_sp_surg_hcqc_kon1_openingheavyfire", 0, 2.5);
        return;
    }
    wait 0.2;
    var_3bb79e2e660e921d dialogue::say("dx_sp_surg_hcqc_kon1_weneedheavyweapons", 0, 2.5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9874
// Size: 0x24
function function_aa8c9f3e29f975f0() {
    level endon("flg_hideout_bathroom_enemies_shooting");
    self endon("death");
    self waittill("weapon_fired");
    utility::flag_set("flg_hideout_bathroom_enemies_shooting");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98a0
// Size: 0x93
function function_cbb20f2499d43199() {
    level.player endon("death");
    level endon("flg_hideout_servicehall_start");
    level endon("flag_hideout_bathroom_clear");
    level endon("flg_hideout_shop_endpath");
    while (!isdefined(level.var_cc456419f1b1cb67)) {
        waitframe();
    }
    level.var_cc456419f1b1cb67 endon("death");
    level.var_cc456419f1b1cb67 endon("entitydeleted");
    utility::flag_wait("flag_hideout_bathroom_kills");
    wait 1;
    if (isalive(level.var_cc456419f1b1cb67)) {
        level.var_cc456419f1b1cb67 dialogue::say("dx_sp_surg_hcqc_kon3_theyreinhere", 0, 2.5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x993b
// Size: 0x12e
function function_87030258af22d221() {
    level.player endon("death");
    level endon("flg_hideout_shop_endpath");
    utility::flag_wait("flag_hideout_bathroom_clear");
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_hcqc_pric_clearmovingup", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hcqc_soap_copythat", 1);
    level thread function_a6dbceb3425bba15("flg_hideout_bathrooms_exit");
    utility::flag_wait("flg_hideout_bathrooms_exit");
    level.player say_team("dx_sp_surg_hcqc_pric_pushinginrightsidewa", 1);
    utility::flag_wait("flg_mainhall_turret_dead");
    foreach (enemy in level.var_a1e59aafd4d3ebb5) {
        thread function_678ee05eb44c1fb9(enemy, "flg_hideout_shops_enemies_visible", "flg_hideout_shop_endpath");
    }
    utility::flag_wait_or_timeout("flg_hideout_shops_enemies_visible", 8);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(2.5, "dx_sp_surg_hcqc_soap_konnishootersinthesh");
    level thread function_68baa74925bfc558("flg_hideout_shop_enemies_noticed_player");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a71
// Size: 0xda
function function_b1bea1f94f8fa6() {
    level.player endon("death");
    level endon("flg_hideout_bathroom_start");
    level endon("flg_hideout_shop_endpath");
    utility::flag_wait("flg_hideout_servicehall_start");
    level.player dialogue::say_team("dx_sp_surg_hcqc_pric_gaztakerightigotleft", 1);
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_hcqc_gazz_rogmovingtothelavato", 1);
    level thread function_a6dbceb3425bba15("flg_hideout_servicehall_end");
    utility::flag_wait("flg_hideout_servicehall_end");
    level.player dialogue::say_team("dx_sp_surg_hcqc_pric_servicecorridorclear", 1);
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_hcqc_gazz_loosclearmovingup", 1);
    level thread function_68baa74925bfc558("flg_hideout_shop_1_enter");
    utility::flag_wait("flg_hideout_shop_1_enter");
    level.player dialogue::say_team("dx_sp_surg_hcqc_pric_pushinginwatchyourfi");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b53
// Size: 0x169
function function_caa7fd38c109546a() {
    level.player endon("death");
    level endon("flg_hideout_bathroom_start");
    level endon("flg_hideout_servicehall_start");
    level endon("flg_hideout_shop_endpath");
    while (!isdefined(level.var_203b48866cfc4a)) {
        waitframe();
    }
    if (utility::flag("flg_hideout_bathroom_start") || utility::flag("flg_hideout_servicehall_start") || utility::flag("flg_hideout_shop_endpath")) {
        return;
    }
    while (true) {
        amount, attacker, direction, point, means_of_death = level.var_203b48866cfc4a waittill("damage");
        if (attacker == level.player) {
            if (means_of_death == "MOD_PISTOL_BULLET" || means_of_death == "MOD_RIFLE_BULLET") {
                break;
            }
        }
        waitframe();
    }
    level.player dialogue::say_team("dx_sp_surg_hcqc_pric_concentratefireonthe", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hcqc_soap_rog", 1);
    utility::flag_wait_all("flg_hideout_shops_enemies_spawned", "flg_hideout_main_path_corridor01", "flg_mainhall_turret_dead");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(1.2, "dx_sp_surg_hcqc_soap_konnishootersinthesh", 1);
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(0.6, "dx_sp_surg_hcqc_gazz_loosclearmovingup", 1);
    level thread function_68baa74925bfc558("flg_hideout_shop_enemies_noticed_player");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc4
// Size: 0x17b
function function_a6dbceb3425bba15(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_mainhall_turret_destroyed");
    level endon("flg_mainhall_turret_hacked");
    if (utility::flag("flg_mainhall_turret_destroyed") || utility::flag("flg_mainhall_turret_hacked")) {
        return;
    }
    if (isarray(var_5bdd72e964d44dc2)) {
        foreach (flag in var_5bdd72e964d44dc2) {
            level endon(flag);
        }
        var_5e531899936a10f9 = utility::array_add(var_5bdd72e964d44dc2, "flg_mainhall_turret_destroyed");
        var_5e531899936a10f9 = utility::array_add(var_5bdd72e964d44dc2, "flg_mainhall_turret_hacked");
    } else {
        level endon(var_5bdd72e964d44dc2);
        var_5e531899936a10f9 = [var_5bdd72e964d44dc2, "flg_mainhall_turret_destroyed", "flg_mainhall_turret_hacked"];
    }
    if (!isdefined(level.var_49579e4b31862e6d)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_needtodisablethattur"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_cantmoveuntiltheturr"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_turretsblockingourad"];
        level.var_49579e4b31862e6d = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    }
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, level.var_49579e4b31862e6d, dialogue::growing_delay(30, 60, 3), 15, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e47
// Size: 0xae
function function_bbd337f65eadf9e() {
    level.player endon("death");
    level endon("flg_hideout_shop_endpath");
    msg = utility::flag_wait_any_return("flg_mainhall_turret_hacked", "flg_mainhall_turret_destroyed");
    if (msg == "flg_mainhall_turret_hacked") {
        level.player dialogue::function_fc0eb6b81c66c661(1.5, "dx_sp_surg_hcqc_pric_turretdisabled", 1, 5);
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hcqc_soap_nicejobcaptainweremo", 0, 5);
    } else {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_hcqc_soap_turretdownedmovingup", 1, 5);
    }
    utility::flag_set("flg_mainhall_turret_disabled");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9efd
// Size: 0xac
function function_397c1ca360652f1d() {
    level.player endon("death");
    level endon("flg_shop_and_escalator_enemies_dead");
    level endon("flg_hideout_finale_start");
    utility::flag_wait("flg_hideout_shop_endpath");
    while (!isdefined(level.var_e936e3c84ef59410)) {
        waitframe();
    }
    level thread function_3ab5fafc20b1c37d();
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_hcqc_gazz_morekonnidescendingt", 1, 5);
    wait 1.2;
    if (isdefined(level.var_e936e3c84ef59410[0]) && isalive(level.var_e936e3c84ef59410[0])) {
        level.var_e936e3c84ef59410[0] dialogue::say("dx_sp_surg_hcqc_kon1_fallback", 0, 2.5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fb1
// Size: 0xbc
function function_3ab5fafc20b1c37d() {
    level.player endon("death");
    utility::flag_wait_or_timeout("flg_hideout_shops_enemies_dead", 10);
    msg = utility::flag_wait_any_return("flg_escalator_enemies_some_dead", "flg_shop_and_escalator_enemies_dead", "flg_hideout_escalator_enemies_retreating", "flg_hideout_finale_start");
    if (msg == "flg_shop_and_escalator_enemies_dead") {
        var_89739451f741631b = function_2a23c0086536dfb2();
        var_89739451f741631b dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_hint_sfo1_enemydown", 1);
    }
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_hcqc_soap_gotmorekonniinthenex", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_hcqc_soap_letspushforwardkillt", 1);
    level thread function_b1247e1992d8a0fb("flg_hideout_finale_start");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa075
// Size: 0x103
function function_68baa74925bfc558(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_shop_and_escalator_enemies_dead");
    level endon("flg_hideout_finale_start");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_ba7ca7dd47be0414)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_letspushupandclearth"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_weneedtoclearthisflo"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_captainwegotmoreenem"];
        level.var_ba7ca7dd47be0414 = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    }
    var_5e531899936a10f9 = ["flg_hideout_finale_start", "flg_shop_and_escalator_enemies_dead", var_5bdd72e964d44dc2, "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, level.var_ba7ca7dd47be0414, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa180
// Size: 0x134
function function_b1247e1992d8a0fb(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_hideout_finale_start");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_gotthemontherunneedt"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_needtomoveupcap"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_whoandwhatwerelookin"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_theyrepushingembackl"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_konnistakingdefensiv"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_letskeeppushingwithh"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    var_5e531899936a10f9 = ["flg_hideout_finale_start", var_5bdd72e964d44dc2, "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(20, 45, 5), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2bc
// Size: 0x10
function function_2735b9cd7fe18bc8() {
    wait 4;
    setmusicstate("mx_surge_hideoutfight");
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa2d4
    // Size: 0x5
    function function_8b078e35dea40f95() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2e1
// Size: 0x3a
function function_4453ef063b49158() {
    level thread function_3ceb656a657bafc0();
    level thread function_40352b8c0ef81990();
    level thread function_2538c4f7d61069d6();
    level thread function_14da6651117a3a57();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa323
// Size: 0x94
function function_3ceb656a657bafc0() {
    level.player endon("death");
    level endon("flg_hideout_finale_rpg_early_death");
    level endon("flg_hideout_final_room_clear");
    utility::flag_wait("flg_hideout_finale_rpg_fired");
    level notify("stop_surge_nags");
    thread function_2735b9cd7fe18bc8();
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_hcqc_soap_rpg", 1);
    utility::flag_wait("flg_hideout_finale_rpg_exploded");
    level thread function_7cef749c913bd764();
    utility::flag_wait("hideout_finale_rpg_enemy_dead");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(1.6, "dx_sp_surg_hcqc_soap_rpgdown", 1, 5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3bf
// Size: 0x7f
function function_7cef749c913bd764() {
    level.player endon("death");
    level endon("flg_hideout_finale_rpg_early_death");
    level endon("hideout_finale_rpg_enemy_dead");
    if (utility::flag("flg_hideout_finale_rpg_early_death") || utility::flag("hideout_finale_rpg_enemy_dead")) {
        return;
    }
    wait 5;
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_hcqc_soap_rpgonthesecondfloorl");
    wait 8;
    level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_hcqc_gazz_rpgreloadingtakehimo");
    utility::flag_set("flg_hideout_finale_rpg_nags_complete");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa446
// Size: 0x1b0
function function_14da6651117a3a57() {
    level.player endon("death");
    level endon("flg_hideout_finale_turret_hacked");
    level endon("flg_hideout_finale_turret_destroyed");
    level endon("flg_hideout_final_room_clear");
    var_5e531899936a10f9 = ["flg_hideout_finale_turret_hacked", "flg_hideout_finale_turret_destroyed", "flg_hideout_final_room_clear"];
    foreach (flag_msg in var_5e531899936a10f9) {
        if (utility::flag_exist(flag_msg) && utility::flag(flag_msg)) {
            return;
        }
    }
    msg = utility::flag_wait_any_return("flg_hideout_finale_rpg_event", "flg_hideout_finale_force_turret_vo");
    if (msg == "flg_hideout_finale_rpg_event") {
        utility::flag_wait_any("flg_hideout_finale_rpg_early_death", "hideout_finale_rpg_enemy_dead", "flg_hideout_finale_rpg_nags_complete");
    }
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(3, "dx_sp_surg_hcqc_gazz_anotherenemyturretba", 1);
    level thread function_b94eece7dbc43470();
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_turretspinninguscapt"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_turretsholdingusback"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_needtodisablethattur"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6);
    var_5e531899936a10f9 = ["flg_hideout_finale_turret_destroyed", "flg_hideout_finale_turret_hacked", "flg_hideout_final_room_clear"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(30, 60, 2), 20, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa5fe
// Size: 0xfa
function function_2538c4f7d61069d6() {
    level.player endon("death");
    level endon("flg_hideout_final_room_clear");
    var_d8133d6c703e9742 = utility::flag_wait_any_return("flg_hideout_finale_player_on_left", "flg_hideout_finale_player_in_center", "flg_hideout_finale_player_on_right");
    switch (var_d8133d6c703e9742) {
    case #"hash_bc5e0e287ad34db9": 
        level.player dialogue::function_fc0eb6b81c66c661(0.1, "dx_sp_surg_hcqc_pric_takingleft", 0, 0.5);
        break;
    case #"hash_1cb768c87143c91a": 
        level.player dialogue::function_fc0eb6b81c66c661(0.1, "dx_sp_surg_hcqc_pric_takingright", 0, 0.5);
        break;
    case #"hash_5c1466dc2ef3097f": 
        level.player dialogue::function_fc0eb6b81c66c661(0.1, "dx_sp_surg_hcqc_pric_pushingdowncenter", 0, 0.5);
        break;
    }
    utility::flag_wait("flg_hideout_finale_spawn_stairway_guy");
    level.player dialogue::function_fc0eb6b81c66c661(0.1, "dx_sp_surg_hcqc_pric_movingupstairs", 0, 2);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa700
// Size: 0x164
function function_b94eece7dbc43470() {
    level.player endon("death");
    level endon("flg_hideout_finale_player_on_left");
    level endon("flg_hideout_finale_player_in_center");
    level endon("flg_hideout_finale_player_on_right");
    level endon("flg_hideout_finale_turret_hacked");
    level endon("flg_hideout_finale_turret_destroyed");
    level endon("flg_hideout_final_room_clear");
    if (utility::flag("flg_hideout_finale_turret_hacked") || utility::flag("flg_hideout_finale_turret_destroyed") || utility::flag("flg_hideout_final_room_clear")) {
        return;
    }
    if (utility::flag("flg_hideout_finale_player_on_left") || utility::flag("flg_hideout_finale_player_in_center") || utility::flag("flg_hideout_finale_player_on_right")) {
        return;
    }
    level thread function_5ee122c505d2f3d9();
    aliases = [];
    aliases[aliases.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_goodscreenpushup"];
    aliases[aliases.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_usethesmokeletsgo"];
    aliases[aliases.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_smokellhideusletsmov"];
    aliases[aliases.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_smokesoutgo"];
    var_3ba00da147758d22 = utility::create_deck(aliases, 1, 1);
    utility::flag_wait_all("flg_hideout_smoke_grenade_thrown", "flg_hideout_smoke_occluder_close_to_allies");
    level dialogue::function_91c23782840cf632(["flg_hideout_smoke_occluder_destroyed", "flg_hideout_final_room_clear"], var_3ba00da147758d22, 10, 1.5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa86c
// Size: 0xc7
function function_5ee122c505d2f3d9() {
    level.player endon("death");
    level endon("flg_hideout_smoke_grenade_thrown");
    level endon("flg_hideout_finale_player_on_left");
    level endon("flg_hideout_finale_player_in_center");
    level endon("flg_hideout_finale_player_on_right");
    level endon("flg_hideout_finale_turret_hacked");
    level endon("flg_hideout_finale_turret_destroyed");
    level endon("flg_hideout_final_room_clear");
    if (utility::flag("flg_hideout_finale_turret_hacked") || utility::flag("flg_hideout_finale_turret_destroyed") || utility::flag("flg_hideout_final_room_clear")) {
        return;
    }
    if (utility::flag("flg_hideout_finale_player_on_left") || utility::flag("flg_hideout_finale_player_in_center") || utility::flag("flg_hideout_finale_player_on_right")) {
        return;
    }
    wait 8;
    if (istrue(function_56b4ff1dc2f4ee44())) {
        level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_hcqc_gazz_capifyougotsmokepopi", 0, 5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa93b
// Size: 0x116
function function_40352b8c0ef81990() {
    level.player endon("death");
    level endon("flg_hideout_final_room_enemies_clear");
    level endon("flg_hideout_final_room_clear");
    msg = utility::flag_wait_any_return("flg_hideout_finale_turret_hacked", "flg_hideout_finale_turret_destroyed");
    if (msg == "flg_hideout_finale_turret_hacked" && !utility::flag("flg_hideout_final_room_clear")) {
        level.player dialogue::function_fc0eb6b81c66c661(1.5, "dx_sp_surg_hcqc_pric_turretdownfocusfireo", 1, 5);
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_hcqc_soap_rog", 0, 1);
    } else {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_hcqc_soap_turretsdown", 1, 5);
        if (!utility::flag("flg_hideout_final_room_clear")) {
            level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hcqc_pric_focusfireupstairs", 1, 5);
            level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_hcqc_soap_rog", 0, 1);
        }
    }
    wait 1;
    level thread function_4b802549c00b63ce();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa59
// Size: 0x12f
function function_4b802549c00b63ce() {
    level.player endon("death");
    level endon("flg_hideout_finale_spawn_stairway_guy");
    level endon("flg_hideout_final_room_enemies_clear");
    level endon("flg_hideout_final_room_clear");
    if (utility::flag("flg_hideout_finale_spawn_stairway_guy") || utility::flag("flg_hideout_final_room_enemies_clear") || utility::flag("flg_hideout_final_room_clear")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_konnisretreatedupsta"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hcqc_gazz_hostilesduginontheup"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_enemyholdingposition"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_letsgetupthereandgiv"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    var_5e531899936a10f9 = ["flg_hideout_final_room_enemies_clear", "flg_hideout_final_room_clear", "flg_hideout_finale_spawn_stairway_guy", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(20, 50, 3), 15, 1);
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xab90
    // Size: 0x5
    function function_105a342681603685() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab9d
// Size: 0x3a
function function_1aad1fb69976739d() {
    level thread function_64fe0e9040981f74();
    level thread function_132b129638f91b8c();
    level thread function_99906247fd78cc39();
    level thread function_e8bc7a9dc82ec93d();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabdf
// Size: 0x1fc
function function_64fe0e9040981f74() {
    level.player endon("death");
    level endon("flg_hideout_final_guy_aware");
    level endon("flag_hideout_office_enemies_visible");
    level endon("flg_hideout_office_enemies_dead");
    level endon("flg_hideout_intel_enter");
    utility::flag_wait("flg_hideout_final_room_clear");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    t_hideout_finale_upstairs = getent("t_hideout_finale_upstairs", "targetname");
    if (level.player istouching(t_hideout_finale_upstairs)) {
        utility::flag_set("flg_hideout_finale_player_upstairs");
    } else {
        level thread function_6c8e67f514edf137();
    }
    if (utility::flag("flg_hideout_finale_player_upstairs")) {
        var_89739451f741631b = function_2a23c0086536dfb2();
        var_89739451f741631b dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_hint_sfo2_areasclear");
        level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_gazz_needtosweepandcleart");
    } else {
        var_df60a24ae294c61e = [[level.var_d18d63c6d75cd1e, 1.5, "dx_sp_surg_hitl_gazz_weclear"], [level.player, 0.6, "dx_sp_surg_hitl_pric_allclear"], [level.var_d18d63c6d75cd1e, 0.4, "dx_sp_surg_hitl_gazz_mustvebeenguardingso", &function_72cf1844bf828de4], [level.player, 0.3, "dx_sp_surg_hitl_pric_weneedtofinditsfoloc", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 0.2, "dx_sp_surg_hitl_soap_copyonyoucaptain", &function_72cf1844bf828de4]];
        level.var_6ef05c49e46d8d70 = ["flg_hideout_finale_player_upstairs", "flag_hideout_office_enemies_visible", "flg_hideout_office_enemies_dead"];
        level dialogue::say_sequence(var_df60a24ae294c61e, 1, 0, 0, 0, "team");
    }
    wait 1;
    level thread function_ef2d567acc982005();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xade3
// Size: 0x76
function function_6c8e67f514edf137() {
    level.player endon("death");
    level endon("flg_hideout_final_guy_aware");
    level endon("flag_hideout_office_enemies_visible");
    level endon("flg_hideout_office_enemies_dead");
    level endon("flg_hideout_intel_enter");
    t_hideout_finale_upstairs = getent("t_hideout_finale_upstairs", "targetname");
    while (true) {
        if (level.player istouching(t_hideout_finale_upstairs)) {
            utility::flag_set("flg_hideout_finale_player_upstairs");
            break;
        }
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae61
// Size: 0xef
function function_ef2d567acc982005() {
    level.player endon("death");
    level endon("flg_hideout_final_guy_aware");
    level endon("flag_hideout_office_enemies_visible");
    level endon("flg_hideout_office_enemies_dead");
    if (utility::flag("flg_hideout_final_guy_aware") || utility::flag("flag_hideout_office_enemies_visible") || utility::flag("flg_hideout_office_enemies_dead")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hitl_soap_captainsecondfloorof"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hitl_gazz_leadusinsix"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hitl_gazz_needtosweepandcleart"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6);
    level dialogue::function_91c23782840cf632(["flg_hideout_final_guy_aware", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaf58
// Size: 0xb1
function function_132b129638f91b8c() {
    level.player endon("death");
    level endon("flg_hideout_office_enemies_dead");
    utility::flag_wait_all("flg_spawn_final_hideout_guy", "flg_hideout_intel_enemies_spawned");
    if (isdefined(level.var_18907a70deb3ae0f) && isdefined(level.var_18907a70deb3ae0f[0]) && isalive(level.var_18907a70deb3ae0f[0])) {
        level.var_18907a70deb3ae0f[0] dialogue::say("dx_sp_surg_hcqc_kon1_theyaregettingcloser", 0, 1);
    }
    wait 0.5;
    if (isdefined(level.var_60635958d622535c) && isalive(level.var_60635958d622535c)) {
        level.var_60635958d622535c dialogue::say("dx_sp_surg_hcqc_kon1_donotletthemadvance");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb011
// Size: 0x4d
function function_99906247fd78cc39() {
    level.player endon("death");
    level endon("flg_hideout_office_enemies_dead");
    utility::flag_wait_all("flg_spawn_final_hideout_guy", "flag_hideout_office_enemies_visible");
    level notify("stop_surge_nags");
    level.player dialogue::function_fc0eb6b81c66c661(0.5, "dx_sp_surg_hitl_pric_contact", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb066
// Size: 0x142
function function_e8bc7a9dc82ec93d() {
    level.player endon("death");
    level endon("hideout_interact_evidence_complete");
    utility::flag_wait("flg_hideout_office_enemies_dead");
    wait 1.2;
    if (utility::flag("flg_hideout_finale_player_saw_buyer_die")) {
        level.player dialogue::say_team("dx_sp_surg_hitl_pric_clear", 1);
        wait 1;
        level.player thread function_2a5f16ea78f32af4("noncombat", 2.5);
        level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_pric_watcherkonnibuyerisd", 1);
        level.player thread function_600f9ba1d61f24f0();
        level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_lasw_findthatflashdrive", 1);
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_soap_theresgottabeintelon", 1);
        level thread function_7acf324799a7a97e("hideout_interact_evidence_start");
        return;
    }
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_chin_soap_clear", 1);
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_pric_rogspreadoutfindthat", 1);
    utility::flag_set("flg_hideout_office_intro_vo_complete");
    level thread function_7acf324799a7a97e("flg_hideout_finale_player_sees_buyer_corpse");
    wait 1;
    level thread function_c06a37cdc81eff44();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1b0
// Size: 0x96
function function_c06a37cdc81eff44() {
    level.player endon("death");
    level endon("hideout_interact_evidence_complete");
    utility::flag_wait("flg_hideout_finale_player_sees_buyer_corpse");
    level.player thread function_2a5f16ea78f32af4("noncombat", 2.5);
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_hitl_pric_watcherkonnibuyerisd", 1);
    level.player thread function_600f9ba1d61f24f0();
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.5, "dx_sp_surg_hitl_lasw_findthatflashdrive", 1);
    level thread function_7acf324799a7a97e("hideout_interact_evidence_start");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb24e
// Size: 0xde
function function_7acf324799a7a97e(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("hideout_interact_evidence_start");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_83a9d83d684e41b7)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hitl_gazz_needtofindthatflashd"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hitl_soap_needtofindthatflashd"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_d18d63c6d75cd1e, "dx_sp_surg_hitl_gazz_flashdrivesgottabear"];
        level.var_83a9d83d684e41b7 = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    }
    level dialogue::function_91c23782840cf632([var_5bdd72e964d44dc2, "hideout_interact_evidence_start"], level.var_83a9d83d684e41b7, dialogue::growing_delay(15, 30, 3), 10);
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb334
    // Size: 0x5
    function function_3ebaf8e7b69ad268() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb341
// Size: 0x28
function function_91b576b5eeb70436() {
    level thread function_ea2020041a382c26();
    level thread function_1f94726f5f75d4ec();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb371
// Size: 0x98
function function_d1061513a0f95e85() {
    var_cd0f1921801b6d45 = sortbydistance(getaiarray("allies"), level.player.origin);
    foreach (ally in var_cd0f1921801b6d45) {
        if (ally != level.player && ally != level.var_9f0ca2b82636560f) {
            return ally;
        }
    }
    return level.var_25932e13dae83dd3;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb412
// Size: 0x65
function function_ea2020041a382c26() {
    level.player endon("death");
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    level.var_89739751f74169b4 dialogue::say_team("dx_sp_surg_chin_sfo4_sfoteaminposition", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_chin_soap_onyousir", 1);
    level thread function_12b61c4d56e108e5();
    level thread function_94483c4a3675a8f1();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb47f
// Size: 0xc7
function function_12b61c4d56e108e5() {
    level.player endon("death");
    level endon("flg_chunnel_intro_train_1_driveby_vo");
    if (utility::flag("flg_chunnel_intro_train_1_driveby_vo")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_letsmoveincaptain"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_readytomovesir"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_needtogetgoing"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    level dialogue::function_91c23782840cf632(["flg_chunnel_intro_train_1_driveby_vo", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb54e
// Size: 0x1d0
function function_94483c4a3675a8f1(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_chunnel_intro_train_1_driveby");
    if (utility::flag("flg_chunnel_intro_train_1_driveby")) {
        return;
    }
    var_3fb84a9d7a0ae41f = [];
    var_854bab21bedcce82 = [];
    var_3fb84a9d7a0ae41f[var_3fb84a9d7a0ae41f.size] = "dx_sp_surg_chin_ghos_weregoodherepricerig";
    var_3fb84a9d7a0ae41f[var_3fb84a9d7a0ae41f.size] = "dx_sp_surg_chin_ghos_youretakingtherightt";
    var_3fb84a9d7a0ae41f[var_3fb84a9d7a0ae41f.size] = "dx_sp_surg_chin_ghos_gotlefttunnelcovered";
    var_3fb84a9d7a0ae41f[var_3fb84a9d7a0ae41f.size] = "dx_sp_surg_chin_ghos_soapswaitinonyoupric";
    var_854bab21bedcce82[var_854bab21bedcce82.size] = "dx_sp_surg_chin_gazz_weresetherecap";
    var_854bab21bedcce82[var_854bab21bedcce82.size] = "dx_sp_surg_chin_gazz_goodheresirsoapshold";
    var_854bab21bedcce82[var_854bab21bedcce82.size] = "dx_sp_surg_chin_gazz_wegotleftsidesiryour";
    var_854bab21bedcce82[var_854bab21bedcce82.size] = "dx_sp_surg_chin_gazz_regroupwithsoapandle";
    var_854bab21bedcce82[var_854bab21bedcce82.size] = "dx_sp_surg_chin_gazz_youreontherightsidet";
    var_14456d29d9ebf448 = utility::create_deck(var_3fb84a9d7a0ae41f, 1, 1);
    var_3783a1c3e2dcc51f = utility::create_deck(var_854bab21bedcce82, 1, 1);
    while (true) {
        var_939de0bf747d324b = distance(level.player.origin, level.ai_ghost.origin);
        var_c2de5d21b890b1be = distance(level.player.origin, level.var_d18d63c6d75cd1e.origin);
        if (var_939de0bf747d324b <= 60 || var_c2de5d21b890b1be <= 60) {
            if (utility::cointoss()) {
                var_c922bb28af697112 = var_14456d29d9ebf448 utility::deck_draw();
                level.ai_ghost dialogue::say_team(var_c922bb28af697112, 0, 2);
            } else {
                var_e4ce68054bed512d = var_3783a1c3e2dcc51f utility::deck_draw();
                level.var_d18d63c6d75cd1e dialogue::say_team(var_e4ce68054bed512d, 0, 2);
            }
            wait randomfloatrange(8, 12);
        }
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb726
// Size: 0x12e
function function_1f94726f5f75d4ec() {
    level.player endon("death");
    utility::flag_wait("flg_chunnel_intro_train_1_driveby");
    level notify("stop_surge_nags");
    utility::flag_wait("train_01_near_player");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_chin_soap_steaminjesus", 1);
    utility::flag_wait("flg_chunnel_intro_track_train_single_passed");
    thread function_3a06dcf411a387e8();
    level.player thread function_2a5f16ea78f32af4("noncombat", 3.5);
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_pric_watcherifmakarovscon", 1);
    level.player thread function_600f9ba1d61f24f0();
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_lasw_attemptingtobreachth", 1);
    if (utility::flag("flg_chunnel_intro_track_vo_start")) {
        return;
    }
    level endon("flg_chunnel_intro_track_vo_start");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_soap_goodathelpingamadbas", 1);
    level thread function_62a5526bb2c01ed0();
    level thread function_29c5ee5a109ac636("flg_chunnel_intro_track_start");
    level.var_351f8aca05656919 dialogue::function_fc0eb6b81c66c661(1.2, "dx_sp_surg_chin_gazz_onthemovecapgoodhunt", 0, 2);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb85c
// Size: 0x10
function function_3a06dcf411a387e8() {
    wait 2;
    setmusicstate("mx_surge_chunnel");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb874
// Size: 0x139
function function_62a5526bb2c01ed0() {
    level endon("flg_chunnel_intro_track_start");
    if (utility::flag("flg_chunnel_intro_track_start")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = "dx_sp_surg_chin_soap_thiswaycaptain";
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = "dx_sp_surg_chin_soap_crossoversthisway";
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = "dx_sp_surg_chin_soap_needtofollowthetrack";
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    var_af36b904b56328b7 = getentarray("out_of_bounds", "targetname");
    var_19489352206d3d26 = getclosest(level.player.origin, var_af36b904b56328b7);
    utility::flag_clear("flg_chunnel_intro_train_1_driveby_vo");
    while (true) {
        if (level.player istouching(var_19489352206d3d26) || utility::flag("flg_chunnel_intro_train_1_driveby_vo")) {
            if (utility::flag("flg_chunnel_intro_train_1_driveby_vo_nags_off")) {
                wait 1;
                continue;
            }
            if (utility::flag("flg_chunnel_intro_train_1_driveby_vo")) {
                level thread function_63e96ea3ddc44e27();
            }
            var_4e8d54ce1703dd7a = var_2fab0bb99cc2049b utility::deck_draw();
            level.var_9f0ca2b82636560f dialogue::say_team(var_4e8d54ce1703dd7a, 0, 2.5);
            wait randomfloatrange(8, 12);
        }
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9b5
// Size: 0x45
function function_63e96ea3ddc44e27() {
    level endon("flg_chunnel_intro_track_start");
    utility::flag_set("flg_chunnel_intro_train_1_driveby_vo_nags_off");
    utility::flag_clear("flg_chunnel_intro_train_1_driveby");
    utility::flag_wait("flg_chunnel_intro_train_1_driveby");
    utility::flag_clear("flg_chunnel_intro_train_1_driveby_vo_nags_off");
    utility::flag_clear("flg_chunnel_intro_train_1_driveby_vo");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba02
// Size: 0xdb
function function_b3b19a6662bb1c61(var_5bdd72e964d44dc2) {
    level.player endon("death");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_9f69927475bffc29)) {
        aliases = [];
        aliases[aliases.size] = "dx_sp_surg_chin_pric_bloodytrain";
        aliases[aliases.size] = "dx_sp_surg_chin_pric_almosthitme";
        aliases[aliases.size] = "dx_sp_surg_chin_pric_thatwasacloseone";
        level.var_9f69927475bffc29 = utility::create_deck(aliases, 1, 1);
    }
    utility::flag_clear("flg_chunnel_player_almost_hit_by_train");
    while (!utility::flag(var_5bdd72e964d44dc2)) {
        utility::flag_wait("flg_chunnel_player_almost_hit_by_train");
        var_4e8d54ce1703dd7a = level.var_9f69927475bffc29 deck_draw();
        level.player dialogue::say_team(var_4e8d54ce1703dd7a, 0, 1);
        utility::flag_waitopen("flg_chunnel_player_almost_hit_by_train");
        wait 5;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbae5
// Size: 0xc8
function function_9ebbf6fd0482c86f(var_5bdd72e964d44dc2) {
    level.player endon("death");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_3488e6107105cb6f)) {
        aliases = [];
        aliases[aliases.size] = "dx_sp_surg_chin_pric_cantwalkthatoneoff";
        aliases[aliases.size] = "dx_sp_surg_chin_pric_bloodyhell";
        level.var_3488e6107105cb6f = utility::create_deck(aliases);
    }
    utility::flag_clear("flg_chunnel_player_sees_enemy_die_on_tracks");
    while (true) {
        utility::flag_wait("flg_chunnel_player_sees_enemy_die_on_tracks");
        var_4e8d54ce1703dd7a = level.var_3488e6107105cb6f deck_draw();
        level.player dialogue::say_team(var_4e8d54ce1703dd7a, 0, 1);
        utility::flag_waitopen("flg_chunnel_player_sees_enemy_die_on_tracks");
        wait 0.5;
    }
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xbbb5
    // Size: 0x5
    function function_63b8ac33d5c8e755() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbc2
// Size: 0x28
function function_8c51d81cc059da92() {
    level thread function_abf966652d450326();
    level thread function_91b944b3dd33df9();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbbf2
// Size: 0x10f
function function_29c5ee5a109ac636(var_5bdd72e964d44dc2) {
    level.player endon("death");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_9bb659f120a443f2)) {
        var_92f1a271f6b70ff6 = [];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_makarovwontbeatthecr"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_letshooftothecrossov"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_sirweneedtokeepmovin"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_weneedtopushtomakaro"];
        var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_crossoverisupaheadca"];
        level.var_9bb659f120a443f2 = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    }
    level dialogue::function_91c23782840cf632([var_5bdd72e964d44dc2, "flag_surge_stop_nags"], level.var_9bb659f120a443f2, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd09
// Size: 0x132
function function_abf966652d450326() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_alerted");
    if (utility::flag("flg_chunnel_intro_track_alerted")) {
        return;
    }
    utility::flag_wait("flg_chunnel_intro_track_start");
    level notify("stop_surge_nags");
    utility::flag_set("flg_chunnel_intro_track_vo_start");
    wait 3;
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    function_4256d29a648763ba();
    var_33718ad7ea90961f = [[level.var_25932e13dae83dd3, 0.2, "dx_sp_surg_chin_sfo4_konnispottedahead", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 0.6, "dx_sp_surg_chin_soap_theydontseeus", &function_72cf1844bf828de4], [level.player, 0.3, "dx_sp_surg_chin_pric_letskeepitthatwayyea", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_chunnel_intro_track_alerted";
    level dialogue::say_sequence(var_33718ad7ea90961f, 1, 0, 0, 0, "team");
    level thread function_bb2981a6e09bef73();
    level thread function_503fde9e398bbbdd();
    level thread function_d682edc598c0e4f9();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe43
// Size: 0x13a
function function_503fde9e398bbbdd() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_alerted");
    while (!isdefined(level.var_1181f1897e13785c)) {
        waitframe();
    }
    var_4e232eaf9f60e290 = sortbydistance(level.var_1181f1897e13785c, level.player.origin);
    if (var_4e232eaf9f60e290.size >= 2) {
        var_67dfd6629d45eb90 = var_4e232eaf9f60e290[0];
        var_67dfd9629d45f229 = var_4e232eaf9f60e290[1];
    }
    if (isdefined(var_67dfd6629d45eb90) && isdefined(var_67dfd9629d45f229)) {
        var_67dfd6629d45eb90 endon("death");
        var_67dfd6629d45eb90 endon("entitydeleted");
        var_67dfd9629d45f229 endon("death");
        var_67dfd9629d45f229 endon("entitydeleted");
        var_67dfd6629d45eb90 say_delayed(1.5, "dx_sp_surg_chin_kon1_needthatlastparttoas", 0, 5);
        var_67dfd9629d45f229 say_delayed(0.8, "dx_sp_surg_chin_kon2_shouldbecomingsoon", 0, 5);
        level thread function_b2e86be73a3f6775();
        var_67dfd6629d45eb90 say_delayed(0.6, "dx_sp_surg_chin_kon1_eta", 0, 5);
        var_67dfd9629d45f229 say_delayed(0.6, "dx_sp_surg_chin_kon2_arrivinginfiveminute", 0, 5);
        var_67dfd6629d45eb90 say_delayed(0.8, "dx_sp_surg_chin_kon1_weneeditinthreeenemy", 0, 5);
        var_67dfd9629d45f229 say_delayed(0.2, "dx_sp_surg_chin_kon2_yessir", 0, 5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf85
// Size: 0x7d
function function_b2e86be73a3f6775() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_alerted");
    level endon("flg_chunnel_intro_train_2_incoming");
    if (utility::flag("flg_chunnel_intro_track_alerted") || utility::flag("flg_chunnel_intro_train_2_incoming")) {
        return;
    }
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.8, "dx_sp_surg_chin_soap_theyreassemblingatur", 0, 1);
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_pric_theywontfinishit", 0, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc00a
// Size: 0xc9
function function_d682edc598c0e4f9() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_alerted");
    if (utility::flag("flg_chunnel_intro_track_alerted")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_enemiesaheadshouldta"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_letsambushkonnibefor"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_hostilesareunawarele"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    level dialogue::function_91c23782840cf632(["flg_chunnel_intro_track_alerted", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(30, 50, 2), 20, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0db
// Size: 0x5c
function function_bb2981a6e09bef73() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_complete");
    utility::flag_wait("flg_chunnel_intro_train_2_incoming");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_chin_soap_anothertraincomin", 1, 5);
    level thread function_c7f1c987bdae4ada();
    level thread function_9ebbf6fd0482c86f("flg_chunnel_intro_track_complete");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc13f
// Size: 0xe8
function function_c7f1c987bdae4ada() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_complete");
    if (!isdefined(level.var_56dea5612e5a8782)) {
        aliases = [];
        aliases[aliases.size] = "dx_sp_surg_chin_soap_train";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_incomingtrain";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_getoffthetracks";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_watchforthetrain";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_mindthetrain";
        level.var_56dea5612e5a8782 = utility::create_deck(aliases, 1, 1);
    }
    utility::flag_wait("flg_chunnel_intro_track_alerted");
    while (true) {
        utility::flag_wait("flg_chunnel_intro_track_train_danger_vo");
        if (!utility::flag("flg_train_passed_player")) {
            var_e736e708aa9d27fc = level.var_56dea5612e5a8782 utility::deck_draw();
            level.var_9f0ca2b82636560f dialogue::say_team(var_e736e708aa9d27fc, 0, 1);
        }
        utility::flag_waitopen("flg_chunnel_intro_track_train_danger_vo");
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc22f
// Size: 0x14f
function function_91b944b3dd33df9() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_complete");
    level thread function_9792fc5316c5c6f1();
    msg = utility::flag_wait_any_return("flg_chunnel_intro_track_attack_left", "flg_chunnel_intro_track_attack_right", "flg_chunnel_intro_track_alerted");
    level notify("stop_surge_nags");
    wait 0.5;
    if (utility::flag("flg_chunnel_intro_track_player_broke_stealth")) {
        level.var_9f0ca2b82636560f dialogue::stop_dialogue();
        level.player dialogue::stop_dialogue();
        level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_pric_engagesergeant", 1, 2.5);
    } else {
        var_b5435945531d710d = function_ae7b099ba92c26c4(level.var_1181f1897e13785c);
        if (istrue(var_b5435945531d710d)) {
            if (utility::flag("flg_chunnel_intro_track_enemies_visible")) {
                level.var_9f0ca2b82636560f dialogue::stop_dialogue();
                level.player dialogue::stop_dialogue();
                level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_pric_engagesergeant", 1, 2.5);
            } else {
                level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_chin_soap_spottedus", 1);
            }
        } else {
            level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_chin_soap_spottedus", 1);
        }
    }
    utility::flag_set("flg_chunnel_intro_track_allies_go_loud");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc386
// Size: 0x43
function function_9792fc5316c5c6f1() {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_complete");
    level.player utility::waittill_any("weapon_fired", "player_flash", "player_frag");
    utility::flag_set("flg_chunnel_intro_track_player_broke_stealth");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3d1
// Size: 0xc2
function function_ae7b099ba92c26c4(var_3c54f8ab21886d24) {
    level.player endon("death");
    level endon("flg_chunnel_intro_track_complete");
    for (i = 0; i < var_3c54f8ab21886d24.size; i++) {
        ai_enemy = var_3c54f8ab21886d24[i];
        if (isdefined(ai_enemy) && isalive(ai_enemy) && ai_enemy cansee(level.player)) {
            foreach (enemy in var_3c54f8ab21886d24) {
                thread function_678ee05eb44c1fb9(enemy, "flg_chunnel_intro_track_enemies_visible", "flg_chunnel_intro_vents_01");
            }
            return true;
        }
    }
    return false;
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc49c
    // Size: 0x5
    function function_55050a18925817e0() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4a9
// Size: 0x3a
function function_19ca5dae7378a648() {
    level thread function_f3e25ed68d5b36f6();
    level thread function_e2e487db292a1385();
    level thread function_ddd71c17b9d1f0e0();
    level thread function_8bf7af918bb38214();
    level dialogue::function_c3a221031a1ff66c(0, 3, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4eb
// Size: 0xc3
function function_f3e25ed68d5b36f6() {
    level.player endon("death");
    level endon("flg_chunnel_intro_vents_01");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(1.4, "dx_sp_surg_chin_soap_clear", 1);
    wait 1;
    level.player thread function_2a5f16ea78f32af4("noncombat", 3.6);
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_pric_sixtowatchertraintun", 1);
    level.player thread function_600f9ba1d61f24f0();
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_lasw_copyadviseusingtheve", 1);
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_chin_pric_checkwilco", 1);
    level thread function_3f6f04839fce8f83();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5b6
// Size: 0x10c
function function_3f6f04839fce8f83() {
    level.player endon("death");
    utility::flag_set("flg_chunnel_vents_checkin_vo_start");
    function_4256d29a648763ba();
    var_31b606456c7fa7d3 = [[level.var_292c01a9cd0b2818, 0.6, "dx_sp_surg_chin_ghos_allbravothisis71taki", &function_72cf1844bf828de4], [level.player, 0.4, "dx_sp_surg_chin_pric_securethemseven", &function_72cf1844bf828de4], [level.var_351f8aca05656919, 0.3, "dx_sp_surg_chin_gazz_wereworkinonitsix", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_chunnel_intro_vents_06";
    level dialogue::say_sequence(var_31b606456c7fa7d3, 1, 0, 0, 0, "team");
    utility::flag_set("flg_chunnel_vents_checkin_vo_complete");
    if (!utility::flag("flg_chunnel_intro_vents_01")) {
        level thread function_fc4dbdc948a8878();
        return;
    }
    level thread function_29c5ee5a109ac636("flg_chunnel_intro_vents_06");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6ca
// Size: 0xb8
function function_fc4dbdc948a8878() {
    level.player endon("death");
    level endon("flg_chunnel_intro_vents_01");
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_ventilationwaysoverh"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_weretakintheventilat"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_ventsareoverherecapt"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    level dialogue::function_91c23782840cf632(["flg_chunnel_intro_vents_01", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc78a
// Size: 0x134
function function_e2e487db292a1385() {
    level.player endon("death");
    level endon("flg_chunnel_crossover_open_door");
    level notify("stop_vents_train_tunnel_warning");
    level endon("stop_vents_train_tunnel_warning");
    if (!isdefined(level.var_56dea5612e5a8782)) {
        aliases = [];
        aliases[aliases.size] = "dx_sp_surg_chin_soap_train";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_incomingtrain";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_getoffthetracks";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_watchforthetrain";
        aliases[aliases.size] = "dx_sp_surg_chin_soap_mindthetrain";
        level.var_56dea5612e5a8782 = utility::create_deck(aliases, 1, 1);
    }
    level thread function_b3b19a6662bb1c61("flg_chunnel_crossover_open_door");
    utility::flag_wait("flg_chunnel_track_intro_to_crossover");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_chin_soap_thiswaycaptainidstay", 0, 2.5);
    wait 1;
    while (true) {
        utility::flag_wait("flg_chunnel_intro_track_train_danger_vo");
        if (!utility::flag("flg_train_passed_player")) {
            var_e736e708aa9d27fc = level.var_56dea5612e5a8782 deck_draw();
            level.var_9f0ca2b82636560f dialogue::say_team(var_e736e708aa9d27fc, 0, 1);
        }
        utility::flag_waitopen_or_timeout("flg_chunnel_intro_track_train_danger_vo", randomfloatrange(5, 8));
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8c6
// Size: 0x1cb
function function_ddd71c17b9d1f0e0() {
    level.player endon("death");
    level endon("flg_chunnel_intro_vents_13");
    utility::flag_wait("flg_chunnel_intro_vents_01");
    level notify("stop_surge_nags");
    if (!utility::flag("flg_chunnel_vents_checkin_vo_start")) {
        level thread function_3f6f04839fce8f83();
    } else {
        level thread function_29c5ee5a109ac636("flg_chunnel_intro_vents_06");
    }
    utility::flag_wait_all("flg_chunnel_vents_checkin_vo_complete", "flg_chunnel_intro_vents_corpses_in_view");
    level thread function_4aaa8f31212b60fe();
    utility::flag_wait_any("flg_chunnel_vents_corpses_visible", "flg_chunnel_intro_vents_09");
    level notify("stop_surge_nags");
    thread function_7f00fe62ddd4f3bd();
    function_4256d29a648763ba();
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_pric_watcherwereseeingdea", 1);
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_chin_lasw_theymaybethefirstofm", 1);
    if (!utility::flag("flg_chunnel_intro_vents_08")) {
        var_1d18da426255d799 = [[level.player, 0.2, "dx_sp_surg_chin_pric_bloodyaffirmativewat", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.5, "dx_sp_surg_chin_ghos_weareinthelineoffire", &function_72cf1844bf828de4], [level.player, 0.3, "dx_sp_surg_chin_pric_giveemallyougotwerea", &function_72cf1844bf828de4], [level.var_351f8aca05656919, 0.2, "dx_sp_surg_chin_gazz_betonitsir", &function_72cf1844bf828de4]];
        level.var_6ef05c49e46d8d70 = "flg_chunnel_intro_vents_13";
        level dialogue::say_sequence(var_1d18da426255d799, 1, 0, 0, 0, "team");
    }
    level thread function_29c5ee5a109ac636("flg_chunnel_intro_vents_13");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca99
// Size: 0xf5
function function_4aaa8f31212b60fe() {
    level.player endon("death");
    level endon("flg_chunnel_vents_corpses_visible");
    level endon("flg_chunnel_intro_vents_09");
    var_266f9e08c50954d6 = getent("trig_chunnel_intro_vents_corpses", "targetname");
    while (!utility::flag("flg_chunnel_intro_vents_06")) {
        if (within_fov_of_players(var_266f9e08c50954d6.origin, cos(20)) && level.player getstance() == "stand") {
            wait 0.15;
            utility::flag_set("flg_chunnel_vents_corpses_visible");
            return;
        }
        wait 0.5;
    }
    var_266f9e08c50954d6 = getent("trig_chunnel_intro_vents_09", "targetname");
    while (!utility::flag("flg_chunnel_intro_vents_09")) {
        if (within_fov_of_players(var_266f9e08c50954d6.origin, cos(30)) && utility::flag("flg_chunnel_intro_vents_06")) {
            utility::flag_set("flg_chunnel_vents_corpses_visible");
            return;
        }
        wait 0.5;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb96
// Size: 0xd
function function_7f00fe62ddd4f3bd() {
    setmusicstate("mx_surge_advance");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbab
// Size: 0xa7
function function_8bf7af918bb38214() {
    level.player endon("death");
    utility::flag_wait("flg_chunnel_intro_vents_14");
    level notify("stop_surge_nags");
    utility::battlechatter_off("axis");
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    function_4256d29a648763ba();
    level thread function_425f66e0229e8364();
    level thread function_1a07d6f1a272fa5c();
    level thread function_226e73c886a3c67();
    level.player dialogue::function_fc0eb6b81c66c661(2, "dx_sp_surg_chin_pric_hostagesinthenextroo", 1);
    level.var_25932e13dae83dd3 dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_sfo4_rogerthat", 0, 2.5);
    level thread function_7ecb6d66be890858();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc5a
// Size: 0x111
function function_7ecb6d66be890858() {
    level.player endon("death");
    level endon("flg_chunnel_vents_garage_alerted");
    level endon("stealth_spotted");
    level endon("flg_chunnel_intro_garage_01");
    if (utility::flag("flg_chunnel_vents_garage_alerted") || utility::flag("stealth_spotted") || utility::flag("flg_chunnel_intro_garage_01")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_needtosecurethehosta"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_needtomoveinandsecur"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_chin_soap_thehostagesneedhelpc"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    var_5e531899936a10f9 = ["flg_chunnel_vents_garage_alerted", "stealth_spotted", "flg_chunnel_intro_garage_01", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_2fab0bb99cc2049b, dialogue::growing_delay(10, 30, 2), 10);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd73
// Size: 0x1bc
function function_1a07d6f1a272fa5c() {
    level.player endon("death");
    level endon("flg_chunnel_vents_garage_alerted");
    level endon("stealth_spotted");
    while (!isdefined(level.var_3edf96459054e230) || !isdefined(level.var_b680f0b90d32078b)) {
        waitframe();
    }
    foreach (ai_enemy in level.var_b680f0b90d32078b) {
        ai_enemy endon("death");
        ai_enemy endon("entitydeleted");
    }
    level.var_3edf96459054e230[0] dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_chin_bmc1_pleaseletusgo", 2);
    level.var_b680f0b90d32078b[0] dialogue::function_fc0eb6b81c66c661(1.1, "dx_sp_surg_chin_kon1_stayquiet", 2);
    utility::flag_wait("flg_chunnel_intro_garage_01");
    var_f48358c2edfdb80f = [[level.var_b680f0b90d32078b[1], 1.5, "dx_sp_surg_chin_kon2_icanthinkofagoodwayt"], [level.var_b680f0b90d32078b[0], 1, "dx_sp_surg_chin_kon3_notabadidea"], [level.var_3edf96459054e230[0], 1.5, "dx_sp_surg_chin_bmc1_nonopleaseilldoanyth"], [level.var_b680f0b90d32078b[0], 1, "dx_sp_surg_chin_kon2_wetoldyoutobequiet"]];
    level dialogue::function_b0c2a659a5c2761f([level, "flg_chunnel_vents_garage_alerted", level, "stealth_spotted"], var_f48358c2edfdb80f, 0);
    wait 3;
    utility::flag_set("flg_chunnel_garage_hostage_execution_start");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf37
// Size: 0x4f
function function_425f66e0229e8364() {
    level.player endon("death");
    level endon("flg_chunnel_intro_garage_complete");
    utility::flag_wait("flg_chunnel_intro_garage_01");
    level.player utility::waittill_any("weapon_fired", "player_flash", "player_frag");
    utility::flag_set("flg_chunnel_vents_garage_player_broke_stealth");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf8e
// Size: 0x2e1
function function_226e73c886a3c67() {
    level.player endon("death");
    level endon("flg_chunnel_crossover_open_door");
    msg = utility::flag_wait_any_return("stealth_spotted", "flg_chunnel_vents_garage_alerted", "flg_chunnel_vents_garage_player_broke_stealth");
    utility::battlechatter_on("axis");
    level notify("stop_surge_nags");
    wait 0.5;
    if (msg == "flg_chunnel_vents_garage_player_broke_stealth") {
        level.player dialogue::say_team("dx_sp_surg_chin_pric_fire", 1);
    }
    utility::flag_wait("flg_chunnel_intro_garage_complete");
    utility::flag_set("flg_chunnel_garage_vo_start");
    utility::flag_clear("stealth_spotted");
    utility::battlechatter_off("axis");
    wait 1.2;
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    level.var_89739751f74169b4 dialogue::say_team("dx_sp_surg_chin_sfo4_garageclear", 1);
    thread function_b6861d7bd63868d5();
    if (utility::flag("flg_chunnel_vents_garage_all_hostages_dead")) {
        var_2a0ff7e2d005911c = [[level.var_89739751f74169b4, 1.2, "dx_sp_surg_chin_sfo4_nosurvivors"], [level.var_9f0ca2b82636560f, 0.3, "dx_sp_surg_chin_soap_nofuckinregardforhum"], [level.player, 0.2, "dx_sp_surg_chin_pric_weneedtofindmakarovn"], [level.var_89739751f74169b4, 0.4, "dx_sp_surg_chin_sfo4_coveringsixcaptain"]];
    } else if (utility::flag("flg_chunnel_vents_garage_hostage_casualties")) {
        var_2a0ff7e2d005911c = [[level.var_89739751f74169b4, 1.2, "dx_sp_surg_chin_sfo4_civiliancasualtieshe"], [level.player, 0.3, "dx_sp_surg_chin_pric_getanysurvivorstosaf"], [level.var_3edf96459054e230[0], 1, "dx_sp_surg_chin_bmc1_ohgodohmygod"], [level.var_89739751f74169b4, 0.2, "dx_sp_surg_chin_sfo4_wellhandlethemrestta"]];
    } else {
        var_2a0ff7e2d005911c = [[level.var_89739751f74169b4, 1.2, "dx_sp_surg_chin_sfo4_securingthehostagesn"], [level.player, 0.3, "dx_sp_surg_chin_pric_getthemtosafety"], [level.var_3edf96459054e230[0], 1, "dx_sp_surg_chin_bmc1_ohgodohmygod"], [level.var_89739751f74169b4, 0.2, "dx_sp_surg_chin_sfo4_wellhandlethemrestta"]];
    }
    level dialogue::say_sequence(var_2a0ff7e2d005911c, 1, 0, 0, 0, "team");
    wait 1;
    level thread function_adc8f9a62f4d402f();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd277
// Size: 0x9e
function function_adc8f9a62f4d402f() {
    level.player endon("death");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_chin_soap_thisis71wereatthecro", 1);
    level.var_318c75041f10c73f dialogue::function_fc0eb6b81c66c661(0.6, "dx_sp_surg_chin_lasw_thatsmakarovslastkno", 1);
    utility::flag_set("flg_chunnel_garage_vo_complete");
    level endon("flg_chunnel_crossover_open_door");
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_chin_pric_letsreadyupmakarovma", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_covr_soap_onyourgosir", 1);
    wait 1;
    level thread function_359f4a7392442dc3();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd31d
// Size: 0xb4
function function_359f4a7392442dc3() {
    level.player endon("death");
    level endon("flg_chunnel_crossover_open_door");
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_waitingonyoucaptain"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_makarovcouldbeherele"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_settobreachcallitcap"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6);
    level dialogue::function_91c23782840cf632(["flg_chunnel_crossover_open_door", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 15);
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xd3d9
    // Size: 0x5
    function function_dce43c38c9ffe90b() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3e6
// Size: 0x31
function function_554b1127c6be10c6() {
    level thread function_b8cfa12c03be1530();
    level thread function_f0d84ee15ee2d715();
    level thread function_7e45588af70fa407();
    level dialogue::function_c3a221031a1ff66c(0, 5, 0, "team");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd41f
// Size: 0x66
function function_b8cfa12c03be1530() {
    level.player endon("death");
    utility::flag_wait("flg_chunnel_crossover_open_door");
    level notify("stop_surge_nags");
    level thread function_f39321bdccb36430();
    level thread function_726ef95054cdb0e7();
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_covr_pric_moving", 0, 1);
    wait 4;
    level thread function_17a9d4c35e5a8363();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd48d
// Size: 0xd
function function_b6861d7bd63868d5() {
    stopmusicstate("mx_surge_advance");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a2
// Size: 0x43
function function_f39321bdccb36430() {
    level.player endon("death");
    level endon("flg_chunnel_middle_crossed");
    level.player utility::waittill_any("weapon_fired", "player_flash", "player_frag");
    utility::flag_set("flg_chunnel_crossover_player_broke_stealth");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4ed
// Size: 0x18b
function function_17a9d4c35e5a8363() {
    level.player endon("death");
    level endon("flg_chunnel_crossover_player_broke_stealth");
    level endon("flg_chunnel_crossover_alerted");
    utility::battlechatter_off("axis");
    while (!isdefined(level.var_337d7d0b877e30c8)) {
        waitframe();
    }
    var_4e232eaf9f60e290 = sortbydistance(level.var_337d7d0b877e30c8, level.player.origin);
    if (var_4e232eaf9f60e290.size >= 2) {
        var_67dfd6629d45eb90 = var_4e232eaf9f60e290[0];
        var_67dfd9629d45f229 = var_4e232eaf9f60e290[1];
    }
    if (isdefined(var_67dfd6629d45eb90) && isdefined(var_67dfd9629d45f229)) {
        var_67dfd6629d45eb90 endon("death");
        var_67dfd6629d45eb90 endon("entitydeleted");
        var_67dfd9629d45f229 endon("death");
        var_67dfd9629d45f229 endon("entitydeleted");
        var_464efcae4fd633b = [[var_67dfd6629d45eb90, 0.4, "dx_sp_surg_covr_kon1_youheardfromtheother"], [var_67dfd9629d45f229, 0.3, "dx_sp_surg_covr_kon2_negative"], [var_67dfd6629d45eb90, 0.5, "dx_sp_surg_covr_kon1_enemycouldbegettingc"], [var_67dfd9629d45f229, 0.3, "dx_sp_surg_covr_kon2_checkyourmagsbeready"], [var_67dfd6629d45eb90, 0.2, "dx_sp_surg_covr_kon1_copythatstayalert"]];
        level dialogue::function_b0c2a659a5c2761f([level, "flg_chunnel_crossover_alerted", level, "flg_chunnel_crossover_player_broke_stealth"], var_464efcae4fd633b, 0);
        utility::battlechatter_on("axis");
        utility::flag_set("flg_chunnel_crossover_alerted");
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd680
// Size: 0xd3
function function_726ef95054cdb0e7() {
    level.player endon("death");
    level endon("flg_crossover_clear_obj_show");
    msg = utility::flag_wait_any_return("flg_chunnel_crossover_alerted", "flg_chunnel_crossover_player_broke_stealth");
    if (msg == "flg_chunnel_crossover_player_broke_stealth") {
        wait 1;
        utility::flag_set("flg_chunnel_crossover_alerted");
        wait 1;
    }
    while (true) {
        ai_enemies = getaiarray("axis");
        ai_enemies = array_removedead_or_dying(ai_enemies, 1);
        var_2a8e824d15b87aa4 = getclosest(level.player.origin, ai_enemies);
        if (isdefined(var_2a8e824d15b87aa4) && isalive(var_2a8e824d15b87aa4)) {
            var_2a8e824d15b87aa4 dialogue::say("dx_sp_surg_covr_kon1_theyrehereopenfire");
            utility::flag_set("flg_chunnel_crossover_enemy_surprise_vo_complete");
            break;
        }
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd75b
// Size: 0x140
function function_f0d84ee15ee2d715() {
    level.player endon("death");
    level endon("flg_crossover_elites_clear");
    msg = utility::flag_wait_any_return("flg_chunnel_crossover_alerted", "flg_chunnel_crossover_exit_garage");
    utility::battlechatter_on("axis");
    if (msg == "flg_chunnel_crossover_alerted") {
        utility::flag_wait_or_timeout("flg_chunnel_crossover_enemy_surprise_vo_complete", 5);
    } else {
        utility::flag_set("flg_chunnel_crossover_alerted");
    }
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_covr_pric_pushforwardfireforef", 1);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_covr_soap_youheardhimmove", 1);
    utility::flag_set("flg_crossover_clear_obj_show");
    level thread function_757ff9ac0bb62be8();
    level thread function_b3b19a6662bb1c61("flg_crossover_exit_reached");
    level thread function_9ebbf6fd0482c86f("flg_crossover_exit_reached");
    utility::flag_wait("flg_chunnel_enter_crossover");
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_covr_pric_crossingwatchfortrai", 1);
    utility::flag_wait("flg_chunnel_middle_crossed");
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    level.var_89739751f74169b4 dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_covr_sfo4_advancingbehindyou", 1);
    wait 1;
    level thread function_cd3c5ae1c9b99016();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8a3
// Size: 0x76
function function_ec3904b43ba2ac4d() {
    level.player endon("death");
    level endon("flg_crossover_second_combat_area");
    level endon("flg_crossover_turret_removed");
    level.var_bfdb4f43205d4328 dialogue::say("dx_sp_surg_hcqc_kon1_deployingturret", 0, 5);
    utility::flag_wait("flg_crossover_turret_active");
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    level.var_89739751f74169b4 dialogue::function_fc0eb6b81c66c661(0.5, "dx_sp_surg_hcqc_sfo3_contactenemyturret", 1, 5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd921
// Size: 0x80
function function_757ff9ac0bb62be8() {
    level.player endon("death");
    level endon("flg_crossover_elites_clear");
    level endon("flg_crossover_exit_reached");
    level thread function_f91c5f8491d5b6cc("flg_chunnel_crossover_initial_enemies_cleared");
    utility::flag_wait_any("flg_chunnel_crossover_initial_enemies_cleared", "flg_chunnel_middle_crossed");
    level thread function_9dc1a2cca93b1ac7("flg_chunnel_middle_crossed");
    utility::flag_wait("flg_chunnel_middle_crossed");
    level thread function_f91c628491d5bd65("flg_chunnel_crossover_advance_enemies_cleared");
    utility::flag_wait_all("flg_crossover_second_combat_area", "flg_crossover_juggernaut_both_dead");
    level thread function_f91c618491d5bb32();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a9
// Size: 0xe2
function function_f91c5f8491d5b6cc(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_crossover_exit_reached");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    var_4b333ee39a0e4a4 = [];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_engaging"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_theyretakingcoverint"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_hcqc_soap_iseeem"];
    var_6ba69ccbacabc34d = utility::create_deck(var_4b333ee39a0e4a4, 1, 1);
    var_5e531899936a10f9 = [var_5bdd72e964d44dc2, "flg_chunnel_middle_crossed", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_6ba69ccbacabc34d, dialogue::growing_delay(20, 40, 4), 15, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda93
// Size: 0x10d
function function_9dc1a2cca93b1ac7(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_crossover_elites_clear");
    level endon("flg_crossover_exit_reached");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    if (!isdefined(level.var_6ba69ccbacabc34d)) {
        var_34869e7fae39e27d = [];
        var_34869e7fae39e27d[var_34869e7fae39e27d.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_morekonniupaheadcapt"];
        var_34869e7fae39e27d[var_34869e7fae39e27d.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_moveforwardletsstayt"];
        var_34869e7fae39e27d[var_34869e7fae39e27d.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_enemiesinfrontletspr"];
        var_34869e7fae39e27d[var_34869e7fae39e27d.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_gotmorekonniinourpat"];
        level.var_3550a4c227a44b5a = utility::create_deck(var_34869e7fae39e27d, 1, 1);
    }
    var_5e531899936a10f9 = [var_5bdd72e964d44dc2, "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, level.var_3550a4c227a44b5a, dialogue::growing_delay(20, 60, 4), 15);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdba8
// Size: 0x44
function function_7542a7d1619df718() {
    level.player endon("death");
    level endon("flg_crossover_second_combat_area");
    utility::flag_wait("flg_crossover_turret_removed");
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.6, "dx_sp_surg_hcqc_soap_turretsdestroyed", 0, 5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdbf4
// Size: 0xe2
function function_f91c628491d5bd65(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_crossover_exit_reached");
    if (utility::flag(var_5bdd72e964d44dc2)) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    var_4b333ee39a0e4a4 = [];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_theyremovingclose"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_stayoffthetracks"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_seriousfuckinnumbers"];
    var_6ba69ccbacabc34d = utility::create_deck(var_4b333ee39a0e4a4, 1, 1);
    var_5e531899936a10f9 = [var_5bdd72e964d44dc2, "flg_crossover_second_combat_area", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_6ba69ccbacabc34d, dialogue::growing_delay(20, 40, 4), 10, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcde
// Size: 0x11b
function function_cd3c5ae1c9b99016() {
    level.player endon("death");
    utility::flag_wait_any("flg_chunnel_crossover_advance_enemies_cleared", "flg_crossover_combat_a_enemies_rush");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    var_4eb0ced8c2bdfa09 = [[level.var_9f0ca2b82636560f, 1.2, "dx_sp_surg_covr_soap_theyrethinninout"], [level.player, 0.3, "dx_sp_surg_covr_pric_ghostgaztroopsincont"], [level.var_292c01a9cd0b2818, 0.6, "dx_sp_surg_covr_ghos_pushingupthetraintun"], [level.var_351f8aca05656919, 0.3, "dx_sp_surg_covr_gazz_noshortageofhostiles"], [level.player, 0.2, "dx_sp_surg_covr_pric_copyweremovingaheadm"]];
    level dialogue::say_sequence(var_4eb0ced8c2bdfa09, 1, 0, 0, 0, "team");
    level thread function_9dc1a2cca93b1ac7("flg_crossover_second_combat_area");
    level thread function_ab48053cf6e311f2();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde01
// Size: 0x104
function function_ab48053cf6e311f2() {
    level.player endon("death");
    level endon("flg_crossover_exit_reached");
    utility::flag_wait_all("flg_crossover_second_combat_area", "flg_chunnel_crossover_sfo_charlie_spawned");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    var_b9e2a48c725b4359 = [[level.var_89739751f74169b4, 0.6, "dx_sp_surg_covr_sfo4_advancing", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 1.2, "dx_sp_surg_covr_soap_watchthatjugg", &function_72cf1844bf828de4], [level.player, 0.8, "dx_sp_surg_covr_pric_hesheavilyarmoredtak", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_crossover_exit_reached";
    level dialogue::say_sequence(var_b9e2a48c725b4359, 1, 0, 0, 0, "team");
    level thread function_50d9701feaf3d770();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf0d
// Size: 0xd6
function function_f91c618491d5bb32() {
    level.player endon("death");
    level endon("flg_crossover_elites_clear");
    level endon("flg_crossover_exit_reached");
    var_4b333ee39a0e4a4 = [];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_almosttherecaptain"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_onlyafewleft"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_justalittlefurtherca"];
    var_6ba69ccbacabc34d = utility::create_deck(var_4b333ee39a0e4a4, 1, 1);
    var_5e531899936a10f9 = ["flg_crossover_elites_clear", "flg_crossover_exit_reached", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_6ba69ccbacabc34d, dialogue::growing_delay(20, 40, 4), 15, 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfeb
// Size: 0xe6
function function_50d9701feaf3d770() {
    level.player endon("death");
    level endon("flg_crossover_exit_reached");
    level thread function_fd7644c12da425c0();
    level thread function_474d27bb20b964c8("flg_crossover_juggernaut_one_dead");
    utility::flag_wait("flg_crossover_juggernaut_one_dead");
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_covr_pric_enemyjuggernautisdow", 1, 2.5);
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.6, "dx_sp_surg_covr_soap_biggertheyare", 1, 2.5);
    level thread function_474d27bb20b964c8("flg_crossover_juggernaut_both_dead");
    utility::flag_wait("flg_crossover_juggernaut_both_dead");
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_covr_pric_hesdown", 2, 0.5);
    if (!utility::flag("flg_crossover_elites_clear")) {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_covr_soap_timetoendthis", 0, 2.5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0d9
// Size: 0xd5
function function_fd7644c12da425c0() {
    level.player endon("death");
    level endon("flg_crossover_jugg_intro_killed");
    level endon("flg_crossover_juggernaut_both_dead");
    level endon("flg_crossover_exit_reached");
    if (!utility::flag("flg_crossover_jugg_intro_path_complete")) {
        utility::flag_wait("flg_crossover_jugg_intro_path_complete");
    }
    while (distance2dsquared(level.player.origin, level.var_5e64b5358f867b1.origin) < squared(124)) {
        wait 1;
    }
    thread function_678ee05eb44c1fb9(level.var_5e64b5358f867b1, "flg_crossover_intro_jugg_visible", "flg_crossover_jugg_intro_killed");
    utility::flag_wait("flg_crossover_intro_jugg_visible");
    if (utility::flag("flg_crossover_juggernaut_one_dead")) {
        level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_covr_pric_enemyjuggernaut", 1, 2.5);
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe1b6
// Size: 0xef
function function_474d27bb20b964c8(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_crossover_exit_reached");
    if (utility::flag(var_5bdd72e964d44dc2) || utility::flag("flg_crossover_exit_reached")) {
        return;
    }
    level endon(var_5bdd72e964d44dc2);
    var_4b333ee39a0e4a4 = [];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_slotthatbigbastard"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_burnhisdowncaptain"];
    var_4b333ee39a0e4a4[var_4b333ee39a0e4a4.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_weneedtofinishhim"];
    var_6ba69ccbacabc34d = utility::create_deck(var_4b333ee39a0e4a4, 1, 1);
    var_5e531899936a10f9 = [var_5bdd72e964d44dc2, "flg_crossover_exit_reached", "flag_surge_stop_nags"];
    level dialogue::function_91c23782840cf632(var_5e531899936a10f9, var_6ba69ccbacabc34d, dialogue::growing_delay(25, 45, 4), 20);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2ad
// Size: 0x14a
function function_7e45588af70fa407() {
    level.player endon("death");
    level endon("flg_bomb_discovered");
    utility::flag_wait_all("flg_crossover_elites_clear", "flg_crossover_juggernaut_both_dead");
    level notify("stop_surge_nags");
    var_cbca47bb5ffa7914 = getaiarray("axis");
    var_cbca47bb5ffa7914 = array_removedead_or_dying(var_cbca47bb5ffa7914);
    if (var_cbca47bb5ffa7914.size > 0) {
        level thread function_3025ee051d28ec46(var_cbca47bb5ffa7914, "flg_crossover_remaining_enemies_dead");
        utility::flag_wait("flg_crossover_remaining_enemies_dead");
    }
    function_4256d29a648763ba();
    level.var_89739751f74169b4 = function_d1061513a0f95e85();
    var_267d89b1fb9e485f = [[level.var_89739751f74169b4, 1.4, "dx_sp_surg_covr_sfo4_clear", &function_72cf1844bf828de4], [level.player, 1.2, "dx_sp_surg_covr_pric_soapletsmovewedontre", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 0.3, "dx_sp_surg_covr_soap_hesnotgettinoutalive", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_bomb_discovered";
    level dialogue::say_sequence(var_267d89b1fb9e485f, 1, 0, 0, 0, "team");
    wait 1.5;
    level thread function_dc9d12489618855e();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3ff
// Size: 0x10d
function function_dc9d12489618855e() {
    level.player endon("death");
    level endon("flg_bomb_discovered");
    if (utility::flag("flg_bomb_discovered")) {
        return;
    }
    var_a3b1f114361fa3c0 = [[level.var_351f8aca05656919, 0.3, "dx_sp_surg_covr_gazz_captainkonnispressin"], [level.player, 0.2, "dx_sp_surg_covr_pric_meansmakarovsstillhe", &function_72cf1844bf828de4], [level.var_292c01a9cd0b2818, 0.4, "dx_sp_surg_covr_ghos_watchyourbackstheyve", &function_72cf1844bf828de4], [level.var_9f0ca2b82636560f, 0.2, "dx_sp_surg_covr_soap_rogerthatltnosurrend", &function_72cf1844bf828de4]];
    level.var_6ef05c49e46d8d70 = "flg_bomb_discovered";
    level dialogue::say_sequence(var_a3b1f114361fa3c0, 1, 0, 0, 0, "team");
    level thread function_26ae641aef0e2486("flg_bomb_discovered");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe514
// Size: 0xd0
function function_26ae641aef0e2486(var_5bdd72e964d44dc2) {
    level.player endon("death");
    level endon("flg_bomb_discovered");
    if (utility::flag("flg_bomb_discovered")) {
        return;
    }
    var_92f1a271f6b70ff6 = [];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_comeoncaptainwererun"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_whateverhesgonnadodo"];
    var_92f1a271f6b70ff6[var_92f1a271f6b70ff6.size] = [level.var_9f0ca2b82636560f, "dx_sp_surg_covr_soap_wecantletmakarovesca"];
    var_2fab0bb99cc2049b = utility::create_deck(var_92f1a271f6b70ff6, 1, 1);
    level dialogue::function_91c23782840cf632(["flg_bomb_discovered", "flag_surge_stop_nags"], var_2fab0bb99cc2049b, dialogue::growing_delay(20, 60, 4), 10);
}

/#

    // Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe5ec
    // Size: 0x5
    function function_c591b3fda09c8dd7() {
        
    }

#/

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5f9
// Size: 0x4d
function function_f9b3b24c9ce60b99() {
    level endon("flg_chunnel_pre_bomb_player_on_left");
    level endon("flg_chunnel_pre_bomb_player_on_right");
    level endon("flag_chunnel_finale_wave_1_dead");
    level.player utility::waittill_any("weapon_fired", "grenade_fire");
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_contact", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe64e
// Size: 0x5d
function function_7efaee8d944d6157() {
    utility::flag_wait("flag_chunnel_finale_wave_1_dead");
    level notify("stop_surge_nags");
    function_4256d29a648763ba();
    thread function_1eecb9607b53a762();
    level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_soap_captaineyesonthebomb", 2);
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_pric_copycheckit", 2);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6b3
// Size: 0xd
function function_1eecb9607b53a762() {
    setmusicstate("mx_surge_hostages");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6c8
// Size: 0x101
function function_edcb9b6a1989fdad() {
    utility::flag_wait("flag_chunnel_finale_wave_1_dead");
    level.player dialogue::function_fc0eb6b81c66c661(1.4, "dx_sp_surg_ssoa_pric_sfosecureaperimeter", 2);
    level.var_ed5a4d7626f6868 dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_sfo4_yessir", 2);
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_pric_soapgetonthatbomb", 2);
    flag_wait("flg_finale_wave2_ready");
    level.player thread function_2a5f16ea78f32af4("combat", 5);
    level.player dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_ssoa_pric_allbravobomblocatedi", 2);
    level.player thread function_600f9ba1d61f24f0();
    level.var_351f8aca05656919 dialogue::function_fc0eb6b81c66c661(0.6, "dx_sp_surg_ssoa_gazz_rogontheway", 2);
    if (!flag("flg_finale_player_in_combat_zone")) {
        flag_wait("flg_finale_player_in_combat_zone");
    }
    utility::flag_set("flg_start_wave_two");
    level thread function_f45a2bf81a3d37b9();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7d1
// Size: 0xaa
function function_f45a2bf81a3d37b9() {
    var_13f0578e0f5cbd02 = getstruct("scene_jup_surge_0900_defuse", "targetname");
    level.var_ed5a4d7626f6868 dialogue::function_fc0eb6b81c66c661(0.4, "dx_sp_surg_ssoa_sfo3_contact", 2);
    level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_pric_fuckinhellstandby", 2);
    thread function_8534b2514ad043c1();
    wait 0.5;
    utility::flag_set("flg_comm_done_from_Price");
    utility::flag_wait("flag_chunnel_finale_wave_2_dead");
    function_4256d29a648763ba();
    level.player dialogue::function_fc0eb6b81c66c661(1, "dx_sp_surg_ssoa_pric_canyoudisarmit", 2);
    utility::flag_set("flg_start_enter_nags");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe883
// Size: 0xac
function function_504bcda7256bc4bf() {
    level endon("flag_chunnel_finale_wave_2_dead");
    animnode = self;
    utility::flag_wait("flg_comm_done_from_Price");
    wait 5;
    animnode thread scene::play([level.var_9f0ca2b82636560f], "scene_nag04");
    wait 9.2;
    animnode thread scene::play([level.var_9f0ca2b82636560f], "scene_nag03");
    wait 4;
    utility::flag_set("flg_cannot_save_start");
    wait 4.3;
    animnode thread scene::play([level.var_9f0ca2b82636560f], "scene_nag05");
    wait 6.9;
    thread function_4fec720fd51f5ca9("flg_snakecam_first_enter_timeout");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe937
// Size: 0x94
function function_8534b2514ad043c1() {
    level endon("flg_snakecam_first_enter_timeout");
    level endon("flag_chunnel_finale_wave_2_dead");
    level endon("flg_start_enter_nags");
    var_13f0578e0f5cbd02 = getstruct("scene_jup_surge_0900_defuse", "targetname");
    level utility::waittill_dead_or_dying(level.var_3ef7af4c51bb40f9, level.var_3ef7af4c51bb40f9.size - 1);
    var_13f0578e0f5cbd02 scene::play([level.var_9f0ca2b82636560f], "scene_nag01");
    var_13f0578e0f5cbd02 thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "scene_loop");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe9d3
// Size: 0xf2
function function_9081dba75d5595c7() {
    level endon("flg_first_bomb_interact_complete");
    animnode = self;
    animnode scene::play([level.var_9f0ca2b82636560f], "scene_nag02");
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "scene_loop");
    wait 5;
    animnode thread scene::play(level.var_9f0ca2b82636560f, "scene_nag03_2");
    wait 9.3;
    animnode thread scene::play(level.var_9f0ca2b82636560f, "scene_nag04_2");
    wait 9.2;
    animnode thread scene::play(level.var_9f0ca2b82636560f, "scene_nag05_2");
    wait 6.9;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "scene_nag06");
    wait 8.5;
    thread function_4fec720fd51f5ca9("flg_snakecam_first_enter_timeout");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeacd
// Size: 0x93
function function_4fec720fd51f5ca9(var_6238672387da7a13, var_b313e1d96d3f666a) {
    if (!isdefined(var_b313e1d96d3f666a)) {
        var_b313e1d96d3f666a = 0;
    }
    utility::flag_set(var_6238672387da7a13);
    if (var_b313e1d96d3f666a == 1) {
        thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag06");
        level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_bloodyhellweretoolat");
    } else {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_bloodyhellweretoolat", 3);
    }
    utility::flag_set("flag_defusal_fail");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb68
// Size: 0x48
function function_810d67576ecea89c() {
    level.var_d18d63c6d75cd1e dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_gazz_wereoutoftimecutting", 3);
    function_d74f405076865c15();
    level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_ssoa_gazz_shit", 3);
    utility::flag_set("flag_defusal_fail");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xebb8
// Size: 0x36f
function function_7cefb008a23b6fc0() {
    level endon("flag_defusal_fail");
    function_4256d29a648763ba();
    utility::flag_set("flag_bomb_defusal_coordination_start");
    var_9f6cdd90045d24bf = [[level.player, 0.8, "dx_sp_surg_ssoa_pric_imintalktomesoap"], [level.player, 0.3, "dx_sp_surg_ssoa_soap_bombsdirtycaptainc4a"], [level.player, 0.2, "dx_sp_surg_ssoa_pric_itllimplodethetunnel"], [level.player, 0.5, "dx_sp_surg_ssoa_soap_ineedthemanufacturer"]];
    level dialogue::say_sequence(var_9f6cdd90045d24bf, 2, 0, 0, 0, "team");
    level thread function_af605355f44740e5();
    var_2495974d33de932e = getstruct("s_bomb_bear_logo", "targetname");
    if (!isdefined(var_2495974d33de932e)) {
        var_2495974d33de932e = spawnstruct();
        var_2495974d33de932e.origin = (-54063, 60368, 494);
    }
    var_2495974d33de932e thread function_45a191c0ccc354f0("flag_defusal_1_success");
    level thread function_9b7641928bbab4f7();
    msg = utility::flag_wait_any_return("flg_bomb_puzzle_spotted", "flg_bomb_puzzle_search_timeout");
    if (msg == "flg_bomb_puzzle_search_timeout") {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_bloodyhellweretoolat", 3);
        utility::flag_set("flag_defusal_fail");
        return;
    }
    level.player utility::flag_clear("flg_bomb_puzzle_spotted");
    var_213f147e9d671a83 = function_e607ac7b165d00cb();
    if (!isdefined(var_213f147e9d671a83)) {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_bloodyhellweretoolat", 3);
        utility::flag_set("flag_defusal_fail");
        return;
    }
    switch (var_213f147e9d671a83) {
    case 0: 
        level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_soap_copybearcuttingthewi", 2);
        function_d74f405076865c15();
        level.player say_team("dx_sp_surg_ssoa_soap_gotitthatboughtussom", 2);
        break;
    case 1:
    case 2:
    case 3:
    default: 
        level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_soap_copycuttingthewire");
        function_d74f405076865c15();
        utility::flag_set("flag_defusal_fail");
        return;
    }
    function_4256d29a648763ba();
    level thread namespace_85a51fd192b9a590::function_a81df2b9565dd07d();
    var_7853a8ce5e65edae = [[level.var_292c01a9cd0b2818, 0.4, "dx_sp_surg_ssoa_ghos_pricebeadvisedmakaro"], [level.player, 0.3, "dx_sp_surg_ssoa_pric_soapyouhearthat"], [level.player, 0.3, "dx_sp_surg_ssoa_soap_affirmimnotleavinthi"]];
    level dialogue::say_sequence(var_7853a8ce5e65edae, 2, 0, 0, 0, "team");
    utility::flag_set("flg_first_bomb_puzzle_complete");
    utility::flag_set("flag_defusal_1_success");
    level.player dialogue::function_fc0eb6b81c66c661(0.7, "dx_sp_surg_ssoa_soap_ughhhimhit", 2, 0.1);
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_soapgetyourgunup", 2);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef2f
// Size: 0x26
function function_af605355f44740e5() {
    level endon("flg_chunnel_finale_snakecam_01_answer_given");
    wait 3;
    level.player dialogue::say_team("dx_sp_surg_ssoa_soap_givemesomethingsirth", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef5d
// Size: 0x154
function function_e607ac7b165d00cb() {
    var_83df368eecf3cea6 = [0, 1, 2, 3];
    var_83df368eecf3cea6 = utility::array_randomize(var_83df368eecf3cea6);
    var_1b8b2ec73f492162 = [%SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH1_OPTION1, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH1_OPTION2, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH1_OPTION3, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH1_OPTION4];
    var_1b8b2ec73f492162 = namespace_fc0114e844f0b4c::function_67f411b123f0cf9(var_83df368eecf3cea6, var_1b8b2ec73f492162);
    var_151363a8275820fb = ["dx_sp_surg_ssoa_pric_abearthatsthelogoont", "dx_sp_surg_ssoa_pric_logoisabear"];
    var_151362a827581ec8 = ["dx_sp_surg_ssoa_pric_atriangle"];
    var_151365a827582561 = ["dx_sp_surg_ssoa_pric_ablueflamethatsthelo", "dx_sp_surg_ssoa_pric_blueflameisthelogo"];
    var_151364a82758232e = ["dx_sp_surg_ssoa_pric_adogthatsthelogoonth", "dx_sp_surg_ssoa_pric_doglogoisadog"];
    var_5c76167572fce9c1 = [var_151363a8275820fb[randomintrange(0, var_151363a8275820fb.size)], var_151362a827581ec8[0], var_151365a827582561[randomintrange(0, var_151365a827582561.size)], var_151364a82758232e[randomintrange(0, var_151364a82758232e.size)]];
    var_5c76167572fce9c1 = namespace_fc0114e844f0b4c::function_67f411b123f0cf9(var_83df368eecf3cea6, var_5c76167572fce9c1);
    var_d9537912526addd1 = namespace_fc0114e844f0b4c::function_945718bb107da39e(var_5c76167572fce9c1, var_1b8b2ec73f492162, 15, 0, "flg_chunnel_finale_snakecam_01_answer_given");
    var_213f147e9d671a83 = var_83df368eecf3cea6[var_d9537912526addd1 - 1];
    return var_213f147e9d671a83;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0ba
// Size: 0x2c
function function_d74f405076865c15() {
    wait 0.3;
    playsoundatpos(level.player.origin, "minefield_click");
    wait 0.5;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0ee
// Size: 0x194
function function_f1a20db8bdb4e9d3() {
    level endon("flag_chunnel_finale_wave_3_dead");
    level endon("flg_script_set_finale_wave_3_dead");
    animnode = self;
    thread function_c622369fc8cc021f();
    function_4256d29a648763ba();
    var_e4f5c03ff0af628e = [[level.var_9f0ca2b82636560f, 0.2, "dx_sp_surg_ssoa_soap_itllblowifiletgocapt"], [level.player, 0.2, "dx_sp_surg_ssoa_pric_fuuuckbravoweneedsup"], [level.var_351f8aca05656919, 0.4, "dx_sp_surg_ssoa_gazz_werepinneddowncapkon"], [level.player, 0.2, "dx_sp_surg_ssoa_pric_pushthroughem"]];
    level dialogue::say_sequence(var_e4f5c03ff0af628e, 2, 0, 0, 0, "team");
    thread function_287cfa9abfa54df8();
    wait 7;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag01");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_finishemsir", 1);
    wait 7;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag04");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_clearemoutcaptain", 1);
    wait 8.2;
    level utility::flag_set("flg_cannot_save_start");
    wait 10.3;
    thread function_4fec720fd51f5ca9("flg_snakecam_first_enter_timeout");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf28a
// Size: 0x54
function function_c622369fc8cc021f() {
    level endon("flag_chunnel_finale_wave_3_dead");
    level endon("flg_script_set_finale_wave_3_dead");
    level utility::waittill_dead_or_dying(level.var_3ef7ae4c51bb3ec6, level.var_3ef7ae4c51bb3ec6.size - 1);
    wait 1.5;
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_oneleftalmostclear", 0, 0.5);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e6
// Size: 0xf5
function function_287cfa9abfa54df8() {
    level endon("flag_chunnel_finale_wave_3_dead");
    level endon("flg_script_set_finale_wave_3_dead");
    count = 0;
    while (count < 2) {
        level.player utility::waittill_any_timeout_1(3, "weapon_fired");
        wait 1;
        if (utility::flag("flag_chunnel_finale_wave_3_dead") || utility::flag("flg_script_set_finale_wave_3_dead")) {
            return;
        }
        if (count == 0) {
            level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_keepemoffmecaptain", 0);
            level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_staydownsergeant", 0);
            wait randomfloatrange(5, 8);
        } else {
            level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_icandothissircoverme", 0);
            level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_imonem", 0);
        }
        count += 1;
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3e3
// Size: 0x1a5
function function_9081dca75d5597fa() {
    level endon("flg_third_bomb_interact_complete");
    animnode = self;
    level.player namespace_7c8eb980997d0c0f::function_fc0eb6b81c66c661(1, "dx_sp_surg_ssoa_pric_wereclearpoliceareki", 2);
    wait 0.5;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag01");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_lessthanaminuteleftc", 2);
    wait 8.5;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag02");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_werelosingtimecaptai", 2);
    wait 8.6;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag03");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_timerscoutindownlets", 2);
    wait 8.2;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag04");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_wererunningoutoftime_01", 2);
    wait 7.5;
    animnode thread scene::play([level.var_9f0ca2b82636560f, level.var_4a6f34f573a7250], "cable_cut_nag05");
    level.var_9f0ca2b82636560f dialogue::say_team("dx_sp_surg_ssoa_soap_ineedyoureyesonthatc", 2);
    wait 8;
    animnode thread function_4fec720fd51f5ca9("flg_snakecam_first_enter_timeout", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf590
// Size: 0x29e
function function_7cefb308a23b7659() {
    level endon("flag_defusal_fail");
    level endon("flag_defusal_2_success");
    utility::autosave_by_name();
    function_4256d29a648763ba();
    var_b4133984a5178648 = [[level.var_292c01a9cd0b2818, 0.6, "dx_sp_surg_ssoa_ghos_07tosixwerepunchingt"], [level.player, 0.2, "dx_sp_surg_ssoa_pric_gethere"], [level.player, 0.6, "dx_sp_surg_ssoa_pric_whatsnextsoap"], [level.player, 0.5, "dx_sp_surg_ssoa_soap_locatetheblastingcap"]];
    level dialogue::say_sequence(var_b4133984a5178648, 2, 0, 0, 0, "team");
    var_15d48365e45fedfc = getstruct("s_bomb_serial_num", "targetname");
    if (!isdefined(var_15d48365e45fedfc)) {
        var_15d48365e45fedfc = spawnstruct();
        var_15d48365e45fedfc.origin = (-54102.8, 60321.8, 484.5);
    }
    var_15d48365e45fedfc thread function_45a191c0ccc354f0("flag_defusal_2_success");
    msg = utility::flag_wait_any_return("flg_bomb_puzzle_spotted", "flg_bomb_puzzle_search_timeout");
    if (msg == "flg_bomb_puzzle_search_timeout") {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_bloodyhellweretoolat", 3);
        utility::flag_set("flag_defusal_fail");
        return;
    }
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_pric_copyblastingcapattac", 2);
    level.player dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_ayetheresaserialnumb", 2);
    level thread function_af605055f4473a4c();
    var_213f147e9d671a83 = function_ec88473743bbf110();
    if (!isdefined(var_213f147e9d671a83)) {
        level.var_9f0ca2b82636560f dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_soap_bloodyhellweretoolat", 3);
        utility::flag_set("flag_defusal_fail");
        return;
    }
    switch (var_213f147e9d671a83) {
    case 2: 
        level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_soap_copygoodworkthisbomb", 2);
        level.player setsoundsubmix("sp_jup_surg_chunnel_finale_mix_makarov_shot");
        utility::flag_set("flag_defusal_2_success");
        break;
    case 0:
    case 1:
    case 3:
    default: 
        level.player dialogue::function_fc0eb6b81c66c661(0.3, "dx_sp_surg_ssoa_soap_copystandby", 2);
        wait 0.5;
        utility::flag_set("flag_defusal_fail");
        return;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf836
// Size: 0x26
function function_af605055f4473a4c() {
    level endon("flg_chunnel_finale_snakecam_02_answer_given");
    wait 3;
    level.player dialogue::say_team("dx_sp_surg_ssoa_soap_thirdnumbercaptainfi", 1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf864
// Size: 0x164
function function_ec88473743bbf110() {
    var_30f7cf84cdc85242 = [0, 1, 2, 3];
    var_30f7cf84cdc85242 = array_randomize(var_30f7cf84cdc85242);
    var_1b8b2ec73f492162 = [%SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH2_OPTION1, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH2_OPTION2, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH2_OPTION3, %SP_JUP_SURGE/CHUNNEL_BOMB_DEFUSE_DIALOG_BRANCH2_OPTION4];
    var_1b8b2ec73f492162 = function_67f411b123f0cf9(var_30f7cf84cdc85242, var_1b8b2ec73f492162);
    var_151363a8275820fb = ["dx_sp_surg_ssoa_pric_thirdnumbersasix", "dx_sp_surg_ssoa_pric_numbersix"];
    var_151365a827582561 = ["dx_sp_surg_ssoa_pric_thethirdnumberisanin", "dx_sp_surg_ssoa_pric_numbernine"];
    var_151362a827581ec8 = ["dx_sp_surg_ssoa_pric_thirdnumberisafive", "dx_sp_surg_ssoa_pric_itsafive"];
    var_151364a82758232e = ["dx_sp_surg_ssoa_pric_thethirdnumberisaone", "dx_sp_surg_ssoa_pric_oneitsaone"];
    var_5c76167572fce9c1 = [var_151363a8275820fb[randomintrange(0, var_151363a8275820fb.size)], var_151362a827581ec8[randomintrange(0, var_151362a827581ec8.size)], var_151365a827582561[randomintrange(0, var_151365a827582561.size)], var_151364a82758232e[randomintrange(0, var_151364a82758232e.size)]];
    var_5c76167572fce9c1 = function_67f411b123f0cf9(var_30f7cf84cdc85242, var_5c76167572fce9c1);
    var_d9537912526addd1 = function_945718bb107da39e(var_5c76167572fce9c1, var_1b8b2ec73f492162, 15, 0, "flg_chunnel_finale_snakecam_02_answer_given");
    var_213f147e9d671a83 = var_30f7cf84cdc85242[var_d9537912526addd1 - 1];
    return var_213f147e9d671a83;
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf9d1
// Size: 0x3a
function function_ef8381859b661508() {
    thread function_582c8ff6886854cb();
    thread autosave_by_name();
    utility::flag_wait("flg_door_closed");
    level.ai_ghost dialogue::function_fc0eb6b81c66c661(0.2, "dx_sp_surg_ssoa_ghos_bloodyhell", 2);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa13
// Size: 0xd
function function_582c8ff6886854cb() {
    setmusicstate("mx_surge_soap");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa28
// Size: 0xd5
function function_ca3c3c9efac4f12() {
    level.var_85e0e3c0d71ec871 waittill("konni_call_out");
    utility::flag_set("flg_price_hand_crush");
    while (!isdefined(level.var_fc28037722b41a8a)) {
        waitframe();
    }
    utility::battlechatter_off("axis");
    level.var_fc28037722b41a8a endon("death");
    level.var_fc28037722b41a8a endon("entitydeleted");
    wait 1.25;
    level.var_fc28037722b41a8a dialogue::say("dx_sp_surg_ssoa_kon1_enemysmovingup", 0);
    wait 0.5;
    level.var_fc28037722b41a8a dialogue::say("dx_sp_surg_hcqc_kon1_openingheavyfire", 0);
    wait 1.2;
    level.var_fc28037722b41a8a dialogue::say("dx_sp_surg_ssoa_kon3_igotyoumove", 0);
    wait 2.5;
    level.var_fc28037722b41a8a dialogue::say("dx_sp_surg_hcqc_kon1_slowthemdown", 0);
    utility::battlechatter_on("axis");
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb05
// Size: 0x70
function function_b4f901f92a5157d4() {
    level.ai_ghost waittill("ghost_calling_johnny");
    utility::battlechatter_on("axis");
    level.ai_ghost dialogue::say_team("dx_sp_surg_ssoa_ghos_johnny", 2);
    utility::flag_wait("flg_final_defuse_interact_triggered");
    level.var_d18d63c6d75cd1e waittill("outro_price_final_comms");
    wait 7.25;
    level.var_f76b2ac280893f92 thread scene::play(undefined, undefined, undefined, 0.1);
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb7d
// Size: 0xf1
function function_b0229a7f1a5b90c8() {
    level endon("flg_final_defuse_interact_triggered");
    b_repeat = 1;
    animnode = self;
    while (b_repeat == 1 && isdefined(level.var_9f0ca2b82636560f)) {
        var_865048328835e385 = utility::within_fov_of_players(level.var_9f0ca2b82636560f geteye(), cos(45));
        if (isdefined(level.var_9f0ca2b82636560f)) {
            var_ac080aa961b986fe = level.player utility::can_trace_to_ai(level.player geteye(), level.var_9f0ca2b82636560f);
            if (flag("flg_gaz_nag3")) {
                b_repeat = 0;
            } else if ((flag("flg_gaz_nag1") || flag("flg_gaz_nag2")) && istrue(var_865048328835e385) && istrue(var_ac080aa961b986fe)) {
                level flag_set("flg_soap_dead_remind");
                b_repeat = 0;
            }
        }
        wait 1;
    }
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc76
// Size: 0x139
function function_e7f1c451b53b8ad2() {
    level endon("flg_final_defuse_interact_triggered");
    animnode = self;
    animnode thread function_b0229a7f1a5b90c8();
    wait 3;
    level flag_set("flg_gaz_nag1");
    wait 2;
    if (!flag("flg_soap_dead_remind")) {
        animnode thread scene::play(level.var_d18d63c6d75cd1e, "nag1");
        wait 5.5;
    } else {
        animnode thread scene::play(level.var_d18d63c6d75cd1e, "nag3_alt");
        level flag_clear("flg_soap_dead_remind");
        wait 6.9;
    }
    level flag_set("flg_gaz_nag2");
    wait 1;
    if (!flag("flg_soap_dead_remind")) {
        animnode thread scene::play(level.var_d18d63c6d75cd1e, "nag2");
        wait 4.5;
    } else {
        animnode thread scene::play(level.var_d18d63c6d75cd1e, "nag3_alt");
        level flag_clear("flg_soap_dead_remind");
        wait 6.9;
    }
    level flag_set("flg_gaz_nag3");
    animnode thread scene::play(level.var_d18d63c6d75cd1e, "nag3");
    wait 6.3;
    utility::flag_set("flg_snakecam_first_enter_timeout");
    level thread function_810d67576ecea89c();
}

// Namespace namespace_f43c40f7bcbe17e7 / namespace_a5d45e477309ced5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb7
// Size: 0x58
function function_be9033d931c1127e() {
    level endon("flg_play_outro_time");
    animnode = self;
    wait 4;
    animnode thread scene::play(level.var_d18d63c6d75cd1e, "scene_nag2");
    level.var_d18d63c6d75cd1e dialogue::say_team("dx_sp_surg_ssoa_gazz_5secondscapcomeon", 1);
    wait 3;
    level thread function_810d67576ecea89c();
}

