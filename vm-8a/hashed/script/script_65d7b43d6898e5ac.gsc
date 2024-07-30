#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_wallbuys_cs;

// Namespace mp_jup_st_a_ob_wallbuys_cs / namespace_b6e91560a1dad5ae
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_wallbuys_cs / namespace_b6e91560a1dad5ae
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_wallbuys_cs");
}

// Namespace mp_jup_st_a_ob_wallbuys_cs / namespace_b6e91560a1dad5ae
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0x3c8
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-19704, 24287, 2176), (0, 300.3, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-32567, 24222, 1376), (0, 208.01, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-32334, 43351, 1485), (0.08, 244.83, 0.01));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-28822, 33085, 1440), (0, 118.03, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-16825, 32262, 2776), (0, 135.1, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-23279, 41246, 2096), (0, 45.1, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-25641, 17756, 1505), (0, 270, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_wallbuys_cs / namespace_b6e91560a1dad5ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58f
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_wallbuys_cs / namespace_b6e91560a1dad5ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x599
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_wallbuys_cs");
}

