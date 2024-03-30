// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_interacts_safe_cs;

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_interacts_safe_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_interacts_safe_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_interacts_safe_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_interacts_safe_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_interacts_safe_cs");
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0
// Size: 0x84
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_interacts_safe_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_interacts_safe_cs");
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SAFECRACK";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_safecrack";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec
// Size: 0x30
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_interacts_safe_cs";
    }
}

// Namespace mp_jup_st_b_ob_interacts_safe_cs / namespace_f8cdc54996ab9eb6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x323
// Size: 0x10
function function_6da2952367672ac0() {
    activityinstances = [];
    return activityinstances;
}

