// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_mysteryboxes_cs;

// Namespace mp_jup_st_f_ob_mysteryboxes_cs/namespace_cb31926db07436b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_mysteryboxes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_mysteryboxes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_mysteryboxes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_mysteryboxes_cs/namespace_cb31926db07436b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_mysteryboxes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_mysteryboxes_cs");
}

// Namespace mp_jup_st_f_ob_mysteryboxes_cs/namespace_cb31926db07436b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0x160
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39885, 12548, 3091), (0, 233.41, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31525, 2042, 2255), (0, 90, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42472, -5155, 2999), (0, 271.2, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_mysteryboxes_cs/namespace_cb31926db07436b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_mysteryboxes_cs/namespace_cb31926db07436b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_mysteryboxes_cs");
}

