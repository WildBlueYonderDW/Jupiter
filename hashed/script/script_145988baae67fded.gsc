// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_gas_stations;

// Namespace mp_jup_st_d_gas_stations/namespace_9661b1840de4663d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_gas_stations")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_gas_stations");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_gas_stations");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_gas_stations/namespace_9661b1840de4663d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_gas_stations");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_gas_stations");
}

// Namespace mp_jup_st_d_gas_stations/namespace_9661b1840de4663d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb
// Size: 0x205
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_gas_stations";
    s.height = 1000;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25124, -1608, 1012), (0, 0, 0), "gas_station", undefined, "large", undefined, undefined, undefined, undefined, 600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_gas_stations";
    s.height = 1000;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35524, 5224, 864), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_gas_stations";
    s.height = 1000;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31053.5, -929, 864), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_gas_stations";
    s.height = 1000;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33889.5, 15155.5, 858.5), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_gas_stations";
    s.height = 1000;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18055, -3462.5, 864), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_gas_stations/namespace_9661b1840de4663d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_gas_stations/namespace_9661b1840de4663d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_gas_stations");
}

