#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_e_ob_activities_summon_cs;

// Namespace mp_jup_st_e_ob_activities_summon_cs / namespace_30cb5b88514b09be
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x151
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activities_summon_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activities_summon_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activities_summon_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activities_summon_cs / namespace_30cb5b88514b09be
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activities_summon_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activities_summon_cs");
}

// Namespace mp_jup_st_e_ob_activities_summon_cs / namespace_30cb5b88514b09be
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x235
// Size: 0x159
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_summon_cs";
    s.name = "red_console_2";
    fe [[ f ]](s, us, cf, (12544, 1664, 1629), (0, 307.86, 0), "red_console_2", "summon_console_red_controller", "summon_consoles");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_summon_cs";
    s.name = "red_console_3";
    fe [[ f ]](s, us, cf, (5703.25, -4828.75, 2824), (0, 225.4, 0), "red_console_3", "summon_console_red_controller", "summon_consoles");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_activities_summon_cs";
    s.name = "red_console_1";
    fe [[ f ]](s, us, cf, (3567.75, 6613.25, 2144), (0, 131.95, 0), "red_console_1", "summon_console_red_controller", "summon_consoles");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activities_summon_cs / namespace_30cb5b88514b09be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x396
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activities_summon_cs / namespace_30cb5b88514b09be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_activities_summon_cs");
}

