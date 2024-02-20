// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs;

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
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

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_TEAM_HUNT";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_team_hunt";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_56357ba4e91e6c7a":
        function_505cd8ee45a0863f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x10e
function function_505cd8ee45a0863f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    s.name = "region";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "team_hunt_region", undefined, "A", undefined, undefined, (-30116, 30648, 2708), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "TEAM_HUNT_A_CENTER_TOWER", "TEAM_HUNT_A_CENTER_TOWER", undefined, undefined, (-30116, 30648, 2708), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs/namespace_78f835bfd4a00278
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0xb1
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_team_hunt";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_pvpve_team_hunt_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-30116, 30648, 2708);
    var_5f614235e4cbbd5b.locationorigin = [];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [];
    var_fdc9acdc19473f08["TEAM_HUNT_A_CENTER_TOWER"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

