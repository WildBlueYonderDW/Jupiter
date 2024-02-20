// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_mrp_challenges_cs;

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs/namespace_ba51c223aee60827
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_mrp_challenges_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_mrp_challenges_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_mrp_challenges_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs/namespace_ba51c223aee60827
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_mrp_challenges_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_mrp_challenges_cs");
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs/namespace_ba51c223aee60827
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0x1cb
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26612.9, 15274.8, 1208.56), (0, 216.96, 0), "mrp_challenge", "cspf_0_auto16462695108949401329", "mrp_bonfire_challenge");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26654.6, 15257.1, 1159.06), (0, 0, 0), "cspf_0_auto769974789794915257", "cspf_0_auto3802287165048353679", undefined, undefined, undefined, undefined, undefined, 75);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    s.trigger_offset = "0,0,40";
    s.var_5aecf2b796ff4569 = "289,307,80";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26650.3, 15250.6, 1186.56), (0, 0, 0), "cspf_0_auto3802287165048353679", "cspf_0_auto12072329909755738250");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26509.3, 15109.6, 1207.56), (0, 0, 0), "cspf_0_auto12072329909755738250");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_mrp_challenges_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26651.1, 15253.5, 1192.56), (0, 0, 0), "cspf_0_auto16462695108949401329", "cspf_0_auto769974789794915257");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs/namespace_ba51c223aee60827
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_mrp_challenges_cs/namespace_ba51c223aee60827
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x438
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_activities_mrp_challenges_cs");
}

