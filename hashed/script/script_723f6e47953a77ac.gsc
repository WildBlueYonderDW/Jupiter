// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_wallbuys_cs;

// Namespace mp_jup_st_e_ob_wallbuys_cs/namespace_edb450e4d095d2e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_wallbuys_cs/namespace_edb450e4d095d2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_wallbuys_cs");
}

// Namespace mp_jup_st_e_ob_wallbuys_cs/namespace_edb450e4d095d2e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0x549
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-6470, 10603, 1096), (0, 124, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-14541, 12415, 1271.96), (0, 63.5, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-11542, 4648, 1055), (0, 70.5, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-3795, 1592, 2008), (0, 195, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (1216, 8061, 1624), (0, 225, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-4252, -6995, 1417), (0, 225, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (2876, -3837, 2010), (0, 225, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (8186, 3137, 1624), (0, 45, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (15534, 6757, 1971), (0, 148.47, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (11751, -331, 1712), (0, 33.67, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_wallbuys_cs/namespace_edb450e4d095d2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70f
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_wallbuys_cs/namespace_edb450e4d095d2e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x719
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_wallbuys_cs");
}

