#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_tower_ob_contracts_escort_cs;

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_tower_ob_contracts_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_tower_ob_contracts_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_tower_ob_contracts_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x463
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_tower_ob_contracts_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_tower_ob_contracts_escort_cs");
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51a
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x524
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_tower_ob_contracts_escort_cs");
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53a
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x59b
// Size: 0x51
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_tower_ob_contracts_escort_cs";
    }
    switch (instancename) {
    case #"hash_bad0a64996c4380b":
        function_8659470aaeaf785a(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4
// Size: 0xb93
function function_8659470aaeaf785a(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_01";
    fe [[ f ]](s, us, cf, (13022.9, 24383.4, 257), (0, 90, 0), "escort_tower_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (12206.2, 19324.9, 1639.21), (5.21, 284.64, -7.47), "activity_nexus_instance_joiner", "ESCORT_TOWER", "ESCORT_TOWER", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (13675.5, 20857, 687), (0, 89.9, 0), "ESCORT_TOWER", undefined, "escort_tower_start", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    fe [[ f ]](s, us, cf, (4279.6, 21101.5, 478.5), (0, 346, 0), "ESCORT_TOWER_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_01";
    fe [[ f ]](s, us, cf, (11876.9, 21046.9, 264), (0, 0, 0), "escort_tower_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_03";
    fe [[ f ]](s, us, cf, (2112.63, 24976.4, 262.76), (0, 0, 0), "escort_tower_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_04";
    fe [[ f ]](s, us, cf, (10286.8, 25096.5, 257), (0, 90, 0), "escort_tower_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_03";
    fe [[ f ]](s, us, cf, (9296.59, 23668.7, 264), (0, 90, 0), "escort_tower_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_02";
    fe [[ f ]](s, us, cf, (8773.38, 24615.9, 749.89), (0, 0, 0), "escort_tower_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_02";
    fe [[ f ]](s, us, cf, (13017.7, 20314.2, 259.75), (0, 90, 0), "escort_tower_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_02";
    fe [[ f ]](s, us, cf, (9114.47, 25050.4, 263.25), (0, 0, 0), "escort_tower_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 450);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_05";
    fe [[ f ]](s, us, cf, (3794.99, 25127.4, 263.25), (0, 90, 0), "escort_tower_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 800);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "ambush_06";
    fe [[ f ]](s, us, cf, (3316.53, 22512.6, 262.5), (0, 90, 0), "escort_tower_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 150);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_03";
    fe [[ f ]](s, us, cf, (4709.61, 24811.3, 256), (0, 0, 0), "escort_tower_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 700);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_01";
    fe [[ f ]](s, us, cf, (10030, 20006.4, 260), (0, 0, 0), "escort_tower_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_01";
    fe [[ f ]](s, us, cf, (9074.48, 20400.4, 264), (0, 0, 0), "escort_tower_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_01";
    fe [[ f ]](s, us, cf, (10168.2, 22385.1, 240.85), (0, 0, 0), "escort_tower_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_03";
    fe [[ f ]](s, us, cf, (3969.8, 26422.4, 257), (0, 0, 0), "escort_tower_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_02";
    fe [[ f ]](s, us, cf, (7468.05, 24839.1, 434.56), (0, 0, 0), "escort_tower_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 150);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_04";
    fe [[ f ]](s, us, cf, (2697.62, 21605.8, 256), (0, 0, 0), "escort_tower_neutralize_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 350);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_04";
    fe [[ f ]](s, us, cf, (3331.86, 19942.9, 575.5), (0, 0, 0), "escort_tower_neutralize_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "neutralize_ambush_04";
    fe [[ f ]](s, us, cf, (4160.9, 20487.7, 262.5), (0, 0, 0), "escort_tower_neutralize_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "horde_02";
    fe [[ f ]](s, us, cf, (6940.28, 24885.6, 256), (0, 270, 0), "escort_tower_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 350);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "horde_01";
    fe [[ f ]](s, us, cf, (9380.16, 19995.8, 264), (0, 0, 0), "escort_tower_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "horde_03";
    fe [[ f ]](s, us, cf, (4030.52, 26240.2, 262.49), (0, 0, 0), "escort_tower_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_tower_ob_contracts_escort_cs";
    s.name = "horde_04";
    fe [[ f ]](s, us, cf, (4124.21, 21339.8, 478.5), (0, 0, 0), "escort_tower_horde_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 700);
}

// Namespace mp_jup_tower_ob_contracts_escort_cs / namespace_99431eda83c9e000
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118f
// Size: 0x15b
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_escort";
    instancestruct.cf = "mp_jup_tower_ob_contracts_escort_cs";
    instancestruct.scriptstructorigin = (11947.5, 18923, 1553.54);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.locationorigin = [(11942, 18937.2, 1552.8), (11952, 18928.5, 1552.69), (11943.8, 18931.2, 1553.15)];
    instancestruct.locationoriginoffset = [(0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0), (0, 0, 0), (0, 0, 0)];
    instancestruct.locationradius = [200, 1, 200];
    activityinstances["ESCORT_TOWER"] = instancestruct;
    return activityinstances;
}

