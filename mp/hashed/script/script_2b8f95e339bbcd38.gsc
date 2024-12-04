#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_h_ob_wallbuys_cs;

// Namespace mp_jup_st_h_ob_wallbuys_cs / namespace_a8fe2a785e59b742
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x111
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_wallbuys_cs / namespace_a8fe2a785e59b742
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x186
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_wallbuys_cs");
}

// Namespace mp_jup_st_h_ob_wallbuys_cs / namespace_a8fe2a785e59b742
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x448
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (1772, -36438, 2064), (0, 104.97, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (8228, -32920, 2744), (0, 90.76, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-3083, -42201, 2814), (0, 273.88, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (1755, -18279, 1708), (0, 255.18, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (13906, -23864, 1712), (0, 90, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (3938, -26398, 1712), (0, 173.76, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-5156, -25546, 1715), (0, 350.19, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-13139, -36165, 1909), (0, 109.75, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_wallbuys_cs / namespace_a8fe2a785e59b742
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x645
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_wallbuys_cs / namespace_a8fe2a785e59b742
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64f
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_wallbuys_cs");
}

