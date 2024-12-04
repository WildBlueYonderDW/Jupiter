#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_fort_ob_unstable_rift_cs;

// Namespace mp_jup_fort_ob_unstable_rift_cs / namespace_fd8ad9722f2e9f14
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_fort_ob_unstable_rift_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_fort_ob_unstable_rift_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_fort_ob_unstable_rift_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_fort_ob_unstable_rift_cs / namespace_fd8ad9722f2e9f14
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4af
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_fort_ob_unstable_rift_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_fort_ob_unstable_rift_cs");
}

// Namespace mp_jup_fort_ob_unstable_rift_cs / namespace_fd8ad9722f2e9f14
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x51e
// Size: 0x1861
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18851, -53693, 1024), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18851, -53891, 1023.5), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18391, -53693, 1024), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18851, -53504, 1024), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18391, -53891, 1023.5), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18599, -53620, 1153), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_circle", undefined, undefined, undefined, undefined, 850);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (18599, -53460.8, 1025.5), (0, 270, -69), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_spawnpoints";
    fe [[ f ]](s, us, cf, (18391, -53504, 1024), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    s.height = 260;
    fe [[ f ]](s, us, cf, (18599, -53636, 961), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_encounter", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18592, -54019, 1024), (0, 270, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_obelisk");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18572, -54376, 1393), (0, 0, 0), "ob_unstable_rift_location0", undefined, "ob_unstable_rift_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_mine_ladder";
    fe [[ f ]](s, us, cf, (18609.8, -55973, 1047), (86.7, 71.8, -0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (2602, 1061, 250);
    s.var_74e936bbadd15418 = (516, 2571, 470);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (17556, -53661, 652), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_teleportvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18164, -53417, 1280), (0, 221.1, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_teleportdestination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_mine_ladder";
    fe [[ f ]](s, us, cf, (18575.8, -55976, 1047), (86.7, 71.8, -27.5), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (18543, -55903.8, 1058), (-2.5, 90, 90), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18756, -53609, 1023.49), (0, 270, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_ammorestock");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_mine_ladder";
    fe [[ f ]](s, us, cf, (18686, -53449.2, 942.75), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1496, 225, 415);
    s.var_74e936bbadd15418 = (-149, 2380, 32);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (15542, -53293, 979), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_aiallowedvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_scaffold";
    fe [[ f ]](s, us, cf, (20134.8, -53723.2, 1024), (0, 359.98, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (20120, -53698.8, 1024), (0, 269.98, -0.23), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (20120.8, -53634.5, 1024), (0, 89.98, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (20138.8, -53618.8, 1024), (0, 89.98, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (20140, -53682.8, 1024), (0, 269.98, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_window_metal_mesh_bars_96";
    fe [[ f ]](s, us, cf, (16513, -54200, 1028), (0, 90, 90), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_lockeddoors";
    fe [[ f ]](s, us, cf, (16499.5, -54196.2, 1068.75), (0, 270, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_lockeddoor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.name = "script_struct";
    s.script_parameters = "blocker_toggleable_scaffold";
    fe [[ f ]](s, us, cf, (18558, -50604.8, 449.75), (0, 268.44, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.name = "script_struct";
    s.script_parameters = "blocker_toggleable_scaffold";
    fe [[ f ]](s, us, cf, (18690.8, -50608.5, 449.75), (0, 268.44, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_building_corrugated_metal";
    fe [[ f ]](s, us, cf, (18689.8, -50606.8, 496.25), (0, 358.44, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_building_corrugated_metal";
    fe [[ f ]](s, us, cf, (18689.5, -50620.8, 496.25), (0, 178.44, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (21070, -54700.2, 875.75), (85.25, 17.55, -71.92), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_lockeddoors";
    fe [[ f ]](s, us, cf, (21063.5, -54654, 844), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_lockeddoor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_wooden_pallet";
    fe [[ f ]](s, us, cf, (21074, -54643, 867.75), (75.9, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (21060, -54703.2, 872.75), (87.26, 147.1, 57.54), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_wooden_pallet";
    fe [[ f ]](s, us, cf, (21055, -54661.8, 868), (75.9, 180, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_lockeddoors";
    fe [[ f ]](s, us, cf, (18593.8, -57016.8, 527.5), (0, 270, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_lockeddoor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_lockeddoors";
    fe [[ f ]](s, us, cf, (20136.4, -53663.4, 1039.85), (0, 180, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_lockeddoor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1310, 225, 415);
    s.var_74e936bbadd15418 = (-149, 1551, 32);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (19882, -54048, 979), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_aiallowedvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1120, -724, 611);
    s.var_74e936bbadd15418 = (-149, 2041, 32);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (19882, -51512, 979), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_aiallowedvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_wooden_pallet_stack";
    fe [[ f ]](s, us, cf, (18669.8, -53530.2, 1025), (0, 84.9, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_mine_ladder";
    fe [[ f ]](s, us, cf, (18687.8, -53448, 648), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_lockeddoors";
    fe [[ f ]](s, us, cf, (14545.5, -52593, 510), (0, 133.31, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_lockeddoor");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_wooden_pallet_stack";
    fe [[ f ]](s, us, cf, (18609, -53524.8, 1025), (0, 84.9, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    fe [[ f ]](s, us, cf, (14580.2, -52554, 542), (86.84, 223.4, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    fe [[ f ]](s, us, cf, (14541.5, -52579.8, 543.25), (70.47, 126.86, -5.76), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    fe [[ f ]](s, us, cf, (14518, -52623.8, 541.25), (86.84, 43.4, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    fe [[ f ]](s, us, cf, (14556.8, -52598, 542.5), (70.47, 306.86, -5.76), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_blockers";
    s.script_parameters = "blocker_toggleable_plywood_sheet";
    fe [[ f ]](s, us, cf, (18603, -53427.8, 1025.5), (0, 270, -69), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_blocker");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1496, 1064, 860);
    s.var_74e936bbadd15418 = (1620, 2790, 32);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (18645, -52920, 979), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_aiallowedvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (18823, -52842, 1024), (0, 270, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (176, 78, 302);
    s.var_74e936bbadd15418 = (174, 174, 32);
    s.groupid = "location0";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]](s, us, cf, (20307, -53625, 1280), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_aiallowedvolume");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0";
    fe [[ f ]](s, us, cf, (18591, -53348, 1024), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_completionportal");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (18191, -52900, 1024), (0, 0, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (18347, -54364, 1024), (0, 90, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (18931, -54081, 1025.5), (0, 180, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (19030, -53536, 1024), (0, 180, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_fort_ob_unstable_rift_cs";
    s.groupid = "location0_tombstones";
    fe [[ f ]](s, us, cf, (18992, -52910, 1024), (0, 180, 0), undefined, "ob_unstable_rift_location0", "ob_unstable_rift_tombstone");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_fort_ob_unstable_rift_cs / namespace_fd8ad9722f2e9f14
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d87
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_fort_ob_unstable_rift_cs / namespace_fd8ad9722f2e9f14
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d91
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_fort_ob_unstable_rift_cs");
}

