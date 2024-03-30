// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_intel_cs;

// Namespace mp_jup_st_h_ob_intel_cs / namespace_3c680bd2b1c17c5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_intel_cs / namespace_3c680bd2b1c17c5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_intel_cs");
}

// Namespace mp_jup_st_h_ob_intel_cs / namespace_3c680bd2b1c17c5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b9
// Size: 0x42a
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (11368, -25691.5, 2224), (0, 182.46, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_weneedresp");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (2531, -31770, 1953), (0, 16.77, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_somethingravenov");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (3956, -14040.5, 1415.5), (351.7, 231.58, -3.3), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_wileymimic");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    fe [[ f ]](s, us, cf, (16151, -38307, 6545), (0, 293.66, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_mistake");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_h_apartment_17";
    fe [[ f ]](s, us, cf, (8462.5, -36040.5, 3090.5), (0, 134.05, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_h_apartment_18";
    fe [[ f ]](s, us, cf, (3224.6, -29565.3, 2350.69), (0, 210.77, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (1118, -18015, 1750), (0, 161.91, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_08");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_h_apartment_22";
    fe [[ f ]](s, us, cf, (12545.1, -35921, 2925.97), (0, 106.79, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_h_apartment_construction_02";
    fe [[ f ]](s, us, cf, (5530.6, -26994.2, 2037.62), (0, 254.99, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_h_apartment_21";
    fe [[ f ]](s, us, cf, (3897.3, -27414.9, 2054.69), (0, 172.46, 0), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_intel_cs / namespace_3c680bd2b1c17c5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ea
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_intel_cs / namespace_3c680bd2b1c17c5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_intel_cs");
}

