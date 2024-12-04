#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_st_e_ob_mysteryboxes_cs;

// Namespace mp_jup_st_e_ob_mysteryboxes_cs / namespace_c524611aff136787
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x210
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_mysteryboxes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_mysteryboxes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_mysteryboxes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_mysteryboxes_cs / namespace_c524611aff136787
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x285
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_mysteryboxes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_mysteryboxes_cs");
}

// Namespace mp_jup_st_e_ob_mysteryboxes_cs / namespace_c524611aff136787
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f4
// Size: 0x478
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Yellow";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (29, 2229, 1831), (0.14, 0.41, 0.15), undefined, "magicbox_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Green";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (18394, -6108, 1932), (0, 225.11, -0.21), undefined, "magicbox_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_script_name = "magicbox";
    s.groupid = "Yellow";
    s.name = "content_instance_magicbox_yellow";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-327, 437, -44), (0, 0, 0), "magicbox_instance_yellow", "ob_jup_st_e_yellow_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_script_name = "magicbox";
    s.groupid = "Green";
    s.name = "content_instance_magicbox_lowtown";
    s.variantname = "content_instance";
    fe [[ f ]](s, us, cf, (-327, 436, -43), (0, 0, 0), "magicbox_instance_lowtown", "ob_jup_st_e_lowtown_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Yellow";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (9108, -4227, 2407), (359.9, 134.81, 0.01), undefined, "magicbox_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Yellow";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (-5316, -1684, 1539), (0, 195.79, 0.01), undefined, "magicbox_instance_yellow");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Green";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (14572, 3407, 1961), (0.01, 237.4, -0.1), undefined, "magicbox_instance_lowtown");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.groupid = "Green";
    s.name = "mysterybox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (17214, -11442, 1994), (0.01, 77.3, 0), undefined, "magicbox_instance_lowtown");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_mysteryboxes_cs / namespace_c524611aff136787
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x774
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_mysteryboxes_cs / namespace_c524611aff136787
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77e
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_mysteryboxes_cs");
}

