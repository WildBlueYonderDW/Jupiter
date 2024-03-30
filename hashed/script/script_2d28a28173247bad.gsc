// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_gas_stations;

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_gas_stations")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_gas_stations");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_gas_stations");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_gas_stations");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_gas_stations");
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9
// Size: 0x1d3
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (31336, 44360, 844), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_gas_stations";
    fe [[ f ]](s, us, cf, (30976, 34528, 1216), (0, 0, 0), "gas_station", "mp_jup_bigmap_c_gas_station_1", "large");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_gas_stations";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 1000;
    fe [[ f ]](s, us, cf, (30848, 34296, 1192), (0, 0, 0), "mp_jup_bigmap_c_gas_station_1", undefined, undefined, undefined, undefined, undefined, undefined, 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_gas_stations";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.height = 1000;
    fe [[ f ]](s, us, cf, (30928, 34800, 1192), (0, 0, 0), "mp_jup_bigmap_c_gas_station_1", undefined, undefined, undefined, undefined, undefined, undefined, 600);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b3
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_gas_stations / namespace_2469fcf354bc890d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_gas_stations");
}

