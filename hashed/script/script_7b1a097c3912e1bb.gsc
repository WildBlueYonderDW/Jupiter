// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs/namespace_3524338e05fdd14b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_mrp_challenges_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_mrp_challenges_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_mrp_challenges_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs/namespace_3524338e05fdd14b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_mrp_challenges_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_mrp_challenges_cs");
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs/namespace_3524338e05fdd14b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x1a1
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,0";
    s.var_5aecf2b796ff4569 = "1775,2328,104";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29949.5, -31892.5, 4030), (0, 338, 0), "cspf_0_auto7695778732172682743", "cspf_0_auto4998820333051875554");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,0";
    s.var_5aecf2b796ff4569 = "800,1430,240";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29860, -31880, 3438.17), (0, 336, 0), "cspf_0_auto4998820333051875554", "cspf_0_auto13589125057381484447");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30084, -31112, 3564), (0, 250, 0), "cspf_0_auto13589125057381484447");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29594.8, -32136.5, 3574.5), (2.26, 17.58, 1.08), "mrp_challenge", "cspf_0_auto7695778732172682743", "mrp_pool_challenge");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs/namespace_3524338e05fdd14b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_mrp_challenges_cs/namespace_3524338e05fdd14b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fb
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_mrp_challenges_cs");
}

