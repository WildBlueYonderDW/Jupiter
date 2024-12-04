#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_i_ob_mysteryboxes_cs;

// Namespace mp_jup_st_i_ob_mysteryboxes_cs / namespace_796b07baaaff58f7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x118
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_mysteryboxes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_mysteryboxes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_mysteryboxes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_mysteryboxes_cs / namespace_796b07baaaff58f7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18d
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_mysteryboxes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_mysteryboxes_cs");
}

// Namespace mp_jup_st_i_ob_mysteryboxes_cs / namespace_796b07baaaff58f7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc
// Size: 0x200
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "mystery_box";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (37337.5, -19409, 3072.58), (359.99, 20.87, -0.01));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "mystery_box";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (27522, -30994, 3954), (0, 249.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "mystery_box";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (30214, -25406, 3136), (0, 327.91, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "mystery_box";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (21524, -19808, 2897), (0, 21.09, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_mysteryboxes_cs / namespace_796b07baaaff58f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x404
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_mysteryboxes_cs / namespace_796b07baaaff58f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40e
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_mysteryboxes_cs");
}

