// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_machines_cs;

// Namespace mp_jup_st_d_ob_machines_cs/namespace_dfc7245f67d19553
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_machines_cs/namespace_dfc7245f67d19553
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_machines_cs");
}

// Namespace mp_jup_st_d_ob_machines_cs/namespace_dfc7245f67d19553
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb
// Size: 0x277
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34378, 3743, 969), (0, 190, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22900, 957, 1241), (0, 100.59, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23360, 12051, 2083), (0, 126.83, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32554, 11895, 960), (0, 280.06, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32797.8, 12504.2, 1104), (0, 100.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27680, -2264, 1729), (0, 190.9, 2));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_machines_cs/namespace_dfc7245f67d19553
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_machines_cs/namespace_dfc7245f67d19553
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_machines_cs");
}

