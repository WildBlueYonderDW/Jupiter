#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_gas_stations;

// Namespace mp_jup_st_i_gas_stations / namespace_f2713faa50431351
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_gas_stations")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_gas_stations");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_gas_stations");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_gas_stations / namespace_f2713faa50431351
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_gas_stations");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_gas_stations");
}

// Namespace mp_jup_st_i_gas_stations / namespace_f2713faa50431351
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb
// Size: 0xda
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.height = 1000;
    fe [[ f ]](s, us, cf, (23156, -18460, 2876), (0, 0, 0), "gas_station", undefined, "large", undefined, undefined, undefined, undefined, 600);
    s = s();
    s.height = 1000;
    fe [[ f ]](s, us, cf, (34868, -28644, 2912), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_gas_stations / namespace_f2713faa50431351
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

