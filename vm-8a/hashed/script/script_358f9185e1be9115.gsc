#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_gas_stations;

// Namespace mp_jup_st_h_gas_stations / namespace_db64ae640647c5cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_gas_stations")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_gas_stations");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_gas_stations");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_gas_stations / namespace_db64ae640647c5cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_gas_stations");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_gas_stations");
}

// Namespace mp_jup_st_h_gas_stations / namespace_db64ae640647c5cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x100
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (-7737.5, -41914, 2423), (0, 0, 0), "gas_station", undefined, "large", undefined, undefined, undefined, undefined, 600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (9136, -20192, 1696), (0, 0, 0), "gas_station", undefined, "large", undefined, undefined, undefined, undefined, 600);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_gas_stations / namespace_db64ae640647c5cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_gas_stations / namespace_db64ae640647c5cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_gas_stations");
}

