// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_intel_cs;

// Namespace mp_jup_st_g_ob_intel_cs/namespace_980316b575ac5e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_intel_cs/namespace_980316b575ac5e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_intel_cs");
}

// Namespace mp_jup_st_g_ob_intel_cs/namespace_980316b575ac5e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444
// Size: 0x550
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12268.5, -37391, 2541.5), (0, 289.46, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_imokay");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6028, -26034, 2912.5), (0, 211.35, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_mobilearmor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6138.5, -32672.5, 2277.5), (0, 214, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_hellhound");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_car_dealership_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10597, -12182.6, 1919.02), (0, 222.31, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_university_building_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12732, -40048.9, 2641.52), (0, 19.75, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22547, -42373, 3061), (0, 74.42, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_opportunity");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.name = "note_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23365, -26490.5, 1756), (0, 258.78, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_07");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_clinic_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14881.4, -42233.8, 3181.58), (0, 108.16, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_apartment_02";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5909.61, -12987.4, 2022.11), (0, 226.74, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_apartment_21";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2237.79, -19755.1, 1883.97), (0, 54.28, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_restaurant_02";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6929.32, -18226.2, 1901.66), (0, 54.08, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_station_house_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28011.7, -15103.5, 1748.88), (0, 253.37, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_g_apartment_18";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18730.3, -31277.2, 2226.05), (0, 270.83, 0), "terminus_audio_intel_warlord");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_intel_cs/namespace_980316b575ac5e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99b
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_intel_cs/namespace_980316b575ac5e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a5
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_intel_cs");
}

