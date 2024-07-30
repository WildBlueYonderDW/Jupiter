#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_wallbuys_cs;

// Namespace mp_jup_st_g_ob_wallbuys_cs / namespace_b18d0b6d51580362
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_wallbuys_cs / namespace_b18d0b6d51580362
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_wallbuys_cs");
}

// Namespace mp_jup_st_g_ob_wallbuys_cs / namespace_b18d0b6d51580362
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0x914
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-19714, -37397, 2662), (0, 249.96, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-19770, -25984, 1736), (0, 275.12, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-8178, -17656, 1697), (0, 232.69, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-24951, -18926, 1702), (0, 77, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-9385, -26978, 1718), (0, 242.11, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-24621.2, -26034.7, 1698), (0, 77.25, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-24209, -31379, 1951), (0, 167.54, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-8563.37, -39564.4, 2293), (0, 110.17, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-15497.7, -42423.5, 2853.5), (0, 200.17, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-10642, -36445, 1909), (0, 199.99, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-50, 59, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-6185, -29295, 1707), (0, 353.06, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-3654, -22323, 1542), (0, 178.66, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-1116, -16955, 1710), (0, 134.73, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-18112, -9219, 1505), (0, 180, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-18293, -14972, 2153.05), (0, 39.57, 0.13));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-22823, -5899, 960), (0, 264.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-30102, -12033, 1544), (0, 330, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_wallbuys_cs / namespace_b18d0b6d51580362
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadb
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_wallbuys_cs / namespace_b18d0b6d51580362
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae5
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_wallbuys_cs");
}

