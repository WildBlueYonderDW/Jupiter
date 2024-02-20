// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_aether_storm_cs;

// Namespace mp_jup_st_e_ob_aether_storm_cs/namespace_5c747362b650ddec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_aether_storm_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_aether_storm_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_aether_storm_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_aether_storm_cs/namespace_5c747362b650ddec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_aether_storm_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_aether_storm_cs");
}

// Namespace mp_jup_st_e_ob_aether_storm_cs/namespace_5c747362b650ddec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x78
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1036, 1750, 2008), (0, 0, 0), "aether_storm_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_aether_storm_cs/namespace_5c747362b650ddec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

