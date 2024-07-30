#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_quest_cs;

// Namespace mp_jup_st_f_ob_quest_cs / namespace_70f0bf4af2b789eb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_quest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_quest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_quest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_quest_cs / namespace_70f0bf4af2b789eb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_quest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_quest_cs");
}

// Namespace mp_jup_st_f_ob_quest_cs / namespace_70f0bf4af2b789eb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0x143
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_quest_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_quest_cs";
    fe [[ f ]](s, us, cf, (33759, -12225, 2981), (0, 0, 0), "quest_a2t3_essence_bazaar");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_quest_cs";
    fe [[ f ]](s, us, cf, (-23552, -21853, 1758), (0, 0, 0), "quest_a2t3_essence_retail");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_quest_cs";
    fe [[ f ]](s, us, cf, (-23022, 21619, 1770), (0, 0, 0), "quest_a2t3_essence_shops");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_quest_cs / namespace_70f0bf4af2b789eb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_quest_cs / namespace_70f0bf4af2b789eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x337
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_quest_cs");
}

