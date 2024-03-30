// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_intel_cs;

// Namespace mp_jup_st_b_ob_intel_cs / namespace_8e46d5b715494c39
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_intel_cs / namespace_8e46d5b715494c39
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_intel_cs");
}

// Namespace mp_jup_st_b_ob_intel_cs / namespace_8e46d5b715494c39
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b9
// Size: 0x42a
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (1873.5, 23650, 1179), (0, 253.56, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_neverfun");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (878, 32838, 1465.5), (0, 359.32, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_imafed");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (4160, 28153.5, 1035.5), (0, 341.95, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_welcome");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_radio_intel";
    fe [[ f ]](s, us, cf, (-10560.5, 30022, 1216), (0, 165.72, 0), "terminus_radio_intel", undefined, "intel_s0_terminus_radio_whatdoyou");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_b_office_lg_01";
    fe [[ f ]](s, us, cf, (7848.92, 24942.2, 1198), (0, 343.03, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (11468.5, 36037.5, 1345), (0, 176.26, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_02");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_b_coalplant_office_02";
    fe [[ f ]](s, us, cf, (-8485.59, 35103.4, 1452.8), (0.99, 84.1, -0.1), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_b_store_abandoned_md_01";
    fe [[ f ]](s, us, cf, (-9188.75, 19172.2, 1672), (0.36, 90.1, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_b_factory_md_3s_01";
    fe [[ f ]](s, us, cf, (5812.57, 31310.2, 1408.6), (0.73, 346.2, -0.24), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_b_station_house_01_a";
    fe [[ f ]](s, us, cf, (10766.2, 36134.7, 1486.62), (1, 85.8, -0.07), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_intel_cs / namespace_8e46d5b715494c39
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ea
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_intel_cs / namespace_8e46d5b715494c39
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_intel_cs");
}

