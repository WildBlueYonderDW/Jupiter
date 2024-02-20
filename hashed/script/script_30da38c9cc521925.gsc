// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_intel_cs;

// Namespace mp_jup_st_a_ob_intel_cs/namespace_16bfbb20bc60bda9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_intel_cs/namespace_16bfbb20bc60bda9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_intel_cs");
}

// Namespace mp_jup_st_a_ob_intel_cs/namespace_16bfbb20bc60bda9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x3c8
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24982.5, 36842, 2248), (0, 50.27, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_we_didnt_train");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30098, 21267, 1455), (0, 233.8, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_symbiosis");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30681, 29451.5, 1395), (0, 20.16, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_fishwater");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22268, 18469.5, 1653), (0, 308.93, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_ideologies");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_a_store_abandoned_lg_02";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23108.5, 17638.6, 1669.8), (0, 138.73, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.name = "note_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36899, 42701, 1801), (0, 209.62, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_01");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_a_apartment_abandoned_md_02";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23778.7, 39317.3, 2268.83), (0, 45, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_a_apartment_abandoned_24";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28559.6, 42105.8, 1717.84), (0, 244.93, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_a_store_abandoned_md_01_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32262.1, 23458.3, 1454.59), (0, 117.63, 0), "terminus_audio_intel_warlord");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_intel_cs/namespace_16bfbb20bc60bda9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x776
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_intel_cs/namespace_16bfbb20bc60bda9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x780
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_intel_cs");
}

