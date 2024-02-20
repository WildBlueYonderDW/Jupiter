// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_machines_cs;

// Namespace mp_jup_st_g_ob_machines_cs/namespace_d3cdad60be79885b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_machines_cs/namespace_d3cdad60be79885b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_machines_cs");
}

// Namespace mp_jup_st_g_ob_machines_cs/namespace_d3cdad60be79885b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd
// Size: 0x6dd
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23229, -31910, 1953), (0.81, 76.69, -0.55));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4441.37, -22778.3, 1566.04), (0, 81.76, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15279, -22632, 1716), (0, 342.48, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24526, -23286.9, 1698.01), (0, 347.48, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6678, -30636, 1751), (0, 348.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22836, -11485, 1504.98), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17232.9, -36981.2, 2453.98), (0, 68.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11943.2, -24096, 5224), (0, 6.73, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20417, -29054, 1832), (0, 132.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20729, -15917, 1512), (0, 298.92, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8240, -9146, 1579), (0, 224.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30092, -10698, 1545), (0, 150.4, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14441.5, -13650.3, 1963.98), (0, 283.9, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13450.8, -19886.7, 1816), (0, 314.83, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-10420, -40184, 2781.5), (0, 19.93, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_machines_cs/namespace_d3cdad60be79885b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c1
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_machines_cs/namespace_d3cdad60be79885b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cb
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_machines_cs");
}

