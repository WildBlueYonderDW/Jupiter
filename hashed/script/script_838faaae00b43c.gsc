// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs;

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_TEAM_HUNT";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_team_hunt";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305
// Size: 0x52
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    }
    switch (instancename) {
    case #"hash_56357ba4e91e6c7a":
        function_505cd8ee45a0863f(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x10e
function function_505cd8ee45a0863f(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "team_hunt_region", undefined, "A", undefined, undefined, (-30116, 30648, 2708), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "TEAM_HUNT_A_CENTER_TOWER", "TEAM_HUNT_A_CENTER_TOWER", undefined, undefined, (-30116, 30648, 2708), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs / namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0xb1
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_team_hunt";
    instancestruct.cf = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-30116, 30648, 2708);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["TEAM_HUNT_A_CENTER_TOWER"] = instancestruct;
    return activityinstances;
}

