#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_intel_cs;

// Namespace mp_jup_st_e_ob_intel_cs / namespace_4a9cd794b84f1429
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a3
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_intel_cs / namespace_4a9cd794b84f1429
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_intel_cs");
}

// Namespace mp_jup_st_e_ob_intel_cs / namespace_4a9cd794b84f1429
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x67c
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (-6966, -5509, 2186), (0, 285.79, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_hereagain");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (19282, -8022, 2423.5), (0, 45.07, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_oldschool");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (6296, -5541.5, 3094), (0, 210, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_megabomb");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (22443.5, -1908, 2385.5), (18.03, 318.48, 59.65), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_disciple");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (6232.5, 9922, 1490.5), (0, 18.17, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_05");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_radio_intel";
    fe [[ f ]](s, us, cf, (1928, 4416, 2050.5), (89.17, 167.41, 173.21), "terminus_radio_intel", undefined, "intel_s0_terminus_radio_fletscareme");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_radio_intel";
    fe [[ f ]](s, us, cf, (11769, 275, 1666), (0, 208.67, 0), "terminus_radio_intel", undefined, "intel_s0_terminus_radio_fletinspire");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (12038, -9614, 1816), (0, 348.02, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_06");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (-6791, 8436.5, 2567), (0, 187.83, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_chaosdown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_warehouse_ind_02";
    fe [[ f ]](s, us, cf, (-8151.5, 7864.25, 1103), (0, 344.21, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_office_lg_02";
    fe [[ f ]](s, us, cf, (-13849.3, 11792, 1449), (0, 209.65, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_office_md_02";
    fe [[ f ]](s, us, cf, (-17546.6, 4379.88, 1447.81), (0, 182.63, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_low_town_18";
    fe [[ f ]](s, us, cf, (20277.9, -1939.11, 2188.82), (0, 257.63, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_low_town_15_b";
    fe [[ f ]](s, us, cf, (20612.8, 988, 2226.5), (0, 118.31, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_low_town_10";
    fe [[ f ]](s, us, cf, (21735.2, -4873.75, 2423.22), (0, 359.43, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_e_low_town_19";
    fe [[ f ]](s, us, cf, (18195.3, -2872.82, 1994.93), (0, 251.89, 0), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_intel_cs / namespace_4a9cd794b84f1429
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_intel_cs / namespace_4a9cd794b84f1429
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb14
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_intel_cs");
}

