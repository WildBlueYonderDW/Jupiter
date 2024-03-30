// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_intel_cs;

// Namespace mp_jup_st_d_ob_intel_cs / namespace_71ff6e94606912fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_intel_cs / namespace_71ff6e94606912fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_intel_cs");
}

// Namespace mp_jup_st_d_ob_intel_cs / namespace_71ff6e94606912fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0x430
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (-28224.5, 9753.5, 1171), (0, 185.31, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_quartrmstr");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (-15895.5, -22178.5, 4664), (0, 343.53, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_keepitrun");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (-14292, -13873.5, 1849), (0, 87.9, 38.67), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_1stimpress");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (-34428, -32089.5, 2058), (0, 173.19, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_ifneedride");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    fe [[ f ]](s, us, cf, (-27337, -11357.5, 1665.25), (0, 172.2, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_noharm");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (-18946, 4916, 1451), (0, 275.3, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_04");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_d_marina_building_10";
    fe [[ f ]](s, us, cf, (-31667.4, 8286.45, 1364.6), (0, 97.63, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_d_house_md_03";
    fe [[ f ]](s, us, cf, (-21595.8, 8742.5, 2553), (0, 217.63, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_d_house_md_08";
    fe [[ f ]](s, us, cf, (-32976, 14796.3, 1108.72), (359.93, 277.8, -3.86), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_d_house_md_08_2";
    fe [[ f ]](s, us, cf, (-19164.8, 9348.75, 2135.5), (0.23, 62.49, -4.12), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_intel_cs / namespace_71ff6e94606912fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_intel_cs / namespace_71ff6e94606912fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7de
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_intel_cs");
}

