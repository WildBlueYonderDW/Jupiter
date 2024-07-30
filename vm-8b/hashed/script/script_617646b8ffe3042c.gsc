#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs;

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x285
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs");
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed
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

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x35f
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    }
    switch (instancename) {
    case #"hash_60d724e3e39f48c": 
        function_1574cbefb1b44ed5(fe, us, cf);
        break;
    case #"hash_e66c98ca5e983558": 
        function_334de3ae01ddf4c9(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x10d
function function_1574cbefb1b44ed5(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "team_hunt_region", undefined, "B", undefined, undefined, (-5800, 28596, 1172), (0, 345, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "TEAM_HUNT_B_POWERPLANT", "TEAM_HUNT_B_POWERPLANT", undefined, undefined, (-5800, 28596, 1172), (0, 345, 0));
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6
// Size: 0x10d
function function_334de3ae01ddf4c9(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "team_hunt_region", undefined, "B", undefined, undefined, (12947.5, 29689, 1051.14), (0, 75, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "TEAM_HUNT_B_SECURITY", "TEAM_HUNT_B_SECURITY", undefined, undefined, (12947.5, 29689, 1051.14), (0, 75, 0));
}

// Namespace mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs / namespace_18438c24222e0aa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_team_hunt";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-5800, 28596, 1172);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["TEAM_HUNT_B_POWERPLANT"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_team_hunt";
    instancestruct.cf = "mp_jup_st_b_ob_contracts_pvpve_team_hunt_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (12947.5, 29689, 1051.14);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["TEAM_HUNT_B_SECURITY"] = instancestruct;
    return activityinstances;
}

