// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_exfil_cs;

// Namespace mp_jup_st_i_ob_exfil_cs/namespace_151106a3ec6d4505
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_exfil_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_exfil_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_exfil_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_exfil_cs/namespace_151106a3ec6d4505
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_exfil_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_exfil_cs");
}

// Namespace mp_jup_st_i_ob_exfil_cs/namespace_151106a3ec6d4505
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346
// Size: 0x433
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.name = "exfil_content_destination_manor";
    s.variantname = "content_destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27950, -25725, 1861), (0, 0, 0), "ob_st_i_manor_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.content_key = "exfil_interact";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23668, -35635, 3408), (358.7, 108.31, 4), "exfil_content_struct_manor_west", "exfil_content_instance_manor_west");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24755.5, -35364.9, 3499), (0, 314.57, 0), "exfil_content_instance_manor_west", "exfil_tile_i_manor_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.variantname = "content_location";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28203, -25913, 1715), (0, 0, 0), "exfil_tile_i_manor_location", "ob_st_i_manor_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (46507.4, -35954.2, 6114), (0, 95, 0), "cspf_0_auto1525938847763494437", "cspf_0_auto87152684517921089");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (50210.8, -34804.6, 8164), (0, 185, 0), undefined, "cspf_0_auto1525938847763494437", "exfil_content_struct_manor_west");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43771.9, -40634.8, 6964), (0, 95, 0), "cspf_0_auto87152684517921089", "cspf_0_auto13153500851605361418");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38192.9, -40009.7, 6533), (0, 95, 0), "cspf_0_auto13153500851605361418", "cspf_0_auto3159671482355696337");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32978.3, -41779.9, 5688), (0, 95, 0), "cspf_0_auto3159671482355696337", "cspf_0_auto9472831467943339569");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28759.6, -40532, 4613), (0, 95, 0), "cspf_0_auto9472831467943339569", "cspf_0_auto9309664513282600956");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24941.7, -37334.5, 4562), (0, 95, 0), "cspf_0_auto9309664513282600956");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_exfil_cs/namespace_151106a3ec6d4505
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x780
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_exfil_cs/namespace_151106a3ec6d4505
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78a
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_exfil_cs");
}

