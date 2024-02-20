// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_bigmap_ob_rift_gate_cs;

// Namespace mp_jup_bigmap_ob_rift_gate_cs/namespace_580fdd1a01eb7ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_bigmap_ob_rift_gate_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_bigmap_ob_rift_gate_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_bigmap_ob_rift_gate_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_bigmap_ob_rift_gate_cs/namespace_580fdd1a01eb7ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_bigmap_ob_rift_gate_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_bigmap_ob_rift_gate_cs");
}

// Namespace mp_jup_bigmap_ob_rift_gate_cs/namespace_580fdd1a01eb7ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0x301
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6250, -12231, 1415), (1.9, 285, 1.9), "electric", "s1_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5851.14, -12232.5, 1432.38), (1.65, 254.99, 3.55), "toxic", "s1_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5552, -12050, 1465), (0.56, 224.72, 1), "ice", "s1_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6550, -12048, 1443), (1.1, 314.95, -2.5), "fire", "s1_rift_gate", "ob_rift_gate_pedestal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6050, -11446, 1495), (0, 179.4, 0), "s1_rift_gate", undefined, "ob_rift_gate");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    s.script_label = "low";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5856, -11488, 1548), (0, 0, 90), "s1_rift_token_prompt", "s1_rift_gate", "ob_rift_token_prompt");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    s.script_label = "high";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6244, -11404, 1548), (0, 180, 90), "s1_rift_token_prompt", "s1_rift_gate", "ob_rift_token_prompt");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6053, -11503, 1503), (0, 268.5, 0), "s1_rift_encounter", "s1_rift_gate", "ob_rift_encounter");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_bigmap_ob_rift_gate_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6051, -11899, 1502), (0, 270, 0), "s1_rift_gate_reward", "s1_rift_gate", "ob_rift_gate_reward");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_bigmap_ob_rift_gate_cs/namespace_580fdd1a01eb7ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_bigmap_ob_rift_gate_cs/namespace_580fdd1a01eb7ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x574
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_bigmap_ob_rift_gate_cs");
}

