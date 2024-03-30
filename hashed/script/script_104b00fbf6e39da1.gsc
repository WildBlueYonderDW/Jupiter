// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_intel_cs;

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_intel_cs");
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce
// Size: 0x42a
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (32629.5, 36250, 1240.5), (0, 45, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_whothisguy");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (36961, 18882, 3834), (0, 307.63, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_byemom");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (25382, 32726.5, 2301), (0, 214.66, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_never_fear");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    fe [[ f ]](s, us, cf, (23351, 21726, 1532), (0, 178.1, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_illshowyou");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_subbase_warehouse_02";
    fe [[ f ]](s, us, cf, (32014.9, 39906.5, 1216), (0, 185, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (32667.5, 26917, 1735), (0, 178.75, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_03");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_countdown_office_2s_01";
    fe [[ f ]](s, us, cf, (35840.5, 29502.4, 1975.5), (0, 59.44, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_milbase_office_2s_02";
    fe [[ f ]](s, us, cf, (32175.6, 30044.8, 1504.75), (4.03, 59.67, -0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_milbase_warehouse_01";
    fe [[ f ]](s, us, cf, (24254.8, 34044.6, 1784.15), (0, 20.25, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_c_police_station_01_b";
    fe [[ f ]](s, us, cf, (27751, 24056.5, 1619.68), (0, 80.91, 0), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_intel_cs / namespace_fb9f50dc60f06e5d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x809
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_intel_cs");
}

