#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_h_ob_activities_mrp_challenges_cs / namespace_cedbec4febf11dff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_mrp_challenges_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_mrp_challenges_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_mrp_challenges_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_mrp_challenges_cs / namespace_cedbec4febf11dff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_mrp_challenges_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_mrp_challenges_cs");
}

// Namespace mp_jup_st_h_ob_activities_mrp_challenges_cs / namespace_cedbec4febf11dff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x203
// Size: 0x8e
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_mrp_challenges_cs";
    fe [[ f ]](s, us, cf, (15489.5, -38552.3, 5184.63), (0, 110.66, 0), "mrp_challenge", undefined, "mrp_crane_scare_challenge");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_mrp_challenges_cs / namespace_cedbec4febf11dff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_mrp_challenges_cs / namespace_cedbec4febf11dff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_mrp_challenges_cs");
}

