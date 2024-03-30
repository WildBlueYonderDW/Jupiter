// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_activities_servershutdown_cs;

// Namespace mp_jup_st_i_ob_activities_servershutdown_cs / namespace_9e7d5c0658c6dddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_servershutdown_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_servershutdown_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_servershutdown_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_servershutdown_cs / namespace_9e7d5c0658c6dddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_servershutdown_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_servershutdown_cs");
}

// Namespace mp_jup_st_i_ob_activities_servershutdown_cs / namespace_9e7d5c0658c6dddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x361
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (26112, -20864, 2880), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (39808, -21120, 2944), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (39168, -25472, 2816), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (27072, -27456, 3008), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (20928, -24064, 2624), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (22720, -27648, 3008), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (20832, -36000, 2944), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (26496, -36224, 2880), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (41216, -29376, 2880), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_servershutdown_cs / namespace_9e7d5c0658c6dddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x529
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_servershutdown_cs / namespace_9e7d5c0658c6dddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x533
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_servershutdown_cs");
}

