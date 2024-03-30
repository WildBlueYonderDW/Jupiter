// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_intel_cs;

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_intel_cs");
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d
// Size: 0x3c8
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (28233.5, -32243, 4036), (0, 69.2, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_heresyourexpert");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    fe [[ f ]](s, us, cf, (39170, -18654.5, 3216.5), (0, 209.97, 0), "deadbolt_audio_intel", undefined, "intel_s0_deadbolt_audio_testing");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    fe [[ f ]](s, us, cf, (22701, -20478.5, 2896), (351.41, 295.74, -55.62), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_intheturn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    fe [[ f ]](s, us, cf, (30317, -22010, 3296), (0, 34.76, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_shoot_them");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_ranch_house_lg_01";
    fe [[ f ]](s, us, cf, (42027.2, -26919.8, 3482.19), (0, 126.17, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_gym_01";
    fe [[ f ]](s, us, cf, (23797, -33271.2, 3681.56), (0, 248.62, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.name = "note_intel";
    fe [[ f ]](s, us, cf, (43058.5, -28909, 3139), (357.6, 24.39, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_09");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_manor_guest_house_02";
    fe [[ f ]](s, us, cf, (29398.4, -26545.5, 3294.13), (0, 236.88, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_i_house_lg_01";
    fe [[ f ]](s, us, cf, (39544.3, -27577.1, 3158.96), (0, 291.3, 0), "terminus_audio_intel_warlord");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_intel_cs / namespace_8f46b09318ad3639
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x766
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_intel_cs");
}

