// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_machines_cs;

// Namespace mp_jup_st_a_ob_machines_cs/namespace_76a8704be68c429f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_machines_cs/namespace_76a8704be68c429f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_machines_cs");
}

// Namespace mp_jup_st_a_ob_machines_cs/namespace_76a8704be68c429f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da
// Size: 0x3f9
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21665, 30321, 2174), (0, 153.64, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27316, 39122, 1573), (0, 243.71, 0), undefined, undefined, "in_gas_station");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28435, 30378, 1577), (0, 297.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22182, 24738, 1711), (0, 339.7, 0), undefined, undefined, "in_gas_station");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31277, 33606.3, 1712), (0, 297.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35575, 29269, 1040), (0, 19.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23861, 17855, 1520), (0, 179.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30462.7, 31317.7, 2664), (0, 27.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29734.8, 41752.3, 1695), (0, 153.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35017.9, 41355.3, 1640.95), (0, 129.71, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_machines_cs/namespace_76a8704be68c429f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_machines_cs/namespace_76a8704be68c429f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_machines_cs");
}

