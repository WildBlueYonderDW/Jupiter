// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_a_ob_activities_mrp_challenges_cs/namespace_7d12a25cf603c57b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_activities_mrp_challenges_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_activities_mrp_challenges_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_activities_mrp_challenges_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_activities_mrp_challenges_cs/namespace_7d12a25cf603c57b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_activities_mrp_challenges_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_activities_mrp_challenges_cs");
}

// Namespace mp_jup_st_a_ob_activities_mrp_challenges_cs/namespace_7d12a25cf603c57b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb
// Size: 0xe4
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_mrp_challenges_cs";
    s.var_5aecf2b796ff4569 = "122,1024,550";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22034, 30514, 2854), (0, 332, 0), "cspf_0_auto10862537481892710558");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21817, 30395, 2683.81), (357.91, 141.87, 0), "mrp_challenge", "cspf_0_auto10862537481892710558", "mrp_freebird_challenge");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_activities_mrp_challenges_cs/namespace_7d12a25cf603c57b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_activities_mrp_challenges_cs/namespace_7d12a25cf603c57b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_activities_mrp_challenges_cs");
}

